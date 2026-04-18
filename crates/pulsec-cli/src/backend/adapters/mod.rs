// RB-07 layer ownership: target-specific backend adapters live under this module.
use crate::backend::support::{BackendContract, PlanTargetAdapterMetadata};
use crate::backend::{NativeLinkPlan, SharedLinkArtifacts};
use crate::cli::target_model::{
    resolve_target_descriptor, PULSEOS_X64_TARGET_ID, WINDOWS_X64_TARGET_ID,
};
use pulsec_core::{IrMethod, IrProgram};
use std::path::{Path, PathBuf};

pub(crate) mod pulseos_x64;
pub(crate) mod windows_x64;

pub(crate) struct AdapterSplitArtifacts {
    pub(crate) startup_obj: PathBuf,
    pub(crate) link_inputs: Vec<PathBuf>,
    pub(crate) codegen: String,
    pub(crate) link_plan: NativeLinkPlan,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub(crate) struct TargetArtifactContract {
    pub(crate) schema: &'static str,
    pub(crate) target_id: &'static str,
    pub(crate) requested_output_mode: &'static str,
    pub(crate) contract_status: &'static str,
    pub(crate) implementation_status: &'static str,
    pub(crate) artifact_family: &'static str,
    pub(crate) requested_output_mode_status: &'static str,
    pub(crate) executable_artifact_kind: &'static str,
    pub(crate) runtime_packaging: &'static str,
    pub(crate) publication_shape: &'static str,
    pub(crate) companion_artifact_kinds: &'static [&'static str],
    pub(crate) naming_policy: &'static str,
    pub(crate) deferred_items: &'static [&'static str],
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub(crate) struct TargetStartupLoaderContract {
    pub(crate) schema: &'static str,
    pub(crate) target_id: &'static str,
    pub(crate) requested_output_mode: &'static str,
    pub(crate) contract_status: &'static str,
    pub(crate) implementation_status: &'static str,
    pub(crate) startup_entry_symbol: &'static str,
    pub(crate) startup_entry_abi: &'static str,
    pub(crate) loader_handoff_kind: &'static str,
    pub(crate) runtime_bootstrap_sequence: &'static [&'static str],
    pub(crate) loader_expectations: &'static [&'static str],
    pub(crate) publication_shape: &'static str,
    pub(crate) published_artifacts: &'static [&'static str],
    pub(crate) loader_manifest_schema: Option<&'static str>,
    pub(crate) loader_manifest_path: Option<&'static str>,
    pub(crate) runtime_companion_policy: &'static str,
    pub(crate) debug_metadata_policy: &'static str,
    pub(crate) deferred_items: &'static [&'static str],
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub(crate) struct TargetExecutableLoadingProofTarget {
    pub(crate) schema: &'static str,
    pub(crate) target_id: &'static str,
    pub(crate) requested_output_mode: &'static str,
    pub(crate) proof_status: &'static str,
    pub(crate) implementation_status: &'static str,
    pub(crate) validation_mode: &'static str,
    pub(crate) startup_loader_contract_schema: &'static str,
    pub(crate) artifact_contract_schema: &'static str,
    pub(crate) runtime_service_contract_schema: &'static str,
    pub(crate) required_published_artifacts: &'static [&'static str],
    pub(crate) required_startup_entry_symbol: &'static str,
    pub(crate) required_loader_manifest_schema: &'static str,
    pub(crate) required_loader_manifest_path: &'static str,
    pub(crate) required_loader_capabilities: &'static [&'static str],
    pub(crate) required_runtime_bootstrap_sequence: &'static [&'static str],
    pub(crate) success_conditions: &'static [&'static str],
    pub(crate) excluded_claims: &'static [&'static str],
}

pub(crate) trait TargetAdapter {
    fn backend_contract(&self) -> BackendContract;
    fn planned_link_plan(&self, ir: &IrProgram) -> NativeLinkPlan;
    fn runtime_service_imports(&self) -> &'static [&'static str];
    fn artifact_family(&self, output_mode: &str) -> &'static str;
    fn artifact_contract(&self, output_mode: &str) -> TargetArtifactContract;
    fn startup_loader_contract(&self, output_mode: &str) -> TargetStartupLoaderContract;
    fn runtime_abi_family(&self, output_mode: &str) -> &'static str;
    fn emit_split_program_objects(
        &self,
        ir: &IrProgram,
        out_dir: &Path,
        linker_override: Option<&Path>,
        emit_statement_trace_metadata: bool,
    ) -> Result<AdapterSplitArtifacts, String>;
    fn emit_full_program_object(
        &self,
        ir: &IrProgram,
        object_path: &Path,
        linker_override: Option<&Path>,
        emit_statement_trace_metadata: bool,
    ) -> Result<(String, Vec<PathBuf>), String>;
    fn emit_print_entry_object(
        &self,
        main_method: &IrMethod,
        object_path: &Path,
        linker_override: Option<&Path>,
    ) -> Result<(String, Vec<PathBuf>), String>;
    fn write_native_failure_report(
        &self,
        report_path: &Path,
        status: &str,
        detail: &str,
        attempts: &[String],
    ) -> Result<(), String>;
    fn link_executable(
        &self,
        object_path: &Path,
        out_dir: &Path,
        report_path: &Path,
        linker_override: Option<&Path>,
        entry_codegen: &str,
        extra_link_inputs: &[PathBuf],
    ) -> Result<Option<PathBuf>, String>;
    fn link_shared_artifacts(
        &self,
        link_plan: &NativeLinkPlan,
        out_dir: &Path,
        report_path: &Path,
        linker_override: Option<&Path>,
        entry_codegen: &str,
    ) -> Result<SharedLinkArtifacts, String>;
}

pub(crate) fn resolve_host_bootstrap_target_adapter(
    requested_target_id: &str,
) -> Result<&'static dyn TargetAdapter, String> {
    let _requested_target = resolve_target_descriptor(requested_target_id).ok_or_else(|| {
        format!(
            "Unsupported host-bootstrap target adapter '{}'",
            requested_target_id
        )
    })?;
    Ok(windows_x64::windows_x64_target_adapter())
}

pub(crate) fn resolve_active_backend_contract(
    requested_target_id: &str,
) -> Result<BackendContract, String> {
    Ok(resolve_host_bootstrap_target_adapter(requested_target_id)?.backend_contract())
}

pub(crate) fn resolve_planned_link_plan(
    requested_target_id: &str,
    ir: &IrProgram,
) -> Result<NativeLinkPlan, String> {
    Ok(resolve_host_bootstrap_target_adapter(requested_target_id)?.planned_link_plan(ir))
}

pub(crate) fn resolve_plan_target_adapter_metadata(
    requested_target_id: &str,
    output_mode: &str,
) -> Result<PlanTargetAdapterMetadata, String> {
    let requested_target = *resolve_target_descriptor(requested_target_id).ok_or_else(|| {
        format!(
            "Unsupported target adapter metadata request '{}'",
            requested_target_id
        )
    })?;
    let active_adapter = resolve_host_bootstrap_target_adapter(requested_target_id)?;
    let active_contract = active_adapter.backend_contract();
    let active_target = *active_contract.target_descriptor;
    let resolution = if requested_target.target_id == active_target.target_id {
        "selected-target-active-adapter"
    } else {
        "selected-target-not-yet-implemented-using-windows-host-bootstrap"
    };

    Ok(PlanTargetAdapterMetadata {
        requested_target,
        active_target,
        resolution,
        artifact_family: active_adapter.artifact_family(output_mode),
        artifact_status: active_target.adapter_status(),
        runtime_abi_family: active_adapter.runtime_abi_family(output_mode),
        runtime_abi_status: active_target.adapter_status(),
    })
}

pub(crate) fn resolve_requested_target_runtime_service_contract(
    requested_target_id: &str,
) -> Result<Option<&'static pulseos_x64::PulseOsRuntimeServiceContract>, String> {
    let requested_target = resolve_target_descriptor(requested_target_id).ok_or_else(|| {
        format!(
            "Unsupported requested target runtime-service contract '{}'",
            requested_target_id
        )
    })?;

    match requested_target.target_id {
        PULSEOS_X64_TARGET_ID => Ok(Some(pulseos_x64::pulseos_x64_runtime_service_contract())),
        _ => Ok(None),
    }
}

pub(crate) fn resolve_active_adapter_artifact_contract(
    requested_target_id: &str,
    output_mode: &str,
) -> Result<TargetArtifactContract, String> {
    Ok(resolve_host_bootstrap_target_adapter(requested_target_id)?.artifact_contract(output_mode))
}

pub(crate) fn resolve_requested_target_artifact_contract(
    requested_target_id: &str,
    output_mode: &str,
) -> Result<Option<TargetArtifactContract>, String> {
    let requested_target = resolve_target_descriptor(requested_target_id).ok_or_else(|| {
        format!(
            "Unsupported requested target artifact contract '{}'",
            requested_target_id
        )
    })?;

    match requested_target.target_id {
        WINDOWS_X64_TARGET_ID => Ok(Some(windows_x64::windows_x64_artifact_contract(
            output_mode,
        ))),
        PULSEOS_X64_TARGET_ID => Ok(Some(pulseos_x64::pulseos_x64_artifact_contract(
            output_mode,
        ))),
        _ => Ok(None),
    }
}

pub(crate) fn resolve_active_adapter_startup_loader_contract(
    requested_target_id: &str,
    output_mode: &str,
) -> Result<TargetStartupLoaderContract, String> {
    Ok(resolve_host_bootstrap_target_adapter(requested_target_id)?
        .startup_loader_contract(output_mode))
}

pub(crate) fn resolve_requested_target_startup_loader_contract(
    requested_target_id: &str,
    output_mode: &str,
) -> Result<Option<TargetStartupLoaderContract>, String> {
    let requested_target = resolve_target_descriptor(requested_target_id).ok_or_else(|| {
        format!(
            "Unsupported requested target startup/loader contract '{}'",
            requested_target_id
        )
    })?;

    match requested_target.target_id {
        WINDOWS_X64_TARGET_ID => Ok(Some(windows_x64::windows_x64_startup_loader_contract(
            output_mode,
        ))),
        PULSEOS_X64_TARGET_ID => Ok(Some(pulseos_x64::pulseos_x64_startup_loader_contract(
            output_mode,
        ))),
        _ => Ok(None),
    }
}

pub(crate) fn resolve_requested_target_executable_loading_proof_target(
    requested_target_id: &str,
    output_mode: &str,
) -> Result<Option<TargetExecutableLoadingProofTarget>, String> {
    let requested_target = resolve_target_descriptor(requested_target_id).ok_or_else(|| {
        format!(
            "Unsupported requested target executable-loading proof target '{}'",
            requested_target_id
        )
    })?;

    match requested_target.target_id {
        PULSEOS_X64_TARGET_ID => Ok(Some(
            pulseos_x64::pulseos_x64_executable_loading_proof_target(output_mode),
        )),
        _ => Ok(None),
    }
}
