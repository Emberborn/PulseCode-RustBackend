use super::*;

pub(super) fn resolve_test_invocation(flags: &CliFlags) -> Result<TestInvocation, String> {
    if let Ok(invocation) = resolve_test_invocation_via_authorlib(flags) {
        return Ok(invocation);
    }
    resolve_test_invocation_fallback(flags)
}

fn resolve_test_invocation_via_authorlib(flags: &CliFlags) -> Result<TestInvocation, String> {
    let request = emit_project_test_invocation_bridge_request(
        &testing_bridge_start_path(flags)?,
        flags.source_root.as_deref(),
    );
    let stdout = run_author_build_bridge_request(&request)?;
    parse_test_invocation_bridge_output(&stdout)
}

fn resolve_test_invocation_fallback(flags: &CliFlags) -> Result<TestInvocation, String> {
    let manifest_info = find_and_load_manifest_for_check(None, flags)?;
    let mut used_manifest = false;
    let mut authorlib_enabled = false;
    let mut manifest_main_pulse: Option<String> = None;
    let mut manifest_test_pulse: Option<String> = None;
    let project_root = if let Some((manifest_path, manifest_config)) = manifest_info {
        used_manifest = true;
        authorlib_enabled = manifest_config
            .authorlib
            .as_ref()
            .map(|cfg| cfg.enabled)
            .unwrap_or(false);
        let _manifest_identity = manifest_config
            .package
            .as_ref()
            .map(|pkg| (&pkg.name, &pkg.version));
        manifest_main_pulse = manifest_config
            .sources
            .main_pulse
            .clone()
            .or_else(|| Some(manifest_config.sources.root.clone()));
        manifest_test_pulse = manifest_config.sources.test_pulse.clone();
        manifest_path
            .parent()
            .ok_or_else(|| format!("Invalid manifest path '{}'", manifest_path.display()))?
            .to_path_buf()
    } else if let Some(project_root) = &flags.project_root {
        PathBuf::from(project_root)
    } else {
        env::current_dir().map_err(|e| format!("Failed to resolve current directory: {e}"))?
    };

    let source_root = if let Some(source_root) = &flags.source_root {
        PathBuf::from(source_root)
    } else if used_manifest {
        let manifest = project_root.join("pulsec.toml");
        let manifest_config = load_manifest_config(&manifest)?;
        let main_pulse = manifest_main_pulse
            .or(manifest_config.sources.main_pulse.clone())
            .unwrap_or_else(|| manifest_config.sources.root.clone());
        project_root.join(main_pulse)
    } else {
        project_root.join("src/main/pulse")
    };
    let tests_root = if used_manifest {
        project_root.join(manifest_test_pulse.unwrap_or_else(|| "src/test/pulse".to_string()))
    } else {
        project_root.join("tests")
    };
    Ok(TestInvocation {
        project_root,
        source_root,
        tests_root,
        used_manifest,
        authorlib_enabled,
    })
}

pub(super) fn discover_test_files(tests_root: &Path) -> Result<Vec<PathBuf>, String> {
    if let Ok(files) = discover_test_files_via_authorlib(tests_root) {
        return Ok(files);
    }
    discover_test_files_fallback(tests_root)
}

fn discover_test_files_via_authorlib(tests_root: &Path) -> Result<Vec<PathBuf>, String> {
    let mut request = String::new();
    request.push_str("project-discover-test-files\n");
    append_bridge_request_raw_value(&mut request, tests_root.to_str());
    let stdout = run_author_build_bridge_request(&request)?;
    parse_bridge_string_list_output(&stdout)
        .map(|values| values.into_iter().map(PathBuf::from).collect::<Vec<_>>())
}

fn discover_test_files_fallback(tests_root: &Path) -> Result<Vec<PathBuf>, String> {
    if !tests_root.exists() {
        return Ok(Vec::new());
    }
    let mut files = Vec::new();
    collect_pulse_files(tests_root, &mut files)?;
    files.sort();
    Ok(files)
}

pub(super) fn display_test_name(tests_root: &Path, file: &Path) -> String {
    if let Ok(rel) = file.strip_prefix(tests_root) {
        rel.display().to_string()
    } else {
        file.display().to_string()
    }
}

fn emit_project_test_invocation_bridge_request(
    start_path: &str,
    source_root_override: Option<&str>,
) -> String {
    let mut out = String::new();
    out.push_str("project-resolve-test-invocation\n");
    append_bridge_request_raw_value(&mut out, Some(start_path));
    append_bridge_request_raw_value(&mut out, source_root_override);
    out
}

fn parse_test_invocation_bridge_output(text: &str) -> Result<TestInvocation, String> {
    let values = parse_bridge_keyed_values(text)?;
    Ok(TestInvocation {
        project_root: PathBuf::from(testing_required_bridge_value(&values, "projectRoot")?),
        source_root: PathBuf::from(testing_required_bridge_value(&values, "sourceRoot")?),
        tests_root: PathBuf::from(testing_required_bridge_value(&values, "testsRoot")?),
        used_manifest: testing_parse_bridge_bool(&values, "usedManifest")?,
        authorlib_enabled: testing_parse_bridge_bool(&values, "authorlibEnabled")?,
    })
}

fn parse_bridge_string_list_output(text: &str) -> Result<Vec<String>, String> {
    let values = parse_bridge_keyed_values(text)?;
    let count = testing_required_bridge_value(&values, "count")?
        .parse::<usize>()
        .map_err(|e| format!("author bridge count parse failed: {e}"))?;
    let mut out = Vec::with_capacity(count);
    for index in 0..count {
        out.push(testing_required_bridge_value(
            &values,
            &format!("item{index}"),
        )?);
    }
    Ok(out)
}

fn testing_bridge_start_path(flags: &CliFlags) -> Result<String, String> {
    if let Some(root) = &flags.project_root {
        return Ok(root.clone());
    }
    env::current_dir()
        .map(|path| path.display().to_string())
        .map_err(|e| format!("Failed to resolve current directory for author bridge: {e}"))
}

fn testing_required_bridge_value(
    values: &std::collections::HashMap<String, Option<String>>,
    key: &str,
) -> Result<String, String> {
    values
        .get(key)
        .ok_or_else(|| format!("author bridge missing key '{}'", key))?
        .clone()
        .ok_or_else(|| format!("author bridge key '{}' must not be null", key))
}

fn testing_parse_bridge_bool(
    values: &std::collections::HashMap<String, Option<String>>,
    key: &str,
) -> Result<bool, String> {
    match testing_required_bridge_value(values, key)?.as_str() {
        "true" => Ok(true),
        "false" => Ok(false),
        other => Err(format!(
            "author bridge key '{}' has invalid boolean '{}'",
            key, other
        )),
    }
}
