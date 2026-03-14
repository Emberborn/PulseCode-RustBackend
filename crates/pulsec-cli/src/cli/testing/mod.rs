use super::*;

pub(super) fn resolve_test_invocation(flags: &CliFlags) -> Result<TestInvocation, String> {
    let manifest_info = find_and_load_manifest_for_check(None, flags)?;
    let mut used_manifest = false;
    let mut manifest_main_pulse: Option<String> = None;
    let mut manifest_test_pulse: Option<String> = None;
    let project_root = if let Some((manifest_path, manifest_config)) = manifest_info {
        used_manifest = true;
        let _manifest_identity = manifest_config
            .package
            .as_ref()
            .map(|pkg| (&pkg.name, &pkg.version, pkg.metadata.len()));
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
        project_root.join(
            manifest_test_pulse
                .unwrap_or_else(|| "src/test/pulse".to_string()),
        )
    } else {
        project_root.join("tests")
    };
    Ok(TestInvocation {
        project_root,
        source_root,
        tests_root,
        used_manifest,
    })
}

pub(super) fn discover_test_files(tests_root: &Path) -> Result<Vec<PathBuf>, String> {
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


