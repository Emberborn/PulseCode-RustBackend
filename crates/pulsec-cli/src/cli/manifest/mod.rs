use super::target_model::{resolve_target_descriptor, supported_target_error_text};
use super::*;

pub(super) fn find_and_load_manifest_for_check(
    entry_arg: Option<&str>,
    flags: &CliFlags,
) -> Result<Option<(PathBuf, ManifestConfig)>, String> {
    let start_dir = if let Some(root) = &flags.project_root {
        PathBuf::from(root)
    } else if let Some(entry) = entry_arg {
        let p = Path::new(entry);
        if p.is_dir() {
            p.to_path_buf()
        } else {
            p.parent().unwrap_or_else(|| Path::new(".")).to_path_buf()
        }
    } else {
        env::current_dir().map_err(|e| format!("Failed to resolve current directory: {e}"))?
    };
    let Some(manifest_path) = find_manifest_path(&start_dir)? else {
        return Ok(None);
    };
    let config = load_manifest_config(&manifest_path)?;
    Ok(Some((manifest_path, config)))
}

pub(super) fn resolve_workspace_context(
    entry_arg: Option<&str>,
    flags: &CliFlags,
) -> Result<Option<WorkspaceContext>, String> {
    if let Ok(workspace) = resolve_workspace_context_via_authorlib(entry_arg, flags) {
        return Ok(workspace);
    }
    resolve_workspace_context_fallback(entry_arg, flags)
}

fn resolve_workspace_context_via_authorlib(
    entry_arg: Option<&str>,
    flags: &CliFlags,
) -> Result<Option<WorkspaceContext>, String> {
    let start_path = manifest_bridge_start_path(entry_arg, flags)?;
    let mut request = String::new();
    request.push_str("project-resolve-workspace-context\n");
    append_bridge_request_raw_value(&mut request, Some(start_path.as_str()));
    let stdout = run_author_build_bridge_request(&request)?;
    parse_workspace_context_bridge_output(&stdout)
}

fn resolve_workspace_context_fallback(
    entry_arg: Option<&str>,
    flags: &CliFlags,
) -> Result<Option<WorkspaceContext>, String> {
    if entry_arg.is_some() || flags.source_root.is_some() {
        return Ok(None);
    }
    let Some((manifest_path, manifest_config)) =
        find_and_load_manifest_for_check(entry_arg, flags)?
    else {
        return Ok(None);
    };
    let Some(workspace) = manifest_config.workspace else {
        return Ok(None);
    };
    let root = manifest_path
        .parent()
        .ok_or_else(|| format!("Invalid manifest path '{}'", manifest_path.display()))?
        .to_path_buf();
    let member_roots = resolve_workspace_member_roots(&root, &workspace.members)?;
    Ok(Some(WorkspaceContext { root, member_roots }))
}

fn parse_workspace_context_bridge_output(text: &str) -> Result<Option<WorkspaceContext>, String> {
    if text.trim().is_empty() {
        return Ok(None);
    }
    let values = parse_bridge_keyed_values(text)?;
    let root = manifest_required_bridge_value(&values, "rootPath")?;
    let count = manifest_required_bridge_value(&values, "count")?
        .parse::<usize>()
        .map_err(|e| format!("author bridge workspace count parse failed: {e}"))?;
    let mut member_roots = Vec::with_capacity(count);
    for index in 0..count {
        member_roots.push(PathBuf::from(manifest_required_bridge_value(
            &values,
            &format!("item{index}"),
        )?));
    }
    Ok(Some(WorkspaceContext {
        root: PathBuf::from(root),
        member_roots,
    }))
}

fn manifest_bridge_start_path(entry_arg: Option<&str>, flags: &CliFlags) -> Result<String, String> {
    if let Some(root) = &flags.project_root {
        return Ok(root.clone());
    }
    if let Some(entry) = entry_arg {
        return Ok(entry.to_string());
    }
    env::current_dir()
        .map(|path| path.display().to_string())
        .map_err(|e| format!("Failed to resolve current directory for author bridge: {e}"))
}

fn manifest_required_bridge_value(
    values: &std::collections::HashMap<String, Option<String>>,
    key: &str,
) -> Result<String, String> {
    values
        .get(key)
        .ok_or_else(|| format!("author bridge missing key '{}'", key))?
        .clone()
        .ok_or_else(|| format!("author bridge key '{}' must not be null", key))
}

pub(super) fn resolve_workspace_member_roots(
    workspace_root: &Path,
    members: &[String],
) -> Result<Vec<PathBuf>, String> {
    let mut out = Vec::new();
    let mut seen = HashSet::new();
    for member in members {
        let raw = member.trim();
        if raw.is_empty() {
            continue;
        }
        let member_root = if Path::new(raw).is_absolute() {
            PathBuf::from(raw)
        } else {
            workspace_root.join(raw)
        };
        let normalized = canonical_existing_path(&member_root).map_err(|e| {
            format!(
                "Workspace member '{}' could not be resolved from '{}': {}",
                raw,
                workspace_root.display(),
                e
            )
        })?;
        let manifest = normalized.join("pulsec.toml");
        if !manifest.exists() {
            return Err(format!(
                "Workspace member '{}' is missing manifest '{}'",
                raw,
                manifest.display()
            ));
        }
        let member_manifest = load_manifest_config(&manifest)?;
        if member_manifest.workspace.is_some() {
            return Err(format!(
                "Workspace member '{}' cannot declare [workspace]",
                raw
            ));
        }
        if !seen.insert(normalized.clone()) {
            continue;
        }
        out.push(normalized);
    }
    out.sort();
    if out.is_empty() {
        return Err(format!(
            "Manifest validation error in '{}': [workspace].members must resolve to at least one member project",
            workspace_root.join("pulsec.toml").display()
        ));
    }
    Ok(out)
}

pub(super) fn resolve_layout_path(
    project_root: &Path,
    configured: Option<&str>,
    default_rel: &str,
) -> PathBuf {
    let rel = configured.unwrap_or(default_rel);
    project_root.join(rel)
}

pub(super) fn find_manifest_path(start_dir: &Path) -> Result<Option<PathBuf>, String> {
    let mut dir = if start_dir.exists() {
        canonical_existing_path(start_dir).map_err(|e| {
            format!(
                "Failed to resolve project directory '{}': {}",
                start_dir.display(),
                e
            )
        })?
    } else {
        absolutize(start_dir).ok_or_else(|| {
            format!(
                "Failed to resolve project directory '{}'",
                start_dir.display()
            )
        })?
    };
    loop {
        let candidate = dir.join("pulsec.toml");
        if candidate.exists() {
            return Ok(Some(candidate));
        }
        let Some(parent) = dir.parent() else {
            return Ok(None);
        };
        if parent == dir {
            return Ok(None);
        }
        dir = parent.to_path_buf();
    }
}

pub(super) fn load_manifest_config(manifest_path: &Path) -> Result<ManifestConfig, String> {
    let content = fs::read_to_string(manifest_path).map_err(|e| {
        format!(
            "Failed to read manifest '{}': {}",
            manifest_path.display(),
            e
        )
    })?;
    let mut section: Option<String> = None;
    let mut package_name: Option<String> = None;
    let mut package_version: Option<String> = None;
    let mut root: Option<String> = None;
    let mut main_pulse: Option<String> = None;
    let mut main_resources: Option<String> = None;
    let mut test_pulse: Option<String> = None;
    let mut test_resources: Option<String> = None;
    let mut api_pulse: Option<String> = None;
    let mut api_resources: Option<String> = None;
    let mut docs_dir: Option<String> = None;
    let mut libraries_dir: Option<String> = None;
    let mut entry: Option<String> = None;
    let mut profile: Option<String> = None;
    let mut target: Option<String> = None;
    let mut output_mode: Option<String> = None;
    let mut output_entry: Option<String> = None;
    let mut runtime_debug_allocator: Option<String> = None;
    let mut runtime_cycle_collector: Option<String> = None;
    let mut out_dir: Option<String> = None;
    let mut asm_dir: Option<String> = None;
    let mut generated_dir: Option<String> = None;
    let mut assets_dir: Option<String> = None;
    let mut sanity_dir: Option<String> = None;
    let mut tmp_dir: Option<String> = None;
    let mut distro_dir: Option<String> = None;
    let mut linker: Option<String> = None;
    let mut assembler: Option<String> = None;
    let mut workspace_members: Option<String> = None;
    let mut authorlib_enabled: Option<bool> = None;
    let mut seen: HashSet<String> = HashSet::new();

    for (line_no, raw_line) in content.lines().enumerate() {
        let line = raw_line.trim();
        if line.is_empty() || line.starts_with('#') {
            continue;
        }
        if line.starts_with('[') && line.ends_with(']') {
            let section_name = line[1..line.len() - 1].trim();
            match section_name {
                "package" | "sources" | "build" | "toolchain" | "workspace" | "authorlib" => {
                    section = Some(section_name.to_string());
                }
                _ => {
                    return Err(format!(
                        "Manifest parse error in '{}': unknown section '[{}]' at line {}",
                        manifest_path.display(),
                        section_name,
                        line_no + 1
                    ));
                }
            }
            continue;
        }
        let Some(active_section) = section.as_deref() else {
            return Err(format!(
                "Manifest parse error in '{}': key/value must be under a section at line {}",
                manifest_path.display(),
                line_no + 1
            ));
        };
        let Some((k, v)) = line.split_once('=') else {
            return Err(format!(
                "Manifest parse error in '{}': expected key = \"value\" at line {}",
                manifest_path.display(),
                line_no + 1
            ));
        };
        let key = k.trim();
        if key.is_empty() {
            return Err(format!(
                "Manifest parse error in '{}': empty key at line {}",
                manifest_path.display(),
                line_no + 1
            ));
        }
        let unique_key = format!("{}.{}", active_section, key);
        if !seen.insert(unique_key.clone()) {
            return Err(format!(
                "Manifest parse error in '{}': duplicate key '{}' at line {}",
                manifest_path.display(),
                unique_key,
                line_no + 1
            ));
        }

        match active_section {
            "package" => match key {
                "name" => {
                    let value = parse_manifest_string(v.trim()).ok_or_else(|| {
                        format!(
                            "Manifest parse error in '{}': expected quoted string for key '{}' at line {}",
                            manifest_path.display(),
                            key,
                            line_no + 1
                        )
                    })?;
                    package_name = Some(value)
                }
                "version" => {
                    let value = parse_manifest_string(v.trim()).ok_or_else(|| {
                        format!(
                            "Manifest parse error in '{}': expected quoted string for key '{}' at line {}",
                            manifest_path.display(),
                            key,
                            line_no + 1
                        )
                    })?;
                    package_version = Some(value)
                }
                _ => {
                    return Err(format!(
                        "Manifest parse error in '{}': unknown key '{}' in [package] at line {}",
                        manifest_path.display(),
                        key,
                        line_no + 1
                    ))
                }
            },
            "sources" => match key {
                "root" => {
                    root = Some(require_manifest_string(
                        manifest_path,
                        key,
                        v.trim(),
                        line_no + 1,
                    )?)
                }
                "main_pulse" => {
                    main_pulse = Some(require_manifest_string(
                        manifest_path,
                        key,
                        v.trim(),
                        line_no + 1,
                    )?)
                }
                "main_resources" => {
                    main_resources = Some(require_manifest_string(
                        manifest_path,
                        key,
                        v.trim(),
                        line_no + 1,
                    )?)
                }
                "test_pulse" => {
                    test_pulse = Some(require_manifest_string(
                        manifest_path,
                        key,
                        v.trim(),
                        line_no + 1,
                    )?)
                }
                "test_resources" => {
                    test_resources = Some(require_manifest_string(
                        manifest_path,
                        key,
                        v.trim(),
                        line_no + 1,
                    )?)
                }
                "api_pulse" => {
                    api_pulse = Some(require_manifest_string(
                        manifest_path,
                        key,
                        v.trim(),
                        line_no + 1,
                    )?)
                }
                "api_resources" => {
                    api_resources = Some(require_manifest_string(
                        manifest_path,
                        key,
                        v.trim(),
                        line_no + 1,
                    )?)
                }
                "docs" => {
                    docs_dir = Some(require_manifest_string(
                        manifest_path,
                        key,
                        v.trim(),
                        line_no + 1,
                    )?)
                }
                "libraries" => {
                    libraries_dir = Some(require_manifest_string(
                        manifest_path,
                        key,
                        v.trim(),
                        line_no + 1,
                    )?)
                }
                "entry" => {
                    entry = Some(require_manifest_string(
                        manifest_path,
                        key,
                        v.trim(),
                        line_no + 1,
                    )?)
                }
                _ => {
                    return Err(format!(
                        "Manifest parse error in '{}': unknown key '{}' in [sources] at line {}",
                        manifest_path.display(),
                        key,
                        line_no + 1
                    ))
                }
            },
            "build" => match key {
                "profile" => {
                    profile = Some(require_manifest_string(
                        manifest_path,
                        key,
                        v.trim(),
                        line_no + 1,
                    )?)
                }
                "target" => {
                    target = Some(require_manifest_string(
                        manifest_path,
                        key,
                        v.trim(),
                        line_no + 1,
                    )?)
                }
                "output_mode" => {
                    output_mode = Some(require_manifest_string(
                        manifest_path,
                        key,
                        v.trim(),
                        line_no + 1,
                    )?)
                }
                "output_entry" => {
                    output_entry = Some(require_manifest_string(
                        manifest_path,
                        key,
                        v.trim(),
                        line_no + 1,
                    )?)
                }
                "runtime_debug_allocator" => {
                    runtime_debug_allocator = Some(require_manifest_string(
                        manifest_path,
                        key,
                        v.trim(),
                        line_no + 1,
                    )?)
                }
                "runtime_cycle_collector" => {
                    runtime_cycle_collector = Some(require_manifest_string(
                        manifest_path,
                        key,
                        v.trim(),
                        line_no + 1,
                    )?)
                }
                "out_dir" => {
                    out_dir = Some(require_manifest_string(
                        manifest_path,
                        key,
                        v.trim(),
                        line_no + 1,
                    )?)
                }
                "asm_dir" => {
                    asm_dir = Some(require_manifest_string(
                        manifest_path,
                        key,
                        v.trim(),
                        line_no + 1,
                    )?)
                }
                "generated_dir" => {
                    generated_dir = Some(require_manifest_string(
                        manifest_path,
                        key,
                        v.trim(),
                        line_no + 1,
                    )?)
                }
                "assets_dir" => {
                    assets_dir = Some(require_manifest_string(
                        manifest_path,
                        key,
                        v.trim(),
                        line_no + 1,
                    )?)
                }
                "sanity_dir" => {
                    sanity_dir = Some(require_manifest_string(
                        manifest_path,
                        key,
                        v.trim(),
                        line_no + 1,
                    )?)
                }
                "tmp_dir" => {
                    tmp_dir = Some(require_manifest_string(
                        manifest_path,
                        key,
                        v.trim(),
                        line_no + 1,
                    )?)
                }
                "distro_dir" => {
                    distro_dir = Some(require_manifest_string(
                        manifest_path,
                        key,
                        v.trim(),
                        line_no + 1,
                    )?)
                }
                _ => {
                    return Err(format!(
                        "Manifest parse error in '{}': unknown key '{}' in [build] at line {}",
                        manifest_path.display(),
                        key,
                        line_no + 1
                    ))
                }
            },
            "toolchain" => match key {
                "linker" => {
                    linker = Some(require_manifest_string(
                        manifest_path,
                        key,
                        v.trim(),
                        line_no + 1,
                    )?)
                }
                "assembler" => {
                    assembler = Some(require_manifest_string(
                        manifest_path,
                        key,
                        v.trim(),
                        line_no + 1,
                    )?)
                }
                _ => {
                    return Err(format!(
                        "Manifest parse error in '{}': unknown key '{}' in [toolchain] at line {}",
                        manifest_path.display(),
                        key,
                        line_no + 1
                    ))
                }
            },
            "workspace" => match key {
                "members" => {
                    workspace_members = Some(require_manifest_string(
                        manifest_path,
                        key,
                        v.trim(),
                        line_no + 1,
                    )?)
                }
                _ => {
                    return Err(format!(
                        "Manifest parse error in '{}': unknown key '{}' in [workspace] at line {}",
                        manifest_path.display(),
                        key,
                        line_no + 1
                    ))
                }
            },
            "authorlib" => match key {
                "enabled" => {
                    authorlib_enabled = Some(require_manifest_bool(
                        manifest_path,
                        key,
                        v.trim(),
                        line_no + 1,
                    )?)
                }
                _ => {
                    return Err(format!(
                        "Manifest parse error in '{}': unknown key '{}' in [authorlib] at line {}",
                        manifest_path.display(),
                        key,
                        line_no + 1
                    ))
                }
            },
            _ => unreachable!("section set is validated above"),
        }
    }

    let workspace = if let Some(raw_members) = workspace_members {
        let members = parse_workspace_members(&raw_members);
        if members.is_empty() {
            return Err(format!(
                "Manifest validation error in '{}': [workspace].members must declare at least one member path",
                manifest_path.display()
            ));
        }
        Some(ManifestWorkspace { members })
    } else {
        None
    };

    let package = match (package_name, package_version) {
        (Some(name), Some(version)) => {
            if !is_valid_manifest_package_name(&name) {
                return Err(format!(
                    "Manifest validation error in '{}': [package].name '{}' is invalid",
                    manifest_path.display(),
                    name
                ));
            }
            if !is_valid_manifest_version(&version) {
                return Err(format!(
                    "Manifest validation error in '{}': [package].version '{}' must be semantic 'x.y.z'",
                    manifest_path.display(),
                    version
                ));
            }
            Some(ManifestPackage { name, version })
        }
        (None, None) if workspace.is_some() => None,
        (None, None) => {
            return Err(format!(
                "Manifest validation error in '{}': [package].name is required",
                manifest_path.display()
            ));
        }
        (Some(_), None) => {
            return Err(format!(
                "Manifest validation error in '{}': [package].version is required",
                manifest_path.display()
            ));
        }
        (None, Some(_)) => {
            return Err(format!(
                "Manifest validation error in '{}': [package].name is required",
                manifest_path.display()
            ));
        }
    };

    let sources_root = root.unwrap_or_else(|| "src/main/pulse".to_string());
    if sources_root.trim().is_empty() {
        return Err(format!(
            "Manifest validation error in '{}': [sources].root cannot be empty",
            manifest_path.display()
        ));
    }
    if let Some(entry_value) = &entry {
        if entry_value.trim().is_empty() {
            return Err(format!(
                "Manifest validation error in '{}': [sources].entry cannot be empty",
                manifest_path.display()
            ));
        };
    }
    for (key, value) in [
        ("[sources].main_pulse", main_pulse.as_deref()),
        ("[sources].main_resources", main_resources.as_deref()),
        ("[sources].test_pulse", test_pulse.as_deref()),
        ("[sources].test_resources", test_resources.as_deref()),
        ("[sources].api_pulse", api_pulse.as_deref()),
        ("[sources].api_resources", api_resources.as_deref()),
        ("[sources].docs", docs_dir.as_deref()),
        ("[sources].libraries", libraries_dir.as_deref()),
        ("[build].out_dir", out_dir.as_deref()),
        ("[build].target", target.as_deref()),
        ("[build].output_mode", output_mode.as_deref()),
        ("[build].output_entry", output_entry.as_deref()),
        (
            "[build].runtime_debug_allocator",
            runtime_debug_allocator.as_deref(),
        ),
        (
            "[build].runtime_cycle_collector",
            runtime_cycle_collector.as_deref(),
        ),
        ("[build].asm_dir", asm_dir.as_deref()),
        ("[build].generated_dir", generated_dir.as_deref()),
        ("[build].assets_dir", assets_dir.as_deref()),
        ("[build].sanity_dir", sanity_dir.as_deref()),
        ("[build].tmp_dir", tmp_dir.as_deref()),
        ("[build].distro_dir", distro_dir.as_deref()),
        ("[toolchain].linker", linker.as_deref()),
        ("[toolchain].assembler", assembler.as_deref()),
    ] {
        if let Some(value) = value {
            if value.trim().is_empty() {
                return Err(format!(
                    "Manifest validation error in '{}': {} cannot be empty",
                    manifest_path.display(),
                    key
                ));
            }
        }
    }
    if let Some(profile_value) = &profile {
        if profile_value != "debug" && profile_value != "release" {
            return Err(format!(
                "Manifest validation error in '{}': [build].profile must be 'debug' or 'release'",
                manifest_path.display()
            ));
        }
    }
    if let Some(target_value) = &target {
        if resolve_target_descriptor(target_value).is_none() {
            return Err(format!(
                "Manifest validation error in '{}': [build].target must be one of: {}",
                manifest_path.display(),
                supported_target_error_text()
            ));
        }
    }
    if let Some(mode_value) = &output_mode {
        if normalize_output_mode(mode_value).is_none() {
            return Err(format!(
                "Manifest validation error in '{}': [build].output_mode must be 'fat' or 'shared' (legacy aliases: 'single_exe', 'exe_with_dlls')",
                manifest_path.display()
            ));
        }
    }
    output_mode = output_mode.map(|mode| normalize_output_mode(&mode).unwrap().to_string());
    if output_mode.as_deref() == Some("shared") && output_entry.is_none() {
        return Err(format!(
            "Manifest validation error in '{}': [build].output_entry is required when [build].output_mode is 'shared'",
            manifest_path.display()
        ));
    }
    if let Some(toggle_value) = &runtime_debug_allocator {
        if toggle_value != "on" && toggle_value != "off" {
            return Err(format!(
                "Manifest validation error in '{}': [build].runtime_debug_allocator must be 'on' or 'off'",
                manifest_path.display()
            ));
        }
    }
    if let Some(toggle_value) = &runtime_cycle_collector {
        if toggle_value != "on" && toggle_value != "off" {
            return Err(format!(
                "Manifest validation error in '{}': [build].runtime_cycle_collector must be 'on' or 'off'",
                manifest_path.display()
            ));
        }
    }

    Ok(ManifestConfig {
        package,
        workspace,
        authorlib: authorlib_enabled.map(|enabled| ManifestAuthorlib { enabled }),
        sources: ManifestSources {
            root: sources_root,
            main_pulse,
            main_resources,
            test_pulse,
            test_resources,
            api_pulse,
            api_resources,
            docs: docs_dir,
            libraries: libraries_dir,
            entry,
        },
        build: ManifestBuild {
            profile,
            target,
            output_mode,
            output_entry,
            runtime_debug_allocator,
            runtime_cycle_collector,
            out_dir,
            asm_dir,
            generated_dir,
            assets_dir,
            sanity_dir,
            tmp_dir,
            distro_dir,
        },
        toolchain: ManifestToolchain { linker, assembler },
    })
}

fn require_manifest_string(
    manifest_path: &Path,
    key: &str,
    raw_value: &str,
    line_no: usize,
) -> Result<String, String> {
    parse_manifest_string(raw_value).ok_or_else(|| {
        format!(
            "Manifest parse error in '{}': expected quoted string for key '{}' at line {}",
            manifest_path.display(),
            key,
            line_no
        )
    })
}

fn require_manifest_bool(
    manifest_path: &Path,
    key: &str,
    raw_value: &str,
    line_no: usize,
) -> Result<bool, String> {
    match raw_value {
        "true" => Ok(true),
        "false" => Ok(false),
        _ => Err(format!(
            "Manifest parse error in '{}': expected boolean true/false for key '{}' at line {}",
            manifest_path.display(),
            key,
            line_no
        )),
    }
}

pub(super) fn parse_manifest_string(raw: &str) -> Option<String> {
    if raw.len() < 2 {
        return None;
    }
    if !(raw.starts_with('"') && raw.ends_with('"')) {
        return None;
    }
    Some(raw[1..raw.len() - 1].to_string())
}

pub(super) fn parse_workspace_members(value: &str) -> Vec<String> {
    let mut out = Vec::new();
    let mut seen: HashSet<String> = HashSet::new();
    for member in value.split(',') {
        let trimmed = member.trim();
        if trimmed.is_empty() {
            continue;
        }
        if seen.insert(trimmed.to_string()) {
            out.push(trimmed.to_string());
        }
    }
    out
}

pub(super) fn is_valid_manifest_package_name(value: &str) -> bool {
    if value.is_empty() {
        return false;
    }
    value
        .chars()
        .all(|c| c.is_ascii_alphanumeric() || c == '-' || c == '_')
}

pub(super) fn is_valid_manifest_version(value: &str) -> bool {
    let parts: Vec<&str> = value.split('.').collect();
    if parts.len() != 3 {
        return false;
    }
    parts
        .iter()
        .all(|part| !part.is_empty() && part.chars().all(|c| c.is_ascii_digit()))
}
