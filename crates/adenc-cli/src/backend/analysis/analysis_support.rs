use super::*;
use crate::backend::adapters::resolve_host_bootstrap_target_adapter;
use crate::backend::target_neutral::render_native_build_plan_with_output_mode_and_link_plan;

pub(crate) struct FrameBudgetReport {
    pub(crate) max_frame_bytes: usize,
    pub(crate) max_frame_method: String,
    pub(crate) warn_violations: Vec<(String, usize)>,
    pub(crate) fail_violations: Vec<(String, usize)>,
}

#[derive(Debug, Default, Clone)]
pub struct RustHostBootstrapBackend {
    pub linker_override: Option<PathBuf>,
    pub target_id: String,
    pub output_mode: String,
    pub output_entry: String,
    pub emit_statement_trace_metadata: bool,
}

impl BackendAdapter for RustHostBootstrapBackend {
    fn emit(&self, ir: &IrProgram, out_dir: &Path) -> Result<BackendArtifact, String> {
        enforce_frame_budget_lints(ir)?;
        fs::create_dir_all(out_dir).map_err(|e| {
            format!(
                "Failed to create build output '{}': {}",
                out_dir.display(),
                e
            )
        })?;
        let ir_path = out_dir.join("adenc.ir.txt");
        fs::write(&ir_path, render_ir_dump(ir))
            .map_err(|e| format!("Failed to write IR artifact '{}': {}", ir_path.display(), e))?;
        let plan_path = out_dir.join("native.plan.json");
        let output_mode = if self.output_mode.is_empty() {
            "fat"
        } else {
            self.output_mode.as_str()
        };
        let output_entry = if self.output_entry.is_empty() {
            "main"
        } else {
            self.output_entry.as_str()
        };
        let adapter = resolve_host_bootstrap_target_adapter(&self.target_id)?;
        let mut object_path = out_dir.join("main.obj");
        let link_report_path = out_dir.join("native.link.txt");
        let mut link_plan = NativeLinkPlan::default();
        let mut split_failure_detail: Option<String> = None;
        let (entry_codegen, extra_link_inputs) = match adapter.emit_split_program_objects(
            ir,
            out_dir,
            self.linker_override.as_deref(),
            self.emit_statement_trace_metadata,
        ) {
            Ok(split) => {
                object_path = split.startup_obj;
                link_plan = split.link_plan;
                (split.codegen, split.link_inputs)
            }
            Err(split_err) => match adapter.emit_full_program_object(
                ir,
                &object_path,
                self.linker_override.as_deref(),
                self.emit_statement_trace_metadata,
            ) {
                Ok((codegen, libs)) => {
                    split_failure_detail = Some(split_err.clone());
                    (format!("{} (split failed: {})", codegen, split_err), libs)
                }
                Err(full_masm_err) => {
                    if let Some(main_method) = find_entry_method(ir) {
                        match adapter.emit_print_entry_object(
                            main_method,
                            &object_path,
                            self.linker_override.as_deref(),
                        ) {
                            Ok((codegen, libs)) => (
                                format!(
                                    "{} (split failed: {}, full-masm failed: {})",
                                    codegen, split_err, full_masm_err
                                ),
                                libs,
                            ),
                            Err(masm_err) => {
                                let compile_err = compile_method_text(main_method)
                                    .err()
                                    .unwrap_or_else(|| "no IR fallback available".to_string());
                                let detail = format!(
                                    "backend codegen failed: ir={} | masm={} | full-masm={} | split={}",
                                    compile_err, masm_err, full_masm_err, split_err
                                );
                                adapter.write_native_failure_report(
                                    &link_report_path,
                                    "backend-failed",
                                    &detail,
                                    &[],
                                )?;
                                return Err(detail);
                            }
                        }
                    } else {
                        let detail = format!(
                            "backend codegen failed: no static main method found in IR | full-masm: {} | split: {}",
                            full_masm_err, split_err
                        );
                        adapter.write_native_failure_report(
                            &link_report_path,
                            "backend-failed",
                            &detail,
                            &[],
                        )?;
                        return Err(detail);
                    }
                }
            },
        };
        if link_plan.startup_objects.is_empty()
            && link_plan.app_owned_objects.is_empty()
            && link_plan.runtime_owned_objects.is_empty()
        {
            link_plan.app_owned_objects.push(object_path.clone());
            link_plan.system_inputs = extra_link_inputs.clone();
        }
        fs::write(
            &plan_path,
            render_native_build_plan_with_output_mode_and_link_plan(
                ir,
                &ir_path,
                &self.target_id,
                output_mode,
                output_entry,
                Some(&link_plan),
            ),
        )
        .map_err(|e| {
            format!(
                "Failed to write native plan '{}': {}",
                plan_path.display(),
                e
            )
        })?;
        let (exe_path, runtime_library_path, runtime_import_library_path) = if output_mode
            == "shared"
        {
            if link_plan.startup_objects.is_empty()
                || link_plan.app_owned_objects.is_empty()
                || link_plan.runtime_owned_objects.is_empty()
            {
                if let Some(split_err) = &split_failure_detail {
                    let detail = format!(
                        "shared output mode requires split runtime/app object emission (split failed: {})",
                        split_err
                    );
                    adapter.write_native_failure_report(
                        &link_report_path,
                        "not-linked",
                        &detail,
                        &[],
                    )?;
                    return Err(detail);
                }
                let detail =
                    "shared output mode requires split runtime/app object emission".to_string();
                adapter.write_native_failure_report(
                    &link_report_path,
                    "not-linked",
                    &detail,
                    &[],
                )?;
                return Err(detail);
            }
            let shared = adapter.link_shared_artifacts(
                &link_plan,
                out_dir,
                &link_report_path,
                self.linker_override.as_deref(),
                &entry_codegen,
            )?;
            (
                shared.exe_path,
                Some(shared.runtime_library_path),
                Some(shared.runtime_import_library_path),
            )
        } else {
            let exe_path = adapter.link_executable(
                &object_path,
                out_dir,
                &link_report_path,
                self.linker_override.as_deref(),
                &entry_codegen,
                &extra_link_inputs,
            )?;
            (exe_path, None, None)
        };

        Ok(BackendArtifact {
            classes: ir.classes.len(),
            methods: ir.classes.iter().map(|c| c.methods.len()).sum(),
            fields: ir.classes.iter().map(|c| c.fields.len()).sum(),
            ir_artifact_path: ir_path,
            native_plan_path: plan_path,
            object_path,
            exe_path,
            runtime_library_path,
            runtime_import_library_path,
            link_report_path,
            entry_codegen,
            link_plan,
        })
    }
}

pub(crate) fn render_ir_dump(ir: &IrProgram) -> String {
    let mut out = String::new();
    out.push_str("# Aden Lang IR Dump\n");
    for class in &ir.classes {
        out.push_str(&format!("class {}.{}\n", class.package_name, class.name));
        for field in &class.fields {
            out.push_str(&format!(
                "  field {} {}{}\n",
                field.ty,
                if field.is_static { "static " } else { "" },
                field.name
            ));
        }
        for method in &class.methods {
            out.push_str(&format!(
                "  method {} {}({}) blocks={} values={}\n",
                method
                    .return_type
                    .clone()
                    .unwrap_or_else(|| "ctor".to_string()),
                method.name,
                method
                    .params
                    .iter()
                    .map(|p| format!("{} {}", p.ty, p.name))
                    .collect::<Vec<_>>()
                    .join(", "),
                method.blocks.len(),
                method.values.len()
            ));
        }
    }
    out
}

pub(crate) fn collect_frame_budget_report(ir: &IrProgram) -> FrameBudgetReport {
    let mut max_frame_bytes = 0usize;
    let mut max_frame_method = "<none>".to_string();
    let mut warn_violations = Vec::new();
    let mut fail_violations = Vec::new();
    for class in &ir.classes {
        for method in &class.methods {
            let frame = masm_method_stack_size(method);
            let fq = format!("{}.{}.{}", class.package_name, class.name, method.name);
            if frame > max_frame_bytes {
                max_frame_bytes = frame;
                max_frame_method = fq.clone();
            }
            if frame > FRAME_BUDGET_WARN_BYTES {
                warn_violations.push((fq.clone(), frame));
            }
            if frame > FRAME_BUDGET_FAIL_BYTES {
                fail_violations.push((fq, frame));
            }
        }
    }
    warn_violations.sort_by(|a, b| b.1.cmp(&a.1).then_with(|| a.0.cmp(&b.0)));
    fail_violations.sort_by(|a, b| b.1.cmp(&a.1).then_with(|| a.0.cmp(&b.0)));
    FrameBudgetReport {
        max_frame_bytes,
        max_frame_method,
        warn_violations,
        fail_violations,
    }
}

pub(crate) fn enforce_frame_budget_lints(ir: &IrProgram) -> Result<(), String> {
    let report = collect_frame_budget_report(ir);
    if report.fail_violations.is_empty() {
        return Ok(());
    }
    let top = report
        .fail_violations
        .iter()
        .take(4)
        .map(|(m, b)| format!("{}={}B", m, b))
        .collect::<Vec<_>>()
        .join(", ");
    Err(format!(
        "Frame budget exceeded (fail={}B, warn={}B). offenders: {}",
        FRAME_BUDGET_FAIL_BYTES, FRAME_BUDGET_WARN_BYTES, top
    ))
}
