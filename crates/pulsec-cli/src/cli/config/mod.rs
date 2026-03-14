use super::*;

pub(super) fn split_optional_entry_arg(args: &[String]) -> (Option<&str>, &[String]) {
    if args.is_empty() {
        return (None, args);
    }
    if args[0].starts_with("--") {
        (None, args)
    } else {
        (Some(args[0].as_str()), &args[1..])
    }
}

#[derive(Debug, Clone)]
pub(super) struct CheckInvocation {
    pub(super) entry_path: String,
    pub(super) source_root: Option<String>,
    pub(super) used_manifest: bool,
}

#[derive(Debug, Clone)]
pub(super) struct BuildInvocation {
    pub(super) entry_path: String,
    pub(super) source_root: Option<String>,
    pub(super) project_root: PathBuf,
    pub(super) build_workspace_root: PathBuf,
    pub(super) build_root: PathBuf,
    pub(super) main_pulse_root: PathBuf,
    pub(super) main_resources_root: PathBuf,
    pub(super) tests_root: PathBuf,
    pub(super) build_asm_dir: PathBuf,
    pub(super) build_generated_dir: PathBuf,
    pub(super) build_assets_dir: PathBuf,
    pub(super) build_sanity_dir: PathBuf,
    pub(super) build_tmp_dir: PathBuf,
    pub(super) profile: String,
    pub(super) target: String,
    pub(super) packaging_mode: String,
    pub(super) output_mode: String,
    pub(super) output_entry: String,
    pub(super) runtime_debug_allocator: String,
    pub(super) runtime_cycle_collector: String,
    pub(super) assembler: Option<String>,
    pub(super) linker: Option<String>,
    pub(super) wix: Option<String>,
    pub(super) signtool: Option<String>,
    pub(super) package_name: Option<String>,
    pub(super) package_version: Option<String>,
    pub(super) package_publisher: Option<String>,
    pub(super) package_identifier: Option<String>,
    pub(super) package_install_scope: Option<String>,
    pub(super) package_entrypoints: Option<String>,
    pub(super) package_icons: Option<String>,
    pub(super) package_assets: Option<String>,
    pub(super) package_license: Option<String>,
    pub(super) package_readme: Option<String>,
    pub(super) package_config: Option<String>,
    pub(super) package_data: Option<String>,
    pub(super) package_libraries: Option<String>,
    pub(super) package_signing_mode: Option<String>,
    pub(super) package_signing_certificate: Option<String>,
    pub(super) package_signing_subject: Option<String>,
    pub(super) package_signing_timestamp_url: Option<String>,
    pub(super) used_manifest: bool,
}

#[derive(Debug, Clone)]
pub(super) struct TestInvocation {
    pub(super) project_root: PathBuf,
    pub(super) source_root: PathBuf,
    pub(super) tests_root: PathBuf,
    pub(super) used_manifest: bool,
}

#[derive(Debug, Clone)]
pub(super) struct BuildRun {
    pub(super) resolved: BuildInvocation,
    pub(super) files_loaded: usize,
    pub(super) artifact: BackendArtifact,
    pub(super) build_config_plan_path: PathBuf,
}

#[derive(Debug, Clone)]
pub(super) struct PackageReport {
    pub(super) mode: String,
    pub(super) status: String,
    pub(super) staging_dir: PathBuf,
    pub(super) report_path: PathBuf,
    pub(super) entry: String,
    pub(super) profile: String,
    pub(super) source_root: Option<String>,
    pub(super) build_output_dir: PathBuf,
    pub(super) executable: Option<PathBuf>,
    pub(super) artifact_stamp: String,
    pub(super) package_name: String,
    pub(super) package_version: String,
    pub(super) msi_output: Option<PathBuf>,
    pub(super) msi_build_log: Option<PathBuf>,
    pub(super) signing_status: String,
    pub(super) signing_backend: String,
    pub(super) signing_policy: String,
    pub(super) signing_reason: String,
    pub(super) signing_target: Option<PathBuf>,
    pub(super) signing_plan: Option<PathBuf>,
    pub(super) signing_log: Option<PathBuf>,
    pub(super) tests_total: usize,
    pub(super) tests_failed: usize,
}

#[derive(Debug, Clone)]
pub(super) enum PackageError {
    Failed(String),
}

#[derive(Debug, Clone)]
pub(super) struct WixToolProbe {
    pub(super) status: String,
    pub(super) path: Option<PathBuf>,
    pub(super) version: Option<String>,
}

#[derive(Debug, Clone)]
pub(super) struct SigningToolProbe {
    pub(super) status: String,
    pub(super) path: Option<PathBuf>,
    pub(super) version: Option<String>,
}

#[derive(Debug, Clone)]
pub(super) struct SigningOutcome {
    pub(super) status: String,
    pub(super) backend: String,
    pub(super) policy: String,
    pub(super) reason: String,
    pub(super) target: Option<PathBuf>,
    pub(super) plan_path: PathBuf,
    pub(super) log_path: Option<PathBuf>,
    pub(super) tool_status: String,
    pub(super) tool_path: Option<PathBuf>,
    pub(super) tool_version: Option<String>,
    pub(super) fatal_error: Option<String>,
}

#[derive(Debug, Clone)]
pub(super) struct ManifestSources {
    pub(super) root: String,
    pub(super) main_pulse: Option<String>,
    pub(super) main_resources: Option<String>,
    pub(super) test_pulse: Option<String>,
    pub(super) test_resources: Option<String>,
    pub(super) api_pulse: Option<String>,
    pub(super) api_resources: Option<String>,
    pub(super) docs: Option<String>,
    pub(super) libraries: Option<String>,
    pub(super) entry: Option<String>,
}

#[derive(Debug, Clone)]
pub(super) struct ManifestBuild {
    pub(super) profile: Option<String>,
    pub(super) target: Option<String>,
    pub(super) packaging_mode: Option<String>,
    pub(super) output_mode: Option<String>,
    pub(super) output_entry: Option<String>,
    pub(super) runtime_debug_allocator: Option<String>,
    pub(super) runtime_cycle_collector: Option<String>,
    pub(super) out_dir: Option<String>,
    pub(super) asm_dir: Option<String>,
    pub(super) generated_dir: Option<String>,
    pub(super) assets_dir: Option<String>,
    pub(super) sanity_dir: Option<String>,
    pub(super) tmp_dir: Option<String>,
    pub(super) distro_dir: Option<String>,
}

#[derive(Debug, Clone)]
pub(super) struct ManifestToolchain {
    pub(super) linker: Option<String>,
    pub(super) assembler: Option<String>,
    pub(super) wix: Option<String>,
    pub(super) signtool: Option<String>,
}

#[derive(Debug, Clone)]
pub(super) struct ManifestPackage {
    pub(super) name: String,
    pub(super) version: String,
    pub(super) metadata: BTreeMap<String, String>,
}

#[derive(Debug, Clone)]
pub(super) struct ManifestWorkspace {
    pub(super) members: Vec<String>,
}

#[derive(Debug, Clone)]
pub(super) struct ManifestConfig {
    pub(super) package: Option<ManifestPackage>,
    pub(super) workspace: Option<ManifestWorkspace>,
    pub(super) sources: ManifestSources,
    pub(super) build: ManifestBuild,
    pub(super) toolchain: ManifestToolchain,
}

#[derive(Debug, Clone)]
pub(super) struct WorkspaceContext {
    pub(super) root: PathBuf,
    pub(super) member_roots: Vec<PathBuf>,
}

pub(super) fn normalize_output_mode(raw: &str) -> Option<&'static str> {
    match raw {
        "fat" | "single_exe" => Some("fat"),
        "shared" | "exe_with_dlls" => Some("shared"),
        _ => None,
    }
}

pub(super) fn resolve_check_invocation(
    entry_arg: Option<&str>,
    flags: &CliFlags,
) -> Result<CheckInvocation, String> {
    let mut used_manifest = false;
    let manifest_info = find_and_load_manifest_for_check(entry_arg, flags)?;
    let mut source_root = flags.source_root.clone();
    let mut entry_path = entry_arg.map(|s| s.to_string());

    if let Some((manifest_path, manifest_config)) = manifest_info {
        used_manifest = true;
        let _manifest_identity = manifest_config
            .package
            .as_ref()
            .map(|pkg| (&pkg.name, &pkg.version, pkg.metadata.len()));
        let project_root = manifest_path
            .parent()
            .ok_or_else(|| format!("Invalid manifest path '{}'", manifest_path.display()))?;
        if source_root.is_none() {
            let main_pulse = manifest_config
                .sources
                .main_pulse
                .clone()
                .unwrap_or_else(|| manifest_config.sources.root.clone());
            source_root = Some(project_root.join(main_pulse).display().to_string());
        }
        if entry_path.is_none() {
            if let Some(entry_rel) = manifest_config.sources.entry {
                let src_root = PathBuf::from(
                    source_root
                        .as_ref()
                        .ok_or_else(|| "Internal error: source root missing".to_string())?,
                );
                entry_path = Some(src_root.join(entry_rel).display().to_string());
            }
        }
    }

    if entry_path.is_none() {
        if let Some(src) = &source_root {
            if let Some(discovered) = discover_entry_from_source_root(Path::new(src))? {
                entry_path = Some(discovered.display().to_string());
            }
        }
    }

    let Some(entry_path) = entry_path else {
        return Err(
            "Missing entry file for 'check'. Provide <entry.pulse> or set [sources].entry in pulsec.toml"
                .to_string(),
        );
    };

    Ok(CheckInvocation {
        entry_path,
        source_root,
        used_manifest,
    })
}

pub(super) fn resolve_build_invocation(
    entry_arg: Option<&str>,
    flags: &CliFlags,
) -> Result<BuildInvocation, String> {
    let manifest_info = find_and_load_manifest_for_check(entry_arg, flags)?;
    let mut used_manifest = false;
    let mut project_root: Option<PathBuf> = None;
    let mut source_root = flags.source_root.clone();
    let mut entry_path = entry_arg.map(|s| s.to_string());
    let mut manifest_profile: Option<String> = None;
    let mut manifest_target: Option<String> = None;
    let mut manifest_packaging_mode: Option<String> = None;
    let mut manifest_output_mode: Option<String> = None;
    let mut manifest_output_entry: Option<String> = None;
    let mut manifest_runtime_debug_allocator: Option<String> = None;
    let mut manifest_runtime_cycle_collector: Option<String> = None;
    let mut manifest_out_dir: Option<String> = None;
    let mut manifest_linker: Option<String> = None;
    let mut manifest_assembler: Option<String> = None;
    let mut manifest_wix: Option<String> = None;
    let mut manifest_signtool: Option<String> = None;
    let mut manifest_main_resources: Option<String> = None;
    let mut manifest_test_pulse: Option<String> = None;
    let mut manifest_asm_dir: Option<String> = None;
    let mut manifest_generated_dir: Option<String> = None;
    let mut manifest_assets_dir: Option<String> = None;
    let mut manifest_sanity_dir: Option<String> = None;
    let mut manifest_tmp_dir: Option<String> = None;
    let mut manifest_distro_dir: Option<String> = None;
    let mut package_name: Option<String> = None;
    let mut package_version: Option<String> = None;
    let mut package_publisher: Option<String> = None;
    let mut package_identifier: Option<String> = None;
    let mut package_install_scope: Option<String> = None;
    let mut package_entrypoints: Option<String> = None;
    let mut package_icons: Option<String> = None;
    let mut package_assets: Option<String> = None;
    let mut package_license: Option<String> = None;
    let mut package_readme: Option<String> = None;
    let mut package_config: Option<String> = None;
    let mut package_data: Option<String> = None;
    let mut package_libraries: Option<String> = None;
    let mut package_signing_mode: Option<String> = None;
    let mut package_signing_certificate: Option<String> = None;
    let mut package_signing_subject: Option<String> = None;
    let mut package_signing_timestamp_url: Option<String> = None;

    if let Some((manifest_path, manifest_config)) = manifest_info {
        used_manifest = true;
        let _manifest_identity = (
            manifest_config
                .package
                .as_ref()
                .map(|pkg| (&pkg.name, &pkg.version, pkg.metadata.len())),
            manifest_config.sources.test_resources.as_deref(),
            manifest_config.sources.api_pulse.as_deref(),
            manifest_config.sources.api_resources.as_deref(),
            manifest_config.sources.docs.as_deref(),
            manifest_config.sources.libraries.as_deref(),
        );
        if let Some(package) = manifest_config.package.as_ref() {
            package_name = Some(package.name.clone());
            package_version = Some(package.version.clone());
            package_publisher = package.metadata.get("publisher").cloned();
            package_identifier = package.metadata.get("identifier").cloned();
            package_install_scope = package.metadata.get("install_scope").cloned();
            package_entrypoints = package.metadata.get("entrypoints").cloned();
            package_icons = package.metadata.get("icons").cloned();
            package_assets = package.metadata.get("assets").cloned();
            package_license = package.metadata.get("license").cloned();
            package_readme = package.metadata.get("readme").cloned();
            package_config = package.metadata.get("config").cloned();
            package_data = package.metadata.get("data").cloned();
            package_libraries = package.metadata.get("libraries").cloned();
            package_signing_mode = package.metadata.get("signing_mode").cloned();
            package_signing_certificate = package.metadata.get("signing_certificate").cloned();
            package_signing_subject = package.metadata.get("signing_subject").cloned();
            package_signing_timestamp_url =
                package.metadata.get("signing_timestamp_url").cloned();
        }
        let root = manifest_path
            .parent()
            .ok_or_else(|| format!("Invalid manifest path '{}'", manifest_path.display()))?
            .to_path_buf();
        project_root = Some(root.clone());
        manifest_profile = manifest_config.build.profile;
        manifest_target = manifest_config.build.target;
        manifest_packaging_mode = manifest_config.build.packaging_mode;
        manifest_output_mode = manifest_config.build.output_mode;
        manifest_output_entry = manifest_config.build.output_entry;
        manifest_runtime_debug_allocator = manifest_config.build.runtime_debug_allocator;
        manifest_runtime_cycle_collector = manifest_config.build.runtime_cycle_collector;
        manifest_out_dir = manifest_config.build.out_dir;
        manifest_linker = manifest_config.toolchain.linker;
        manifest_assembler = manifest_config.toolchain.assembler;
        manifest_wix = manifest_config.toolchain.wix;
        manifest_signtool = manifest_config.toolchain.signtool;
        let manifest_main_pulse = manifest_config
            .sources
            .main_pulse
            .clone()
            .or_else(|| Some(manifest_config.sources.root.clone()));
        manifest_main_resources = manifest_config.sources.main_resources.clone();
        manifest_test_pulse = manifest_config.sources.test_pulse.clone();
        manifest_asm_dir = manifest_config.build.asm_dir.clone();
        manifest_generated_dir = manifest_config.build.generated_dir.clone();
        manifest_assets_dir = manifest_config.build.assets_dir.clone();
        manifest_sanity_dir = manifest_config.build.sanity_dir.clone();
        manifest_tmp_dir = manifest_config.build.tmp_dir.clone();
        manifest_distro_dir = manifest_config.build.distro_dir.clone();

        if source_root.is_none() {
            let main_pulse = manifest_main_pulse
                .unwrap_or_else(|| "src/main/pulse".to_string());
            source_root = Some(root.join(main_pulse).display().to_string());
        }
        if entry_path.is_none() {
            if let Some(entry_rel) = manifest_config.sources.entry {
                let src_root = PathBuf::from(
                    source_root
                        .as_ref()
                        .ok_or_else(|| "Internal error: source root missing".to_string())?,
                );
                entry_path = Some(src_root.join(entry_rel).display().to_string());
            }
        }
    }

    if source_root.is_none() {
        source_root = Some("src/main/pulse".to_string());
    }
    if entry_path.is_none() {
        if let Some(src) = &source_root {
            if let Some(discovered) = discover_entry_from_source_root(Path::new(src))? {
                entry_path = Some(discovered.display().to_string());
            }
        }
    }
    let Some(entry_path) = entry_path else {
        return Err(
            "Missing entry file for 'build'. Provide <entry.pulse> or set [sources].entry in pulsec.toml"
                .to_string(),
        );
    };

    let profile = if let Some(cli_profile) = &flags.profile {
        cli_profile.clone()
    } else if let Some(manifest_profile) = manifest_profile {
        match manifest_profile.as_str() {
            "debug" | "release" => manifest_profile,
            _ => {
                return Err(
                    "Manifest [build].profile must be 'debug' or 'release'".to_string(),
                )
            }
        }
    } else {
        "release".to_string()
    };
    let target = flags
        .target
        .clone()
        .or(manifest_target)
        .unwrap_or_else(|| "native-x64".to_string());
    let packaging_mode = flags
        .packaging_mode
        .clone()
        .or(manifest_packaging_mode)
        .unwrap_or_else(|| "staged".to_string());
    let output_mode = flags
        .output_mode
        .clone()
        .or(manifest_output_mode)
        .unwrap_or_else(|| "fat".to_string());
    let output_entry = manifest_output_entry.unwrap_or_else(|| "main".to_string());
    let runtime_debug_allocator = flags
        .runtime_debug_allocator
        .clone()
        .or(manifest_runtime_debug_allocator)
        .unwrap_or_else(|| "off".to_string());
    let runtime_cycle_collector = flags
        .runtime_cycle_collector
        .clone()
        .or(manifest_runtime_cycle_collector)
        .unwrap_or_else(|| "on".to_string());

    let base_root = if let Some(root) = project_root.clone() {
        root
    } else if let Some(root) = &flags.project_root {
        PathBuf::from(root)
    } else if let Some(src) = &source_root {
        canonical_existing_path(Path::new(src))
            .ok()
            .and_then(|p| p.parent().map(|parent| parent.to_path_buf()))
            .or_else(|| absolutize(Path::new(src)).and_then(|p| p.parent().map(|parent| parent.to_path_buf())))
            .unwrap_or_else(|| {
                env::current_dir()
                    .unwrap_or_else(|_| PathBuf::from("."))
            })
    } else {
        env::current_dir().unwrap_or_else(|_| PathBuf::from("."))
    };

    let configured_out_dir = flags.out_dir.clone().or(manifest_out_dir.clone());
    let build_root = if let Some(out_dir) = configured_out_dir {
        let out_path = PathBuf::from(out_dir);
        if out_path.is_absolute() {
            out_path
        } else {
            base_root.join(out_path)
        }
    } else if used_manifest || flags.profile.is_some() {
        let distro_rel = manifest_distro_dir
            .clone()
            .unwrap_or_else(|| "build/distro".to_string());
        base_root.join(distro_rel).join(&profile)
    } else {
        // Preserve direct-mode artifact layout used by fixture suites.
        base_root.join("build")
    };

    let project_root = project_root.unwrap_or_else(|| base_root.clone());
    let build_workspace_root = project_root.join("build");
    let main_pulse_root = source_root
        .as_ref()
        .map(PathBuf::from)
        .unwrap_or_else(|| resolve_layout_path(&project_root, None, "src/main/pulse"));
    let main_resources_root = resolve_layout_path(
        &project_root,
        manifest_main_resources.as_deref(),
        "src/main/resources",
    );
    let tests_root = resolve_layout_path(&project_root, manifest_test_pulse.as_deref(), "src/test/pulse");
    let build_asm_dir = resolve_layout_path(&project_root, manifest_asm_dir.as_deref(), "build/asm");
    let build_generated_dir = resolve_layout_path(
        &project_root,
        manifest_generated_dir.as_deref(),
        "build/generated",
    );
    let build_assets_dir =
        resolve_layout_path(&project_root, manifest_assets_dir.as_deref(), "build/assets");
    let build_sanity_dir =
        resolve_layout_path(&project_root, manifest_sanity_dir.as_deref(), "build/sanity");
    let build_tmp_dir = resolve_layout_path(&project_root, manifest_tmp_dir.as_deref(), "build/tmp");

    Ok(BuildInvocation {
        entry_path,
        source_root,
        project_root: project_root.clone(),
        build_workspace_root,
        build_root,
        main_pulse_root,
        main_resources_root,
        tests_root,
        build_asm_dir,
        build_generated_dir,
        build_assets_dir,
        build_sanity_dir,
        build_tmp_dir,
        profile,
        target,
        packaging_mode,
        output_mode,
        output_entry,
        runtime_debug_allocator,
        runtime_cycle_collector,
        assembler: flags.assembler.clone().or(manifest_assembler),
        linker: manifest_linker,
        wix: flags.wix.clone().or(manifest_wix),
        signtool: flags.signtool.clone().or(manifest_signtool),
        package_name,
        package_version,
        package_publisher,
        package_identifier,
        package_install_scope,
        package_entrypoints,
        package_icons,
        package_assets,
        package_license,
        package_readme,
        package_config,
        package_data,
        package_libraries,
        package_signing_mode,
        package_signing_certificate,
        package_signing_subject,
        package_signing_timestamp_url,
        used_manifest,
    })
}

