use super::*;

pub(super) fn run_package_pipeline(
    build: &BuildRun,
    flags: &CliFlags,
    from_build_command: bool,
) -> Result<PackageReport, PackageError> {
    let (tests_total, tests_failed) =
        run_packaging_test_gate(build).map_err(PackageError::Failed)?;
    let effective_msi = flags.msi || build.resolved.packaging_mode == "msi";
    if effective_msi {
        validate_msi_packaging_metadata(&build.resolved).map_err(PackageError::Failed)?;
    }
    let build_staging_root = if let Some(staging) = &flags.staging_dir {
        let p = PathBuf::from(staging);
        if p.is_absolute() {
            p
        } else {
            build.resolved.build_workspace_root.join(p)
        }
    } else {
        build.resolved.build_workspace_root.join("staging")
    };
    fs::create_dir_all(&build_staging_root).map_err(|e| {
        PackageError::Failed(format!(
            "Failed to create staging directory '{}': {}",
            build_staging_root.display(),
            e
        ))
    })?;
    materialize_package_layout(build, &build_staging_root).map_err(PackageError::Failed)?;

    let mode = if effective_msi { "msi" } else { "staged" }.to_string();
    let mut status = if effective_msi {
        "pending".to_string()
    } else {
        "ready".to_string()
    };
    let package_output_root = build
        .resolved
        .build_workspace_root
        .join("distro")
        .join("package");
    fs::create_dir_all(&package_output_root).map_err(|e| {
        PackageError::Failed(format!(
            "Failed to create package output directory '{}': {}",
            package_output_root.display(),
            e
        ))
    })?;
    let (package_name, package_version, artifact_stamp) = build_artifact_identity(&build.resolved);
    let report_path = package_output_root.join("package.report.txt");
    let stamped_report_path = package_output_root.join(format!("package.{artifact_stamp}.report.txt"));

    let mut report = PackageReport {
        mode,
        status: status.clone(),
        staging_dir: build_staging_root.clone(),
        report_path: report_path.clone(),
        entry: build.resolved.entry_path.clone(),
        profile: build.resolved.profile.clone(),
        source_root: build.resolved.source_root.clone(),
        build_output_dir: build.resolved.build_root.clone(),
        executable: build.artifact.exe_path.clone(),
        artifact_stamp: artifact_stamp.clone(),
        package_name: package_name.clone(),
        package_version: package_version.clone(),
        msi_output: None,
        msi_build_log: None,
        signing_status: "not_requested".to_string(),
        signing_backend: "none".to_string(),
        signing_policy: "release_optional_unsigned_fallback".to_string(),
        signing_reason: "not_evaluated".to_string(),
        signing_target: None,
        signing_plan: None,
        signing_log: None,
        tests_total,
        tests_failed,
    };
    let mut msi_generation_error: Option<String> = None;
    let mut package_failure: Option<String> = None;

    let mut report_text = String::new();
    report_text.push_str("schema=pulsec.package.report.v1\n");
    report_text.push_str(&format!("mode={}\n", report.mode));
    report_text.push_str(&format!("entry={}\n", report.entry));
    report_text.push_str(&format!("profile={}\n", report.profile));
    report_text.push_str(&format!("package_name={}\n", report.package_name));
    report_text.push_str(&format!("package_version={}\n", report.package_version));
    report_text.push_str(&format!("artifact_stamp={}\n", report.artifact_stamp));
    report_text.push_str(&format!(
        "source_root={}\n",
        report.source_root.as_deref().unwrap_or("<none>")
    ));
    report_text.push_str(&format!("build_output_dir={}\n", report.build_output_dir.display()));
    report_text.push_str(&format!(
        "layout_root={}\n",
        build_staging_root.display()
    ));
    report_text.push_str(&format!(
        "executable={}\n",
        report
            .executable
            .as_ref()
            .map(|p| p.display().to_string())
            .unwrap_or_else(|| "<none>".to_string())
    ));
    report_text.push_str(&format!("tests_total={}\n", report.tests_total));
    report_text.push_str(&format!("tests_failed={}\n", report.tests_failed));
    report_text.push_str(&format!(
        "entrypoint={}\n",
        if from_build_command {
            "build --msi"
        } else {
            "package"
        }
    ));
    if effective_msi {
        let wix_probe = probe_wix_toolchain(build.resolved.wix.as_deref());
        let (contract_path, template_path) =
            emit_msi_backend_contract(&package_output_root, build, &report, &wix_probe)
                .map_err(PackageError::Failed)?;
        match generate_msi_artifact(
            &package_output_root,
            &template_path,
            &report.artifact_stamp,
            &wix_probe,
        ) {
            Ok((msi_path, build_log_path)) => {
                status = "ready".to_string();
                report.msi_output = Some(msi_path);
                report.msi_build_log = Some(build_log_path);
            }
            Err(err) => {
                status = "failed".to_string();
                msi_generation_error = Some(err);
            }
        }
        report.status = status.clone();
        report_text.push_str("msi_backend=wix\n");
        report_text.push_str("msi_upgrade_policy=in_place\n");
        report_text.push_str(&format!("msi_tool_status={}\n", wix_probe.status));
        report_text.push_str(&format!(
            "msi_tool_path={}\n",
            wix_probe
                .path
                .as_ref()
                .map(|p| p.display().to_string())
                .unwrap_or_else(|| "<none>".to_string())
        ));
        report_text.push_str(&format!(
            "msi_tool_version={}\n",
            wix_probe.version.as_deref().unwrap_or("<unknown>")
        ));
        report_text.push_str(&format!("msi_contract={}\n", contract_path.display()));
        report_text.push_str(&format!("msi_template_stub={}\n", template_path.display()));
        report_text.push_str(&format!(
            "msi_output={}\n",
            report
                .msi_output
                .as_ref()
                .map(|p| p.display().to_string())
                .unwrap_or_else(|| "<none>".to_string())
        ));
        report_text.push_str(&format!(
            "msi_build_log={}\n",
            report
                .msi_build_log
                .as_ref()
                .map(|p| p.display().to_string())
                .unwrap_or_else(|| "<none>".to_string())
        ));
        if let Some(err) = &msi_generation_error {
            report_text.push_str(&format!("msi_error={}\n", err));
            package_failure = Some(format!("MSI generation failed: {err}"));
        }
    }
    let signing_outcome = emit_release_signing_plan(&package_output_root, build, &report, flags)
        .map_err(PackageError::Failed)?;
    report.signing_status = signing_outcome.status.clone();
    report.signing_backend = signing_outcome.backend.clone();
    report.signing_policy = signing_outcome.policy.clone();
    report.signing_reason = signing_outcome.reason.clone();
    report.signing_target = signing_outcome.target.clone();
    report.signing_plan = Some(signing_outcome.plan_path.clone());
    report.signing_log = signing_outcome.log_path.clone();
    report_text.push_str(&format!("signing_status={}\n", report.signing_status));
    report_text.push_str(&format!("signing_backend={}\n", report.signing_backend));
    report_text.push_str(&format!("signing_policy={}\n", report.signing_policy));
    report_text.push_str(&format!("signing_reason={}\n", report.signing_reason));
    report_text.push_str(&format!(
        "signing_target={}\n",
        report
            .signing_target
            .as_ref()
            .map(|p| p.display().to_string())
            .unwrap_or_else(|| "<none>".to_string())
    ));
    report_text.push_str(&format!(
        "signing_plan={}\n",
        report
            .signing_plan
            .as_ref()
            .map(|p| p.display().to_string())
            .unwrap_or_else(|| "<none>".to_string())
    ));
    report_text.push_str(&format!(
        "signing_log={}\n",
        report
            .signing_log
            .as_ref()
            .map(|p| p.display().to_string())
            .unwrap_or_else(|| "<none>".to_string())
    ));
    report_text.push_str(&format!("signing_tool_status={}\n", signing_outcome.tool_status));
    report_text.push_str(&format!(
        "signing_tool_path={}\n",
        signing_outcome
            .tool_path
            .as_ref()
            .map(|p| p.display().to_string())
            .unwrap_or_else(|| "<none>".to_string())
    ));
    report_text.push_str(&format!(
        "signing_tool_version={}\n",
        signing_outcome.tool_version.as_deref().unwrap_or("<unknown>")
    ));
    if let Some(err) = &signing_outcome.fatal_error {
        if package_failure.is_none() {
            package_failure = Some(format!("Signing failed: {err}"));
        }
    }
    if package_failure.is_some() {
        status = "failed".to_string();
    }
    report.status = status.clone();
    report_text.push_str(&format!("status={}\n", report.status));
    fs::write(&report_path, report_text).map_err(|e| {
        PackageError::Failed(format!(
            "Failed to write package report '{}': {}",
            report_path.display(),
            e
        ))
    })?;
    copy_file_into(&report_path, &stamped_report_path).map_err(PackageError::Failed)?;

    if let Some(err) = package_failure {
        return Err(PackageError::Failed(err));
    }
    Ok(report)
}

pub(super) fn run_packaging_test_gate(build: &BuildRun) -> Result<(usize, usize), String> {
    let tests = discover_test_files(&build.resolved.tests_root)?;
    if tests.is_empty() {
        return Ok((0, 0));
    }
    let source_root = build.resolved.main_pulse_root.display().to_string();
    let mut failed = 0usize;
    for test_file in &tests {
        if let Err(err) = check_project(&test_file.display().to_string(), Some(&source_root), false) {
            failed += 1;
            if failed == 1 {
                eprintln!("[FAIL] package test gate {} :: {}", test_file.display(), err);
            }
        }
    }
    if failed > 0 {
        return Err(format!(
            "Packaging test gate failed: {} of {} tests failed under '{}'",
            failed,
            tests.len(),
            build.resolved.tests_root.display()
        ));
    }
    Ok((tests.len(), 0))
}

pub(super) fn materialize_package_layout(build: &BuildRun, staging_root: &Path) -> Result<(), String> {
    let bin_dir = staging_root.join("bin");
    let assets_dir = staging_root.join("assets");
    let icons_dir = staging_root.join("icons");
    let licenses_dir = staging_root.join("licenses");
    let docs_dir = staging_root.join("docs");
    let config_dir = staging_root.join("config");
    let data_dir = staging_root.join("data");
    let metadata_dir = staging_root.join("metadata");
    let logs_dir = staging_root.join("logs");
    let obj_dir = staging_root.join("obj");
    for dir in [
        &bin_dir,
        &assets_dir,
        &icons_dir,
        &licenses_dir,
        &docs_dir,
        &config_dir,
        &data_dir,
        &metadata_dir,
        &logs_dir,
        &obj_dir,
    ] {
        fs::create_dir_all(dir)
            .map_err(|e| format!("Failed to create staging directory '{}': {}", dir.display(), e))?;
    }
    let (package_name, package_version, artifact_stamp) = build_artifact_identity(&build.resolved);

    copy_file_into(
        &build.artifact.link_report_path,
        &logs_dir.join("native.link.txt"),
    )?;
    copy_file_into(
        &build.build_config_plan_path,
        &metadata_dir.join("build.config.plan.json"),
    )?;
    copy_file_into(
        &build.artifact.native_plan_path,
        &metadata_dir.join("native.plan.json"),
    )?;
    copy_file_into(
        &build.artifact.ir_artifact_path,
        &metadata_dir.join("pulsec.ir.txt"),
    )?;
    copy_file_into(&build.artifact.object_path, &obj_dir.join("main.obj"))?;
    let mut stamp_text = String::new();
    stamp_text.push_str("schema=pulsec.artifact.stamp.v1\n");
    stamp_text.push_str(&format!("name={package_name}\n"));
    stamp_text.push_str(&format!("version={package_version}\n"));
    stamp_text.push_str(&format!("profile={}\n", build.resolved.profile));
    stamp_text.push_str(&format!("stamp={artifact_stamp}\n"));
    fs::write(metadata_dir.join("artifact.stamp.txt"), stamp_text).map_err(|e| {
        format!(
            "Failed to write package stamp '{}': {}",
            metadata_dir.join("artifact.stamp.txt").display(),
            e
        )
    })?;

    if build.resolved.output_mode == "shared" {
        if let Some(exe) = &build.artifact.exe_path {
            if let Some(bin_root) = exe.parent() {
                for entry in fs::read_dir(bin_root)
                    .map_err(|e| format!("Failed to read shared bin dir '{}': {}", bin_root.display(), e))?
                    .flatten()
                {
                    let path = entry.path();
                    if path.is_file() {
                        copy_file_into(&path, &bin_dir.join(entry.file_name()))?;
                    } else if path.is_dir() {
                        copy_dir_recursive(&path, &bin_dir.join(entry.file_name()))?;
                    }
                }
            }
        }
    } else if build.resolved.build_assets_dir.exists() {
        copy_dir_recursive(&build.resolved.build_assets_dir, &assets_dir)?;
    }
    for path in resolve_payload_input_paths(&build.resolved.project_root, build.resolved.package_assets.as_deref()) {
        copy_payload_item(&path, &assets_dir, true)?;
    }
    for path in resolve_payload_input_paths(&build.resolved.project_root, build.resolved.package_icons.as_deref()) {
        copy_payload_item(&path, &icons_dir, true)?;
    }
    for path in resolve_payload_input_paths(
        &build.resolved.project_root,
        build.resolved.package_license.as_deref(),
    ) {
        copy_payload_item(&path, &licenses_dir, true)?;
    }
    if build.resolved.package_license.is_none() {
        for fallback in ["LICENSE", "LICENSE.txt", "LICENSE.md"] {
            let candidate = build.resolved.project_root.join(fallback);
            if candidate.exists() {
                copy_payload_item(&candidate, &licenses_dir, true)?;
                break;
            }
        }
    }
    for path in resolve_payload_input_paths(
        &build.resolved.project_root,
        build.resolved.package_readme.as_deref(),
    ) {
        copy_payload_item(&path, &docs_dir, true)?;
    }
    if build.resolved.package_readme.is_none() {
        for fallback in ["README.md", "README.txt"] {
            let candidate = build.resolved.project_root.join(fallback);
            if candidate.exists() {
                copy_payload_item(&candidate, &docs_dir, true)?;
                break;
            }
        }
    }
    for path in resolve_payload_input_paths(
        &build.resolved.project_root,
        build.resolved.package_config.as_deref(),
    ) {
        copy_payload_item(&path, &config_dir, true)?;
    }
    for path in resolve_payload_input_paths(&build.resolved.project_root, build.resolved.package_data.as_deref()) {
        copy_payload_item(&path, &data_dir, true)?;
    }
    for path in resolve_payload_input_paths(
        &build.resolved.project_root,
        build.resolved.package_libraries.as_deref(),
    ) {
        copy_payload_item(&path, &bin_dir, true)?;
    }
    if let Some(runtime_library) = &build.artifact.runtime_library_path {
        copy_file_into(
            runtime_library,
            &bin_dir.join(
                runtime_library
                    .file_name()
                    .unwrap_or_else(|| std::ffi::OsStr::new("pulsecore.dll")),
            ),
        )?;
    }
    if let Some(runtime_import_library) = &build.artifact.runtime_import_library_path {
        copy_file_into(
            runtime_import_library,
            &bin_dir.join(
                runtime_import_library
                    .file_name()
                    .unwrap_or_else(|| std::ffi::OsStr::new("pulsecore.lib")),
            ),
        )?;
    }
    let distro_libraries = build.resolved.build_root.join("libraries");
    if distro_libraries.exists() {
        copy_dir_recursive(&distro_libraries, &bin_dir)?;
    }

    let launch_descriptor = bin_dir.join("launch.txt");
    if let Some(exe) = &build.artifact.exe_path {
        let file_name = exe
            .file_name()
            .unwrap_or_else(|| std::ffi::OsStr::new("main.exe"));
        let staged_exe = bin_dir.join(file_name);
        if !staged_exe.exists() {
            copy_file_into(exe, &staged_exe)?;
        }
        if build.resolved.output_mode == "shared" {
            if let (Some(runtime_library), Some(runtime_import_library)) = (
                &build.artifact.runtime_library_path,
                &build.artifact.runtime_import_library_path,
            ) {
                write_shared_runtime_lookup_metadata(
                    &launch_descriptor,
                    &build.resolved.profile,
                    &artifact_stamp,
                    &staged_exe,
                    runtime_library,
                    runtime_import_library,
                    ".",
                )?;
            }
        } else {
            let mut launch_text = String::new();
            launch_text.push_str("schema=pulsec.package.launch.v1\n");
            launch_text.push_str(&format!("profile={}\n", build.resolved.profile));
            launch_text.push_str(&format!("artifact_stamp={artifact_stamp}\n"));
            launch_text.push_str(&format!("executable={}\n", staged_exe.display()));
            fs::write(&launch_descriptor, launch_text).map_err(|e| {
                format!(
                    "Failed to write package launch descriptor '{}': {}",
                    launch_descriptor.display(),
                    e
                )
            })?;
        }
    } else {
        let mut launch_text = String::new();
        launch_text.push_str("schema=pulsec.package.launch.v1\n");
        launch_text.push_str(&format!("profile={}\n", build.resolved.profile));
        launch_text.push_str(&format!("artifact_stamp={artifact_stamp}\n"));
        launch_text.push_str("executable=<none>\n");
        fs::write(&launch_descriptor, launch_text).map_err(|e| {
            format!(
                "Failed to write package launch descriptor '{}': {}",
                launch_descriptor.display(),
                e
            )
        })?;
    }
    Ok(())
}

pub(super) fn resolve_payload_input_paths(project_root: &Path, raw: Option<&str>) -> Vec<PathBuf> {
    let Some(raw) = raw else {
        return Vec::new();
    };
    let mut out = Vec::new();
    for token in raw.split([',', ';']) {
        let path = token.trim();
        if path.is_empty() {
            continue;
        }
        let resolved = if Path::new(path).is_absolute() {
            PathBuf::from(path)
        } else {
            project_root.join(path)
        };
        if resolved.exists() {
            out.push(resolved);
        }
    }
    out
}

pub(super) fn copy_payload_item(src: &Path, dst_dir: &Path, flatten_dir_contents: bool) -> Result<(), String> {
    if src.is_dir() {
        if flatten_dir_contents {
            copy_dir_recursive(src, dst_dir)
        } else {
            let leaf = src
                .file_name()
                .ok_or_else(|| format!("Invalid payload directory '{}'", src.display()))?;
            copy_dir_recursive(src, &dst_dir.join(leaf))
        }
    } else {
        let leaf = src
            .file_name()
            .ok_or_else(|| format!("Invalid payload file '{}'", src.display()))?;
        copy_file_into(src, &dst_dir.join(leaf))
    }
}

pub(super) fn copy_file_into(src: &Path, dst: &Path) -> Result<(), String> {
    let parent = dst
        .parent()
        .ok_or_else(|| format!("Invalid destination path '{}'", dst.display()))?;
    fs::create_dir_all(parent)
        .map_err(|e| format!("Failed to create directory '{}': {}", parent.display(), e))?;
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

pub(super) fn validate_msi_packaging_metadata(resolved: &BuildInvocation) -> Result<(), String> {
    let mut missing = Vec::new();
    if resolved.package_name.as_deref().unwrap_or("").trim().is_empty() {
        missing.push("[package].name");
    }
    if resolved
        .package_publisher
        .as_deref()
        .unwrap_or("")
        .trim()
        .is_empty()
    {
        missing.push("[package.metadata].publisher");
    }
    if resolved
        .package_identifier
        .as_deref()
        .unwrap_or("")
        .trim()
        .is_empty()
    {
        missing.push("[package.metadata].identifier");
    }
    if resolved
        .package_entrypoints
        .as_deref()
        .unwrap_or("")
        .trim()
        .is_empty()
    {
        missing.push("[package.metadata].entrypoints");
    }
    if resolved.package_icons.as_deref().unwrap_or("").trim().is_empty() {
        missing.push("[package.metadata].icons");
    }
    if resolved.package_assets.as_deref().unwrap_or("").trim().is_empty() {
        missing.push("[package.metadata].assets");
    }
    let install_scope = resolved.package_install_scope.as_deref().unwrap_or("").trim();
    if install_scope.is_empty() {
        missing.push("[package.metadata].install_scope");
    } else if install_scope != "per-user" && install_scope != "per-machine" {
        return Err(
            "Packaging metadata validation failed: [package.metadata].install_scope must be 'per-user' or 'per-machine'"
                .to_string(),
        );
    }
    if missing.is_empty() {
        Ok(())
    } else {
        Err(format!(
            "Packaging metadata validation failed for MSI: missing {}",
            missing.join(", ")
        ))
    }
}

pub(super) fn parse_tool_version(output: &process::Output) -> Option<String> {
    let stdout = String::from_utf8_lossy(&output.stdout);
    for line in stdout.lines() {
        let trimmed = line.trim();
        if !trimmed.is_empty() {
            return Some(trimmed.to_string());
        }
    }
    let stderr = String::from_utf8_lossy(&output.stderr);
    for line in stderr.lines() {
        let trimmed = line.trim();
        if !trimmed.is_empty() {
            return Some(trimmed.to_string());
        }
    }
    None
}

pub(super) fn probe_wix_toolchain(explicit_wix: Option<&str>) -> WixToolProbe {
    let mut candidates: Vec<PathBuf> = Vec::new();
    if let Some(explicit) = explicit_wix {
        if !explicit.trim().is_empty() {
            candidates.push(PathBuf::from(explicit));
        }
    }
    if let Ok(raw) = env::var("PULSEC_WIX_CLI") {
        if !raw.trim().is_empty() {
            candidates.push(PathBuf::from(raw));
        }
    }
    if let Ok(program_files) = env::var("ProgramFiles") {
        let pf = PathBuf::from(program_files);
        candidates.push(pf.join("WiX Toolset v6.0").join("bin").join("wix.exe"));
        candidates.push(pf.join("WiX Toolset v6").join("bin").join("wix.exe"));
    }
    if let Ok(program_files_x86) = env::var("ProgramFiles(x86)") {
        let pf86 = PathBuf::from(program_files_x86);
        candidates.push(pf86.join("WiX Toolset v6.0").join("bin").join("wix.exe"));
        candidates.push(pf86.join("WiX Toolset v6").join("bin").join("wix.exe"));
    }
    candidates.push(PathBuf::from("wix.exe"));
    candidates.push(PathBuf::from("wix"));

    for candidate in candidates {
        if candidate.is_absolute() && !candidate.exists() {
            continue;
        }
        let output = process::Command::new(&candidate).arg("--version").output();
        let Ok(output) = output else {
            continue;
        };
        if output.status.success() {
            return WixToolProbe {
                status: "available".to_string(),
                path: Some(candidate),
                version: parse_tool_version(&output),
            };
        }
    }

    WixToolProbe {
        status: "unavailable".to_string(),
        path: None,
        version: None,
    }
}

pub(super) fn probe_signtool(explicit_signtool: Option<&str>) -> SigningToolProbe {
    let mut candidates: Vec<PathBuf> = Vec::new();
    if let Some(explicit) = explicit_signtool {
        if !explicit.trim().is_empty() {
            candidates.push(PathBuf::from(explicit));
        }
    }
    if let Ok(raw) = env::var("PULSEC_SIGNTOOL") {
        if !raw.trim().is_empty() {
            candidates.push(PathBuf::from(raw));
        }
    }
    candidates.push(PathBuf::from("signtool.exe"));
    candidates.push(PathBuf::from("signtool"));

    for candidate in candidates {
        if candidate.is_absolute() && !candidate.exists() {
            continue;
        }
        if candidate.is_absolute() {
            return SigningToolProbe {
                status: "available".to_string(),
                path: Some(candidate),
                version: None,
            };
        }
        let output = process::Command::new(&candidate).arg("/?").output();
        if output.is_ok() {
            return SigningToolProbe {
                status: "available".to_string(),
                path: Some(candidate),
                version: None,
            };
        }
    }

    SigningToolProbe {
        status: "unavailable".to_string(),
        path: None,
        version: None,
    }
}

pub(super) fn emit_release_signing_plan(
    package_output_root: &Path,
    build: &BuildRun,
    report: &PackageReport,
    flags: &CliFlags,
) -> Result<SigningOutcome, String> {
    let plan_path = package_output_root.join("signing.plan.txt");
    let log_path = package_output_root.join("signing.log.txt");
    let signing_mode = build
        .resolved
        .package_signing_mode
        .as_deref()
        .unwrap_or("unsigned")
        .trim();
    let signing_certificate = build
        .resolved
        .package_signing_certificate
        .as_deref()
        .unwrap_or("")
        .trim();
    let signing_subject = build
        .resolved
        .package_signing_subject
        .as_deref()
        .unwrap_or("")
        .trim();
    let signing_timestamp_url = build
        .resolved
        .package_signing_timestamp_url
        .as_deref()
        .unwrap_or("")
        .trim();
    let target = if report.mode == "msi" {
        report.msi_output.clone()
    } else {
        report.executable.clone()
    };
    let probe = if signing_mode == "signtool" {
        probe_signtool(flags.signtool.as_deref().or(build.resolved.signtool.as_deref()))
    } else {
        SigningToolProbe {
            status: "not_requested".to_string(),
            path: None,
            version: None,
        }
    };

    let mut outcome = SigningOutcome {
        status: "unsigned".to_string(),
        backend: if signing_mode == "signtool" {
            "signtool".to_string()
        } else {
            "none".to_string()
        },
        policy: "release_optional_unsigned_fallback".to_string(),
        reason: "policy_default_unsigned".to_string(),
        target,
        plan_path: plan_path.clone(),
        log_path: None,
        tool_status: probe.status.clone(),
        tool_path: probe.path.clone(),
        tool_version: probe.version.clone(),
        fatal_error: None,
    };

    if build.resolved.profile != "release" {
        outcome.status = "skipped".to_string();
        outcome.backend = "none".to_string();
        outcome.reason = "profile_not_release".to_string();
    } else if outcome.target.is_none() {
        outcome.reason = "no_signable_artifact".to_string();
    } else if signing_mode == "unsigned" {
        outcome.reason = if build.resolved.package_signing_mode.is_some() {
            "policy_explicit_unsigned".to_string()
        } else {
            "policy_default_unsigned".to_string()
        };
    } else if signing_mode == "signtool" {
        if probe.status != "available" {
            outcome.reason = "fallback_tool_unavailable".to_string();
        } else if signing_certificate.is_empty() && signing_subject.is_empty() {
            outcome.reason = "fallback_missing_identity".to_string();
        } else {
            let tool = probe
                .path
                .as_ref()
                .expect("available signtool probe must carry a path");
            let target_path = outcome
                .target
                .as_ref()
                .expect("signing target checked above")
                .clone();
            let mut args: Vec<String> = vec!["sign".to_string(), "/fd".to_string(), "SHA256".to_string()];
            if !signing_certificate.is_empty() {
                args.push("/f".to_string());
                args.push(signing_certificate.to_string());
            } else {
                args.push("/n".to_string());
                args.push(signing_subject.to_string());
            }
            if !signing_timestamp_url.is_empty() {
                args.push("/tr".to_string());
                args.push(signing_timestamp_url.to_string());
                args.push("/td".to_string());
                args.push("SHA256".to_string());
            }
            args.push(normalize_windows_tool_path(&target_path));
            let output = process::Command::new(tool)
                .args(&args)
                .output()
                .map_err(|e| format!("Failed to launch SignTool '{}': {}", tool.display(), e))?;
            let mut log = String::new();
            log.push_str("schema=pulsec.signing.log.v1\n");
            log.push_str(&format!("tool={}\n", tool.display()));
            log.push_str(&format!("target={}\n", target_path.display()));
            log.push_str(&format!("status={}\n", output.status));
            log.push_str("stdout=\n");
            log.push_str(&String::from_utf8_lossy(&output.stdout));
            if !log.ends_with('\n') {
                log.push('\n');
            }
            log.push_str("stderr=\n");
            log.push_str(&String::from_utf8_lossy(&output.stderr));
            if !log.ends_with('\n') {
                log.push('\n');
            }
            fs::write(&log_path, log).map_err(|e| {
                format!(
                    "Failed to write signing log '{}': {}",
                    log_path.display(),
                    e
                )
            })?;
            outcome.log_path = Some(log_path.clone());
            if output.status.success() {
                outcome.status = "signed".to_string();
                outcome.reason = "signtool_success".to_string();
            } else {
                outcome.status = "failed".to_string();
                outcome.reason = "signtool_failed".to_string();
                outcome.fatal_error = Some(format!(
                    "SignTool returned {} for '{}'",
                    output.status,
                    target_path.display()
                ));
            }
        }
    } else {
        outcome.status = "failed".to_string();
        outcome.backend = "none".to_string();
        outcome.reason = "invalid_signing_mode".to_string();
        outcome.fatal_error = Some(format!(
            "Unsupported signing_mode '{}'; expected 'unsigned' or 'signtool'",
            signing_mode
        ));
    }

    let mut plan = String::new();
    plan.push_str("schema=pulsec.signing.plan.v1\n");
    plan.push_str(&format!("profile={}\n", build.resolved.profile));
    plan.push_str(&format!("package_name={}\n", report.package_name));
    plan.push_str(&format!("package_version={}\n", report.package_version));
    plan.push_str(&format!("artifact_stamp={}\n", report.artifact_stamp));
    plan.push_str(&format!("mode={}\n", report.mode));
    plan.push_str(&format!("signing_mode={}\n", signing_mode));
    plan.push_str(&format!("signing_policy={}\n", outcome.policy));
    plan.push_str(&format!("signing_status={}\n", outcome.status));
    plan.push_str(&format!("signing_backend={}\n", outcome.backend));
    plan.push_str(&format!("signing_reason={}\n", outcome.reason));
    plan.push_str(&format!(
        "signing_target={}\n",
        outcome
            .target
            .as_ref()
            .map(|p| p.display().to_string())
            .unwrap_or_else(|| "<none>".to_string())
    ));
    plan.push_str(&format!(
        "signing_tool_status={}\n",
        outcome.tool_status
    ));
    plan.push_str(&format!(
        "signing_tool_path={}\n",
        outcome
            .tool_path
            .as_ref()
            .map(|p| p.display().to_string())
            .unwrap_or_else(|| "<none>".to_string())
    ));
    plan.push_str(&format!(
        "signing_tool_version={}\n",
        outcome.tool_version.as_deref().unwrap_or("<unknown>")
    ));
    plan.push_str(&format!(
        "signing_certificate={}\n",
        if signing_certificate.is_empty() {
            "<none>"
        } else {
            signing_certificate
        }
    ));
    plan.push_str(&format!(
        "signing_subject={}\n",
        if signing_subject.is_empty() {
            "<none>"
        } else {
            signing_subject
        }
    ));
    plan.push_str(&format!(
        "signing_timestamp_url={}\n",
        if signing_timestamp_url.is_empty() {
            "<none>"
        } else {
            signing_timestamp_url
        }
    ));
    if let Some(log_path) = &outcome.log_path {
        plan.push_str(&format!("signing_log={}\n", log_path.display()));
    } else {
        plan.push_str("signing_log=<none>\n");
    }
    if let Some(err) = &outcome.fatal_error {
        plan.push_str(&format!("signing_error={}\n", err));
    }
    fs::write(&plan_path, plan).map_err(|e| {
        format!(
            "Failed to write signing plan '{}': {}",
            plan_path.display(),
            e
        )
    })?;

    Ok(outcome)
}

pub(super) fn emit_msi_backend_contract(
    package_output_root: &Path,
    build: &BuildRun,
    report: &PackageReport,
    probe: &WixToolProbe,
) -> Result<(PathBuf, PathBuf), String> {
    let contract_path = package_output_root.join("msi.backend.contract.txt");
    let template_path = package_output_root.join("msi.template.stub.wxs");
    let publisher = build
        .resolved
        .package_publisher
        .as_deref()
        .unwrap_or("PulseCode");
    let identifier = build
        .resolved
        .package_identifier
        .as_deref()
        .unwrap_or("com.pulse.unnamed");
    let install_scope = build
        .resolved
        .package_install_scope
        .as_deref()
        .unwrap_or("per-user");
    let entrypoints_raw = build
        .resolved
        .package_entrypoints
        .as_deref()
        .unwrap_or("<none>");
    let primary_entrypoint = entrypoints_raw
        .split([',', ';'])
        .find_map(|token| {
            let t = token.trim();
            if t.is_empty() {
                None
            } else {
                Some(t)
            }
        })
        .unwrap_or("<none>");
    let install_root = if install_scope == "per-machine" {
        "ProgramFiles64Folder"
    } else {
        "LocalAppDataFolder"
    };
    let wix_scope = if install_scope == "per-machine" {
        "perMachine"
    } else {
        "perUser"
    };
    let shortcut_directory = if install_scope == "per-machine" {
        "ProgramMenuFolder"
    } else {
        "DesktopFolder"
    };
    let registry_root = if install_scope == "per-machine" {
        "HKLM"
    } else {
        "HKCU"
    };
    let registry_key = format!(r"Software\PulseCode\{}\Install", identifier);
    let exe_name = report
        .executable
        .as_ref()
        .and_then(|p| p.file_name())
        .and_then(|s| s.to_str())
        .unwrap_or("main.exe");
    let staged_exe = report.staging_dir.join("bin").join(exe_name);
    let staged_exe_text = normalize_windows_tool_path(&staged_exe);
    let staged_payloads = collect_staged_installer_payloads(&report.staging_dir, exe_name)?;
    let upgrade_code = deterministic_upgrade_code(identifier, install_scope);
    let product_code = deterministic_product_code(identifier, &report.package_version, install_scope);
    let side_by_side_policy = "forbid_same_identifier_same_scope";
    let cross_scope_policy = "allow_per_user_and_per_machine";
    let uninstall_behavior = "remove_install_folder_and_shortcuts";
    let main_component_guid = deterministic_guid(&format!(
        "{identifier}|{install_scope}|main_executable_component"
    ));

    let mut contract = String::new();
    contract.push_str("schema=pulsec.msi.backend.contract.v1\n");
    contract.push_str("backend=wix\n");
    contract.push_str("backend_version_contract=v6\n");
    contract.push_str("upgrade_policy=in_place\n");
    contract.push_str(&format!("package_name={}\n", report.package_name));
    contract.push_str(&format!("package_version={}\n", report.package_version));
    contract.push_str(&format!("artifact_stamp={}\n", report.artifact_stamp));
    contract.push_str(&format!("publisher={publisher}\n"));
    contract.push_str(&format!("identifier={identifier}\n"));
    contract.push_str(&format!("install_scope={install_scope}\n"));
    contract.push_str(&format!("install_root={install_root}\n"));
    contract.push_str(&format!("shortcut_directory={shortcut_directory}\n"));
    contract.push_str(&format!("entrypoints={entrypoints_raw}\n"));
    contract.push_str(&format!("primary_entrypoint={primary_entrypoint}\n"));
    contract.push_str(&format!("staged_executable={}\n", staged_exe_text));
    contract.push_str(&format!("staged_payload_count={}\n", staged_payloads.len()));
    contract.push_str(&format!("upgrade_code={upgrade_code}\n"));
    contract.push_str(&format!("product_code={product_code}\n"));
    contract.push_str(&format!("side_by_side_policy={side_by_side_policy}\n"));
    contract.push_str(&format!("cross_scope_policy={cross_scope_policy}\n"));
    contract.push_str("upgrade_behavior=major_upgrade_replace_existing\n");
    contract.push_str("downgrade_policy=blocked\n");
    contract.push_str(&format!("uninstall_behavior={uninstall_behavior}\n"));
    contract.push_str(&format!("status={}\n", probe.status));
    contract.push_str(&format!(
        "tool_path={}\n",
        probe.path
            .as_ref()
            .map(|p| p.display().to_string())
            .unwrap_or_else(|| "<none>".to_string())
    ));
    contract.push_str(&format!(
        "tool_version={}\n",
        probe.version.as_deref().unwrap_or("<unknown>")
    ));
    fs::write(&contract_path, contract).map_err(|e| {
        format!(
            "Failed to write MSI backend contract '{}': {}",
            contract_path.display(),
            e
        )
    })?;

    let mut wxs = String::new();
    wxs.push_str("<!-- schema=pulsec.msi.template.stub.v1 -->\n");
    wxs.push_str(&format!("<!-- package_name={} -->\n", report.package_name));
    wxs.push_str(&format!("<!-- package_version={} -->\n", report.package_version));
    wxs.push_str(&format!("<!-- artifact_stamp={} -->\n", report.artifact_stamp));
    wxs.push_str(&format!("<!-- publisher={} -->\n", publisher));
    wxs.push_str(&format!("<!-- identifier={} -->\n", identifier));
    wxs.push_str(&format!("<!-- install_scope={} -->\n", install_scope));
    wxs.push_str(&format!("<!-- entrypoints={} -->\n", entrypoints_raw));
    wxs.push_str(&format!("<!-- primary_entrypoint={} -->\n", primary_entrypoint));
    wxs.push_str(&format!("<!-- staged_executable={} -->\n", staged_exe_text));
    wxs.push_str(&format!("<!-- staged_payload_count={} -->\n", staged_payloads.len()));
    wxs.push_str(&format!("<!-- product_code={} -->\n", product_code));
    wxs.push_str(&format!("<!-- side_by_side_policy={} -->\n", side_by_side_policy));
    wxs.push_str(&format!("<!-- cross_scope_policy={} -->\n", cross_scope_policy));
    wxs.push_str(&format!("<!-- uninstall_behavior={} -->\n", uninstall_behavior));
    wxs.push_str("<!-- backend=wix v6 -->\n");
    wxs.push_str("<Wix xmlns=\"http://wixtoolset.org/schemas/v4/wxs\">\n");
    wxs.push_str(&format!(
        "  <Package Name=\"{}\" Manufacturer=\"{}\" Version=\"{}\" UpgradeCode=\"{}\" Scope=\"{}\" InstallerVersion=\"500\">\n",
        xml_escape(&report.package_name),
        xml_escape(publisher),
        xml_escape(&report.package_version),
        upgrade_code,
        wix_scope
    ));
    wxs.push_str("    <SummaryInformation Description=\"PulseCode MSI template stub\" />\n");
    wxs.push_str("    <MajorUpgrade DowngradeErrorMessage=\"A newer version is already installed.\" />\n");
    wxs.push_str("    <MediaTemplate />\n");
    wxs.push_str("    <Feature Id=\"MainFeature\" Title=\"MainFeature\" Level=\"1\">\n");
    wxs.push_str("      <ComponentGroupRef Id=\"AppPayload\" />\n");
    wxs.push_str("    </Feature>\n");
    wxs.push_str("  </Package>\n");
    wxs.push_str("  <Fragment>\n");
    wxs.push_str(&format!(
        "    <StandardDirectory Id=\"{}\">\n",
        install_root
    ));
    wxs.push_str(&format!(
        "      <Directory Id=\"INSTALLFOLDER\" Name=\"{}\">\n",
        xml_escape(&report.package_name)
    ));
    emit_wix_directory_tree(&mut wxs, &staged_payloads, 8);
    wxs.push_str("      </Directory>\n");
    wxs.push_str("    </StandardDirectory>\n");
    wxs.push_str("  </Fragment>\n");
    wxs.push_str("  <Fragment>\n");
    wxs.push_str("    <ComponentGroup Id=\"AppPayload\" Directory=\"INSTALLFOLDER\">\n");
    wxs.push_str(&format!(
        "      <Component Id=\"MainExecutableComponent\" Guid=\"{}\">\n",
        main_component_guid
    ));
    wxs.push_str(&format!(
        "        <File Id=\"MainExecutable\" Source=\"{}\" />\n",
        xml_escape(&staged_exe_text)
    ));
    wxs.push_str(&format!(
        "        <RegistryValue Root=\"{}\" Key=\"{}\" Name=\"Installed\" Value=\"1\" Type=\"integer\" KeyPath=\"yes\" />\n",
        registry_root,
        xml_escape(&registry_key)
    ));
    wxs.push_str(&format!(
        "        <Shortcut Id=\"AppShortcut\" Name=\"{}\" Directory=\"{}\" Target=\"[INSTALLFOLDER]{}\" WorkingDirectory=\"INSTALLFOLDER\" />\n",
        xml_escape(&report.package_name),
        shortcut_directory,
        xml_escape(exe_name)
    ));
    wxs.push_str(&format!(
        "        <RemoveFile Id=\"RemoveOldVersionedExecutables\" Name=\"{}-*.exe\" On=\"install\" />\n",
        xml_escape(&report.package_name)
    ));
    wxs.push_str("        <RemoveFolder Id=\"RemoveInstallFolder\" Directory=\"INSTALLFOLDER\" On=\"uninstall\" />\n");
    wxs.push_str("      </Component>\n");
    for payload in staged_payloads
        .iter()
        .filter(|payload| payload.install_rel != PathBuf::from(exe_name))
    {
        let component_id = wix_id("PayloadComponent", &payload.install_rel);
        let file_id = wix_id("PayloadFile", &payload.install_rel);
        let registry_name = wix_id("PayloadInstalled", &payload.install_rel);
        let component_guid = deterministic_guid(&format!(
            "{identifier}|{install_scope}|payload|{}",
            payload.install_rel.display()
        ));
        let directory_id = payload
            .install_rel
            .parent()
            .filter(|parent| !parent.as_os_str().is_empty())
            .map(wix_directory_id)
            .unwrap_or_else(|| "INSTALLFOLDER".to_string());
        wxs.push_str(&format!(
            "      <Component Id=\"{}\" Directory=\"{}\" Guid=\"{}\">\n",
            component_id, directory_id, component_guid
        ));
        wxs.push_str(&format!(
            "        <File Id=\"{}\" Source=\"{}\" />\n",
            file_id,
            xml_escape(&normalize_windows_tool_path(&payload.source_path))
        ));
        if let Some(parent) = payload
            .install_rel
            .parent()
            .filter(|parent| !parent.as_os_str().is_empty())
        {
            wxs.push_str(&format!(
                "        <RemoveFolder Id=\"{}\" Directory=\"{}\" On=\"uninstall\" />\n",
                wix_id("RemoveFolder", parent),
                directory_id
            ));
        }
        wxs.push_str(&format!(
            "        <RegistryValue Root=\"{}\" Key=\"{}\" Name=\"{}\" Value=\"1\" Type=\"integer\" KeyPath=\"yes\" />\n",
            registry_root,
            xml_escape(&registry_key),
            registry_name
        ));
        wxs.push_str("      </Component>\n");
    }
    wxs.push_str("    </ComponentGroup>\n");
    wxs.push_str("  </Fragment>\n");
    wxs.push_str("</Wix>\n");
    fs::write(&template_path, wxs).map_err(|e| {
        format!(
            "Failed to write MSI template stub '{}': {}",
            template_path.display(),
            e
        )
    })?;

    Ok((contract_path, template_path))
}

#[derive(Debug, Clone)]
pub(super) struct StagedInstallerPayload {
    source_path: PathBuf,
    install_rel: PathBuf,
}

pub(super) fn collect_staged_installer_payloads(
    staging_dir: &Path,
    exe_name: &str,
) -> Result<Vec<StagedInstallerPayload>, String> {
    let mut payloads = Vec::new();
    let bin_dir = staging_dir.join("bin");
    if bin_dir.exists() {
        collect_staged_payloads_recursive(&bin_dir, &bin_dir, &mut payloads, false)?;
    }
    collect_staged_payloads_recursive(&bin_dir, &bin_dir, &mut payloads, true)?;
    let assets_dir = staging_dir.join("assets");
    if assets_dir.exists() {
        collect_staged_payloads_recursive(&assets_dir, &assets_dir, &mut payloads, false)?;
    }
    payloads.sort_by(|a, b| a.install_rel.cmp(&b.install_rel));
    payloads.dedup_by(|a, b| a.install_rel == b.install_rel);
    if !payloads
        .iter()
        .any(|payload| payload.install_rel == PathBuf::from(exe_name))
    {
        return Err(format!(
            "MSI packaging expected staged executable '{}' under '{}'",
            exe_name,
            bin_dir.display()
        ));
    }
    Ok(payloads)
}

pub(super) fn collect_staged_payloads_recursive(
    root: &Path,
    current: &Path,
    payloads: &mut Vec<StagedInstallerPayload>,
    libraries_mode: bool,
) -> Result<(), String> {
    for entry in fs::read_dir(current)
        .map_err(|e| format!("Failed to read staged MSI payload dir '{}': {}", current.display(), e))?
    {
        let entry = entry.map_err(|e| {
            format!(
                "Failed to inspect staged MSI payload entry under '{}': {}",
                current.display(),
                e
            )
        })?;
        let path = entry.path();
        if path.is_dir() {
            collect_staged_payloads_recursive(root, &path, payloads, libraries_mode)?;
            continue;
        }
    if libraries_mode {
            let ext = path
                .extension()
                .and_then(|ext| ext.to_str())
                .unwrap_or_default()
                .to_ascii_lowercase();
            if ext != "dll" && ext != "lib" {
                continue;
            }
        }
        let rel = path.strip_prefix(root).map_err(|e| {
            format!(
                "Failed to derive MSI payload relative path '{}': {}",
                path.display(),
                e
            )
        })?;
        let install_rel = rel.to_path_buf();
        payloads.push(StagedInstallerPayload {
            source_path: path,
            install_rel,
        });
    }
    Ok(())
}

pub(super) fn emit_wix_directory_tree(
    wxs: &mut String,
    payloads: &[StagedInstallerPayload],
    indent_level: usize,
) {
    let mut dirs = std::collections::BTreeSet::new();
    for payload in payloads {
        let mut current = payload.install_rel.parent().map(Path::to_path_buf);
        while let Some(dir) = current {
            if dir.as_os_str().is_empty() {
                break;
            }
            dirs.insert(dir.clone());
            current = dir.parent().map(Path::to_path_buf);
        }
    }
    emit_wix_directory_children(wxs, &dirs, None, indent_level);
}

pub(super) fn emit_wix_directory_children(
    wxs: &mut String,
    dirs: &std::collections::BTreeSet<PathBuf>,
    parent: Option<&Path>,
    indent_level: usize,
) {
    let parent_depth = parent.map(path_depth).unwrap_or(0);
    let children: Vec<PathBuf> = dirs
        .iter()
        .filter(|dir| {
            let dir_parent = dir.parent().filter(|p| !p.as_os_str().is_empty());
            dir_parent == parent && path_depth(dir) == parent_depth + 1
        })
        .cloned()
        .collect();
    for child in children {
        let child_name = child
            .file_name()
            .and_then(|name| name.to_str())
            .unwrap_or("payload");
        let child_id = wix_directory_id(&child);
        wxs.push_str(&format!(
            "{:indent$}<Directory Id=\"{}\" Name=\"{}\">\n",
            "",
            child_id,
            xml_escape(child_name),
            indent = indent_level
        ));
        emit_wix_directory_children(wxs, dirs, Some(&child), indent_level + 2);
        wxs.push_str(&format!("{:indent$}</Directory>\n", "", indent = indent_level));
    }
}

pub(super) fn path_depth(path: &Path) -> usize {
    path.components().count()
}

pub(super) fn wix_directory_id(path: &Path) -> String {
    wix_id("Dir", path)
}

pub(super) fn wix_id(prefix: &str, path: &Path) -> String {
    let raw = path
        .components()
        .map(|component| component.as_os_str().to_string_lossy())
        .collect::<Vec<_>>()
        .join("_");
    let mut out = String::with_capacity(prefix.len() + raw.len() + 1);
    out.push_str(prefix);
    out.push('_');
    for ch in raw.chars() {
        if ch.is_ascii_alphanumeric() {
            out.push(ch);
        } else {
            out.push('_');
        }
    }
    out
}

pub(super) fn xml_escape(raw: &str) -> String {
    raw.replace('&', "&amp;")
        .replace('<', "&lt;")
        .replace('>', "&gt;")
        .replace('"', "&quot;")
        .replace('\'', "&apos;")
}

pub(super) fn normalize_windows_tool_path(path: &Path) -> String {
    let raw = path.display().to_string();
    if let Some(stripped) = raw.strip_prefix(r"\\?\") {
        stripped.to_string()
    } else {
        raw
    }
}

pub(super) fn fnv1a64(bytes: &[u8]) -> u64 {
    let mut hash: u64 = 0xcbf29ce484222325;
    for b in bytes {
        hash ^= u64::from(*b);
        hash = hash.wrapping_mul(0x100000001b3);
    }
    hash
}

pub(super) fn deterministic_guid(seed: &str) -> String {
    let h1 = fnv1a64(seed.as_bytes());
    let h2 = fnv1a64(format!("{seed}|pulse|guid").as_bytes());
    let raw = format!("{h1:016x}{h2:016x}");
    format!(
        "{{{}-{}-{}-{}-{}}}",
        &raw[0..8],
        &raw[8..12],
        &raw[12..16],
        &raw[16..20],
        &raw[20..32]
    )
}

pub(super) fn deterministic_upgrade_code(identifier: &str, install_scope: &str) -> String {
    deterministic_guid(&format!("{identifier}|{install_scope}|upgrade"))
}

pub(super) fn deterministic_product_code(identifier: &str, version: &str, install_scope: &str) -> String {
    deterministic_guid(&format!("{identifier}|{version}|{install_scope}|product"))
}

pub(super) fn generate_msi_artifact(
    package_output_root: &Path,
    template_path: &Path,
    artifact_stamp: &str,
    probe: &WixToolProbe,
) -> Result<(PathBuf, PathBuf), String> {
    let Some(wix) = probe.path.as_ref() else {
        return Err("WiX tool is unavailable (set --wix <path> or [toolchain].wix)".to_string());
    };
    let msi_path = package_output_root.join(format!("{artifact_stamp}.msi"));
    let log_path = package_output_root.join("msi.build.log.txt");
    let template_arg = normalize_windows_tool_path(template_path);
    let output_arg = normalize_windows_tool_path(&msi_path);
    let output = process::Command::new(wix)
        .arg("build")
        .arg(&template_arg)
        .arg("-o")
        .arg(&output_arg)
        .output()
        .map_err(|e| format!("Failed to launch WiX '{}': {}", wix.display(), e))?;
    let mut log = String::new();
    log.push_str("schema=pulsec.msi.build.log.v1\n");
    log.push_str(&format!("tool={}\n", wix.display()));
    log.push_str(&format!("template={}\n", template_arg));
    log.push_str(&format!("output={}\n", output_arg));
    log.push_str(&format!("status={}\n", output.status));
    log.push_str("[stdout]\n");
    log.push_str(&String::from_utf8_lossy(&output.stdout));
    log.push_str("\n[stderr]\n");
    log.push_str(&String::from_utf8_lossy(&output.stderr));
    fs::write(&log_path, log)
        .map_err(|e| format!("Failed to write MSI build log '{}': {}", log_path.display(), e))?;

    if !output.status.success() {
        return Err(format!(
            "WiX build failed (status: {}). See '{}'",
            output.status,
            log_path.display()
        ));
    }
    if !msi_path.exists() {
        return Err(format!(
            "WiX reported success but MSI artifact is missing at '{}'",
            msi_path.display()
        ));
    }
    Ok((msi_path, log_path))
}

pub(super) fn print_package_summary(report: &PackageReport) {
    println!(
        "Package summary: mode={} status={} staging_dir={} artifact_stamp={}",
        report.mode,
        report.status,
        report.staging_dir.display(),
        report.artifact_stamp
    );
    println!("Package report: {}", report.report_path.display());
    if let Some(msi) = &report.msi_output {
        println!("MSI artifact: {}", msi.display());
    }
    println!(
        "Signing: status={} backend={} reason={}",
        report.signing_status, report.signing_backend, report.signing_reason
    );
}


