use super::*;
use crate::backend::SharedLinkArtifacts;
use crate::cli::config::{
    append_bridge_request_raw_value, append_bridge_request_value, normalize_bridge_path,
    run_adk_build_bridge_request,
};
use std::os::windows::process::ExitStatusExt;
use std::process::{Command, ExitStatus, Output};
use std::time::{SystemTime, UNIX_EPOCH};

#[derive(Debug, Clone, PartialEq, Eq)]
pub(crate) struct ToolchainEnvironmentPlan {
    inherit_parent_environment: bool,
    overrides: Vec<(String, String)>,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub(crate) struct ToolchainProcessPlan {
    executable: PathBuf,
    working_directory: Option<PathBuf>,
    arguments: Vec<String>,
    environment: ToolchainEnvironmentPlan,
}

#[derive(Debug, Clone, PartialEq, Eq)]
struct AuthorToolchainDiscoveryPlan {
    visual_studio_roots: Vec<PathBuf>,
    visual_studio_tool_root_relative_path: PathBuf,
    visual_studio_linker_relative_path: PathBuf,
    windows_sdk_lib_roots: Vec<PathBuf>,
    windows_sdk_kernel32_relative_path: PathBuf,
}

#[derive(Debug, Clone, PartialEq, Eq)]
struct AuthorToolchainDiscoveryResult {
    visual_studio_linkers: Vec<PathBuf>,
    kernel32_lib_path: Option<PathBuf>,
}

#[derive(Debug, Clone, PartialEq, Eq)]
struct AuthorToolchainProcessResult {
    exit_code: i32,
    stdout_text: String,
    stderr_text: String,
}

fn emit_toolchain_discovery_bridge_request() -> String {
    "toolchain-discovery\n".to_string()
}

fn emit_toolchain_probe_bridge_request() -> String {
    "toolchain-probe\n".to_string()
}

#[cfg(test)]
fn emit_toolchain_probe_custom_bridge_request(
    visual_studio_roots: &[PathBuf],
    visual_studio_tool_root_relative_path: &Path,
    visual_studio_linker_relative_path: &Path,
    windows_sdk_lib_roots: &[PathBuf],
    windows_sdk_kernel32_relative_path: &Path,
) -> String {
    let mut out = String::new();
    out.push_str("toolchain-probe-custom\n");
    let vs_roots = visual_studio_roots
        .iter()
        .map(|path| normalize_bridge_path(&path.display().to_string()))
        .collect::<Vec<_>>()
        .join("\n");
    let sdk_roots = windows_sdk_lib_roots
        .iter()
        .map(|path| normalize_bridge_path(&path.display().to_string()))
        .collect::<Vec<_>>()
        .join("\n");
    append_bridge_request_value(
        &mut out,
        "visualStudioRoots",
        if vs_roots.is_empty() {
            None
        } else {
            Some(vs_roots.as_str())
        },
    );
    append_bridge_request_value(
        &mut out,
        "visualStudioToolRootRelativePath",
        visual_studio_tool_root_relative_path.to_str(),
    );
    append_bridge_request_value(
        &mut out,
        "visualStudioLinkerRelativePath",
        visual_studio_linker_relative_path.to_str(),
    );
    append_bridge_request_value(
        &mut out,
        "windowsSdkLibRoots",
        if sdk_roots.is_empty() {
            None
        } else {
            Some(sdk_roots.as_str())
        },
    );
    append_bridge_request_value(
        &mut out,
        "windowsSdkKernel32RelativePath",
        windows_sdk_kernel32_relative_path.to_str(),
    );
    out
}

fn emit_toolchain_candidate_bridge_request(
    linker_override: Option<&Path>,
    env_linker: Option<&str>,
    discovered_visual_studio_linkers: &[PathBuf],
) -> String {
    let mut out = String::new();
    out.push_str("toolchain-candidates\n");
    append_bridge_request_value(
        &mut out,
        "linkerOverride",
        linker_override.and_then(|path| path.to_str()),
    );
    append_bridge_request_value(&mut out, "envLinker", env_linker);
    let discovered = discovered_visual_studio_linkers
        .iter()
        .map(|path| normalize_bridge_path(&path.display().to_string()))
        .collect::<Vec<_>>()
        .join("\n");
    append_bridge_request_value(
        &mut out,
        "discoveredVisualStudioLinkers",
        if discovered.is_empty() {
            None
        } else {
            Some(discovered.as_str())
        },
    );
    out
}

fn emit_toolchain_write_response_file_bridge_request(
    response_file_path: &Path,
    args: &[String],
) -> String {
    let mut out = String::new();
    out.push_str("toolchain-write-response-file\n");
    append_bridge_request_value(&mut out, "responseFilePath", response_file_path.to_str());
    let argument_count = args.len().to_string();
    append_bridge_request_raw_value(&mut out, Some(argument_count.as_str()));
    for arg in args {
        append_bridge_request_raw_value(&mut out, Some(arg.as_str()));
    }
    out
}

fn emit_toolchain_execute_process_bridge_request(
    plan: &ToolchainProcessPlan,
    capture_directory: &Path,
    capture_stem: &str,
) -> String {
    let mut out = String::new();
    out.push_str("toolchain-execute-process\n");
    let executable = normalize_bridge_path(&plan.executable.display().to_string());
    let working_directory = plan
        .working_directory
        .as_ref()
        .map(|path| normalize_bridge_path(&path.display().to_string()));
    let capture_directory = normalize_bridge_path(&capture_directory.display().to_string());
    append_bridge_request_raw_value(&mut out, Some(executable.as_str()));
    append_bridge_request_raw_value(&mut out, working_directory.as_deref());
    append_bridge_request_raw_value(&mut out, Some(capture_directory.as_str()));
    append_bridge_request_raw_value(&mut out, Some(capture_stem));
    append_bridge_request_raw_value(
        &mut out,
        Some(if plan.environment.inherit_parent_environment {
            "true"
        } else {
            "false"
        }),
    );
    let override_count = plan.environment.overrides.len().to_string();
    append_bridge_request_raw_value(&mut out, Some(override_count.as_str()));
    let argument_count = plan.arguments.len().to_string();
    append_bridge_request_raw_value(&mut out, Some(argument_count.as_str()));
    for (name, value) in &plan.environment.overrides {
        append_bridge_request_raw_value(&mut out, Some(name.as_str()));
        append_bridge_request_raw_value(&mut out, Some(value.as_str()));
    }
    for argument in &plan.arguments {
        append_bridge_request_raw_value(&mut out, Some(argument.as_str()));
    }
    out
}

fn parse_bridge_values(text: &str) -> Result<HashMap<String, String>, String> {
    let mut values = HashMap::new();
    for line in text.lines() {
        if line.trim().is_empty() {
            continue;
        }
        let (key, raw) = line
            .split_once('=')
            .ok_or_else(|| format!("invalid adk bridge line '{}'", line))?;
        let (present, encoded) = raw
            .split_once(':')
            .ok_or_else(|| format!("invalid adk bridge value '{}'", line))?;
        match present {
            "0" => {}
            "1" => {
                values.insert(key.to_string(), unescape_bridge_value(encoded)?);
            }
            _ => return Err(format!("invalid adk bridge presence tag '{}'", present)),
        }
    }
    Ok(values)
}

fn unescape_bridge_value(value: &str) -> Result<String, String> {
    let mut out = String::with_capacity(value.len());
    let mut chars = value.chars();
    while let Some(ch) = chars.next() {
        if ch != '\\' {
            out.push(ch);
            continue;
        }
        match chars.next() {
            Some('n') => out.push('\n'),
            Some('r') => out.push('\r'),
            Some('\\') => out.push('\\'),
            Some(other) => {
                out.push('\\');
                out.push(other);
            }
            None => return Err("adk bridge ended inside escape sequence".to_string()),
        }
    }
    Ok(out)
}

fn required_bridge_value(values: &HashMap<String, String>, key: &str) -> Result<String, String> {
    values
        .get(key)
        .cloned()
        .ok_or_else(|| format!("adk bridge missing key '{}'", key))
}

fn parse_bridge_lines(values: &HashMap<String, String>, key: &str) -> Result<Vec<PathBuf>, String> {
    Ok(required_bridge_value(values, key)?
        .lines()
        .filter(|line| !line.trim().is_empty())
        .map(PathBuf::from)
        .collect())
}

fn parse_toolchain_discovery_bridge_output(
    text: &str,
) -> Result<AuthorToolchainDiscoveryPlan, String> {
    let values = parse_bridge_values(text)?;
    Ok(AuthorToolchainDiscoveryPlan {
        visual_studio_roots: parse_bridge_lines(&values, "visualStudioRoots")?,
        visual_studio_tool_root_relative_path: PathBuf::from(required_bridge_value(
            &values,
            "visualStudioToolRootRelativePath",
        )?),
        visual_studio_linker_relative_path: PathBuf::from(required_bridge_value(
            &values,
            "visualStudioLinkerRelativePath",
        )?),
        windows_sdk_lib_roots: parse_bridge_lines(&values, "windowsSdkLibRoots")?,
        windows_sdk_kernel32_relative_path: PathBuf::from(required_bridge_value(
            &values,
            "windowsSdkKernel32RelativePath",
        )?),
    })
}

fn parse_toolchain_candidate_bridge_output(
    text: &str,
) -> Result<(Vec<PathBuf>, Vec<PathBuf>), String> {
    let values = parse_bridge_values(text)?;
    Ok((
        parse_bridge_lines(&values, "linkerCandidates")?,
        parse_bridge_lines(&values, "assemblerCandidates")?,
    ))
}

fn parse_optional_bridge_path(values: &HashMap<String, String>, key: &str) -> Option<PathBuf> {
    values.get(key).map(PathBuf::from)
}

fn parse_toolchain_probe_bridge_output(
    text: &str,
) -> Result<AuthorToolchainDiscoveryResult, String> {
    let values = parse_bridge_values(text)?;
    Ok(AuthorToolchainDiscoveryResult {
        visual_studio_linkers: parse_bridge_lines(&values, "visualStudioLinkers")?,
        kernel32_lib_path: parse_optional_bridge_path(&values, "kernel32LibPath"),
    })
}

fn parse_toolchain_process_bridge_output(
    text: &str,
) -> Result<AuthorToolchainProcessResult, String> {
    let values = parse_bridge_values(text)?;
    let exit_code = required_bridge_value(&values, "exitCode")?
        .parse::<i32>()
        .map_err(|e| format!("invalid adk process bridge exit code: {e}"))?;
    Ok(AuthorToolchainProcessResult {
        exit_code,
        stdout_text: required_bridge_value(&values, "stdoutText")?,
        stderr_text: required_bridge_value(&values, "stderrText")?,
    })
}

fn adk_toolchain_discovery_plan() -> Result<AuthorToolchainDiscoveryPlan, String> {
    let output = run_adk_build_bridge_request(&emit_toolchain_discovery_bridge_request())?;
    parse_toolchain_discovery_bridge_output(&output)
}

fn adk_toolchain_probe_result() -> Result<AuthorToolchainDiscoveryResult, String> {
    let output = run_adk_build_bridge_request(&emit_toolchain_probe_bridge_request())?;
    parse_toolchain_probe_bridge_output(&output)
}

#[cfg(test)]
fn adk_toolchain_probe_result_for_plan(
    visual_studio_roots: &[PathBuf],
    visual_studio_tool_root_relative_path: &Path,
    visual_studio_linker_relative_path: &Path,
    windows_sdk_lib_roots: &[PathBuf],
    windows_sdk_kernel32_relative_path: &Path,
) -> Result<AuthorToolchainDiscoveryResult, String> {
    let output = run_adk_build_bridge_request(&emit_toolchain_probe_custom_bridge_request(
        visual_studio_roots,
        visual_studio_tool_root_relative_path,
        visual_studio_linker_relative_path,
        windows_sdk_lib_roots,
        windows_sdk_kernel32_relative_path,
    ))?;
    parse_toolchain_probe_bridge_output(&output)
}

fn rust_fallback_toolchain_discovery_plan() -> AuthorToolchainDiscoveryPlan {
    AuthorToolchainDiscoveryPlan {
        visual_studio_roots: vec![
            PathBuf::from("C:/Program Files/Microsoft Visual Studio"),
            PathBuf::from("C:/Program Files (x86)/Microsoft Visual Studio"),
        ],
        visual_studio_tool_root_relative_path: PathBuf::from("VC/Tools/MSVC"),
        visual_studio_linker_relative_path: PathBuf::from("bin/Hostx64/x64/link.exe"),
        windows_sdk_lib_roots: vec![PathBuf::from("C:/Program Files (x86)/Windows Kits/10/Lib")],
        windows_sdk_kernel32_relative_path: PathBuf::from("um/x64/kernel32.lib"),
    }
}

fn adk_toolchain_candidate_plan(
    linker_override: Option<&Path>,
    env_linker: Option<&str>,
    discovered_visual_studio_linkers: &[PathBuf],
) -> Result<(Vec<PathBuf>, Vec<PathBuf>), String> {
    let output = run_adk_build_bridge_request(&emit_toolchain_candidate_bridge_request(
        linker_override,
        env_linker,
        discovered_visual_studio_linkers,
    ))?;
    parse_toolchain_candidate_bridge_output(&output)
}

fn adk_toolchain_write_response_file(
    response_file_path: &Path,
    args: &[String],
) -> Result<PathBuf, String> {
    let output = run_adk_build_bridge_request(
        &emit_toolchain_write_response_file_bridge_request(response_file_path, args),
    )?;
    let written_path = output.trim();
    if written_path.is_empty() {
        return Err("adk bridge returned empty response-file path".to_string());
    }
    Ok(PathBuf::from(written_path))
}

fn unique_toolchain_process_capture_root() -> PathBuf {
    std::env::temp_dir().join(format!(
        "adenc_toolchain_process_{}_{}",
        std::process::id(),
        SystemTime::now()
            .duration_since(UNIX_EPOCH)
            .expect("system time")
            .as_nanos()
    ))
}

fn adk_toolchain_execute_process(plan: &ToolchainProcessPlan) -> Result<Output, String> {
    if !plan.environment.inherit_parent_environment {
        return Err(
            "adk toolchain process bridge does not yet support inheritParentEnvironment=false"
                .to_string(),
        );
    }
    let capture_root = unique_toolchain_process_capture_root();
    let request = emit_toolchain_execute_process_bridge_request(plan, &capture_root, "tool");
    let result = run_adk_build_bridge_request(&request)
        .and_then(|stdout| parse_toolchain_process_bridge_output(&stdout));
    let _ = fs::remove_dir_all(&capture_root);
    let result = result?;
    Ok(Output {
        status: ExitStatus::from_raw(result.exit_code as u32),
        stdout: result.stdout_text.into_bytes(),
        stderr: result.stderr_text.into_bytes(),
    })
}

fn discover_visual_studio_linkers_with_plan(plan: &AuthorToolchainDiscoveryPlan) -> Vec<PathBuf> {
    let mut found = Vec::new();
    for root in &plan.visual_studio_roots {
        if !root.exists() {
            continue;
        }
        let Ok(version_dirs) = fs::read_dir(root) else {
            continue;
        };
        for version_entry in version_dirs.flatten() {
            let version_path = version_entry.path();
            if !version_path.is_dir() {
                continue;
            }
            let Ok(edition_dirs) = fs::read_dir(&version_path) else {
                continue;
            };
            for edition_entry in edition_dirs.flatten() {
                let edition_path = edition_entry.path();
                if !edition_path.is_dir() {
                    continue;
                }
                let msvc_root = edition_path.join(&plan.visual_studio_tool_root_relative_path);
                let Ok(msvc_versions) = fs::read_dir(&msvc_root) else {
                    continue;
                };
                for toolset_entry in msvc_versions.flatten() {
                    let link_path = toolset_entry
                        .path()
                        .join(&plan.visual_studio_linker_relative_path);
                    if link_path.exists() {
                        found.push(link_path);
                    }
                }
            }
        }
    }
    found.sort();
    found.reverse();
    found
}

fn discover_kernel32_lib_with_plan(plan: &AuthorToolchainDiscoveryPlan) -> Option<PathBuf> {
    for kits_root in &plan.windows_sdk_lib_roots {
        if !kits_root.exists() {
            continue;
        }
        let mut versions = fs::read_dir(kits_root)
            .ok()?
            .flatten()
            .map(|e| e.path())
            .filter(|p| p.is_dir())
            .collect::<Vec<_>>();
        versions.sort();
        versions.reverse();
        for version in versions {
            let candidate = version.join(&plan.windows_sdk_kernel32_relative_path);
            if candidate.exists() {
                return Some(candidate);
            }
        }
    }
    None
}

// RB-09 scope: these helpers are retained Windows x64 adapter support, not
// target-neutral backend policy.
pub(crate) fn discover_ml64(linker_override: Option<&Path>) -> Option<PathBuf> {
    let env_linker = env::var("PULSEC_LINKER").ok();
    let discovered_linkers = discover_visual_studio_linkers();
    let candidates =
        ordered_ml64_candidates(linker_override, env_linker.as_deref(), &discovered_linkers);
    candidates.into_iter().find(|p| p.exists())
}

pub(crate) fn discover_kernel32_lib() -> Option<PathBuf> {
    if let Ok(result) = adk_toolchain_probe_result() {
        if let Some(candidate) = result.kernel32_lib_path {
            return Some(candidate);
        }
    }
    if let Ok(plan) = adk_toolchain_discovery_plan() {
        if let Some(candidate) = discover_kernel32_lib_with_plan(&plan) {
            return Some(candidate);
        }
    }
    discover_kernel32_lib_with_plan(&rust_fallback_toolchain_discovery_plan())
}

fn write_linker_response_file(
    out_dir: &Path,
    stem: &str,
    args: &[String],
) -> Result<PathBuf, String> {
    let rsp_path = out_dir.join(format!(
        "{stem}_{}_{}.rsp",
        std::process::id(),
        SystemTime::now()
            .duration_since(UNIX_EPOCH)
            .unwrap_or_default()
            .as_nanos()
    ));
    if let Ok(written_path) = adk_toolchain_write_response_file(&rsp_path, args) {
        return Ok(written_path);
    }
    fs::create_dir_all(out_dir).map_err(|e| {
        format!(
            "Failed to create linker response directory '{}': {}",
            out_dir.display(),
            e
        )
    })?;
    let body = render_linker_response_file_body(args);
    fs::write(&rsp_path, body).map_err(|e| {
        format!(
            "Failed to write linker response file '{}': {}",
            rsp_path.display(),
            e
        )
    })?;
    Ok(rsp_path)
}

fn render_linker_response_file_body(args: &[String]) -> String {
    let mut body = String::new();
    for arg in args {
        body.push('"');
        body.push_str(&arg.replace('"', "\\\""));
        body.push('"');
        body.push('\n');
    }
    body
}

fn response_file_argument(response_file_path: &Path) -> String {
    format!("@{}", windows_cmd_path(response_file_path))
}

pub(crate) fn default_toolchain_environment_plan() -> ToolchainEnvironmentPlan {
    ToolchainEnvironmentPlan {
        inherit_parent_environment: true,
        overrides: Vec::new(),
    }
}

#[allow(dead_code)]
fn merge_environment_plan(
    base: &ToolchainEnvironmentPlan,
    overrides: &[(String, String)],
) -> ToolchainEnvironmentPlan {
    let mut merged = base.overrides.clone();
    for (name, value) in overrides {
        let needle = name.to_ascii_lowercase();
        if let Some(index) = merged
            .iter()
            .position(|(existing, _)| existing.to_ascii_lowercase() == needle)
        {
            merged.remove(index);
        }
        merged.push((name.clone(), value.clone()));
    }
    ToolchainEnvironmentPlan {
        inherit_parent_environment: base.inherit_parent_environment,
        overrides: merged,
    }
}

pub(crate) fn plan_response_file_process(
    executable: &Path,
    _working_directory: Option<&Path>,
    response_file_path: &Path,
    environment: ToolchainEnvironmentPlan,
) -> ToolchainProcessPlan {
    ToolchainProcessPlan {
        executable: executable.to_path_buf(),
        working_directory: None,
        arguments: vec![response_file_argument(response_file_path)],
        environment,
    }
}

pub(crate) fn plan_windows_masm_assemble_process(
    executable: &Path,
    _working_directory: Option<&Path>,
    asm_path: &Path,
    obj_path: &Path,
    environment: ToolchainEnvironmentPlan,
) -> ToolchainProcessPlan {
    ToolchainProcessPlan {
        executable: executable.to_path_buf(),
        working_directory: None,
        arguments: vec![
            "/c".to_string(),
            "/nologo".to_string(),
            format!("/Fo{}", obj_path.display()),
            asm_path.display().to_string(),
        ],
        environment,
    }
}

pub(crate) fn execute_toolchain_process(
    plan: &ToolchainProcessPlan,
) -> Result<std::process::Output, String> {
    if let Ok(output) = adk_toolchain_execute_process(plan) {
        return Ok(output);
    }
    let mut command = Command::new(&plan.executable);
    if let Some(dir) = &plan.working_directory {
        command.current_dir(dir);
    }
    if !plan.environment.inherit_parent_environment {
        command.env_clear();
    }
    for (name, value) in &plan.environment.overrides {
        command.env(name, value);
    }
    command
        .args(&plan.arguments)
        .output()
        .map_err(|e| format!("Failed to execute '{}': {}", plan.executable.display(), e))
}

pub(crate) fn try_link_windows_executable(
    object_path: &Path,
    out_dir: &Path,
    report_path: &Path,
    linker_override: Option<&Path>,
    entry_codegen: &str,
    extra_link_inputs: &[PathBuf],
) -> Result<Option<PathBuf>, String> {
    if let Some(parent) = report_path.parent() {
        fs::create_dir_all(parent).map_err(|e| {
            format!(
                "Failed to create link report directory '{}': {}",
                parent.display(),
                e
            )
        })?;
    }
    let exe_path = out_dir.join("main.exe");
    let mut attempts = Vec::new();

    for linker in linker_candidates(linker_override) {
        let linker_display = linker.display().to_string();
        let args = plan_windows_executable_link_args(
            "mainCRTStartup",
            &exe_path,
            object_path,
            extra_link_inputs,
        );

        let mut retry = 0usize;
        let max_retries = 3usize;
        let rsp_path = write_linker_response_file(out_dir, "native_exe_link", &args)?;
        loop {
            let process = plan_response_file_process(
                &linker,
                Some(out_dir),
                &rsp_path,
                default_toolchain_environment_plan(),
            );
            match execute_toolchain_process(&process) {
                Ok(output) => {
                    if output.status.success() {
                        let report = format!(
                            "status=linked\nlinker={}\nentry_codegen={}\nexe={}\n",
                            linker_display,
                            entry_codegen,
                            exe_path.display()
                        );
                        fs::write(report_path, report).map_err(|e| {
                            format!(
                                "Failed to write link report '{}': {}",
                                report_path.display(),
                                e
                            )
                        })?;
                        return Ok(Some(exe_path));
                    }

                    let stdout = String::from_utf8_lossy(&output.stdout);
                    let stderr = String::from_utf8_lossy(&output.stderr);
                    let transient_lock = stdout.contains("LNK1104") || stderr.contains("LNK1104");
                    if transient_lock && retry < max_retries {
                        retry += 1;
                        std::thread::sleep(std::time::Duration::from_millis(50 * retry as u64));
                        continue;
                    }
                    attempts.push(format!(
                        "linker={} status=failed stdout={} stderr={} retries={}",
                        linker_display,
                        stdout.trim(),
                        stderr.trim(),
                        retry
                    ));
                    break;
                }
                Err(err) => {
                    attempts.push(format!(
                        "linker={} status=unavailable error={}",
                        linker_display, err
                    ));
                    break;
                }
            }
        }
    }

    write_native_failure_report(report_path, "not-linked", entry_codegen, &attempts)?;
    Err(format!(
        "Failed to link native executable; see '{}'",
        report_path.display()
    ))
}

pub(crate) fn write_native_failure_report(
    report_path: &Path,
    status: &str,
    entry_codegen: &str,
    attempts: &[String],
) -> Result<(), String> {
    let mut report = String::new();
    report.push_str(&format!("status={}\n", status));
    report.push_str(&format!("entry_codegen={}\n", entry_codegen));
    for line in attempts {
        report.push_str(line);
        report.push('\n');
    }
    fs::write(report_path, report).map_err(|e| {
        format!(
            "Failed to write failure report '{}': {}",
            report_path.display(),
            e
        )
    })
}

pub(crate) fn try_link_windows_shared_artifacts(
    link_plan: &NativeLinkPlan,
    out_dir: &Path,
    report_path: &Path,
    linker_override: Option<&Path>,
    entry_codegen: &str,
) -> Result<SharedLinkArtifacts, String> {
    if let Some(parent) = report_path.parent() {
        fs::create_dir_all(parent).map_err(|e| {
            format!(
                "Failed to create link report directory '{}': {}",
                parent.display(),
                e
            )
        })?;
    }

    let (runtime_library_name, runtime_import_lib_name) = shared_runtime_artifact_names();
    let runtime_library_path = out_dir.join(&runtime_library_name);
    let runtime_import_library_path = out_dir.join(&runtime_import_lib_name);
    let exe_path = out_dir.join("main.exe");
    let mut attempts = Vec::new();
    let supplemental_runtime_objects = link_plan
        .app_owned_objects
        .iter()
        .filter(|path| {
            let normalized = path
                .to_string_lossy()
                .replace('\\', "/")
                .to_ascii_lowercase();
            normalized.contains("/obj/aden/")
        })
        .cloned()
        .collect::<Vec<_>>();

    for linker in linker_candidates(linker_override) {
        let linker_display = linker.display().to_string();
        let exported_symbols = if link_plan.shared_runtime_exports.is_empty() {
            shared_runtime_export_symbols()
        } else {
            link_plan.shared_runtime_exports.clone()
        };
        let dll_args = plan_windows_shared_runtime_link_args(
            &runtime_library_path,
            &runtime_import_library_path,
            &exported_symbols,
            &link_plan.runtime_owned_objects,
            &supplemental_runtime_objects,
            &link_plan.system_inputs,
        );
        let dll_rsp_path = write_linker_response_file(out_dir, "shared_runtime_link", &dll_args)?;
        let dll_process = plan_response_file_process(
            &linker,
            Some(out_dir),
            &dll_rsp_path,
            default_toolchain_environment_plan(),
        );
        match execute_toolchain_process(&dll_process) {
            Ok(output) if output.status.success() => {}
            Ok(output) => {
                attempts.push(format!(
                    "linker={} runtime_library=failed stdout={} stderr={}",
                    linker_display,
                    String::from_utf8_lossy(&output.stdout).trim(),
                    String::from_utf8_lossy(&output.stderr).trim()
                ));
                continue;
            }
            Err(err) => {
                attempts.push(format!(
                    "linker={} status=unavailable error={}",
                    linker_display, err
                ));
                continue;
            }
        }
        let exe_args = plan_windows_shared_app_link_args(
            &exe_path,
            &runtime_import_library_path,
            &link_plan.startup_objects,
            &link_plan.app_owned_objects,
            &link_plan.system_inputs,
        );
        let exe_rsp_path = write_linker_response_file(out_dir, "shared_app_link", &exe_args)?;
        let exe_process = plan_response_file_process(
            &linker,
            Some(out_dir),
            &exe_rsp_path,
            default_toolchain_environment_plan(),
        );
        match execute_toolchain_process(&exe_process) {
            Ok(output) if output.status.success() => {
                let report = format!(
                    concat!(
                        "status=linked\n",
                        "mode=shared\n",
                        "linker={}\n",
                        "entry_codegen={}\n",
                        "app_import_linkage=import_library\n",
                        "app_runtime_load=peer_runtime_library\n",
                        "startup_object={}\n",
                        "startup_bootstrap=mainCRTStartup->adenc_rt_init->app_entry->adenc_rt_shutdown->ExitProcess\n",
                        "runtime_export_policy=procedure_only|minimal_versioned_abi\n",
                        "runtime_exports={}\n",
                        "exe={}\n",
                        "runtime_library={}\n",
                        "runtime_import_library={}\n"
                    ),
                    linker_display,
                    entry_codegen,
                    link_plan
                        .startup_objects
                        .first()
                        .map(|path| path.display().to_string())
                        .unwrap_or_else(|| "obj/runtime/Startup.obj".to_string()),
                    exported_symbols.join(","),
                    exe_path.display(),
                    runtime_library_path.display(),
                    runtime_import_library_path.display(),
                );
                fs::write(report_path, report).map_err(|e| {
                    format!(
                        "Failed to write link report '{}': {}",
                        report_path.display(),
                        e
                    )
                })?;
                return Ok(SharedLinkArtifacts {
                    exe_path: Some(exe_path),
                    runtime_library_path,
                    runtime_import_library_path,
                });
            }
            Ok(output) => {
                attempts.push(format!(
                    "linker={} app_executable=failed stdout={} stderr={}",
                    linker_display,
                    String::from_utf8_lossy(&output.stdout).trim(),
                    String::from_utf8_lossy(&output.stderr).trim()
                ));
            }
            Err(err) => {
                attempts.push(format!(
                    "linker={} app_executable=unavailable error={}",
                    linker_display, err
                ));
            }
        }
    }

    let mut report = String::from("status=not-linked\nmode=shared\n");
    report.push_str(&format!("entry_codegen={}\n", entry_codegen));
    for line in attempts {
        report.push_str(&line);
        report.push('\n');
    }
    fs::write(report_path, report).map_err(|e| {
        format!(
            "Failed to write shared link report '{}': {}",
            report_path.display(),
            e
        )
    })?;
    Err(format!(
        "Failed to link shared runtime/app artifacts; see '{}'",
        report_path.display()
    ))
}

pub(crate) fn windows_cmd_path(path: &Path) -> String {
    let s = path.to_string_lossy();
    if cfg!(windows) {
        s.strip_prefix(r"\\?\").unwrap_or(&s).to_string()
    } else {
        s.to_string()
    }
}

fn linker_candidates(linker_override: Option<&Path>) -> Vec<PathBuf> {
    let env_linker = env::var("PULSEC_LINKER").ok();
    let discovered_linkers = discover_visual_studio_linkers();
    ordered_linker_candidates(linker_override, env_linker.as_deref(), &discovered_linkers)
}

fn discover_visual_studio_linkers() -> Vec<PathBuf> {
    if let Ok(result) = adk_toolchain_probe_result() {
        if !result.visual_studio_linkers.is_empty() {
            return result.visual_studio_linkers;
        }
    }
    if let Ok(plan) = adk_toolchain_discovery_plan() {
        let discovered = discover_visual_studio_linkers_with_plan(&plan);
        if !discovered.is_empty() {
            return discovered;
        }
    }
    discover_visual_studio_linkers_with_plan(&rust_fallback_toolchain_discovery_plan())
}

fn ordered_linker_candidates(
    linker_override: Option<&Path>,
    env_linker: Option<&str>,
    discovered_visual_studio_linkers: &[PathBuf],
) -> Vec<PathBuf> {
    if let Ok((linkers, _)) = adk_toolchain_candidate_plan(
        linker_override,
        env_linker,
        discovered_visual_studio_linkers,
    ) {
        return linkers;
    }
    if let Some(path) = linker_override {
        return vec![path.to_path_buf()];
    }
    if let Some(override_path) = env_linker {
        let trimmed = override_path.trim();
        if !trimmed.is_empty() {
            return vec![PathBuf::from(trimmed)];
        }
    }
    let mut candidates = vec![PathBuf::from("link.exe"), PathBuf::from("lld-link.exe")];
    candidates.extend(discovered_visual_studio_linkers.iter().cloned());
    dedup_paths_case_insensitive(candidates)
}

fn ordered_ml64_candidates(
    linker_override: Option<&Path>,
    env_linker: Option<&str>,
    discovered_visual_studio_linkers: &[PathBuf],
) -> Vec<PathBuf> {
    if let Ok((_, assemblers)) = adk_toolchain_candidate_plan(
        linker_override,
        env_linker,
        discovered_visual_studio_linkers,
    ) {
        return assemblers;
    }
    let mut candidates = Vec::new();
    append_adjacent_ml64(&mut candidates, linker_override);
    if let Some(linker_env) = env_linker {
        let trimmed = linker_env.trim();
        if !trimmed.is_empty() {
            let path = PathBuf::from(trimmed);
            append_adjacent_ml64(&mut candidates, Some(path.as_path()));
        }
    }
    for linker in discovered_visual_studio_linkers {
        append_adjacent_ml64(&mut candidates, Some(linker.as_path()));
    }
    candidates.push(PathBuf::from("ml64.exe"));
    dedup_paths_case_insensitive(candidates)
}

fn append_adjacent_ml64(candidates: &mut Vec<PathBuf>, linker_path: Option<&Path>) {
    if let Some(linker) = linker_path {
        if let Some(parent) = linker.parent() {
            candidates.push(parent.join("ml64.exe"));
        }
    }
}

fn dedup_paths_case_insensitive(candidates: Vec<PathBuf>) -> Vec<PathBuf> {
    let mut dedup = Vec::new();
    for candidate in candidates {
        let key = candidate.to_string_lossy().to_ascii_lowercase();
        if !dedup
            .iter()
            .any(|seen: &PathBuf| seen.to_string_lossy().to_ascii_lowercase() == key)
        {
            dedup.push(candidate);
        }
    }
    dedup
}

fn new_windows_executable_link_args(entry: &str, out_path: &Path) -> Vec<String> {
    vec![
        "/NOLOGO".to_string(),
        "/MACHINE:X64".to_string(),
        format!("/ENTRY:{entry}"),
        "/SUBSYSTEM:CONSOLE".to_string(),
        "/NODEFAULTLIB".to_string(),
        "/LARGEADDRESSAWARE:NO".to_string(),
        format!("/OUT:{}", windows_cmd_path(out_path)),
    ]
}

fn plan_windows_executable_link_args(
    entry: &str,
    out_path: &Path,
    object_path: &Path,
    extra_link_inputs: &[PathBuf],
) -> Vec<String> {
    let mut args = new_windows_executable_link_args(entry, out_path);
    args.push(windows_cmd_path(object_path));
    for input in extra_link_inputs {
        args.push(windows_cmd_path(input));
    }
    args
}

fn plan_windows_shared_runtime_link_args(
    runtime_library_path: &Path,
    runtime_import_library_path: &Path,
    exported_symbols: &[String],
    runtime_owned_objects: &[PathBuf],
    supplemental_runtime_objects: &[PathBuf],
    system_inputs: &[PathBuf],
) -> Vec<String> {
    let mut args = vec![
        "/NOLOGO".to_string(),
        "/MACHINE:X64".to_string(),
        "/DLL".to_string(),
        "/NOENTRY".to_string(),
        "/NODEFAULTLIB".to_string(),
        "/LARGEADDRESSAWARE:NO".to_string(),
        format!("/OUT:{}", windows_cmd_path(runtime_library_path)),
        format!("/IMPLIB:{}", windows_cmd_path(runtime_import_library_path)),
    ];
    for export in exported_symbols {
        args.push(format!("/EXPORT:{}", export));
    }
    for object in runtime_owned_objects {
        args.push(windows_cmd_path(object));
    }
    for object in supplemental_runtime_objects {
        args.push(windows_cmd_path(object));
    }
    for input in system_inputs {
        args.push(windows_cmd_path(input));
    }
    args
}

fn plan_windows_shared_app_link_args(
    out_path: &Path,
    runtime_import_library_path: &Path,
    startup_objects: &[PathBuf],
    app_owned_objects: &[PathBuf],
    system_inputs: &[PathBuf],
) -> Vec<String> {
    let mut args = new_windows_executable_link_args("mainCRTStartup", out_path);
    for object in startup_objects {
        args.push(windows_cmd_path(object));
    }
    for object in app_owned_objects {
        let normalized = object
            .to_string_lossy()
            .replace('\\', "/")
            .to_ascii_lowercase();
        if normalized.contains("/obj/aden/") || normalized.starts_with("obj/aden/") {
            continue;
        }
        args.push(windows_cmd_path(object));
    }
    args.push(windows_cmd_path(runtime_import_library_path));
    for input in system_inputs {
        args.push(windows_cmd_path(input));
    }
    args
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::cli::config::prewarm_adk_build_bridge_runner;
    use std::sync::OnceLock;

    fn ensure_adk_build_bridge_ready_for_toolchain_tests() {
        static READY: OnceLock<()> = OnceLock::new();
        READY.get_or_init(|| {
            prewarm_adk_build_bridge_runner()
                .expect("prewarm adk build bridge for toolchain tests");
        });
    }

    #[test]
    fn ordered_linker_candidates_lock_cli_env_and_default_policy() {
        ensure_adk_build_bridge_ready_for_toolchain_tests();
        let cli = ordered_linker_candidates(
            Some(Path::new("C:/tools/link.exe")),
            Some("C:/env/link.exe"),
            &[PathBuf::from("C:/vs/link.exe")],
        );
        assert_eq!(cli, vec![PathBuf::from("C:/tools/link.exe")]);

        let env_only = ordered_linker_candidates(
            None,
            Some("C:/env/link.exe"),
            &[PathBuf::from("C:/vs/link.exe")],
        );
        assert_eq!(env_only, vec![PathBuf::from("C:/env/link.exe")]);

        let discovered = ordered_linker_candidates(
            None,
            None,
            &[
                PathBuf::from("C:/vs/link.exe"),
                PathBuf::from("C:/VS/LINK.EXE"),
            ],
        );
        assert_eq!(
            discovered,
            vec![
                PathBuf::from("link.exe"),
                PathBuf::from("lld-link.exe"),
                PathBuf::from("C:/vs/link.exe"),
            ]
        );
    }

    #[test]
    fn ordered_ml64_candidates_lock_adjacent_and_fallback_policy() {
        ensure_adk_build_bridge_ready_for_toolchain_tests();
        let candidates = ordered_ml64_candidates(
            Some(Path::new("C:/tools/link.exe")),
            Some("C:/env/link.exe"),
            &[
                PathBuf::from("C:/vs/link.exe"),
                PathBuf::from("C:/VS/LINK.EXE"),
            ],
        );
        assert_eq!(
            candidates,
            vec![
                PathBuf::from("C:/tools/ml64.exe"),
                PathBuf::from("C:/env/ml64.exe"),
                PathBuf::from("C:/vs/ml64.exe"),
                PathBuf::from("ml64.exe"),
            ]
        );
    }

    #[test]
    fn toolchain_discovery_bridge_locks_windows_probe_graph() {
        ensure_adk_build_bridge_ready_for_toolchain_tests();
        let plan =
            adk_toolchain_discovery_plan().expect("resolve bridged toolchain discovery plan");
        assert_eq!(
            plan,
            AuthorToolchainDiscoveryPlan {
                visual_studio_roots: vec![
                    PathBuf::from("C:/Program Files/Microsoft Visual Studio"),
                    PathBuf::from("C:/Program Files (x86)/Microsoft Visual Studio"),
                ],
                visual_studio_tool_root_relative_path: PathBuf::from("VC/Tools/MSVC"),
                visual_studio_linker_relative_path: PathBuf::from("bin/Hostx64/x64/link.exe"),
                windows_sdk_lib_roots: vec![PathBuf::from(
                    "C:/Program Files (x86)/Windows Kits/10/Lib"
                )],
                windows_sdk_kernel32_relative_path: PathBuf::from("um/x64/kernel32.lib"),
            }
        );
    }

    #[test]
    fn toolchain_probe_bridge_executes_windows_probe_graph() {
        ensure_adk_build_bridge_ready_for_toolchain_tests();
        let root = std::env::temp_dir().join(format!(
            "adenc_toolchain_probe_bridge_{}_{}",
            std::process::id(),
            std::time::SystemTime::now()
                .duration_since(std::time::UNIX_EPOCH)
                .expect("time")
                .as_nanos()
        ));
        let vs_root = root.join("vs");
        let kits_root = root.join("kits");
        let link_path = vs_root
            .join("2022")
            .join("Community")
            .join("VC")
            .join("Tools")
            .join("MSVC")
            .join("14.40.0")
            .join("bin")
            .join("Hostx64")
            .join("x64")
            .join("link.exe");
        let kernel32 = kits_root
            .join("10.0.26100.0")
            .join("um")
            .join("x64")
            .join("kernel32.lib");
        fs::create_dir_all(link_path.parent().expect("link parent")).expect("create link dirs");
        fs::create_dir_all(kernel32.parent().expect("kernel parent")).expect("create kernel dirs");
        fs::write(&link_path, "").expect("write linker placeholder");
        fs::write(&kernel32, "").expect("write kernel32 placeholder");
        let result = adk_toolchain_probe_result_for_plan(
            &[vs_root.clone()],
            Path::new("VC/Tools/MSVC"),
            Path::new("bin/Hostx64/x64/link.exe"),
            &[kits_root.clone()],
            Path::new("um/x64/kernel32.lib"),
        )
        .expect("resolve bridged toolchain probe result");
        assert!(
            result.visual_studio_linkers == vec![link_path.clone()],
            "unexpected linker probe results: {:?}",
            result.visual_studio_linkers
        );
        assert!(
            result.kernel32_lib_path == Some(kernel32.clone()),
            "unexpected kernel32 probe result: {:?}",
            result.kernel32_lib_path
        );
        let _ = fs::remove_dir_all(root);
    }

    #[test]
    fn toolchain_discovery_helpers_lock_windows_probe_walks() {
        let root = std::env::temp_dir().join(format!(
            "adenc_toolchain_probe_lock_{}_{}",
            std::process::id(),
            std::time::SystemTime::now()
                .duration_since(std::time::UNIX_EPOCH)
                .expect("time")
                .as_nanos()
        ));
        let vs_root = root.join("vs");
        let kits_root = root.join("kits");
        let link_path = vs_root
            .join("2022")
            .join("Community")
            .join("VC")
            .join("Tools")
            .join("MSVC")
            .join("14.40.0")
            .join("bin")
            .join("Hostx64")
            .join("x64")
            .join("link.exe");
        let kernel32 = kits_root
            .join("10.0.26100.0")
            .join("um")
            .join("x64")
            .join("kernel32.lib");
        fs::create_dir_all(link_path.parent().expect("link parent")).expect("create link dirs");
        fs::create_dir_all(kernel32.parent().expect("kernel parent")).expect("create kernel dirs");
        fs::write(&link_path, "").expect("write linker placeholder");
        fs::write(&kernel32, "").expect("write kernel32 placeholder");

        let plan = AuthorToolchainDiscoveryPlan {
            visual_studio_roots: vec![vs_root.clone()],
            visual_studio_tool_root_relative_path: PathBuf::from("VC/Tools/MSVC"),
            visual_studio_linker_relative_path: PathBuf::from("bin/Hostx64/x64/link.exe"),
            windows_sdk_lib_roots: vec![kits_root.clone()],
            windows_sdk_kernel32_relative_path: PathBuf::from("um/x64/kernel32.lib"),
        };
        assert_eq!(
            discover_visual_studio_linkers_with_plan(&plan),
            vec![link_path.clone()]
        );
        assert_eq!(
            discover_kernel32_lib_with_plan(&plan),
            Some(kernel32.clone())
        );

        let _ = fs::remove_dir_all(root);
    }

    #[test]
    fn windows_executable_link_args_lock_order_and_rsp_rendering() {
        let args = plan_windows_executable_link_args(
            "mainCRTStartup",
            Path::new("build/main.exe"),
            Path::new("obj/runtime/Startup.obj"),
            &[
                PathBuf::from("obj/runtime/StdlibRuntime.obj"),
                PathBuf::from("kernel32.lib"),
            ],
        );
        assert_eq!(
            args,
            vec![
                "/NOLOGO",
                "/MACHINE:X64",
                "/ENTRY:mainCRTStartup",
                "/SUBSYSTEM:CONSOLE",
                "/NODEFAULTLIB",
                "/LARGEADDRESSAWARE:NO",
                "/OUT:build/main.exe",
                "obj/runtime/Startup.obj",
                "obj/runtime/StdlibRuntime.obj",
                "kernel32.lib",
            ]
            .into_iter()
            .map(String::from)
            .collect::<Vec<_>>()
        );
        assert_eq!(
            render_linker_response_file_body(&args),
            "\"/NOLOGO\"\n\"/MACHINE:X64\"\n\"/ENTRY:mainCRTStartup\"\n\"/SUBSYSTEM:CONSOLE\"\n\"/NODEFAULTLIB\"\n\"/LARGEADDRESSAWARE:NO\"\n\"/OUT:build/main.exe\"\n\"obj/runtime/Startup.obj\"\n\"obj/runtime/StdlibRuntime.obj\"\n\"kernel32.lib\"\n"
        );
        assert_eq!(
            response_file_argument(Path::new("build/native_exe_link.rsp")),
            "@build/native_exe_link.rsp"
        );
    }

    #[test]
    fn windows_shared_link_args_lock_runtime_and_app_shapes() {
        let runtime_args = plan_windows_shared_runtime_link_args(
            Path::new("build/adencore.dll"),
            Path::new("build/adencore.lib"),
            &[
                "adenc_rt_init".to_string(),
                "adenc_rt_shutdown".to_string(),
            ],
            &[PathBuf::from("obj/runtime/StdlibRuntime.obj")],
            &[PathBuf::from("obj/aden/lang/IO.obj")],
            &[PathBuf::from("kernel32.lib")],
        );
        assert_eq!(
            runtime_args,
            vec![
                "/NOLOGO",
                "/MACHINE:X64",
                "/DLL",
                "/NOENTRY",
                "/NODEFAULTLIB",
                "/LARGEADDRESSAWARE:NO",
                "/OUT:build/adencore.dll",
                "/IMPLIB:build/adencore.lib",
                "/EXPORT:adenc_rt_init",
                "/EXPORT:adenc_rt_shutdown",
                "obj/runtime/StdlibRuntime.obj",
                "obj/aden/lang/IO.obj",
                "kernel32.lib",
            ]
            .into_iter()
            .map(String::from)
            .collect::<Vec<_>>()
        );

        let app_args = plan_windows_shared_app_link_args(
            Path::new("build/main.exe"),
            Path::new("build/adencore.lib"),
            &[PathBuf::from("obj/runtime/Startup.obj")],
            &[
                PathBuf::from("obj/app/core/Main.obj"),
                PathBuf::from("obj/aden/lang/IO.obj"),
            ],
            &[PathBuf::from("kernel32.lib")],
        );
        assert_eq!(
            app_args,
            vec![
                "/NOLOGO",
                "/MACHINE:X64",
                "/ENTRY:mainCRTStartup",
                "/SUBSYSTEM:CONSOLE",
                "/NODEFAULTLIB",
                "/LARGEADDRESSAWARE:NO",
                "/OUT:build/main.exe",
                "obj/runtime/Startup.obj",
                "obj/app/core/Main.obj",
                "build/adencore.lib",
                "kernel32.lib",
            ]
            .into_iter()
            .map(String::from)
            .collect::<Vec<_>>()
        );
    }

    #[test]
    fn toolchain_process_plans_lock_environment_merge_and_process_shapes() {
        let merged = merge_environment_plan(
            &ToolchainEnvironmentPlan {
                inherit_parent_environment: true,
                overrides: vec![
                    ("PATH".to_string(), "C:/base".to_string()),
                    ("LIB".to_string(), "C:/libs".to_string()),
                ],
            },
            &[
                ("path".to_string(), "C:/override".to_string()),
                ("INCLUDE".to_string(), "C:/include".to_string()),
            ],
        );
        assert_eq!(
            merged,
            ToolchainEnvironmentPlan {
                inherit_parent_environment: true,
                overrides: vec![
                    ("LIB".to_string(), "C:/libs".to_string()),
                    ("path".to_string(), "C:/override".to_string()),
                    ("INCLUDE".to_string(), "C:/include".to_string()),
                ],
            }
        );

        let link_process = plan_response_file_process(
            Path::new("link.exe"),
            Some(Path::new("build")),
            Path::new("build/native_exe_link.rsp"),
            merged.clone(),
        );
        assert_eq!(
            link_process,
            ToolchainProcessPlan {
                executable: PathBuf::from("link.exe"),
                working_directory: None,
                arguments: vec!["@build/native_exe_link.rsp".to_string()],
                environment: merged.clone(),
            }
        );

        let masm_process = plan_windows_masm_assemble_process(
            Path::new("ml64.exe"),
            Some(Path::new("build")),
            Path::new("build/main.asm"),
            Path::new("build/main.obj"),
            default_toolchain_environment_plan(),
        );
        assert_eq!(
            masm_process,
            ToolchainProcessPlan {
                executable: PathBuf::from("ml64.exe"),
                working_directory: None,
                arguments: vec![
                    "/c".to_string(),
                    "/nologo".to_string(),
                    "/Fobuild/main.obj".to_string(),
                    "build/main.asm".to_string(),
                ],
                environment: default_toolchain_environment_plan(),
            }
        );
    }

    #[test]
    fn toolchain_response_file_bridge_writes_host_file() {
        ensure_adk_build_bridge_ready_for_toolchain_tests();
        let temp_root = std::env::temp_dir().join(format!(
            "adenc_toolchain_rsp_bridge_{}_{}",
            std::process::id(),
            std::time::SystemTime::now()
                .duration_since(std::time::UNIX_EPOCH)
                .expect("system time")
                .as_nanos()
        ));
        let rsp_path = temp_root.join("nested").join("native_exe_link.rsp");
        let mut args = vec![
            "/NOLOGO".to_string(),
            "/OUT:build/main.exe".to_string(),
            "obj/app/core/Main.obj".to_string(),
        ];
        for index in 0..40 {
            args.push(format!(
                "C:/Users/EMBERB~1/AppData/Local/Temp/adenc_toolchain_rsp_bridge/obj{:02}.obj",
                index
            ));
        }
        let written = adk_toolchain_write_response_file(&rsp_path, &args)
            .expect("write response file through adk bridge");
        assert_eq!(
            written,
            PathBuf::from(normalize_bridge_path(&rsp_path.display().to_string()))
        );
        let body = fs::read_to_string(&rsp_path).expect("read bridged response file");
        let expected = args
            .iter()
            .map(|arg| format!("\"{}\"", arg))
            .collect::<Vec<_>>()
            .join("\n")
            + "\n";
        assert_eq!(body, expected);
        let _ = fs::remove_dir_all(temp_root);
    }

    #[test]
    fn toolchain_process_bridge_executes_shell_capture_flow() {
        ensure_adk_build_bridge_ready_for_toolchain_tests();
        let process = ToolchainProcessPlan {
            executable: PathBuf::from("cmd.exe"),
            working_directory: None,
            arguments: vec![
                "/d".to_string(),
                "/c".to_string(),
                "echo toolchain_bridge_ok".to_string(),
            ],
            environment: default_toolchain_environment_plan(),
        };
        let output =
            adk_toolchain_execute_process(&process).expect("execute toolchain process bridge");
        assert!(
            output.status.success(),
            "bridge process failed: {:?}",
            output.status
        );
        let stdout = String::from_utf8_lossy(&output.stdout);
        let stderr = String::from_utf8_lossy(&output.stderr);
        assert!(
            stdout.contains("toolchain_bridge_ok"),
            "unexpected stdout: {}",
            stdout
        );
        assert!(stderr.trim().is_empty(), "unexpected stderr: {}", stderr);
    }
}
