use super::*;

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
    pub(super) packaging_mode: Option<String>,
    pub(super) output_mode: Option<String>,
    pub(super) runtime_debug_allocator: Option<String>,
    pub(super) runtime_cycle_collector: Option<String>,
    pub(super) out_dir: Option<String>,
    pub(super) msi: bool,
    pub(super) staging_dir: Option<String>,
    pub(super) assembler: Option<String>,
    pub(super) linker: Option<String>,
    pub(super) wix: Option<String>,
    pub(super) signtool: Option<String>,
}

pub(super) fn execute_build_pipeline(resolved: &BuildInvocation, flags: &CliFlags) -> Result<BuildRun, String> {
    let result = check_project(&resolved.entry_path, resolved.source_root.as_deref(), true)?;
    let ir = lower_checked_project_to_ir(&result)
        .map_err(|e| format!("IR lowering failed: {e}"))?;
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
    let backend = NoopNativeBackend {
        linker_override: flags
            .linker
            .as_ref()
            .or(resolved.linker.as_ref())
            .map(PathBuf::from),
        output_mode: resolved.output_mode.clone(),
        output_entry: resolved.output_entry.clone(),
    };
    let artifact = backend
        .emit(&ir, &backend_out_dir)
        .map_err(|e| format!("backend emit failed: {e}"))?;
    materialize_build_layout(resolved, &artifact, &backend_out_dir)?;
    let publish_debug_diagnostics = publish_profile_layout && resolved.profile == "debug";
    let published_artifact = publish_build_artifacts(
        resolved,
        &artifact,
        &backend_out_dir,
        publish_profile_layout,
        publish_debug_diagnostics,
    )?;
    let build_config_plan_path =
        emit_resolved_build_config_plan(
            resolved,
            &published_artifact,
            flags,
            publish_profile_layout,
            publish_debug_diagnostics,
        )?;
    materialize_stamped_build_artifacts(
        resolved,
        &published_artifact,
        &build_config_plan_path,
        publish_profile_layout,
        publish_debug_diagnostics,
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
        files_loaded: result.files_loaded,
        artifact: published_artifact,
        build_config_plan_path,
    })
}

pub(super) fn publish_build_artifacts(
    resolved: &BuildInvocation,
    artifact: &BackendArtifact,
    backend_out_dir: &Path,
    publish_profile_layout: bool,
    publish_debug_diagnostics: bool,
) -> Result<BackendArtifact, String> {
    if !publish_profile_layout {
        return Ok(artifact.clone());
    }

    let artifact_base_name = build_artifact_base_name(resolved);
    let shared_profile_layout = resolved.output_mode == "shared";
    let profile_bin_dir = if shared_profile_layout {
        let dir = resolved.build_root.join("bin");
        fs::create_dir_all(&dir)
            .map_err(|e| format!("Failed to create shared bin dir '{}': {}", dir.display(), e))?;
        Some(dir)
    } else {
        None
    };
    let profile_metadata_dir = if shared_profile_layout && publish_debug_diagnostics {
        let dir = resolved.build_root.join("metadata");
        fs::create_dir_all(&dir).map_err(|e| {
            format!(
                "Failed to create shared metadata dir '{}': {}",
                dir.display(),
                e
            )
        })?;
        Some(dir)
    } else {
        None
    };
    let (ir_target, native_plan_target, link_report_target) = if publish_debug_diagnostics {
        let debug_target_root = profile_metadata_dir.as_ref().unwrap_or(&resolved.build_root);
        let ir_target = debug_target_root.join(format!("{artifact_base_name}-pulsec.ir.txt"));
        let native_plan_target =
            debug_target_root.join(format!("{artifact_base_name}-native.plan.json"));
        let link_report_target =
            debug_target_root.join(format!("{artifact_base_name}-native.link.txt"));
        copy_file_into(&artifact.ir_artifact_path, &ir_target)?;
        copy_file_into(&artifact.native_plan_path, &native_plan_target)?;
        copy_file_into(&artifact.link_report_path, &link_report_target)?;
        (ir_target, native_plan_target, link_report_target)
    } else {
        (
            artifact.ir_artifact_path.clone(),
            artifact.native_plan_path.clone(),
            artifact.link_report_path.clone(),
        )
    };

    let object_path = published_object_path(resolved, artifact, backend_out_dir);

    let exe_path = if let Some(exe) = &artifact.exe_path {
        let published_exe = profile_bin_dir
            .as_ref()
            .unwrap_or(&resolved.build_root)
            .join(format!("{artifact_base_name}.exe"));
        copy_file_into(exe, &published_exe)?;
        Some(published_exe)
    } else {
        None
    };
    let runtime_library_path = if let Some(runtime_library) = &artifact.runtime_library_path {
        let published_runtime_library = profile_bin_dir
            .as_ref()
            .unwrap_or(&resolved.build_root)
            .join(
                runtime_library
                    .file_name()
                    .unwrap_or_else(|| std::ffi::OsStr::new("pulsecore.dll")),
            );
        copy_file_into(runtime_library, &published_runtime_library)?;
        Some(published_runtime_library)
    } else {
        None
    };
    let runtime_import_library_path =
        if let Some(runtime_import_library) = &artifact.runtime_import_library_path {
            let published_runtime_import_library = profile_bin_dir
                .as_ref()
                .unwrap_or(&resolved.build_root)
                .join(
                    runtime_import_library
                        .file_name()
                        .unwrap_or_else(|| std::ffi::OsStr::new("pulsecore.lib")),
                );
            copy_file_into(runtime_import_library, &published_runtime_import_library)?;
            Some(published_runtime_import_library)
        } else {
            None
        };
    if resolved.build_assets_dir.exists() {
        copy_dir_recursive(
            &resolved.build_assets_dir,
            profile_bin_dir.as_ref().unwrap_or(&resolved.build_root),
        )?;
    }
    if shared_profile_layout {
        if let (Some(exe), Some(runtime_library), Some(runtime_import_library), Some(bin_dir)) = (
            exe_path.as_ref(),
            runtime_library_path.as_ref(),
            runtime_import_library_path.as_ref(),
            profile_bin_dir.as_ref(),
        ) {
            let (_, _, artifact_stamp) = build_artifact_identity(resolved);
            write_shared_runtime_lookup_metadata(
                &bin_dir.join("launch.txt"),
                &resolved.profile,
                &artifact_stamp,
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
        ir_artifact_path: ir_target,
        native_plan_path: native_plan_target,
        object_path,
        exe_path,
        runtime_library_path,
        runtime_import_library_path,
        link_report_path: link_report_target,
        entry_codegen: artifact.entry_codegen.clone(),
        link_plan: artifact.link_plan.clone(),
    })
}

pub(super) fn published_object_path(
    resolved: &BuildInvocation,
    artifact: &BackendArtifact,
    backend_out_dir: &Path,
) -> PathBuf {
    if let Ok(rel) = artifact.object_path.strip_prefix(backend_out_dir.join("obj")) {
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

pub(super) fn write_shared_runtime_lookup_metadata(
    descriptor_path: &Path,
    profile: &str,
    artifact_stamp: &str,
    exe: &Path,
    runtime_library: &Path,
    runtime_import_library: &Path,
    runtime_relative_dir: &str,
) -> Result<(), String> {
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
        "pulsec_rt_intToString",
        "pulsec_rt_booleanToString",
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
    launch_text.push_str(&format!("required_runtime_imports={required_runtime_imports}\n"));
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
    _artifact: &BackendArtifact,
    _build_config_plan_path: &Path,
    publish_profile_layout: bool,
    publish_debug_diagnostics: bool,
) -> Result<(), String> {
    if publish_profile_layout && !publish_debug_diagnostics {
        return Ok(());
    }
    let (package_name, package_version, stamp) = build_artifact_identity(resolved);
    let stamp_file_name = if publish_profile_layout {
        "stamp.txt"
    } else {
        "artifact.stamp.txt"
    };

    let mut stamp_text = String::new();
    stamp_text.push_str("schema=pulsec.artifact.stamp.v1\n");
    stamp_text.push_str(&format!("name={package_name}\n"));
    stamp_text.push_str(&format!("version={package_version}\n"));
    stamp_text.push_str(&format!("profile={}\n", resolved.profile));
    stamp_text.push_str(&format!("stamp={stamp}\n"));
    let stamp_path = if publish_profile_layout && resolved.output_mode == "shared" {
        resolved.build_root.join("metadata").join(stamp_file_name)
    } else {
        resolved.build_root.join(stamp_file_name)
    };
    if let Some(parent) = stamp_path.parent() {
        fs::create_dir_all(parent).map_err(|e| {
            format!(
                "Failed to create artifact stamp directory '{}': {}",
                parent.display(),
                e
            )
        })?;
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
    flags: &CliFlags,
    publish_profile_layout: bool,
    publish_debug_diagnostics: bool,
) -> Result<PathBuf, String> {
    let plan_path = if publish_profile_layout && publish_debug_diagnostics {
        let debug_root = if resolved.output_mode == "shared" {
            resolved.build_root.join("metadata")
        } else {
            resolved.build_root.clone()
        };
        debug_root.join(format!("{}-build.config.plan.json", build_artifact_base_name(resolved)))
    } else if publish_profile_layout {
        resolved
            .build_tmp_dir
            .join(format!("{}-build.config.plan.json", build_artifact_base_name(resolved)))
    } else {
        resolved.build_root.join("build.config.plan.json")
    };
    let mut out = String::new();
    out.push_str("{\n");
    out.push_str("  \"schema\": \"pulsec.build.config.v1\",\n");
    out.push_str(&format!("  \"profile\": \"{}\",\n", resolved.profile));
    out.push_str(&format!("  \"target\": \"{}\",\n", resolved.target));
    out.push_str(&format!(
        "  \"packaging_mode\": \"{}\",\n",
        resolved.packaging_mode
    ));
    out.push_str(&format!(
        "  \"output\": {{ \"mode\": \"{}\", \"entry\": \"{}\" }},\n",
        resolved.output_mode, resolved.output_entry
    ));
    out.push_str(&format!(
        "  \"runtime\": {{ \"debug_allocator\": \"{}\", \"cycle_collector\": \"{}\" }},\n",
        resolved.runtime_debug_allocator, resolved.runtime_cycle_collector
    ));
    out.push_str(&format!(
        "  \"toolchain\": {{ \"linker\": \"{}\", \"assembler\": \"{}\", \"wix\": \"{}\", \"signtool\": \"{}\" }},\n",
        flags
            .linker
            .as_ref()
            .or(resolved.linker.as_ref())
            .map(|s| s.as_str())
            .unwrap_or(""),
        flags
            .assembler
            .as_ref()
            .or(resolved.assembler.as_ref())
            .map(|s| s.as_str())
            .unwrap_or(""),
        flags
            .wix
            .as_ref()
            .or(resolved.wix.as_ref())
            .map(|s| s.as_str())
            .unwrap_or(""),
        flags
            .signtool
            .as_ref()
            .or(resolved.signtool.as_ref())
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
        resolved.build_root.display()
    ));
    out.push_str(&format!(
        "  \"artifacts\": {{ \"native_plan\": \"{}\", \"ir\": \"{}\", \"object\": \"{}\" }}\n",
        artifact.native_plan_path.display(),
        artifact.ir_artifact_path.display(),
        artifact.object_path.display()
    ));
    out.push_str("}\n");
    fs::write(&plan_path, out)
        .map_err(|e| format!("Failed to write build config plan '{}': {}", plan_path.display(), e))?;
    Ok(plan_path)
}

pub(super) fn materialize_build_layout(
    resolved: &BuildInvocation,
    artifact: &BackendArtifact,
    backend_out_dir: &Path,
) -> Result<(), String> {
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
        copy_dir_recursive_filtered(
            &emitted_obj_dir,
            &resolved.build_asm_dir,
            &|path| path.extension().and_then(|e| e.to_str()) == Some("asm"),
        )?;
        copy_dir_recursive_filtered(
            &emitted_obj_dir,
            &resolved.build_generated_dir,
            &|path| path.extension().and_then(|e| e.to_str()) == Some("obj"),
        )?;
    }
    let sibling_asm = artifact.object_path.with_extension("asm");
    if sibling_asm.exists() {
        let asm_target = resolved.build_asm_dir.join(
            sibling_asm
                .file_name()
                .unwrap_or_else(|| std::ffi::OsStr::new("main.asm")),
        );
        fs::copy(&sibling_asm, &asm_target).map_err(|e| {
            format!(
                "Failed to copy asm artifact '{}' -> '{}': {}",
                sibling_asm.display(),
                asm_target.display(),
                e
            )
        })?;
    }
    if artifact.object_path.exists() {
        let obj_target = published_object_path(resolved, artifact, backend_out_dir);
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
    fs::create_dir_all(dst)
        .map_err(|e| format!("Failed to create directory '{}': {}", dst.display(), e))?;
    let entries = fs::read_dir(src)
        .map_err(|e| format!("Failed to read directory '{}': {}", src.display(), e))?;
    for entry in entries {
        let entry = entry
            .map_err(|e| format!("Failed to read directory entry in '{}': {}", src.display(), e))?;
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
        let entry = entry
            .map_err(|e| format!("Failed to read directory entry in '{}': {}", src.display(), e))?;
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

pub(super) fn print_build_summary(build: &BuildRun) {
    let (_, _, artifact_stamp) = build_artifact_identity(&build.resolved);
    println!(
        "Build IR ready: classes={} methods={} fields={} files={}",
        build.artifact.classes, build.artifact.methods, build.artifact.fields, build.files_loaded
    );
    println!(
        "Build mode: profile={} target={} packaging_mode={} output_mode={} output_entry={} runtime_debug_allocator={} runtime_cycle_collector={} project_mode={} source_root={} output_dir={}",
        build.resolved.profile,
        build.resolved.target,
        build.resolved.packaging_mode,
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
        build.resolved.build_root.display()
    );
    println!("IR artifact: {}", build.artifact.ir_artifact_path.display());
    println!("Native plan: {}", build.artifact.native_plan_path.display());
    println!("Object scaffold: {}", build.artifact.object_path.display());
    println!("Link report: {}", build.artifact.link_report_path.display());
    println!("Build config plan: {}", build.build_config_plan_path.display());
    println!("Artifact stamp: {}", artifact_stamp);
    println!("Entry codegen: {}", build.artifact.entry_codegen);
    if let Some(exe) = &build.artifact.exe_path {
        println!("Executable: {}", exe.display());
    } else {
        println!("Executable: not produced (no linker available or link failed)");
    }
    println!("Native backend spike (Phase B) is complete; next is runtime hardening in Phase C.");
}


