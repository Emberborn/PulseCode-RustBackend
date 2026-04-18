use super::*;

pub(super) struct TestFileExecution {
    pub(super) files_loaded: usize,
}

pub(super) fn resolve_test_invocation(flags: &CliFlags) -> Result<TestInvocation, String> {
    if let Ok(invocation) = resolve_test_invocation_via_adklib(flags) {
        return Ok(invocation);
    }
    resolve_test_invocation_fallback(flags)
}

fn resolve_test_invocation_via_adklib(flags: &CliFlags) -> Result<TestInvocation, String> {
    let request = emit_project_test_invocation_bridge_request(
        &testing_bridge_start_path(flags)?,
        flags.source_root.as_deref(),
    );
    let stdout = run_adk_build_bridge_request(&request)?;
    parse_test_invocation_bridge_output(&stdout)
}

fn resolve_test_invocation_fallback(flags: &CliFlags) -> Result<TestInvocation, String> {
    let manifest_info = find_and_load_manifest_for_check(None, flags)?;
    let mut used_manifest = false;
    let mut adklib_enabled = false;
    let mut manifest_main_aden: Option<String> = None;
    let mut manifest_test_aden: Option<String> = None;
    let project_root = if let Some((manifest_path, manifest_config)) = manifest_info {
        used_manifest = true;
        adklib_enabled = manifest_config
            .adklib
            .as_ref()
            .map(|cfg| cfg.enabled)
            .unwrap_or(false);
        let _manifest_identity = manifest_config
            .package
            .as_ref()
            .map(|pkg| (&pkg.name, &pkg.version));
        manifest_main_aden = manifest_config
            .sources
            .main_aden
            .clone()
            .or_else(|| Some(manifest_config.sources.root.clone()));
        manifest_test_aden = manifest_config.sources.test_aden.clone();
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
        let manifest = project_root.join("aden.toml");
        let manifest_config = load_manifest_config(&manifest)?;
        let main_aden = manifest_main_aden
            .or(manifest_config.sources.main_aden.clone())
            .unwrap_or_else(|| manifest_config.sources.root.clone());
        project_root.join(main_aden)
    } else {
        project_root.join("src/main/aden")
    };
    let tests_root = if used_manifest {
        project_root.join(manifest_test_aden.unwrap_or_else(|| "src/test/aden".to_string()))
    } else {
        project_root.join("tests")
    };
    Ok(TestInvocation {
        project_root,
        source_root,
        tests_root,
        used_manifest,
        adklib_enabled,
    })
}

pub(super) fn discover_test_files(tests_root: &Path) -> Result<Vec<PathBuf>, String> {
    if let Ok(files) = discover_test_files_via_adklib(tests_root) {
        return Ok(files);
    }
    discover_test_files_fallback(tests_root)
}

fn discover_test_files_via_adklib(tests_root: &Path) -> Result<Vec<PathBuf>, String> {
    let mut request = String::new();
    request.push_str("project-discover-test-files\n");
    append_bridge_request_raw_value(&mut request, tests_root.to_str());
    let stdout = run_adk_build_bridge_request(&request)?;
    parse_bridge_string_list_output(&stdout)
        .map(|values| values.into_iter().map(PathBuf::from).collect::<Vec<_>>())
}

fn discover_test_files_fallback(tests_root: &Path) -> Result<Vec<PathBuf>, String> {
    if !tests_root.exists() {
        return Ok(Vec::new());
    }
    let mut files = Vec::new();
    collect_aden_files(tests_root, &mut files)?;
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

pub(super) fn execute_test_file(
    entry_path: &str,
    source_root: Option<&str>,
    strict_package: bool,
    adklib_enabled: bool,
    selfhost_provider: bool,
) -> Result<TestFileExecution, String> {
    if selfhost_provider {
        if let Ok(result) = execute_test_file_via_adklib_bridge(
            entry_path,
            source_root,
            strict_package,
            adklib_enabled,
        ) {
            return Ok(result);
        }
    }
    execute_test_file_fallback(entry_path, source_root, strict_package, adklib_enabled)
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

fn emit_compiler_test_file_bridge_request(
    compiler_path: &str,
    entry_path: &str,
    source_root: Option<&str>,
    strict_package: bool,
    adklib_enabled: bool,
) -> String {
    let mut out = String::new();
    out.push_str("compiler-execute-test-file\n");
    append_bridge_request_raw_value(&mut out, Some(compiler_path));
    append_bridge_request_raw_value(&mut out, Some(entry_path));
    append_bridge_request_raw_value(&mut out, source_root);
    append_bridge_request_raw_value(&mut out, Some(if strict_package { "true" } else { "false" }));
    append_bridge_request_raw_value(
        &mut out,
        Some(if adklib_enabled { "true" } else { "false" }),
    );
    out
}

fn parse_test_invocation_bridge_output(text: &str) -> Result<TestInvocation, String> {
    let values = parse_bridge_keyed_values(text)?;
    Ok(TestInvocation {
        project_root: PathBuf::from(testing_required_bridge_value(&values, "projectRoot")?),
        source_root: PathBuf::from(testing_required_bridge_value(&values, "sourceRoot")?),
        tests_root: PathBuf::from(testing_required_bridge_value(&values, "testsRoot")?),
        used_manifest: testing_parse_bridge_bool(&values, "usedManifest")?,
        adklib_enabled: testing_parse_bridge_bool(&values, "adklibEnabled")?,
    })
}

fn execute_test_file_via_adklib_bridge(
    entry_path: &str,
    source_root: Option<&str>,
    strict_package: bool,
    adklib_enabled: bool,
) -> Result<TestFileExecution, String> {
    let compiler_path = current_adenc_executable_path()?;
    let request = emit_compiler_test_file_bridge_request(
        &compiler_path,
        entry_path,
        source_root,
        strict_package,
        adklib_enabled,
    );
    let stdout = run_adk_build_bridge_request(&request)?;
    parse_test_file_execution_bridge_output(&stdout)
}

fn execute_test_file_fallback(
    entry_path: &str,
    source_root: Option<&str>,
    strict_package: bool,
    adklib_enabled: bool,
) -> Result<TestFileExecution, String> {
    let result = check_project_with_adklib(
        entry_path,
        source_root,
        strict_package,
        adklib_enabled,
    )?;
    Ok(TestFileExecution {
        files_loaded: result.files_loaded,
    })
}

fn parse_test_file_execution_bridge_output(text: &str) -> Result<TestFileExecution, String> {
    let values = parse_testing_raw_bridge_values(text)?;
    let success = match values.first().and_then(|value| value.as_deref()) {
        Some("true") => true,
        Some("false") => false,
        other => {
            return Err(format!(
                "adk test-file bridge returned invalid success flag {:?}",
                other
            ))
        }
    };
    if success {
        let files_loaded = values
            .get(1)
            .and_then(|value| value.as_deref())
            .ok_or_else(|| "adk test-file bridge missing filesLoaded".to_string())?
            .parse::<usize>()
            .map_err(|e| format!("adk test-file bridge filesLoaded parse failed: {e}"))?;
        return Ok(TestFileExecution { files_loaded });
    }
    Err(values
        .get(2)
        .cloned()
        .flatten()
        .unwrap_or_else(|| "compiler test execution failed".to_string()))
}

fn parse_testing_raw_bridge_values(text: &str) -> Result<Vec<Option<String>>, String> {
    let mut values = Vec::new();
    for line in text.lines() {
        if line.trim().is_empty() {
            continue;
        }
        let (present, encoded) = line
            .split_once(':')
            .ok_or_else(|| format!("invalid adk test bridge line '{}'", line))?;
        let value = match present {
            "0" => None,
            "1" => Some(unescape_testing_raw_bridge_value(encoded)?),
            other => {
                return Err(format!(
                    "invalid adk test bridge presence tag '{}'",
                    other
                ))
            }
        };
        values.push(value);
    }
    Ok(values)
}

fn unescape_testing_raw_bridge_value(encoded: &str) -> Result<String, String> {
    let mut out = String::with_capacity(encoded.len());
    let mut chars = encoded.chars();
    while let Some(ch) = chars.next() {
        if ch != '\\' {
            out.push(ch);
            continue;
        }
        let Some(escaped) = chars.next() else {
            return Err("invalid trailing escape in adk test bridge value".to_string());
        };
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

fn parse_bridge_string_list_output(text: &str) -> Result<Vec<String>, String> {
    let values = parse_bridge_keyed_values(text)?;
    let count = testing_required_bridge_value(&values, "count")?
        .parse::<usize>()
        .map_err(|e| format!("adk bridge count parse failed: {e}"))?;
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
        .map_err(|e| format!("Failed to resolve current directory for adk bridge: {e}"))
}

fn current_adenc_executable_path() -> Result<String, String> {
    env::current_exe()
        .map(|path| path.display().to_string())
        .map_err(|e| format!("Failed to resolve aden provider path: {e}"))
}

fn testing_required_bridge_value(
    values: &std::collections::HashMap<String, Option<String>>,
    key: &str,
) -> Result<String, String> {
    values
        .get(key)
        .ok_or_else(|| format!("adk bridge missing key '{}'", key))?
        .clone()
        .ok_or_else(|| format!("adk bridge key '{}' must not be null", key))
}

fn testing_parse_bridge_bool(
    values: &std::collections::HashMap<String, Option<String>>,
    key: &str,
) -> Result<bool, String> {
    match testing_required_bridge_value(values, key)?.as_str() {
        "true" => Ok(true),
        "false" => Ok(false),
        other => Err(format!(
            "adk bridge key '{}' has invalid boolean '{}'",
            key, other
        )),
    }
}
