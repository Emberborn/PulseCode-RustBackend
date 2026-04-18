use super::*;
use crate::backend::PlanTargetAdapterMetadata;
use crate::backend::NativeLinkPlan;
use crate::cli::config::{
    append_bridge_request_raw_value, append_bridge_request_value, run_author_build_bridge_request,
};
use std::collections::HashMap;

pub(super) fn lower_checked_project_to_ir(result: &CheckResult) -> Result<IrProgram, String> {
    if result.class_contexts.len() != result.merged.classes.len() {
        return Err(format!(
            "class context mismatch: {} contexts for {} classes",
            result.class_contexts.len(),
            result.merged.classes.len()
        ));
    }
    lower_to_ir_with_contexts(&result.merged, &result.class_contexts)
}

#[derive(Debug, Clone)]
pub(super) struct CliFlags {
    pub(super) strict_package: bool,
    pub(super) friendly: bool,
    pub(super) project_root: Option<String>,
    pub(super) source_root: Option<String>,
    pub(super) profile: Option<String>,
    pub(super) target: Option<String>,
    pub(super) output_mode: Option<String>,
    pub(super) runtime_debug_allocator: Option<String>,
    pub(super) runtime_cycle_collector: Option<String>,
    pub(super) out_dir: Option<String>,
    pub(super) assembler: Option<String>,
    pub(super) linker: Option<String>,
}

#[derive(Debug, Clone)]
pub(super) struct BuildPublicationPlan {
    artifact_stamp: String,
    publish_profile_layout: bool,
    publish_debug_diagnostics: bool,
    shared_profile_layout: bool,
    published_ir_path: PathBuf,
    published_native_plan_path: PathBuf,
    published_link_report_path: PathBuf,
    published_object_path: PathBuf,
    published_executable_path: Option<PathBuf>,
    published_runtime_library_path: Option<PathBuf>,
    published_runtime_import_library_path: Option<PathBuf>,
    published_assets_root: Option<PathBuf>,
    shared_launch_metadata_path: Option<PathBuf>,
    artifact_stamp_path: PathBuf,
    build_config_plan_path: PathBuf,
}

pub(super) fn execute_build_pipeline(
    resolved: &BuildInvocation,
    flags: &CliFlags,
) -> Result<BuildRun, String> {
    let publish_profile_layout = resolved.used_manifest || flags.profile.is_some();
    let backend_out_dir = if publish_profile_layout {
        let dir = resolved
            .build_tmp_dir
            .join("backend")
            .join(&resolved.profile);
        if dir.exists() {
            fs::remove_dir_all(&dir).map_err(|e| {
                format!(
                    "Failed to reset backend tmp directory '{}': {}",
                    dir.display(),
                    e
                )
            })?;
        }
        dir
    } else {
        resolved.build_root.clone()
    };
    let (files_loaded, artifact) = execute_build_compiler_core(
        resolved,
        &backend_out_dir,
        resolved.profile == "debug",
    )?;
    let publish_debug_diagnostics = publish_profile_layout && resolved.profile == "debug";
    let (published_artifact, build_config_plan_path) = finalize_build_outputs(
        resolved,
        &artifact,
        &backend_out_dir,
        publish_profile_layout,
        publish_debug_diagnostics,
        flags,
    )?;
    if publish_debug_diagnostics && backend_out_dir.exists() {
        fs::remove_dir_all(&backend_out_dir).map_err(|e| {
            format!(
                "Failed to clean backend tmp directory '{}': {}",
                backend_out_dir.display(),
                e
            )
        })?;
    }
    Ok(BuildRun {
        resolved: resolved.clone(),
        files_loaded,
        artifact: published_artifact,
        build_config_plan_path,
    })
}

fn execute_build_compiler_core(
    resolved: &BuildInvocation,
    backend_out_dir: &Path,
    emit_statement_trace_metadata: bool,
) -> Result<(usize, BackendArtifact), String> {
    if let Ok(result) = execute_build_compiler_core_via_authorlib_bridge(
        resolved,
        backend_out_dir,
        emit_statement_trace_metadata,
    ) {
        return Ok(result);
    }
    let result = check_project_with_authorlib(
        &resolved.entry_path,
        resolved.source_root.as_deref(),
        true,
        resolved.authorlib_enabled,
    )?;
    let ir =
        lower_checked_project_to_ir(&result).map_err(|e| format!("IR lowering failed: {e}"))?;
    let backend = RustHostBootstrapBackend {
        linker_override: resolved.linker.as_ref().map(PathBuf::from),
        target_id: resolved.target.clone(),
        output_mode: resolved.output_mode.clone(),
        output_entry: resolved.output_entry.clone(),
        emit_statement_trace_metadata,
    };
    let artifact = backend
        .emit(&ir, backend_out_dir)
        .map_err(|e| format!("backend emit failed: {e}"))?;
    Ok((result.files_loaded, artifact))
}

fn execute_build_compiler_core_via_authorlib_bridge(
    resolved: &BuildInvocation,
    backend_out_dir: &Path,
    emit_statement_trace_metadata: bool,
) -> Result<(usize, BackendArtifact), String> {
    let current_exe = env::current_exe()
        .map_err(|e| format!("Failed to resolve pulsec provider path: {e}"))?;
    let emit_trace_value = if emit_statement_trace_metadata {
        "true"
    } else {
        "false"
    };
    let request = {
        let mut out = String::new();
        out.push_str("compiler-execute-build-core\n");
        append_bridge_request_raw_value(&mut out, current_exe.to_str());
        append_bridge_request_raw_value(&mut out, Some(&resolved.entry_path));
        append_bridge_request_raw_value(&mut out, resolved.source_root.as_deref());
        append_bridge_request_raw_value(
            &mut out,
            Some(if resolved.authorlib_enabled { "true" } else { "false" }),
        );
        append_bridge_request_raw_value(&mut out, Some(&resolved.target));
        append_bridge_request_raw_value(&mut out, Some(&resolved.output_mode));
        append_bridge_request_raw_value(&mut out, Some(&resolved.output_entry));
        append_bridge_request_raw_value(&mut out, resolved.linker.as_deref());
        append_bridge_request_raw_value(&mut out, Some(emit_trace_value));
        append_bridge_request_raw_value(&mut out, backend_out_dir.to_str());
        out
    };
    let stdout = run_author_build_bridge_request(&request)?;
    parse_build_compiler_core_bridge_output(&stdout)
}

fn parse_build_compiler_core_bridge_output(text: &str) -> Result<(usize, BackendArtifact), String> {
    let values = parse_build_compiler_core_bridge_values(text)?;
    let success = match values.first().and_then(|value| value.as_deref()) {
        Some("true") => true,
        Some("false") => false,
        other => {
            return Err(format!(
                "author compiler build bridge returned invalid success flag {:?}",
                other
            ));
        }
    };
    if !success {
        return Err(values
            .get(13)
            .and_then(|value| value.clone())
            .unwrap_or_else(|| "unknown compiler build provider failure".to_string()));
    }
    let files_loaded = parse_build_core_usize(values.get(1).and_then(|v| v.as_deref()), "filesLoaded")?;
    let classes = parse_build_core_usize(values.get(2).and_then(|v| v.as_deref()), "classes")?;
    let methods = parse_build_core_usize(values.get(3).and_then(|v| v.as_deref()), "methods")?;
    let fields = parse_build_core_usize(values.get(4).and_then(|v| v.as_deref()), "fields")?;
    let artifact = BackendArtifact {
        classes,
        methods,
        fields,
        ir_artifact_path: PathBuf::from(required_build_core_value(&values, 5, "irArtifactPath")?),
        native_plan_path: PathBuf::from(required_build_core_value(&values, 6, "nativePlanPath")?),
        object_path: PathBuf::from(required_build_core_value(&values, 7, "objectPath")?),
        exe_path: optional_build_core_path(&values, 8),
        runtime_library_path: optional_build_core_path(&values, 9),
        runtime_import_library_path: optional_build_core_path(&values, 10),
        link_report_path: PathBuf::from(required_build_core_value(&values, 11, "linkReportPath")?),
        entry_codegen: required_build_core_value(&values, 12, "entryCodegen")?,
        link_plan: NativeLinkPlan::default(),
    };
    Ok((files_loaded, artifact))
}

fn parse_build_compiler_core_bridge_values(text: &str) -> Result<Vec<Option<String>>, String> {
    let mut out = Vec::new();
    for line in text.lines() {
        let separator = line.find(':').ok_or_else(|| {
            format!("author compiler build bridge line missing ':' separator: {line}")
        })?;
        let present = &line[..separator];
        let encoded = &line[(separator + 1)..];
        let value = match present {
            "0" => None,
            "1" => Some(unescape_build_core_value(encoded)?),
            other => {
                return Err(format!(
                    "author compiler build bridge line has invalid presence flag '{other}'"
                ));
            }
        };
        out.push(value);
    }
    Ok(out)
}

fn required_build_core_value(
    values: &[Option<String>],
    index: usize,
    key: &str,
) -> Result<String, String> {
    values
        .get(index)
        .and_then(|value| value.clone())
        .ok_or_else(|| format!("author compiler build bridge missing '{key}'"))
}

fn optional_build_core_path(values: &[Option<String>], index: usize) -> Option<PathBuf> {
    values
        .get(index)
        .and_then(|value| value.clone())
        .filter(|value| !value.is_empty())
        .map(PathBuf::from)
}

fn parse_build_core_usize(value: Option<&str>, key: &str) -> Result<usize, String> {
    match value {
        Some(raw) if !raw.is_empty() => raw
            .parse::<usize>()
            .map_err(|e| format!("author compiler build bridge key '{key}' parse failed: {e}")),
        _ => Ok(0),
    }
}

fn unescape_build_core_value(value: &str) -> Result<String, String> {
    let mut out = String::new();
    let mut chars = value.chars();
    while let Some(ch) = chars.next() {
        if ch != '\\' {
            out.push(ch);
            continue;
        }
        let escaped = chars.next().ok_or_else(|| {
            "author compiler build bridge value ended in dangling escape".to_string()
        })?;
        match escaped {
            'n' => out.push('\n'),
            'r' => out.push('\r'),
            '\\' => out.push('\\'),
            other => {
                out.push('\\');
                out.push(other);
            }
        }
    }
    Ok(out)
}

fn finalize_build_outputs(
    resolved: &BuildInvocation,
    artifact: &BackendArtifact,
    backend_out_dir: &Path,
    publish_profile_layout: bool,
    publish_debug_diagnostics: bool,
    flags: &CliFlags,
) -> Result<(BackendArtifact, PathBuf), String> {
    if let Ok((published_artifact, build_config_plan_path)) = author_build_finalize_outputs(
        resolved,
        artifact,
        backend_out_dir,
        publish_profile_layout,
        publish_debug_diagnostics,
    ) {
        return Ok((published_artifact, build_config_plan_path));
    }

    materialize_build_layout(resolved, artifact, backend_out_dir)?;
    let publication_plan = resolve_build_publication_plan(
        resolved,
        artifact,
        backend_out_dir,
        publish_profile_layout,
        publish_debug_diagnostics,
    )?;
    let published_artifact = publish_build_artifacts(resolved, artifact, &publication_plan)?;
    let build_config_plan_path =
        emit_resolved_build_config_plan(resolved, &published_artifact, &publication_plan, flags)?;
    materialize_stamped_build_artifacts(resolved, &publication_plan)?;
    Ok((published_artifact, build_config_plan_path))
}

pub(super) fn publish_build_artifacts(
    resolved: &BuildInvocation,
    artifact: &BackendArtifact,
    publication_plan: &BuildPublicationPlan,
) -> Result<BackendArtifact, String> {
    if let Ok(output) = run_author_build_bridge_request(
        &emit_build_publish_artifacts_bridge_request(resolved, artifact, publication_plan),
    ) {
        let (
            ir_artifact_path,
            native_plan_path,
            link_report_path,
            object_path,
            exe_path,
            runtime_library_path,
            runtime_import_library_path,
        ) = parse_build_published_artifact_bridge_output(&output)?;
        return Ok(BackendArtifact {
            classes: artifact.classes,
            methods: artifact.methods,
            fields: artifact.fields,
            ir_artifact_path,
            native_plan_path,
            object_path,
            exe_path,
            runtime_library_path,
            runtime_import_library_path,
            link_report_path,
            entry_codegen: artifact.entry_codegen.clone(),
            link_plan: artifact.link_plan.clone(),
        });
    }

    publish_build_artifacts_fallback(resolved, artifact, publication_plan)
}

fn publish_build_artifacts_fallback(
    resolved: &BuildInvocation,
    artifact: &BackendArtifact,
    publication_plan: &BuildPublicationPlan,
) -> Result<BackendArtifact, String> {
    if !publication_plan.publish_profile_layout {
        return Ok(artifact.clone());
    }

    if publication_plan.publish_debug_diagnostics {
        copy_file_into(
            &artifact.ir_artifact_path,
            &publication_plan.published_ir_path,
        )?;
        copy_file_into(
            &artifact.native_plan_path,
            &publication_plan.published_native_plan_path,
        )?;
        copy_file_into(
            &artifact.link_report_path,
            &publication_plan.published_link_report_path,
        )?;
    }

    let object_path = publication_plan.published_object_path.clone();

    let exe_path = if let (Some(exe), Some(target)) = (
        artifact.exe_path.as_ref(),
        publication_plan.published_executable_path.as_ref(),
    ) {
        copy_file_into(exe, target)?;
        Some(target.clone())
    } else {
        None
    };
    let runtime_library_path = if let (Some(src), Some(target)) = (
        artifact.runtime_library_path.as_ref(),
        publication_plan.published_runtime_library_path.as_ref(),
    ) {
        copy_file_into(src, target)?;
        Some(target.clone())
    } else {
        None
    };
    let runtime_import_library_path = if let (Some(src), Some(target)) = (
        artifact.runtime_import_library_path.as_ref(),
        publication_plan
            .published_runtime_import_library_path
            .as_ref(),
    ) {
        copy_file_into(src, target)?;
        Some(target.clone())
    } else {
        None
    };
    if resolved.build_assets_dir.exists() {
        if let Some(target) = publication_plan.published_assets_root.as_ref() {
            copy_dir_recursive(&resolved.build_assets_dir, target)?;
        }
    }
    if publication_plan.shared_profile_layout {
        if let (Some(exe), Some(runtime_library), Some(runtime_import_library), Some(launch_path)) = (
            exe_path.as_ref(),
            runtime_library_path.as_ref(),
            runtime_import_library_path.as_ref(),
            publication_plan.shared_launch_metadata_path.as_ref(),
        ) {
            write_shared_runtime_lookup_metadata(
                launch_path,
                &resolved.profile,
                &publication_plan.artifact_stamp,
                exe,
                runtime_library,
                runtime_import_library,
                ".",
            )?;
        }
    }

    Ok(BackendArtifact {
        classes: artifact.classes,
        methods: artifact.methods,
        fields: artifact.fields,
        ir_artifact_path: publication_plan.published_ir_path.clone(),
        native_plan_path: publication_plan.published_native_plan_path.clone(),
        object_path,
        exe_path,
        runtime_library_path,
        runtime_import_library_path,
        link_report_path: publication_plan.published_link_report_path.clone(),
        entry_codegen: artifact.entry_codegen.clone(),
        link_plan: artifact.link_plan.clone(),
    })
}

pub(super) fn published_object_path(
    resolved: &BuildInvocation,
    artifact: &BackendArtifact,
    backend_out_dir: &Path,
) -> PathBuf {
    if let Ok(rel) = artifact
        .object_path
        .strip_prefix(backend_out_dir.join("obj"))
    {
        resolved.build_generated_dir.join(rel)
    } else {
        resolved.build_generated_dir.join(
            artifact
                .object_path
                .file_name()
                .unwrap_or_else(|| std::ffi::OsStr::new("main.obj")),
        )
    }
}

pub(super) fn normalized_artifact_label_segment(raw: &str, fallback: &str) -> String {
    let mut out = String::new();
    let mut last_dash = false;
    for ch in raw.chars() {
        let c = ch.to_ascii_lowercase();
        let keep = c.is_ascii_alphanumeric() || c == '.' || c == '_' || c == '-';
        if keep {
            out.push(c);
            last_dash = false;
        } else if !last_dash {
            out.push('-');
            last_dash = true;
        }
    }
    let trimmed = out.trim_matches('-').trim_matches('.').trim_matches('_');
    if trimmed.is_empty() {
        fallback.to_string()
    } else {
        trimmed.to_string()
    }
}

pub(super) fn build_artifact_identity(resolved: &BuildInvocation) -> (String, String, String) {
    let package_name = normalized_artifact_label_segment(
        resolved.package_name.as_deref().unwrap_or("unnamed"),
        "unnamed",
    );
    let package_version = normalized_artifact_label_segment(
        resolved.package_version.as_deref().unwrap_or("0.0.0"),
        "0.0.0",
    );
    let profile = normalized_artifact_label_segment(&resolved.profile, "release");
    let stamp = format!("{package_name}-{package_version}-{profile}");
    (package_name, package_version, stamp)
}

pub(super) fn build_artifact_base_name(resolved: &BuildInvocation) -> String {
    let (package_name, package_version, _) = build_artifact_identity(resolved);
    format!("{package_name}-{package_version}")
}

fn emit_build_publication_plan_bridge_request(
    resolved: &BuildInvocation,
    artifact: &BackendArtifact,
    backend_out_dir: &Path,
    publish_profile_layout: bool,
    publish_debug_diagnostics: bool,
) -> String {
    let mut out = String::new();
    out.push_str("build-publication-plan\n");
    append_bridge_request_value(&mut out, "buildRoot", resolved.build_root.to_str());
    append_bridge_request_value(&mut out, "outputRoot", resolved.output_root.to_str());
    append_bridge_request_value(
        &mut out,
        "generatedRoot",
        resolved.build_generated_dir.to_str(),
    );
    append_bridge_request_value(&mut out, "assetsRoot", resolved.build_assets_dir.to_str());
    append_bridge_request_value(&mut out, "tmpRoot", resolved.build_tmp_dir.to_str());
    append_bridge_request_raw_value(&mut out, Some(&resolved.profile));
    append_bridge_request_raw_value(&mut out, Some(&resolved.output_mode));
    append_bridge_request_raw_value(&mut out, resolved.package_name.as_deref());
    append_bridge_request_raw_value(&mut out, resolved.package_version.as_deref());
    append_bridge_request_value(&mut out, "backendOutDir", backend_out_dir.to_str());
    append_bridge_request_value(&mut out, "irPath", artifact.ir_artifact_path.to_str());
    append_bridge_request_value(
        &mut out,
        "nativePlanPath",
        artifact.native_plan_path.to_str(),
    );
    append_bridge_request_value(
        &mut out,
        "linkReportPath",
        artifact.link_report_path.to_str(),
    );
    append_bridge_request_value(&mut out, "objectPath", artifact.object_path.to_str());
    append_bridge_request_value(
        &mut out,
        "executablePath",
        artifact.exe_path.as_deref().and_then(Path::to_str),
    );
    append_bridge_request_value(
        &mut out,
        "runtimeLibraryPath",
        artifact
            .runtime_library_path
            .as_deref()
            .and_then(Path::to_str),
    );
    append_bridge_request_value(
        &mut out,
        "runtimeImportLibraryPath",
        artifact
            .runtime_import_library_path
            .as_deref()
            .and_then(Path::to_str),
    );
    append_bridge_request_raw_value(
        &mut out,
        Some(if publish_profile_layout {
            "true"
        } else {
            "false"
        }),
    );
    append_bridge_request_raw_value(
        &mut out,
        Some(if publish_debug_diagnostics {
            "true"
        } else {
            "false"
        }),
    );
    out
}

fn parse_build_publication_plan_bridge_output(text: &str) -> Result<BuildPublicationPlan, String> {
    let mut values: HashMap<String, Option<String>> = HashMap::new();
    for line in text.lines() {
        if line.trim().is_empty() {
            continue;
        }
        let (key, raw) = line
            .split_once('=')
            .ok_or_else(|| format!("invalid build publication bridge line '{}'", line))?;
        let (present, encoded) = raw
            .split_once(':')
            .ok_or_else(|| format!("invalid build publication bridge value '{}'", line))?;
        let value = match present {
            "0" => None,
            "1" => Some(unescape_build_publication_bridge_value(encoded)?),
            _ => {
                return Err(format!(
                    "invalid build publication bridge presence tag '{}'",
                    present
                ))
            }
        };
        values.insert(key.to_string(), value);
    }

    Ok(BuildPublicationPlan {
        artifact_stamp: required_build_publication_bridge_value(&values, "artifactStamp")?,
        publish_profile_layout: parse_build_publication_bridge_bool(
            &values,
            "publishProfileLayout",
        )?,
        publish_debug_diagnostics: parse_build_publication_bridge_bool(
            &values,
            "publishDebugDiagnostics",
        )?,
        shared_profile_layout: parse_build_publication_bridge_bool(&values, "sharedProfileLayout")?,
        published_ir_path: PathBuf::from(required_build_publication_bridge_value(
            &values,
            "publishedIrPath",
        )?),
        published_native_plan_path: PathBuf::from(required_build_publication_bridge_value(
            &values,
            "publishedNativePlanPath",
        )?),
        published_link_report_path: PathBuf::from(required_build_publication_bridge_value(
            &values,
            "publishedLinkReportPath",
        )?),
        published_object_path: PathBuf::from(required_build_publication_bridge_value(
            &values,
            "publishedObjectPath",
        )?),
        published_executable_path: optional_build_publication_bridge_path(
            &values,
            "publishedExecutablePath",
        ),
        published_runtime_library_path: optional_build_publication_bridge_path(
            &values,
            "publishedRuntimeLibraryPath",
        ),
        published_runtime_import_library_path: optional_build_publication_bridge_path(
            &values,
            "publishedRuntimeImportLibraryPath",
        ),
        published_assets_root: optional_build_publication_bridge_path(
            &values,
            "publishedAssetsRoot",
        ),
        shared_launch_metadata_path: optional_build_publication_bridge_path(
            &values,
            "sharedLaunchMetadataPath",
        ),
        artifact_stamp_path: PathBuf::from(required_build_publication_bridge_value(
            &values,
            "artifactStampPath",
        )?),
        build_config_plan_path: PathBuf::from(required_build_publication_bridge_value(
            &values,
            "buildConfigPlanPath",
        )?),
    })
}

fn required_build_publication_bridge_value(
    values: &HashMap<String, Option<String>>,
    key: &str,
) -> Result<String, String> {
    values
        .get(key)
        .ok_or_else(|| format!("build publication bridge missing key '{}'", key))?
        .clone()
        .ok_or_else(|| format!("build publication bridge key '{}' must not be null", key))
}

fn optional_build_publication_bridge_path(
    values: &HashMap<String, Option<String>>,
    key: &str,
) -> Option<PathBuf> {
    values.get(key).cloned().flatten().map(PathBuf::from)
}

fn parse_build_publication_bridge_bool(
    values: &HashMap<String, Option<String>>,
    key: &str,
) -> Result<bool, String> {
    match required_build_publication_bridge_value(values, key)?.as_str() {
        "true" => Ok(true),
        "false" => Ok(false),
        other => Err(format!(
            "build publication bridge key '{}' has invalid boolean '{}'",
            key, other
        )),
    }
}

fn unescape_build_publication_bridge_value(value: &str) -> Result<String, String> {
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
            None => return Err("build publication bridge ended inside escape sequence".to_string()),
        }
    }
    Ok(out)
}

fn resolve_build_publication_plan(
    resolved: &BuildInvocation,
    artifact: &BackendArtifact,
    backend_out_dir: &Path,
    publish_profile_layout: bool,
    publish_debug_diagnostics: bool,
) -> Result<BuildPublicationPlan, String> {
    if let Ok(output) =
        run_author_build_bridge_request(&emit_build_publication_plan_bridge_request(
            resolved,
            artifact,
            backend_out_dir,
            publish_profile_layout,
            publish_debug_diagnostics,
        ))
    {
        return parse_build_publication_plan_bridge_output(&output);
    }

    let artifact_base_name = build_artifact_base_name(resolved);
    let (_, _, artifact_stamp) = build_artifact_identity(resolved);
    let shared_profile_layout = publish_profile_layout && resolved.output_mode == "shared";
    let profile_bin_dir = if shared_profile_layout {
        Some(resolved.output_root.join("bin"))
    } else {
        None
    };
    let profile_metadata_dir = if shared_profile_layout && publish_debug_diagnostics {
        Some(resolved.output_root.join("metadata"))
    } else {
        None
    };
    let debug_target_root = profile_metadata_dir
        .as_ref()
        .unwrap_or(&resolved.output_root);
    let published_ir_path = if publish_debug_diagnostics {
        debug_target_root.join(format!("{artifact_base_name}-pulsec.ir.txt"))
    } else {
        artifact.ir_artifact_path.clone()
    };
    let published_native_plan_path = if publish_debug_diagnostics {
        debug_target_root.join(format!("{artifact_base_name}-native.plan.json"))
    } else {
        artifact.native_plan_path.clone()
    };
    let published_link_report_path = if publish_debug_diagnostics {
        debug_target_root.join(format!("{artifact_base_name}-native.link.txt"))
    } else {
        artifact.link_report_path.clone()
    };
    let published_object_path = if publish_profile_layout {
        published_object_path(resolved, artifact, backend_out_dir)
    } else {
        artifact.object_path.clone()
    };
    let published_executable_path = artifact.exe_path.as_ref().map(|exe| {
        if publish_profile_layout {
            profile_bin_dir
                .as_ref()
                .unwrap_or(&resolved.output_root)
                .join(format!("{artifact_base_name}.exe"))
        } else {
            exe.clone()
        }
    });
    let published_runtime_library_path = artifact.runtime_library_path.as_ref().map(|path| {
        if publish_profile_layout {
            profile_bin_dir
                .as_ref()
                .unwrap_or(&resolved.output_root)
                .join(
                    path.file_name()
                        .unwrap_or_else(|| std::ffi::OsStr::new("pulsecore.dll")),
                )
        } else {
            path.clone()
        }
    });
    let published_runtime_import_library_path =
        artifact.runtime_import_library_path.as_ref().map(|path| {
            if publish_profile_layout {
                profile_bin_dir
                    .as_ref()
                    .unwrap_or(&resolved.output_root)
                    .join(
                        path.file_name()
                            .unwrap_or_else(|| std::ffi::OsStr::new("pulsecore.lib")),
                    )
            } else {
                path.clone()
            }
        });
    let published_assets_root = Some(if publish_profile_layout {
        profile_bin_dir
            .as_ref()
            .unwrap_or(&resolved.output_root)
            .clone()
    } else {
        resolved.build_assets_dir.clone()
    });
    let shared_launch_metadata_path = if shared_profile_layout
        && published_executable_path.is_some()
        && published_runtime_library_path.is_some()
        && published_runtime_import_library_path.is_some()
    {
        profile_bin_dir.as_ref().map(|dir| dir.join("launch.txt"))
    } else {
        None
    };
    let artifact_stamp_path = if publish_profile_layout && shared_profile_layout {
        resolved.output_root.join("metadata").join("stamp.txt")
    } else if publish_profile_layout {
        resolved.output_root.join("stamp.txt")
    } else {
        resolved.output_root.join("artifact.stamp.txt")
    };
    let build_config_plan_path = if publish_profile_layout && publish_debug_diagnostics {
        let debug_root = if shared_profile_layout {
            resolved.output_root.join("metadata")
        } else {
            resolved.output_root.clone()
        };
        debug_root.join(format!("{artifact_base_name}-build.config.plan.json"))
    } else if publish_profile_layout {
        resolved
            .build_tmp_dir
            .join(format!("{artifact_base_name}-build.config.plan.json"))
    } else {
        resolved.build_root.join("build.config.plan.json")
    };

    Ok(BuildPublicationPlan {
        artifact_stamp,
        publish_profile_layout,
        publish_debug_diagnostics,
        shared_profile_layout,
        published_ir_path,
        published_native_plan_path,
        published_link_report_path,
        published_object_path,
        published_executable_path,
        published_runtime_library_path,
        published_runtime_import_library_path,
        published_assets_root,
        shared_launch_metadata_path,
        artifact_stamp_path,
        build_config_plan_path,
    })
}

fn emit_build_write_launch_metadata_bridge_request(
    descriptor_path: &Path,
    profile: &str,
    artifact_stamp: &str,
    exe: &Path,
    runtime_library: &Path,
    runtime_import_library: &Path,
    runtime_relative_dir: &str,
) -> String {
    let mut out = String::new();
    out.push_str("build-write-launch-metadata\n");
    append_bridge_request_value(&mut out, "descriptorPath", descriptor_path.to_str());
    append_bridge_request_raw_value(&mut out, Some(profile));
    append_bridge_request_raw_value(&mut out, Some(artifact_stamp));
    append_bridge_request_value(&mut out, "executablePath", exe.to_str());
    append_bridge_request_value(&mut out, "runtimeLibraryPath", runtime_library.to_str());
    append_bridge_request_value(
        &mut out,
        "runtimeImportLibraryPath",
        runtime_import_library.to_str(),
    );
    append_bridge_request_raw_value(&mut out, Some(runtime_relative_dir));
    out
}

fn emit_build_write_artifact_stamp_bridge_request(
    stamp_path: &Path,
    package_name: &str,
    package_version: &str,
    profile: &str,
    artifact_stamp: &str,
) -> String {
    let mut out = String::new();
    out.push_str("build-write-artifact-stamp\n");
    append_bridge_request_value(&mut out, "stampPath", stamp_path.to_str());
    append_bridge_request_raw_value(&mut out, Some(package_name));
    append_bridge_request_raw_value(&mut out, Some(package_version));
    append_bridge_request_raw_value(&mut out, Some(profile));
    append_bridge_request_raw_value(&mut out, Some(artifact_stamp));
    out
}

fn emit_build_copy_file_bridge_request(source_path: &Path, destination_path: &Path) -> String {
    let mut out = String::new();
    out.push_str("build-copy-file\n");
    append_bridge_request_value(&mut out, "sourcePath", source_path.to_str());
    append_bridge_request_value(&mut out, "destinationPath", destination_path.to_str());
    out
}

fn emit_build_copy_recursive_bridge_request(source_path: &Path, destination_path: &Path) -> String {
    let mut out = String::new();
    out.push_str("build-copy-recursive\n");
    append_bridge_request_value(&mut out, "sourcePath", source_path.to_str());
    append_bridge_request_value(&mut out, "destinationPath", destination_path.to_str());
    out
}

fn emit_build_copy_recursive_extension_bridge_request(
    source_path: &Path,
    destination_path: &Path,
    extension: &str,
) -> String {
    let mut out = String::new();
    out.push_str("build-copy-recursive-extension\n");
    append_bridge_request_value(&mut out, "sourcePath", source_path.to_str());
    append_bridge_request_value(&mut out, "destinationPath", destination_path.to_str());
    append_bridge_request_raw_value(&mut out, Some(extension));
    out
}

fn emit_build_materialize_layout_bridge_request(
    resolved: &BuildInvocation,
    artifact: &BackendArtifact,
    backend_out_dir: &Path,
    published_object_path: &Path,
) -> String {
    let mut out = String::new();
    out.push_str("build-materialize-layout\n");
    append_bridge_request_value(&mut out, "asmRoot", resolved.build_asm_dir.to_str());
    append_bridge_request_value(
        &mut out,
        "generatedRoot",
        resolved.build_generated_dir.to_str(),
    );
    append_bridge_request_value(&mut out, "assetsRoot", resolved.build_assets_dir.to_str());
    append_bridge_request_value(&mut out, "sanityRoot", resolved.build_sanity_dir.to_str());
    append_bridge_request_value(&mut out, "tmpRoot", resolved.build_tmp_dir.to_str());
    append_bridge_request_value(
        &mut out,
        "emittedObjectRoot",
        backend_out_dir.join("obj").to_str(),
    );
    append_bridge_request_value(
        &mut out,
        "siblingAsmPath",
        artifact.object_path.with_extension("asm").to_str(),
    );
    append_bridge_request_value(&mut out, "objectPath", artifact.object_path.to_str());
    append_bridge_request_value(
        &mut out,
        "publishedObjectPath",
        published_object_path.to_str(),
    );
    append_bridge_request_value(
        &mut out,
        "mainResourcesRoot",
        resolved.main_resources_root.to_str(),
    );
    append_bridge_request_value(&mut out, "mainPulseRoot", resolved.main_pulse_root.to_str());
    out
}

fn emit_build_write_config_plan_bridge_request(
    plan_path: &Path,
    resolved: &BuildInvocation,
    artifact: &BackendArtifact,
    target_adapter_metadata: &PlanTargetAdapterMetadata,
) -> String {
    let mut out = String::new();
    out.push_str("build-write-config-plan\n");
    append_bridge_request_value(&mut out, "planPath", plan_path.to_str());
    append_bridge_request_raw_value(&mut out, Some(&resolved.profile));
    append_bridge_request_raw_value(&mut out, Some(&resolved.target));
    append_bridge_request_raw_value(
        &mut out,
        Some(&target_adapter_metadata.requested_target.target_id),
    );
    append_bridge_request_raw_value(
        &mut out,
        Some(&target_adapter_metadata.requested_target.os_family),
    );
    append_bridge_request_raw_value(
        &mut out,
        Some(&target_adapter_metadata.requested_target.arch),
    );
    append_bridge_request_raw_value(
        &mut out,
        Some(
            target_adapter_metadata
                .requested_target
                .support_level
                .as_str(),
        ),
    );
    append_bridge_request_raw_value(
        &mut out,
        Some(&target_adapter_metadata.requested_target.lane_name),
    );
    append_bridge_request_raw_value(
        &mut out,
        Some(target_adapter_metadata.requested_target.lane_kind.as_str()),
    );
    append_bridge_request_raw_value(
        &mut out,
        Some(&target_adapter_metadata.requested_target.bootstrap_status()),
    );
    append_bridge_request_raw_value(
        &mut out,
        Some(&target_adapter_metadata.requested_target.strategic_status()),
    );
    append_bridge_request_raw_value(
        &mut out,
        Some(&target_adapter_metadata.requested_target.adapter_status()),
    );
    append_bridge_request_raw_value(
        &mut out,
        Some(&target_adapter_metadata.active_target.target_id),
    );
    append_bridge_request_raw_value(
        &mut out,
        Some(&target_adapter_metadata.active_target.os_family),
    );
    append_bridge_request_raw_value(&mut out, Some(&target_adapter_metadata.active_target.arch));
    append_bridge_request_raw_value(
        &mut out,
        Some(target_adapter_metadata.active_target.support_level.as_str()),
    );
    append_bridge_request_raw_value(
        &mut out,
        Some(&target_adapter_metadata.active_target.lane_name),
    );
    append_bridge_request_raw_value(
        &mut out,
        Some(target_adapter_metadata.active_target.lane_kind.as_str()),
    );
    append_bridge_request_raw_value(
        &mut out,
        Some(&target_adapter_metadata.active_target.bootstrap_status()),
    );
    append_bridge_request_raw_value(
        &mut out,
        Some(&target_adapter_metadata.active_target.strategic_status()),
    );
    append_bridge_request_raw_value(
        &mut out,
        Some(&target_adapter_metadata.active_target.adapter_status()),
    );
    append_bridge_request_raw_value(&mut out, Some(&target_adapter_metadata.resolution));
    append_bridge_request_raw_value(&mut out, Some(&target_adapter_metadata.artifact_family));
    append_bridge_request_raw_value(&mut out, Some(&target_adapter_metadata.artifact_status));
    append_bridge_request_raw_value(&mut out, Some(&target_adapter_metadata.runtime_abi_family));
    append_bridge_request_raw_value(&mut out, Some(&target_adapter_metadata.runtime_abi_status));
    append_bridge_request_raw_value(&mut out, Some(&resolved.output_mode));
    append_bridge_request_raw_value(&mut out, Some(&resolved.output_entry));
    append_bridge_request_raw_value(&mut out, Some(&resolved.runtime_debug_allocator));
    append_bridge_request_raw_value(&mut out, Some(&resolved.runtime_cycle_collector));
    append_bridge_request_raw_value(&mut out, resolved.linker.as_deref());
    append_bridge_request_raw_value(&mut out, resolved.assembler.as_deref());
    append_bridge_request_value(&mut out, "asmRoot", resolved.build_asm_dir.to_str());
    append_bridge_request_value(
        &mut out,
        "generatedRoot",
        resolved.build_generated_dir.to_str(),
    );
    append_bridge_request_value(&mut out, "assetsRoot", resolved.build_assets_dir.to_str());
    append_bridge_request_value(&mut out, "sanityRoot", resolved.build_sanity_dir.to_str());
    append_bridge_request_value(&mut out, "tmpRoot", resolved.build_tmp_dir.to_str());
    append_bridge_request_value(&mut out, "distroRoot", resolved.output_root.to_str());
    append_bridge_request_value(
        &mut out,
        "nativePlanPath",
        artifact.native_plan_path.to_str(),
    );
    append_bridge_request_value(&mut out, "irPath", artifact.ir_artifact_path.to_str());
    append_bridge_request_value(&mut out, "objectPath", artifact.object_path.to_str());
    out
}

fn emit_build_render_summary_bridge_request(build: &BuildRun) -> String {
    let mut out = String::new();
    out.push_str("build-render-summary\n");
    append_bridge_request_raw_value(&mut out, Some(&build.artifact.classes.to_string()));
    append_bridge_request_raw_value(&mut out, Some(&build.artifact.methods.to_string()));
    append_bridge_request_raw_value(&mut out, Some(&build.artifact.fields.to_string()));
    append_bridge_request_raw_value(&mut out, Some(&build.files_loaded.to_string()));
    append_bridge_request_raw_value(&mut out, Some(&build.resolved.profile));
    append_bridge_request_raw_value(&mut out, Some(&build.resolved.target));
    append_bridge_request_raw_value(&mut out, Some(&build.resolved.output_mode));
    append_bridge_request_raw_value(&mut out, Some(&build.resolved.output_entry));
    append_bridge_request_raw_value(&mut out, Some(&build.resolved.runtime_debug_allocator));
    append_bridge_request_raw_value(&mut out, Some(&build.resolved.runtime_cycle_collector));
    append_bridge_request_raw_value(
        &mut out,
        Some(if build.resolved.used_manifest {
            "true"
        } else {
            "false"
        }),
    );
    append_bridge_request_value(
        &mut out,
        "sourceRoot",
        build.resolved.source_root.as_deref(),
    );
    append_bridge_request_value(&mut out, "outputRoot", build.resolved.output_root.to_str());
    append_bridge_request_value(
        &mut out,
        "irArtifactPath",
        build.artifact.ir_artifact_path.to_str(),
    );
    append_bridge_request_value(
        &mut out,
        "nativePlanPath",
        build.artifact.native_plan_path.to_str(),
    );
    append_bridge_request_value(&mut out, "objectPath", build.artifact.object_path.to_str());
    append_bridge_request_value(
        &mut out,
        "linkReportPath",
        build.artifact.link_report_path.to_str(),
    );
    append_bridge_request_value(
        &mut out,
        "buildConfigPlanPath",
        build.build_config_plan_path.to_str(),
    );
    append_bridge_request_raw_value(&mut out, build.resolved.package_name.as_deref());
    append_bridge_request_raw_value(&mut out, build.resolved.package_version.as_deref());
    append_bridge_request_raw_value(&mut out, Some(&build.artifact.entry_codegen));
    append_bridge_request_value(
        &mut out,
        "executablePath",
        build.artifact.exe_path.as_deref().and_then(Path::to_str),
    );
    out
}

fn emit_build_publish_artifacts_bridge_request(
    resolved: &BuildInvocation,
    artifact: &BackendArtifact,
    publication_plan: &BuildPublicationPlan,
) -> String {
    let mut out = String::new();
    out.push_str("build-publish-artifacts\n");
    append_bridge_request_value(&mut out, "sourceIrPath", artifact.ir_artifact_path.to_str());
    append_bridge_request_value(
        &mut out,
        "sourceNativePlanPath",
        artifact.native_plan_path.to_str(),
    );
    append_bridge_request_value(
        &mut out,
        "sourceLinkReportPath",
        artifact.link_report_path.to_str(),
    );
    append_bridge_request_value(&mut out, "sourceObjectPath", artifact.object_path.to_str());
    append_bridge_request_value(
        &mut out,
        "sourceExecutablePath",
        artifact.exe_path.as_deref().and_then(Path::to_str),
    );
    append_bridge_request_value(
        &mut out,
        "sourceRuntimeLibraryPath",
        artifact
            .runtime_library_path
            .as_deref()
            .and_then(Path::to_str),
    );
    append_bridge_request_value(
        &mut out,
        "sourceRuntimeImportLibraryPath",
        artifact
            .runtime_import_library_path
            .as_deref()
            .and_then(Path::to_str),
    );
    append_bridge_request_value(
        &mut out,
        "sourceAssetsRoot",
        resolved.build_assets_dir.to_str(),
    );
    append_bridge_request_raw_value(&mut out, Some(&resolved.profile));
    append_bridge_request_raw_value(
        &mut out,
        Some(if publication_plan.publish_profile_layout {
            "true"
        } else {
            "false"
        }),
    );
    append_bridge_request_raw_value(
        &mut out,
        Some(if publication_plan.publish_debug_diagnostics {
            "true"
        } else {
            "false"
        }),
    );
    append_bridge_request_raw_value(
        &mut out,
        Some(if publication_plan.shared_profile_layout {
            "true"
        } else {
            "false"
        }),
    );
    append_bridge_request_raw_value(&mut out, Some(&publication_plan.artifact_stamp));
    append_bridge_request_value(
        &mut out,
        "publishedIrPath",
        publication_plan.published_ir_path.to_str(),
    );
    append_bridge_request_value(
        &mut out,
        "publishedNativePlanPath",
        publication_plan.published_native_plan_path.to_str(),
    );
    append_bridge_request_value(
        &mut out,
        "publishedLinkReportPath",
        publication_plan.published_link_report_path.to_str(),
    );
    append_bridge_request_value(
        &mut out,
        "publishedObjectPath",
        publication_plan.published_object_path.to_str(),
    );
    append_bridge_request_value(
        &mut out,
        "publishedExecutablePath",
        publication_plan
            .published_executable_path
            .as_deref()
            .and_then(Path::to_str),
    );
    append_bridge_request_value(
        &mut out,
        "publishedRuntimeLibraryPath",
        publication_plan
            .published_runtime_library_path
            .as_deref()
            .and_then(Path::to_str),
    );
    append_bridge_request_value(
        &mut out,
        "publishedRuntimeImportLibraryPath",
        publication_plan
            .published_runtime_import_library_path
            .as_deref()
            .and_then(Path::to_str),
    );
    append_bridge_request_value(
        &mut out,
        "publishedAssetsRoot",
        publication_plan
            .published_assets_root
            .as_deref()
            .and_then(Path::to_str),
    );
    append_bridge_request_value(
        &mut out,
        "sharedLaunchMetadataPath",
        publication_plan
            .shared_launch_metadata_path
            .as_deref()
            .and_then(Path::to_str),
    );
    out
}

fn emit_build_finalize_artifacts_bridge_request(
    resolved: &BuildInvocation,
    artifact: &BackendArtifact,
    backend_out_dir: &Path,
    publish_profile_layout: bool,
    publish_debug_diagnostics: bool,
) -> Result<String, String> {
    let target_adapter_metadata =
        resolve_plan_target_adapter_metadata(&resolved.target, &resolved.output_mode)?;
    let mut out = String::new();
    out.push_str("build-finalize-artifacts\n");
    append_bridge_request_value(&mut out, "buildRoot", resolved.build_root.to_str());
    append_bridge_request_value(&mut out, "outputRoot", resolved.output_root.to_str());
    append_bridge_request_value(&mut out, "asmRoot", resolved.build_asm_dir.to_str());
    append_bridge_request_value(
        &mut out,
        "generatedRoot",
        resolved.build_generated_dir.to_str(),
    );
    append_bridge_request_value(&mut out, "assetsRoot", resolved.build_assets_dir.to_str());
    append_bridge_request_value(&mut out, "sanityRoot", resolved.build_sanity_dir.to_str());
    append_bridge_request_value(&mut out, "tmpRoot", resolved.build_tmp_dir.to_str());
    append_bridge_request_value(
        &mut out,
        "mainResourcesRoot",
        Some(resolved.main_resources_root.to_string_lossy().as_ref()),
    );
    append_bridge_request_value(
        &mut out,
        "mainPulseRoot",
        Some(resolved.main_pulse_root.to_string_lossy().as_ref()),
    );
    append_bridge_request_raw_value(&mut out, Some(&resolved.profile));
    append_bridge_request_raw_value(&mut out, Some(&resolved.target));
    append_bridge_request_raw_value(&mut out, Some(&resolved.output_mode));
    append_bridge_request_raw_value(&mut out, Some(&resolved.output_entry));
    append_bridge_request_raw_value(&mut out, Some(&resolved.runtime_debug_allocator));
    append_bridge_request_raw_value(&mut out, Some(&resolved.runtime_cycle_collector));
    append_bridge_request_raw_value(&mut out, resolved.package_name.as_deref());
    append_bridge_request_raw_value(&mut out, resolved.package_version.as_deref());
    append_bridge_request_raw_value(&mut out, resolved.linker.as_deref());
    append_bridge_request_raw_value(&mut out, resolved.assembler.as_deref());
    append_bridge_request_value(&mut out, "backendOutDir", backend_out_dir.to_str());
    append_bridge_request_value(&mut out, "irPath", artifact.ir_artifact_path.to_str());
    append_bridge_request_value(
        &mut out,
        "nativePlanPath",
        artifact.native_plan_path.to_str(),
    );
    append_bridge_request_value(
        &mut out,
        "linkReportPath",
        artifact.link_report_path.to_str(),
    );
    append_bridge_request_value(&mut out, "objectPath", artifact.object_path.to_str());
    append_bridge_request_value(
        &mut out,
        "executablePath",
        artifact.exe_path.as_deref().and_then(Path::to_str),
    );
    append_bridge_request_value(
        &mut out,
        "runtimeLibraryPath",
        artifact
            .runtime_library_path
            .as_deref()
            .and_then(Path::to_str),
    );
    append_bridge_request_value(
        &mut out,
        "runtimeImportLibraryPath",
        artifact
            .runtime_import_library_path
            .as_deref()
            .and_then(Path::to_str),
    );
    append_bridge_request_raw_value(
        &mut out,
        Some(if publish_profile_layout {
            "true"
        } else {
            "false"
        }),
    );
    append_bridge_request_raw_value(
        &mut out,
        Some(if publish_debug_diagnostics {
            "true"
        } else {
            "false"
        }),
    );
    append_bridge_request_raw_value(
        &mut out,
        Some(&target_adapter_metadata.requested_target.target_id),
    );
    append_bridge_request_raw_value(
        &mut out,
        Some(&target_adapter_metadata.requested_target.os_family),
    );
    append_bridge_request_raw_value(
        &mut out,
        Some(&target_adapter_metadata.requested_target.arch),
    );
    append_bridge_request_raw_value(
        &mut out,
        Some(
            target_adapter_metadata
                .requested_target
                .support_level
                .as_str(),
        ),
    );
    append_bridge_request_raw_value(
        &mut out,
        Some(&target_adapter_metadata.requested_target.lane_name),
    );
    append_bridge_request_raw_value(
        &mut out,
        Some(target_adapter_metadata.requested_target.lane_kind.as_str()),
    );
    append_bridge_request_raw_value(
        &mut out,
        Some(&target_adapter_metadata.requested_target.bootstrap_status()),
    );
    append_bridge_request_raw_value(
        &mut out,
        Some(&target_adapter_metadata.requested_target.strategic_status()),
    );
    append_bridge_request_raw_value(
        &mut out,
        Some(&target_adapter_metadata.requested_target.adapter_status()),
    );
    append_bridge_request_raw_value(
        &mut out,
        Some(&target_adapter_metadata.active_target.target_id),
    );
    append_bridge_request_raw_value(
        &mut out,
        Some(&target_adapter_metadata.active_target.os_family),
    );
    append_bridge_request_raw_value(&mut out, Some(&target_adapter_metadata.active_target.arch));
    append_bridge_request_raw_value(
        &mut out,
        Some(target_adapter_metadata.active_target.support_level.as_str()),
    );
    append_bridge_request_raw_value(
        &mut out,
        Some(&target_adapter_metadata.active_target.lane_name),
    );
    append_bridge_request_raw_value(
        &mut out,
        Some(target_adapter_metadata.active_target.lane_kind.as_str()),
    );
    append_bridge_request_raw_value(
        &mut out,
        Some(&target_adapter_metadata.active_target.bootstrap_status()),
    );
    append_bridge_request_raw_value(
        &mut out,
        Some(&target_adapter_metadata.active_target.strategic_status()),
    );
    append_bridge_request_raw_value(
        &mut out,
        Some(&target_adapter_metadata.active_target.adapter_status()),
    );
    append_bridge_request_raw_value(&mut out, Some(&target_adapter_metadata.resolution));
    append_bridge_request_raw_value(&mut out, Some(&target_adapter_metadata.artifact_family));
    append_bridge_request_raw_value(&mut out, Some(&target_adapter_metadata.artifact_status));
    append_bridge_request_raw_value(&mut out, Some(&target_adapter_metadata.runtime_abi_family));
    append_bridge_request_raw_value(&mut out, Some(&target_adapter_metadata.runtime_abi_status));
    append_bridge_request_value(&mut out, "distroRoot", resolved.output_root.to_str());
    Ok(out)
}

fn parse_build_published_artifact_bridge_output(
    text: &str,
) -> Result<
    (
        PathBuf,
        PathBuf,
        PathBuf,
        PathBuf,
        Option<PathBuf>,
        Option<PathBuf>,
        Option<PathBuf>,
    ),
    String,
> {
    let mut values: HashMap<String, Option<String>> = HashMap::new();
    for line in text.lines() {
        if line.trim().is_empty() {
            continue;
        }
        let (key, raw) = line
            .split_once('=')
            .ok_or_else(|| format!("invalid build publish bridge line '{}'", line))?;
        let (present, encoded) = raw
            .split_once(':')
            .ok_or_else(|| format!("invalid build publish bridge value '{}'", line))?;
        let value = match present {
            "0" => None,
            "1" => Some(unescape_build_publication_bridge_value(encoded)?),
            _ => {
                return Err(format!(
                    "invalid build publish bridge presence tag '{}'",
                    present
                ))
            }
        };
        values.insert(key.to_string(), value);
    }

    Ok((
        PathBuf::from(required_build_publication_bridge_value(&values, "irPath")?),
        PathBuf::from(required_build_publication_bridge_value(
            &values,
            "nativePlanPath",
        )?),
        PathBuf::from(required_build_publication_bridge_value(
            &values,
            "linkReportPath",
        )?),
        PathBuf::from(required_build_publication_bridge_value(
            &values,
            "objectPath",
        )?),
        optional_build_publication_bridge_path(&values, "executablePath"),
        optional_build_publication_bridge_path(&values, "runtimeLibraryPath"),
        optional_build_publication_bridge_path(&values, "runtimeImportLibraryPath"),
    ))
}

fn parse_build_finalization_bridge_output(
    text: &str,
    source_artifact: &BackendArtifact,
) -> Result<(BackendArtifact, PathBuf), String> {
    let (
        ir_artifact_path,
        native_plan_path,
        link_report_path,
        object_path,
        exe_path,
        runtime_library_path,
        runtime_import_library_path,
    ) = parse_build_published_artifact_bridge_output(text)?;
    let mut build_config_plan_path = None;
    for line in text.lines() {
        if line.trim().is_empty() {
            continue;
        }
        let Some((key, raw)) = line.split_once('=') else {
            continue;
        };
        if key != "buildConfigPlanPath" {
            continue;
        }
        let (present, encoded) = raw
            .split_once(':')
            .ok_or_else(|| format!("invalid build finalization bridge value '{}'", line))?;
        match present {
            "0" => build_config_plan_path = None,
            "1" => {
                build_config_plan_path = Some(PathBuf::from(
                    unescape_build_publication_bridge_value(encoded)?,
                ))
            }
            _ => {
                return Err(format!(
                    "invalid build finalization bridge presence tag '{}'",
                    present
                ))
            }
        }
    }
    let build_config_plan_path = build_config_plan_path
        .ok_or_else(|| "build finalization bridge missing buildConfigPlanPath".to_string())?;
    Ok((
        BackendArtifact {
            classes: source_artifact.classes,
            methods: source_artifact.methods,
            fields: source_artifact.fields,
            ir_artifact_path,
            native_plan_path,
            object_path,
            exe_path,
            runtime_library_path,
            runtime_import_library_path,
            link_report_path,
            entry_codegen: source_artifact.entry_codegen.clone(),
            link_plan: source_artifact.link_plan.clone(),
        },
        build_config_plan_path,
    ))
}

fn author_build_finalize_outputs(
    resolved: &BuildInvocation,
    artifact: &BackendArtifact,
    backend_out_dir: &Path,
    publish_profile_layout: bool,
    publish_debug_diagnostics: bool,
) -> Result<(BackendArtifact, PathBuf), String> {
    let request = emit_build_finalize_artifacts_bridge_request(
        resolved,
        artifact,
        backend_out_dir,
        publish_profile_layout,
        publish_debug_diagnostics,
    )?;
    let output = run_author_build_bridge_request(&request)?;
    parse_build_finalization_bridge_output(&output, artifact)
}

fn author_build_write_shared_runtime_lookup_metadata(
    descriptor_path: &Path,
    profile: &str,
    artifact_stamp: &str,
    exe: &Path,
    runtime_library: &Path,
    runtime_import_library: &Path,
    runtime_relative_dir: &str,
) -> Result<(), String> {
    let output =
        run_author_build_bridge_request(&emit_build_write_launch_metadata_bridge_request(
            descriptor_path,
            profile,
            artifact_stamp,
            exe,
            runtime_library,
            runtime_import_library,
            runtime_relative_dir,
        ))?;
    let written = output.trim();
    if written.is_empty() {
        return Err("author build launch metadata writer returned no path".to_string());
    }
    Ok(())
}

fn author_build_write_artifact_stamp(
    stamp_path: &Path,
    package_name: &str,
    package_version: &str,
    profile: &str,
    artifact_stamp: &str,
) -> Result<(), String> {
    let output = run_author_build_bridge_request(&emit_build_write_artifact_stamp_bridge_request(
        stamp_path,
        package_name,
        package_version,
        profile,
        artifact_stamp,
    ))?;
    let written = output.trim();
    if written.is_empty() {
        return Err("author build artifact stamp writer returned no path".to_string());
    }
    Ok(())
}

fn author_build_copy_file(source_path: &Path, destination_path: &Path) -> Result<(), String> {
    let output = run_author_build_bridge_request(&emit_build_copy_file_bridge_request(
        source_path,
        destination_path,
    ))?;
    let written = output.trim();
    if written.is_empty() {
        return Err("author build copy file returned no path".to_string());
    }
    Ok(())
}

fn author_build_copy_recursive(source_path: &Path, destination_path: &Path) -> Result<(), String> {
    let output = run_author_build_bridge_request(&emit_build_copy_recursive_bridge_request(
        source_path,
        destination_path,
    ))?;
    let written = output.trim();
    if written.is_empty() {
        return Err("author build copy recursive returned no path".to_string());
    }
    Ok(())
}

fn author_build_copy_recursive_extension(
    source_path: &Path,
    destination_path: &Path,
    extension: &str,
) -> Result<(), String> {
    let output =
        run_author_build_bridge_request(&emit_build_copy_recursive_extension_bridge_request(
            source_path,
            destination_path,
            extension,
        ))?;
    let written = output.trim();
    if written.is_empty() {
        return Err("author build copy recursive extension returned no path".to_string());
    }
    Ok(())
}

fn author_build_materialize_layout(
    resolved: &BuildInvocation,
    artifact: &BackendArtifact,
    backend_out_dir: &Path,
    published_object_path: &Path,
) -> Result<(), String> {
    let output = run_author_build_bridge_request(&emit_build_materialize_layout_bridge_request(
        resolved,
        artifact,
        backend_out_dir,
        published_object_path,
    ))?;
    let written = output.trim();
    if written.is_empty() {
        return Err("author build materialize layout returned no path".to_string());
    }
    Ok(())
}

fn author_build_write_config_plan(
    plan_path: &Path,
    resolved: &BuildInvocation,
    artifact: &BackendArtifact,
    target_adapter_metadata: &PlanTargetAdapterMetadata,
) -> Result<(), String> {
    let output = run_author_build_bridge_request(&emit_build_write_config_plan_bridge_request(
        plan_path,
        resolved,
        artifact,
        target_adapter_metadata,
    ))?;
    let written = output.trim();
    if written.is_empty() {
        return Err("author build config plan writer returned no path".to_string());
    }
    Ok(())
}

fn author_build_render_summary(build: &BuildRun) -> Result<String, String> {
    run_author_build_bridge_request(&emit_build_render_summary_bridge_request(build))
}

pub(super) fn write_shared_runtime_lookup_metadata(
    descriptor_path: &Path,
    profile: &str,
    artifact_stamp: &str,
    exe: &Path,
    runtime_library: &Path,
    runtime_import_library: &Path,
    runtime_relative_dir: &str,
) -> Result<(), String> {
    if let Ok(()) = author_build_write_shared_runtime_lookup_metadata(
        descriptor_path,
        profile,
        artifact_stamp,
        exe,
        runtime_library,
        runtime_import_library,
        runtime_relative_dir,
    ) {
        return Ok(());
    }
    if let Some(parent) = descriptor_path.parent() {
        fs::create_dir_all(parent).map_err(|e| {
            format!(
                "Failed to create shared lookup descriptor directory '{}': {}",
                parent.display(),
                e
            )
        })?;
    }
    let exe_name = exe
        .file_name()
        .unwrap_or_else(|| std::ffi::OsStr::new("main.exe"))
        .to_string_lossy();
    let runtime_library_name = runtime_library
        .file_name()
        .unwrap_or_else(|| std::ffi::OsStr::new("pulsecore.dll"))
        .to_string_lossy();
    let runtime_import_library_name = runtime_import_library
        .file_name()
        .unwrap_or_else(|| std::ffi::OsStr::new("pulsecore.lib"))
        .to_string_lossy();
    let required_runtime_imports = [
        "pulsec_rt_init",
        "pulsec_rt_shutdown",
        "pulsec_rt_objectNew",
        "pulsec_rt_objectClassId",
        "pulsec_rt_stringFromBytes",
        "pulsec_rt_consoleWrite",
        "pulsec_rt_consoleWriteLine",
        "pulsec_rt_arcRetain",
        "pulsec_rt_arcRelease",
        "pulsec_rt_arcCycleTick",
        "pulsec_rt_weakNew",
        "pulsec_rt_weakGet",
        "pulsec_rt_weakClear",
        "pulsec_rt_dispatchNullReceiverPanic",
        "pulsec_rt_dispatchInvalidTypePanic",
        "pulsec_rt_tracePush",
        "pulsec_rt_tracePop",
        "pulsec_rt_traceDump",
    ]
    .join(",");
    let mut launch_text = String::new();
    launch_text.push_str("schema=pulsec.shared.launch.v1\n");
    launch_text.push_str(&format!("profile={profile}\n"));
    launch_text.push_str(&format!("artifact_stamp={artifact_stamp}\n"));
    launch_text.push_str("mode=shared\n");
    launch_text.push_str("runtime_load=peer_runtime_library\n");
    launch_text.push_str("lookup_policy=relative-sibling-runtime\n");
    launch_text.push_str("runtime_abi_schema=pulsec.runtime.abi.v1\n");
    launch_text.push_str("runtime_abi_version=2\n");
    launch_text.push_str("object_model_abi_schema=pulsec.object_model.abi.v1\n");
    launch_text.push_str("object_model_abi_version=1\n");
    launch_text.push_str("mismatch_policy=deterministic-fail-fast\n");
    launch_text.push_str("missing_runtime_policy=deterministic-fail-fast\n");
    launch_text.push_str("missing_import_policy=deterministic-fail-fast\n");
    launch_text.push_str("runtime_abi_mismatch_message=Runtime ABI mismatch\n");
    launch_text.push_str("object_model_abi_mismatch_message=Object model ABI mismatch\n");
    launch_text.push_str(&format!(
        "required_runtime_imports={required_runtime_imports}\n"
    ));
    launch_text.push_str(&format!("executable={exe_name}\n"));
    if runtime_relative_dir == "." || runtime_relative_dir.is_empty() {
        launch_text.push_str(&format!("runtime_library={runtime_library_name}\n"));
        launch_text.push_str(&format!(
            "runtime_import_library={runtime_import_library_name}\n"
        ));
    } else {
        launch_text.push_str(&format!(
            "runtime_library=../{runtime_relative_dir}/{runtime_library_name}\n"
        ));
        launch_text.push_str(&format!(
            "runtime_import_library=../{runtime_relative_dir}/{runtime_import_library_name}\n"
        ));
    }
    fs::write(descriptor_path, launch_text).map_err(|e| {
        format!(
            "Failed to write shared lookup descriptor '{}': {}",
            descriptor_path.display(),
            e
        )
    })
}

pub(super) fn materialize_stamped_build_artifacts(
    resolved: &BuildInvocation,
    publication_plan: &BuildPublicationPlan,
) -> Result<(), String> {
    if publication_plan.publish_profile_layout && !publication_plan.publish_debug_diagnostics {
        return Ok(());
    }
    let (package_name, package_version, _) = build_artifact_identity(resolved);

    let mut stamp_text = String::new();
    stamp_text.push_str("schema=pulsec.artifact.stamp.v1\n");
    stamp_text.push_str(&format!("name={package_name}\n"));
    stamp_text.push_str(&format!("version={package_version}\n"));
    stamp_text.push_str(&format!("profile={}\n", resolved.profile));
    stamp_text.push_str(&format!("stamp={}\n", publication_plan.artifact_stamp));
    let stamp_path = publication_plan.artifact_stamp_path.clone();
    if let Some(parent) = stamp_path.parent() {
        fs::create_dir_all(parent).map_err(|e| {
            format!(
                "Failed to create artifact stamp directory '{}': {}",
                parent.display(),
                e
            )
        })?;
    }
    if let Ok(()) = author_build_write_artifact_stamp(
        &stamp_path,
        &package_name,
        &package_version,
        &resolved.profile,
        &publication_plan.artifact_stamp,
    ) {
        return Ok(());
    }
    fs::write(&stamp_path, stamp_text).map_err(|e| {
        format!(
            "Failed to write artifact stamp '{}': {}",
            stamp_path.display(),
            e
        )
    })?;
    Ok(())
}

pub(super) fn emit_resolved_build_config_plan(
    resolved: &BuildInvocation,
    artifact: &BackendArtifact,
    publication_plan: &BuildPublicationPlan,
    _flags: &CliFlags,
) -> Result<PathBuf, String> {
    let target_adapter_metadata =
        resolve_plan_target_adapter_metadata(&resolved.target, &resolved.output_mode)?;
    let plan_path = publication_plan.build_config_plan_path.clone();
    if let Ok(()) =
        author_build_write_config_plan(&plan_path, resolved, artifact, &target_adapter_metadata)
    {
        return Ok(plan_path);
    }
    let mut out = String::new();
    out.push_str("{\n");
    out.push_str("  \"schema\": \"pulsec.build.config.v1\",\n");
    out.push_str(&format!("  \"profile\": \"{}\",\n", resolved.profile));
    out.push_str(&format!("  \"target\": \"{}\",\n", resolved.target));
    out.push_str("  \"target_adapter\": {\n");
    out.push_str("    \"requested\": {\n");
    out.push_str(&format!(
        "      \"target_id\": \"{}\",\n",
        target_adapter_metadata.requested_target.target_id
    ));
    out.push_str(&format!(
        "      \"os_family\": \"{}\",\n",
        target_adapter_metadata.requested_target.os_family
    ));
    out.push_str(&format!(
        "      \"arch\": \"{}\",\n",
        target_adapter_metadata.requested_target.arch
    ));
    out.push_str(&format!(
        "      \"support_level\": \"{}\",\n",
        target_adapter_metadata
            .requested_target
            .support_level
            .as_str()
    ));
    out.push_str(&format!(
        "      \"lane_name\": \"{}\",\n",
        target_adapter_metadata.requested_target.lane_name
    ));
    out.push_str(&format!(
        "      \"lane_kind\": \"{}\",\n",
        target_adapter_metadata.requested_target.lane_kind.as_str()
    ));
    out.push_str(&format!(
        "      \"bootstrap_status\": \"{}\",\n",
        target_adapter_metadata.requested_target.bootstrap_status()
    ));
    out.push_str(&format!(
        "      \"strategic_status\": \"{}\",\n",
        target_adapter_metadata.requested_target.strategic_status()
    ));
    out.push_str(&format!(
        "      \"adapter_status\": \"{}\"\n",
        target_adapter_metadata.requested_target.adapter_status()
    ));
    out.push_str("    },\n");
    out.push_str("    \"active\": {\n");
    out.push_str(&format!(
        "      \"target_id\": \"{}\",\n",
        target_adapter_metadata.active_target.target_id
    ));
    out.push_str(&format!(
        "      \"os_family\": \"{}\",\n",
        target_adapter_metadata.active_target.os_family
    ));
    out.push_str(&format!(
        "      \"arch\": \"{}\",\n",
        target_adapter_metadata.active_target.arch
    ));
    out.push_str(&format!(
        "      \"support_level\": \"{}\",\n",
        target_adapter_metadata.active_target.support_level.as_str()
    ));
    out.push_str(&format!(
        "      \"lane_name\": \"{}\",\n",
        target_adapter_metadata.active_target.lane_name
    ));
    out.push_str(&format!(
        "      \"lane_kind\": \"{}\",\n",
        target_adapter_metadata.active_target.lane_kind.as_str()
    ));
    out.push_str(&format!(
        "      \"bootstrap_status\": \"{}\",\n",
        target_adapter_metadata.active_target.bootstrap_status()
    ));
    out.push_str(&format!(
        "      \"strategic_status\": \"{}\",\n",
        target_adapter_metadata.active_target.strategic_status()
    ));
    out.push_str(&format!(
        "      \"adapter_status\": \"{}\"\n",
        target_adapter_metadata.active_target.adapter_status()
    ));
    out.push_str("    },\n");
    out.push_str(&format!(
        "    \"resolution\": \"{}\",\n",
        target_adapter_metadata.resolution
    ));
    out.push_str("    \"artifact_family\": {\n");
    out.push_str(&format!(
        "      \"id\": \"{}\",\n",
        target_adapter_metadata.artifact_family
    ));
    out.push_str(&format!(
        "      \"status\": \"{}\"\n",
        target_adapter_metadata.artifact_status
    ));
    out.push_str("    },\n");
    out.push_str("    \"runtime_abi_family\": {\n");
    out.push_str(&format!(
        "      \"id\": \"{}\",\n",
        target_adapter_metadata.runtime_abi_family
    ));
    out.push_str(&format!(
        "      \"status\": \"{}\"\n",
        target_adapter_metadata.runtime_abi_status
    ));
    out.push_str("    }\n");
    out.push_str("  },\n");
    out.push_str(&format!(
        "  \"output\": {{ \"mode\": \"{}\", \"entry\": \"{}\" }},\n",
        resolved.output_mode, resolved.output_entry
    ));
    out.push_str(&format!(
        "  \"runtime\": {{ \"debug_allocator\": \"{}\", \"cycle_collector\": \"{}\" }},\n",
        resolved.runtime_debug_allocator, resolved.runtime_cycle_collector
    ));
    out.push_str(&format!(
        "  \"toolchain\": {{ \"linker\": \"{}\", \"assembler\": \"{}\" }},\n",
        resolved.linker.as_ref().map(|s| s.as_str()).unwrap_or(""),
        resolved
            .assembler
            .as_ref()
            .map(|s| s.as_str())
            .unwrap_or("")
    ));
    out.push_str(&format!(
        "  \"layout\": {{ \"asm\": \"{}\", \"generated\": \"{}\", \"assets\": \"{}\", \"sanity\": \"{}\", \"tmp\": \"{}\", \"distro\": \"{}\" }},\n",
        resolved.build_asm_dir.display(),
        resolved.build_generated_dir.display(),
        resolved.build_assets_dir.display(),
        resolved.build_sanity_dir.display(),
        resolved.build_tmp_dir.display(),
        resolved.output_root.display()
    ));
    out.push_str(&format!(
        "  \"artifacts\": {{ \"native_plan\": \"{}\", \"ir\": \"{}\", \"object\": \"{}\" }}\n",
        artifact.native_plan_path.display(),
        artifact.ir_artifact_path.display(),
        artifact.object_path.display()
    ));
    out.push_str("}\n");
    fs::write(&plan_path, out).map_err(|e| {
        format!(
            "Failed to write build config plan '{}': {}",
            plan_path.display(),
            e
        )
    })?;
    Ok(plan_path)
}

pub(super) fn materialize_build_layout(
    resolved: &BuildInvocation,
    artifact: &BackendArtifact,
    backend_out_dir: &Path,
) -> Result<(), String> {
    let published_object_target = if artifact.object_path.exists() {
        Some(published_object_path(resolved, artifact, backend_out_dir))
    } else {
        None
    };
    if let Some(target) = published_object_target.as_ref() {
        if let Ok(()) = author_build_materialize_layout(resolved, artifact, backend_out_dir, target)
        {
            return Ok(());
        }
    }
    fs::create_dir_all(&resolved.build_asm_dir).map_err(|e| {
        format!(
            "Failed to create asm directory '{}': {}",
            resolved.build_asm_dir.display(),
            e
        )
    })?;
    fs::create_dir_all(&resolved.build_generated_dir).map_err(|e| {
        format!(
            "Failed to create generated directory '{}': {}",
            resolved.build_generated_dir.display(),
            e
        )
    })?;
    fs::create_dir_all(&resolved.build_assets_dir).map_err(|e| {
        format!(
            "Failed to create assets directory '{}': {}",
            resolved.build_assets_dir.display(),
            e
        )
    })?;
    fs::create_dir_all(&resolved.build_sanity_dir).map_err(|e| {
        format!(
            "Failed to create sanity directory '{}': {}",
            resolved.build_sanity_dir.display(),
            e
        )
    })?;
    fs::create_dir_all(&resolved.build_tmp_dir).map_err(|e| {
        format!(
            "Failed to create tmp directory '{}': {}",
            resolved.build_tmp_dir.display(),
            e
        )
    })?;

    let emitted_obj_dir = backend_out_dir.join("obj");
    if emitted_obj_dir.exists() {
        copy_dir_recursive_extension(&emitted_obj_dir, &resolved.build_asm_dir, "asm")?;
        copy_dir_recursive_extension(&emitted_obj_dir, &resolved.build_generated_dir, "obj")?;
    }
    let sibling_asm = artifact.object_path.with_extension("asm");
    if sibling_asm.exists() {
        let asm_target = resolved.build_asm_dir.join(
            sibling_asm
                .file_name()
                .unwrap_or_else(|| std::ffi::OsStr::new("main.asm")),
        );
        copy_file_into(&sibling_asm, &asm_target)?;
    }
    if artifact.object_path.exists() {
        let obj_target = published_object_target
            .unwrap_or_else(|| published_object_path(resolved, artifact, backend_out_dir));
        copy_file_into(&artifact.object_path, &obj_target)?;
    }
    if resolved.main_resources_root.exists() {
        copy_dir_recursive(&resolved.main_resources_root, &resolved.build_assets_dir)?;
    }
    if resolved.main_pulse_root.exists() {
        let sanity_src_dir = resolved.build_sanity_dir.join("src_main_pulse");
        copy_dir_recursive(&resolved.main_pulse_root, &sanity_src_dir)?;
    }
    Ok(())
}

pub(super) fn copy_dir_recursive(src: &Path, dst: &Path) -> Result<(), String> {
    if let Ok(()) = author_build_copy_recursive(src, dst) {
        return Ok(());
    }
    fs::create_dir_all(dst)
        .map_err(|e| format!("Failed to create directory '{}': {}", dst.display(), e))?;
    let entries = fs::read_dir(src)
        .map_err(|e| format!("Failed to read directory '{}': {}", src.display(), e))?;
    for entry in entries {
        let entry = entry.map_err(|e| {
            format!(
                "Failed to read directory entry in '{}': {}",
                src.display(),
                e
            )
        })?;
        let src_path = entry.path();
        let dst_path = dst.join(entry.file_name());
        if src_path.is_dir() {
            copy_dir_recursive(&src_path, &dst_path)?;
        } else {
            fs::copy(&src_path, &dst_path).map_err(|e| {
                format!(
                    "Failed to copy '{}' -> '{}': {}",
                    src_path.display(),
                    dst_path.display(),
                    e
                )
            })?;
        }
    }
    Ok(())
}

pub(super) fn copy_file_into(src: &Path, dst: &Path) -> Result<(), String> {
    if let Ok(()) = author_build_copy_file(src, dst) {
        return Ok(());
    }
    if let Some(parent) = dst.parent() {
        fs::create_dir_all(parent)
            .map_err(|e| format!("Failed to create directory '{}': {}", parent.display(), e))?;
    }
    fs::copy(src, dst).map_err(|e| {
        format!(
            "Failed to copy '{}' -> '{}': {}",
            src.display(),
            dst.display(),
            e
        )
    })?;
    Ok(())
}

pub(super) fn copy_dir_recursive_filtered(
    src: &Path,
    dst: &Path,
    include: &dyn Fn(&Path) -> bool,
) -> Result<(), String> {
    fs::create_dir_all(dst)
        .map_err(|e| format!("Failed to create directory '{}': {}", dst.display(), e))?;
    let entries = fs::read_dir(src)
        .map_err(|e| format!("Failed to read directory '{}': {}", src.display(), e))?;
    for entry in entries {
        let entry = entry.map_err(|e| {
            format!(
                "Failed to read directory entry in '{}': {}",
                src.display(),
                e
            )
        })?;
        let src_path = entry.path();
        let dst_path = dst.join(entry.file_name());
        if src_path.is_dir() {
            copy_dir_recursive_filtered(&src_path, &dst_path, include)?;
        } else if include(&src_path) {
            if let Some(parent) = dst_path.parent() {
                fs::create_dir_all(parent).map_err(|e| {
                    format!("Failed to create directory '{}': {}", parent.display(), e)
                })?;
            }
            fs::copy(&src_path, &dst_path).map_err(|e| {
                format!(
                    "Failed to copy '{}' -> '{}': {}",
                    src_path.display(),
                    dst_path.display(),
                    e
                )
            })?;
        }
    }
    Ok(())
}

pub(super) fn copy_dir_recursive_extension(
    src: &Path,
    dst: &Path,
    extension: &str,
) -> Result<(), String> {
    if let Ok(()) = author_build_copy_recursive_extension(src, dst, extension) {
        return Ok(());
    }
    copy_dir_recursive_filtered(src, dst, &|path| {
        path.extension().and_then(|value| value.to_str()) == Some(extension)
    })
}

fn render_build_summary_fallback(build: &BuildRun) -> String {
    let (_, _, artifact_stamp) = build_artifact_identity(&build.resolved);
    let mut out = String::new();
    out.push_str(&format!(
        "Build IR ready: classes={} methods={} fields={} files={}\n",
        build.artifact.classes, build.artifact.methods, build.artifact.fields, build.files_loaded
    ));
    out.push_str(&format!(
        "Build mode: profile={} target={} output_mode={} output_entry={} runtime_debug_allocator={} runtime_cycle_collector={} project_mode={} source_root={} output_dir={}\n",
        build.resolved.profile,
        build.resolved.target,
        build.resolved.output_mode,
        build.resolved.output_entry,
        build.resolved.runtime_debug_allocator,
        build.resolved.runtime_cycle_collector,
        if build.resolved.used_manifest {
            "manifest"
        } else {
            "direct"
        },
        build.resolved.source_root.as_deref().unwrap_or("<none>"),
        build.resolved.output_root.display()
    ));
    out.push_str(&format!(
        "IR artifact: {}\n",
        build.artifact.ir_artifact_path.display()
    ));
    out.push_str(&format!(
        "Native plan: {}\n",
        build.artifact.native_plan_path.display()
    ));
    out.push_str(&format!(
        "Object scaffold: {}\n",
        build.artifact.object_path.display()
    ));
    out.push_str(&format!(
        "Link report: {}\n",
        build.artifact.link_report_path.display()
    ));
    out.push_str(&format!(
        "Build config plan: {}\n",
        build.build_config_plan_path.display()
    ));
    out.push_str(&format!("Artifact stamp: {}\n", artifact_stamp));
    out.push_str(&format!(
        "Entry codegen: {}\n",
        build.artifact.entry_codegen
    ));
    if let Some(exe) = &build.artifact.exe_path {
        out.push_str(&format!("Executable: {}\n", exe.display()));
    } else {
        out.push_str("Executable: not produced (no linker available or link failed)\n");
    }
    out.push_str(
        "Native backend spike (Phase B) is complete; next is runtime hardening in Phase C.\n",
    );
    out
}

pub(super) fn print_build_summary(build: &BuildRun) {
    if let Ok(text) = author_build_render_summary(build) {
        print!("{text}");
        return;
    }
    print!("{}", render_build_summary_fallback(build));
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::backend::NativeLinkPlan;
    use std::sync::atomic::{AtomicU64, Ordering};
    use std::time::{SystemTime, UNIX_EPOCH};

    fn unique_temp_root() -> PathBuf {
        static NEXT_ID: AtomicU64 = AtomicU64::new(1);
        let nanos = SystemTime::now()
            .duration_since(UNIX_EPOCH)
            .expect("system time")
            .as_nanos();
        let id = NEXT_ID.fetch_add(1, Ordering::Relaxed);
        let root = std::env::temp_dir().join(format!(
            "pulsec_build_toolchain_{}_{}_{}",
            std::process::id(),
            nanos,
            id
        ));
        fs::create_dir_all(&root).expect("create temp root");
        root
    }

    #[test]
    fn emit_resolved_build_config_plan_uses_resolved_toolchain_not_cli_flags() {
        let root = unique_temp_root();
        fs::create_dir_all(root.join("build")).expect("create build dir");
        let resolved = BuildInvocation {
            entry_path: root
                .join("src/main/pulse/app/core/Main.pulse")
                .display()
                .to_string(),
            source_root: Some(root.join("src/main/pulse").display().to_string()),
            build_root: root.join("build"),
            output_root: root.join("build"),
            main_pulse_root: root.join("src/main/pulse"),
            main_resources_root: root.join("src/main/resources"),
            build_asm_dir: root.join("build/asm"),
            build_generated_dir: root.join("build/generated"),
            build_assets_dir: root.join("build/assets"),
            build_sanity_dir: root.join("build/sanity"),
            build_tmp_dir: root.join("build/tmp"),
            profile: "release".to_string(),
            target: "windows-x64".to_string(),
            output_mode: "fat".to_string(),
            output_entry: "main".to_string(),
            runtime_debug_allocator: "off".to_string(),
            runtime_cycle_collector: "on".to_string(),
            assembler: Some("resolved-asm".to_string()),
            linker: Some("resolved-link".to_string()),
            package_name: Some("demo".to_string()),
            package_version: Some("0.1.0".to_string()),
            used_manifest: false,
            authorlib_enabled: false,
        };
        let artifact = BackendArtifact {
            classes: 1,
            methods: 1,
            fields: 0,
            ir_artifact_path: root.join("build/main.ir.txt"),
            native_plan_path: root.join("build/native.plan.json"),
            object_path: root.join("build/obj/main.obj"),
            exe_path: None,
            runtime_library_path: None,
            runtime_import_library_path: None,
            link_report_path: root.join("build/native.link.txt"),
            entry_codegen: "ok".to_string(),
            link_plan: NativeLinkPlan::default(),
        };
        let flags = CliFlags {
            strict_package: true,
            friendly: false,
            project_root: Some(root.display().to_string()),
            source_root: None,
            profile: None,
            target: None,
            output_mode: None,
            runtime_debug_allocator: None,
            runtime_cycle_collector: None,
            out_dir: None,
            assembler: Some("cli-asm".to_string()),
            linker: Some("cli-link".to_string()),
        };

        let publication_plan =
            resolve_build_publication_plan(&resolved, &artifact, &root.join("build"), false, false)
                .expect("resolve publication plan");
        let plan_path =
            emit_resolved_build_config_plan(&resolved, &artifact, &publication_plan, &flags)
                .expect("emit build plan");
        let plan_text = fs::read_to_string(&plan_path).expect("read build plan");

        assert!(
            plan_text.contains(
                "\"toolchain\": { \"linker\": \"resolved-link\", \"assembler\": \"resolved-asm\" }"
            ),
            "expected resolved toolchain in build plan\n{}",
            plan_text
        );
        assert!(
            !plan_text.contains("cli-link") && !plan_text.contains("cli-asm"),
            "expected CLI toolchain drift to stay out of emitted build plan\n{}",
            plan_text
        );

        let _ = fs::remove_dir_all(root);
    }
}
