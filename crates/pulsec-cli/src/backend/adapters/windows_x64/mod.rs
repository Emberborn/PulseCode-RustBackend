// RB-07 layer ownership: the current Windows x64 adapter owns MASM/COFF emission,
// toolchain discovery/linking, and Windows bootstrap artifact/runtime/startup metadata.
// RB-08 turns this into the first explicit adapter seam used by host bootstrap and plan resolution.
// RB-09 scope: this adapter preserves the current Windows x64 host/bootstrap lane and
// immediate target path. It does not own Windows installer/signing/productization policy.
use super::{
    AdapterSplitArtifacts, TargetAdapter, TargetArtifactContract, TargetStartupLoaderContract,
};
use crate::backend::emission::{
    emit_masm_full_program_object, emit_masm_print_entry_object, emit_masm_split_program_objects,
};
use crate::backend::support::{
    package_to_path, try_link_windows_executable, try_link_windows_shared_artifacts,
    windows_x64_backend_contract, write_native_failure_report, BackendContract,
};
use crate::backend::{NativeLinkPlan, SharedLinkArtifacts};
use pulsec_core::{IrMethod, IrProgram};
use std::path::{Path, PathBuf};

pub(crate) struct WindowsX64TargetAdapter;

static WINDOWS_X64_TARGET_ADAPTER: WindowsX64TargetAdapter = WindowsX64TargetAdapter;
static WINDOWS_X64_RUNTIME_SERVICE_IMPORTS: &[&str] = &[
    "GetStdHandle",
    "WriteFile",
    "ExitProcess",
    "GetProcessHeap",
    "HeapAlloc",
    "HeapFree",
    "GetSystemTimeAsFileTime",
    "LoadLibraryA",
    "GetModuleHandleA",
    "FreeLibrary",
    "GetProcAddress",
    "CreateProcessA",
    "WaitForSingleObject",
    "GetExitCodeProcess",
    "Sleep",
    "SwitchToThread",
    "GetCurrentThreadId",
    "CreateThread",
    "CreateMutexA",
    "ReleaseMutex",
    "CreateEventA",
    "SetEvent",
    "ResetEvent",
    "CloseHandle",
    "CreateSemaphoreA",
    "ReleaseSemaphore",
];
static WINDOWS_X64_SHARED_COMPANION_ARTIFACT_KINDS: &[&str] = &[
    "runtime_library",
    "runtime_import_library",
    "runtime_lookup_metadata",
];
static WINDOWS_X64_FAT_PUBLISHED_ARTIFACTS: &[&str] = &["<entry>.exe"];
static WINDOWS_X64_SHARED_PUBLISHED_ARTIFACTS: &[&str] = &[
    "bin/<entry>.exe",
    "lib/pulsecore-<pulsec-semver>.dll",
    "lib/pulsecore-<pulsec-semver>.lib",
    "bin/launch.txt",
];
static WINDOWS_X64_NO_COMPANION_ARTIFACT_KINDS: &[&str] = &[];
static WINDOWS_X64_NO_DEFERRED_ITEMS: &[&str] = &[];
static WINDOWS_X64_RUNTIME_BOOTSTRAP_SEQUENCE: &[&str] = &[
    "mainCRTStartup",
    "pulsec_rt_init",
    "app_entry",
    "pulsec_rt_shutdown",
    "ExitProcess",
];
static WINDOWS_X64_FAT_LOADER_EXPECTATIONS: &[&str] = &[
    "resolve-maincrtstartup-from-startup-object",
    "call-pulsec_rt_init-before-app_entry",
    "call-pulsec_rt_shutdown-before-exitprocess",
    "no-launch-descriptor-required-in-fat-mode",
];
static WINDOWS_X64_SHARED_LOADER_EXPECTATIONS: &[&str] = &[
    "resolve-maincrtstartup-from-startup-object",
    "call-pulsec_rt_init-before-app_entry",
    "call-pulsec_rt_shutdown-before-exitprocess",
    "resolve-runtime-library-from-bin-launch-descriptor",
];

pub(crate) fn windows_x64_target_adapter() -> &'static WindowsX64TargetAdapter {
    &WINDOWS_X64_TARGET_ADAPTER
}

pub(crate) fn windows_x64_runtime_service_imports() -> &'static [&'static str] {
    WINDOWS_X64_RUNTIME_SERVICE_IMPORTS
}

pub(crate) fn windows_x64_artifact_contract(output_mode: &str) -> TargetArtifactContract {
    match output_mode {
        "shared" => TargetArtifactContract {
            schema: "pulsec.windows_x64.artifact_contract.v1",
            target_id: "windows-x64",
            requested_output_mode: "shared",
            contract_status: "current-host-bootstrap-artifact-contract",
            implementation_status: "implemented",
            artifact_family: "windows-pe-coff-shared-runtime",
            requested_output_mode_status: "implemented-current-host-bootstrap",
            executable_artifact_kind: "pe-coff-exe-plus-shared-runtime",
            runtime_packaging: "peer-runtime-library",
            publication_shape: "profile-bin-lib-layout",
            companion_artifact_kinds: WINDOWS_X64_SHARED_COMPANION_ARTIFACT_KINDS,
            naming_policy: "<entry>.exe + pulsecore-<pulsec-semver>.dll/.lib + launch.txt",
            deferred_items: WINDOWS_X64_NO_DEFERRED_ITEMS,
        },
        _ => TargetArtifactContract {
            schema: "pulsec.windows_x64.artifact_contract.v1",
            target_id: "windows-x64",
            requested_output_mode: "fat",
            contract_status: "current-host-bootstrap-artifact-contract",
            implementation_status: "implemented",
            artifact_family: "windows-pe-coff-fat-executable",
            requested_output_mode_status: "implemented-current-host-bootstrap",
            executable_artifact_kind: "pe-coff-exe",
            runtime_packaging: "embedded-runtime-payload",
            publication_shape: "single-profile-root-executable",
            companion_artifact_kinds: WINDOWS_X64_NO_COMPANION_ARTIFACT_KINDS,
            naming_policy: "<entry>.exe",
            deferred_items: WINDOWS_X64_NO_DEFERRED_ITEMS,
        },
    }
}

pub(crate) fn windows_x64_startup_loader_contract(
    output_mode: &str,
) -> TargetStartupLoaderContract {
    match output_mode {
        "shared" => TargetStartupLoaderContract {
            schema: "pulsec.windows_x64.startup_loader_contract.v1",
            target_id: "windows-x64",
            requested_output_mode: "shared",
            contract_status: "current-host-bootstrap-startup-loader-contract",
            implementation_status: "implemented",
            startup_entry_symbol: "mainCRTStartup",
            startup_entry_abi: "win64-pe-entry",
            loader_handoff_kind: "pe-loader-direct-entry",
            runtime_bootstrap_sequence: WINDOWS_X64_RUNTIME_BOOTSTRAP_SEQUENCE,
            loader_expectations: WINDOWS_X64_SHARED_LOADER_EXPECTATIONS,
            publication_shape: "profile-bin-lib-layout",
            published_artifacts: WINDOWS_X64_SHARED_PUBLISHED_ARTIFACTS,
            loader_manifest_schema: Some("pulsec.shared.launch.v1"),
            loader_manifest_path: Some("bin/launch.txt"),
            runtime_companion_policy: "peer-runtime-library",
            debug_metadata_policy: "debug-profile-adds-metadata-dir-no-sidecar-symbols",
            deferred_items: WINDOWS_X64_NO_DEFERRED_ITEMS,
        },
        _ => TargetStartupLoaderContract {
            schema: "pulsec.windows_x64.startup_loader_contract.v1",
            target_id: "windows-x64",
            requested_output_mode: "fat",
            contract_status: "current-host-bootstrap-startup-loader-contract",
            implementation_status: "implemented",
            startup_entry_symbol: "mainCRTStartup",
            startup_entry_abi: "win64-pe-entry",
            loader_handoff_kind: "pe-loader-direct-entry",
            runtime_bootstrap_sequence: WINDOWS_X64_RUNTIME_BOOTSTRAP_SEQUENCE,
            loader_expectations: WINDOWS_X64_FAT_LOADER_EXPECTATIONS,
            publication_shape: "single-profile-root-executable",
            published_artifacts: WINDOWS_X64_FAT_PUBLISHED_ARTIFACTS,
            loader_manifest_schema: None,
            loader_manifest_path: None,
            runtime_companion_policy: "embedded-runtime-payload",
            debug_metadata_policy: "no-published-debug-sidecars",
            deferred_items: WINDOWS_X64_NO_DEFERRED_ITEMS,
        },
    }
}

fn planned_startup_object_path() -> PathBuf {
    PathBuf::from("obj").join("runtime").join("Startup.obj")
}

fn planned_runtime_owned_object_paths() -> Vec<PathBuf> {
    vec![PathBuf::from("obj")
        .join("runtime")
        .join("StdlibRuntime.obj")]
}

fn planned_app_owned_object_paths(ir: &IrProgram) -> Vec<PathBuf> {
    let mut objects = ir
        .classes
        .iter()
        .map(|class| {
            PathBuf::from("obj")
                .join(package_to_path(&class.package_name))
                .join(format!("{}.obj", class.name))
        })
        .collect::<Vec<_>>();
    objects.sort();
    objects
}

impl TargetAdapter for WindowsX64TargetAdapter {
    fn backend_contract(&self) -> BackendContract {
        windows_x64_backend_contract()
    }

    fn planned_link_plan(&self, ir: &IrProgram) -> NativeLinkPlan {
        NativeLinkPlan {
            startup_objects: vec![planned_startup_object_path()],
            app_owned_objects: planned_app_owned_object_paths(ir),
            runtime_owned_objects: planned_runtime_owned_object_paths(),
            system_inputs: vec![PathBuf::from("kernel32.lib")],
            shared_runtime_exports: Vec::new(),
        }
    }

    fn runtime_service_imports(&self) -> &'static [&'static str] {
        windows_x64_runtime_service_imports()
    }

    fn artifact_family(&self, output_mode: &str) -> &'static str {
        match output_mode {
            "shared" => "windows-pe-coff-shared-runtime",
            _ => "windows-pe-coff-fat-executable",
        }
    }

    fn artifact_contract(&self, output_mode: &str) -> TargetArtifactContract {
        windows_x64_artifact_contract(output_mode)
    }

    fn startup_loader_contract(&self, output_mode: &str) -> TargetStartupLoaderContract {
        windows_x64_startup_loader_contract(output_mode)
    }

    fn runtime_abi_family(&self, output_mode: &str) -> &'static str {
        match output_mode {
            "shared" => "pulsec-runtime-abi-v2-shared-windows-bootstrap",
            _ => "pulsec-runtime-abi-v2-embedded-windows-bootstrap",
        }
    }

    fn emit_split_program_objects(
        &self,
        ir: &IrProgram,
        out_dir: &Path,
        linker_override: Option<&Path>,
        emit_statement_trace_metadata: bool,
    ) -> Result<AdapterSplitArtifacts, String> {
        let split = emit_masm_split_program_objects(
            ir,
            out_dir,
            linker_override,
            emit_statement_trace_metadata,
        )?;
        Ok(AdapterSplitArtifacts {
            startup_obj: split.startup_obj,
            link_inputs: split.link_inputs,
            codegen: split.codegen,
            link_plan: split.link_plan,
        })
    }

    fn emit_full_program_object(
        &self,
        ir: &IrProgram,
        object_path: &Path,
        linker_override: Option<&Path>,
        emit_statement_trace_metadata: bool,
    ) -> Result<(String, Vec<PathBuf>), String> {
        emit_masm_full_program_object(
            ir,
            object_path,
            linker_override,
            emit_statement_trace_metadata,
        )
    }

    fn emit_print_entry_object(
        &self,
        main_method: &IrMethod,
        object_path: &Path,
        linker_override: Option<&Path>,
    ) -> Result<(String, Vec<PathBuf>), String> {
        emit_masm_print_entry_object(main_method, object_path, linker_override)
    }

    fn write_native_failure_report(
        &self,
        report_path: &Path,
        status: &str,
        detail: &str,
        attempts: &[String],
    ) -> Result<(), String> {
        write_native_failure_report(report_path, status, detail, attempts)
    }

    fn link_executable(
        &self,
        object_path: &Path,
        out_dir: &Path,
        report_path: &Path,
        linker_override: Option<&Path>,
        entry_codegen: &str,
        extra_link_inputs: &[PathBuf],
    ) -> Result<Option<PathBuf>, String> {
        try_link_windows_executable(
            object_path,
            out_dir,
            report_path,
            linker_override,
            entry_codegen,
            extra_link_inputs,
        )
    }

    fn link_shared_artifacts(
        &self,
        link_plan: &NativeLinkPlan,
        out_dir: &Path,
        report_path: &Path,
        linker_override: Option<&Path>,
        entry_codegen: &str,
    ) -> Result<SharedLinkArtifacts, String> {
        try_link_windows_shared_artifacts(
            link_plan,
            out_dir,
            report_path,
            linker_override,
            entry_codegen,
        )
    }
}
