use super::*;

pub(crate) fn discover_ml64(linker_override: Option<&Path>) -> Option<PathBuf> {
    let mut candidates = Vec::new();
    if let Some(linker) = linker_override {
        if let Some(parent) = linker.parent() {
            candidates.push(parent.join("ml64.exe"));
        }
    }
    if let Ok(linker_env) = env::var("PULSEC_LINKER") {
        let path = PathBuf::from(linker_env);
        if let Some(parent) = path.parent() {
            candidates.push(parent.join("ml64.exe"));
        }
    }
    for linker in discover_visual_studio_linkers() {
        if let Some(parent) = linker.parent() {
            candidates.push(parent.join("ml64.exe"));
        }
    }
    candidates.push(PathBuf::from("ml64.exe"));
    candidates.into_iter().find(|p| p.exists())
}

pub(crate) fn discover_kernel32_lib() -> Option<PathBuf> {
    let kits_root = Path::new(r"C:\Program Files (x86)\Windows Kits\10\Lib");
    if !kits_root.exists() {
        return None;
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
        let candidate = version.join("um").join("x64").join("kernel32.lib");
        if candidate.exists() {
            return Some(candidate);
        }
    }
    None
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
    let entry = "mainCRTStartup";
    let mut attempts = Vec::new();

    for linker in linker_candidates(linker_override) {
        let linker_display = linker.display().to_string();
        let args = vec![
            "/NOLOGO".to_string(),
            "/MACHINE:X64".to_string(),
            format!("/ENTRY:{entry}"),
            "/SUBSYSTEM:CONSOLE".to_string(),
            "/NODEFAULTLIB".to_string(),
            "/LARGEADDRESSAWARE:NO".to_string(),
            format!("/OUT:{}", windows_cmd_path(&exe_path)),
        ];
        let mut args = args;
        args.push(windows_cmd_path(object_path));
        for input in extra_link_inputs {
            args.push(windows_cmd_path(input));
        }

        let mut retry = 0usize;
        let max_retries = 3usize;
        loop {
            match Command::new(&linker).args(&args).output() {
                Ok(output) => {
                    if output.status.success() {
                        let report = format!(
                            "status=linked\nlinker={}\nentry_codegen={}\nexe={}\n",
                            linker_display,
                            entry_codegen,
                            exe_path.display()
                        );
                        fs::write(report_path, report).map_err(|e| {
                            format!("Failed to write link report '{}': {}", report_path.display(), e)
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
            let normalized = path.to_string_lossy().replace('\\', "/").to_ascii_lowercase();
            normalized.contains("/obj/com/pulse/")
        })
        .cloned()
        .collect::<Vec<_>>();

    for linker in linker_candidates(linker_override) {
        let linker_display = linker.display().to_string();

        let mut dll_args = vec![
            "/NOLOGO".to_string(),
            "/MACHINE:X64".to_string(),
            "/DLL".to_string(),
            "/NOENTRY".to_string(),
            "/NODEFAULTLIB".to_string(),
            "/LARGEADDRESSAWARE:NO".to_string(),
            format!("/OUT:{}", windows_cmd_path(&runtime_library_path)),
            format!("/IMPLIB:{}", windows_cmd_path(&runtime_import_library_path)),
        ];
        let exported_symbols = shared_runtime_export_symbols();
        for export in &exported_symbols {
            dll_args.push(format!("/EXPORT:{}", export));
        }
        for object in &link_plan.runtime_owned_objects {
            dll_args.push(windows_cmd_path(object));
        }
        for object in &supplemental_runtime_objects {
            dll_args.push(windows_cmd_path(object));
        }
        for input in &link_plan.system_inputs {
            dll_args.push(windows_cmd_path(input));
        }

        match Command::new(&linker).args(&dll_args).output() {
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

        let mut exe_args = vec![
            "/NOLOGO".to_string(),
            "/MACHINE:X64".to_string(),
            "/ENTRY:mainCRTStartup".to_string(),
            "/SUBSYSTEM:CONSOLE".to_string(),
            "/NODEFAULTLIB".to_string(),
            "/LARGEADDRESSAWARE:NO".to_string(),
            format!("/OUT:{}", windows_cmd_path(&exe_path)),
        ];
        for object in &link_plan.startup_objects {
            exe_args.push(windows_cmd_path(object));
        }
        for object in &link_plan.app_owned_objects {
            let normalized = object
                .to_string_lossy()
                .replace('\\', "/")
                .to_ascii_lowercase();
            if normalized.contains("/obj/com/pulse/") {
                continue;
            }
            exe_args.push(windows_cmd_path(object));
        }
        exe_args.push(windows_cmd_path(&runtime_import_library_path));
        for input in &link_plan.system_inputs {
            exe_args.push(windows_cmd_path(input));
        }

        match Command::new(&linker).args(&exe_args).output() {
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
                        "startup_bootstrap=mainCRTStartup->pulsec_rt_init->app_entry->pulsec_rt_shutdown->ExitProcess\n",
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
                    format!("Failed to write link report '{}': {}", report_path.display(), e)
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
    if let Some(path) = linker_override {
        return vec![path.to_path_buf()];
    }
    if let Ok(override_path) = env::var("PULSEC_LINKER") {
        let trimmed = override_path.trim();
        if !trimmed.is_empty() {
            return vec![PathBuf::from(trimmed)];
        }
    }
    let mut candidates = Vec::new();
    candidates.push(PathBuf::from("link.exe"));
    candidates.push(PathBuf::from("lld-link.exe"));
    candidates.extend(discover_visual_studio_linkers());

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

fn discover_visual_studio_linkers() -> Vec<PathBuf> {
    let root = Path::new(r"C:\Program Files\Microsoft Visual Studio");
    if !root.exists() {
        return Vec::new();
    }

    let mut found = Vec::new();
    let Ok(version_dirs) = fs::read_dir(root) else {
        return Vec::new();
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
            let msvc_root = edition_path.join("VC").join("Tools").join("MSVC");
            let Ok(msvc_versions) = fs::read_dir(&msvc_root) else {
                continue;
            };
            for toolset_entry in msvc_versions.flatten() {
                let link_path = toolset_entry
                    .path()
                    .join("bin")
                    .join("Hostx64")
                    .join("x64")
                    .join("link.exe");
                if link_path.exists() {
                    found.push(link_path);
                }
            }
        }
    }

    found.sort();
    found.reverse();
    found
}
