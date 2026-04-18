// RB-13 contract ownership: this module publishes the first AdenOS x64 runtime-service ABI
// slice without claiming that the executable adapter is implemented yet.
use super::{
    TargetArtifactContract, TargetExecutableLoadingProofTarget, TargetStartupLoaderContract,
};
use crate::cli::target_model::PULSEOS_X64_TARGET_ID;

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub(crate) struct AdenOsRuntimeServiceContract {
    pub(crate) schema: &'static str,
    pub(crate) contract_status: &'static str,
    pub(crate) target_id: &'static str,
    pub(crate) implementation_status: &'static str,
    pub(crate) purpose: &'static str,
    pub(crate) console_capabilities: &'static [&'static str],
    pub(crate) panic_capabilities: &'static [&'static str],
    pub(crate) process_capabilities: &'static [&'static str],
    pub(crate) path_capabilities: &'static [&'static str],
    pub(crate) file_capabilities: &'static [&'static str],
    pub(crate) service_capabilities: &'static [&'static str],
    pub(crate) text_encoding: &'static str,
    pub(crate) exit_code_type: &'static str,
    pub(crate) panic_behavior: &'static str,
    pub(crate) handle_model: &'static str,
    pub(crate) deferred_items: &'static [&'static str],
}

static PULSEOS_X64_RUNTIME_SERVICE_CONTRACT: AdenOsRuntimeServiceContract =
    AdenOsRuntimeServiceContract {
        schema: "adenc.adenos.runtime_service.v1",
        contract_status: "first-slice-meeting-milestone",
        target_id: PULSEOS_X64_TARGET_ID,
        implementation_status: "contract-defined-not-yet-implemented",
        purpose: "define the minimum requested-target AdenOS service ABI slice without inheriting Windows host-bootstrap imports or startup naming",
        console_capabilities: &[
            "adenos.console.write_utf8",
            "adenos.console.write_line_utf8",
        ],
        panic_capabilities: &["adenos.panic.abort_utf8"],
        process_capabilities: &["adenos.process.exit_i32"],
        path_capabilities: &["adenos.path.program_dir_utf8"],
        file_capabilities: &[
            "adenos.file.open_read",
            "adenos.file.read",
            "adenos.file.close",
        ],
        service_capabilities: &[
            "adenos.service.connect",
            "adenos.service.request",
            "adenos.service.close",
        ],
        text_encoding: "utf8",
        exit_code_type: "i32",
        panic_behavior: "non-returning-abort-with-diagnostic",
        handle_model: "opaque-handle-reserved-not-frozen",
        deferred_items: &[
            "syscall numbers or trap encoding",
            "startup entry symbol and loader handoff",
            "artifact publication layout",
            "path normalization and cwd semantics",
            "service payload binary layout",
        ],
    };
static PULSEOS_X64_NO_COMPANION_ARTIFACT_KINDS: &[&str] = &[];
static PULSEOS_X64_FAT_ARTIFACT_DEFERRED_ITEMS: &[&str] = &[
    "startup context binary layout",
    "argv/envp publication policy",
    "debug metadata publication policy",
];
static PULSEOS_X64_SHARED_ARTIFACT_DEFERRED_ITEMS: &[&str] = &[
    "startup context binary layout",
    "argv/envp publication policy",
    "separate shared-runtime publication lane",
    "debug metadata publication policy",
];
static PULSEOS_X64_RUNTIME_BOOTSTRAP_SEQUENCE: &[&str] = &[
    "adenos_start",
    "adenc_rt_init",
    "app_entry",
    "adenc_rt_shutdown",
    "return_i32_exit_code",
];
static PULSEOS_X64_LOADER_EXPECTATIONS: &[&str] = &[
    "map-primary-program-image-before-entry",
    "resolve-adenos_start-from-primary-image",
    "provide-opaque-startup-context-for-runtime-services",
    "returned-i32-becomes-process-exit-code",
    "read-launch-manifest-from-bin-launch.json",
];
static PULSEOS_X64_PUBLISHED_ARTIFACTS: &[&str] = &["bin/<entry>", "bin/launch.json"];
static PULSEOS_X64_FAT_STARTUP_DEFERRED_ITEMS: &[&str] = &[
    "startup context binary layout",
    "argv/envp handoff policy",
    "debug symbol sidecar policy",
];
static PULSEOS_X64_SHARED_STARTUP_DEFERRED_ITEMS: &[&str] = &[
    "startup context binary layout",
    "argv/envp handoff policy",
    "separate shared-runtime publication lane",
    "debug symbol sidecar policy",
];
static PULSEOS_X64_LOADING_PROOF_REQUIRED_LOADER_CAPABILITIES: &[&str] = &[
    "map-primary-program-image-before-entry",
    "resolve-adenos_start-from-primary-image",
    "provide-opaque-startup-context-for-runtime-services",
    "surface-launch-manifest-metadata-from-bin-launch.json",
    "propagate-returned-i32-as-process-exit-code",
];
static PULSEOS_X64_LOADING_PROOF_SUCCESS_CONDITIONS: &[&str] = &[
    "primary-program-image-is-published-at-bin-entry",
    "launch-manifest-is-published-at-bin-launch-json",
    "startup-entry-symbol-adenos_start-is-resolvable",
    "loader-handoff-enables-published-runtime-service-capabilities",
    "runtime-bootstrap-sequence-reaches-app-entry-and-exit-code-return",
];
static PULSEOS_X64_LOADING_PROOF_EXCLUDED_CLAIMS: &[&str] = &[
    "does-not-prove-real-loader-execution-yet",
    "does-not-freeze-startup-context-binary-layout",
    "does-not-freeze-syscall-numbers-or-trap-encoding",
    "does-not-publish-a-separate-shared-runtime-lane-yet",
];

pub(crate) fn adenos_x64_runtime_service_contract() -> &'static AdenOsRuntimeServiceContract {
    &PULSEOS_X64_RUNTIME_SERVICE_CONTRACT
}

pub(crate) fn adenos_x64_artifact_contract(output_mode: &str) -> TargetArtifactContract {
    match output_mode {
        "shared" => TargetArtifactContract {
            schema: "adenc.adenos.artifact_contract.v1",
            target_id: PULSEOS_X64_TARGET_ID,
            requested_output_mode: "shared",
            contract_status: "first-slice-artifact-contract",
            implementation_status: "contract-defined-not-yet-implemented",
            artifact_family: "adenos-program-image-contract",
            requested_output_mode_status:
                "shared-request-collapses-to-first-slice-single-image-layout",
            executable_artifact_kind: "adenos-program-image",
            runtime_packaging: "shared-request-collapses-to-single-image-runtime-bootstrap",
            publication_shape: "profile-bin-layout-with-launch-manifest",
            companion_artifact_kinds: PULSEOS_X64_NO_COMPANION_ARTIFACT_KINDS,
            naming_policy: "bin/<entry> + bin/launch.json",
            deferred_items: PULSEOS_X64_SHARED_ARTIFACT_DEFERRED_ITEMS,
        },
        _ => TargetArtifactContract {
            schema: "adenc.adenos.artifact_contract.v1",
            target_id: PULSEOS_X64_TARGET_ID,
            requested_output_mode: "fat",
            contract_status: "first-slice-artifact-contract",
            implementation_status: "contract-defined-not-yet-implemented",
            artifact_family: "adenos-program-image-contract",
            requested_output_mode_status: "first-slice-loader-layout-published",
            executable_artifact_kind: "adenos-program-image",
            runtime_packaging: "single-image-runtime-bootstrap",
            publication_shape: "profile-bin-layout-with-launch-manifest",
            companion_artifact_kinds: PULSEOS_X64_NO_COMPANION_ARTIFACT_KINDS,
            naming_policy: "bin/<entry> + bin/launch.json",
            deferred_items: PULSEOS_X64_FAT_ARTIFACT_DEFERRED_ITEMS,
        },
    }
}

pub(crate) fn adenos_x64_startup_loader_contract(
    output_mode: &str,
) -> TargetStartupLoaderContract {
    match output_mode {
        "shared" => TargetStartupLoaderContract {
            schema: "adenc.adenos.startup_loader_contract.v1",
            target_id: PULSEOS_X64_TARGET_ID,
            requested_output_mode: "shared",
            contract_status: "first-slice-startup-loader-contract",
            implementation_status: "contract-defined-not-yet-implemented",
            startup_entry_symbol: "adenos_start",
            startup_entry_abi: "adenos-loader-entry-v1",
            loader_handoff_kind: "opaque-startup-context-handle",
            runtime_bootstrap_sequence: PULSEOS_X64_RUNTIME_BOOTSTRAP_SEQUENCE,
            loader_expectations: PULSEOS_X64_LOADER_EXPECTATIONS,
            publication_shape: "profile-bin-layout-with-launch-manifest",
            published_artifacts: PULSEOS_X64_PUBLISHED_ARTIFACTS,
            loader_manifest_schema: Some("adenc.adenos.launch.v1"),
            loader_manifest_path: Some("bin/launch.json"),
            runtime_companion_policy: "shared-request-collapses-to-single-image-layout",
            debug_metadata_policy: "no-extra-published-debug-metadata-first-slice",
            deferred_items: PULSEOS_X64_SHARED_STARTUP_DEFERRED_ITEMS,
        },
        _ => TargetStartupLoaderContract {
            schema: "adenc.adenos.startup_loader_contract.v1",
            target_id: PULSEOS_X64_TARGET_ID,
            requested_output_mode: "fat",
            contract_status: "first-slice-startup-loader-contract",
            implementation_status: "contract-defined-not-yet-implemented",
            startup_entry_symbol: "adenos_start",
            startup_entry_abi: "adenos-loader-entry-v1",
            loader_handoff_kind: "opaque-startup-context-handle",
            runtime_bootstrap_sequence: PULSEOS_X64_RUNTIME_BOOTSTRAP_SEQUENCE,
            loader_expectations: PULSEOS_X64_LOADER_EXPECTATIONS,
            publication_shape: "profile-bin-layout-with-launch-manifest",
            published_artifacts: PULSEOS_X64_PUBLISHED_ARTIFACTS,
            loader_manifest_schema: Some("adenc.adenos.launch.v1"),
            loader_manifest_path: Some("bin/launch.json"),
            runtime_companion_policy: "single-image-runtime-bootstrap",
            debug_metadata_policy: "no-extra-published-debug-metadata-first-slice",
            deferred_items: PULSEOS_X64_FAT_STARTUP_DEFERRED_ITEMS,
        },
    }
}

pub(crate) fn adenos_x64_executable_loading_proof_target(
    output_mode: &str,
) -> TargetExecutableLoadingProofTarget {
    TargetExecutableLoadingProofTarget {
        schema: "adenc.adenos.loading_proof_target.v1",
        target_id: PULSEOS_X64_TARGET_ID,
        requested_output_mode: match output_mode {
            "shared" => "shared",
            _ => "fat",
        },
        proof_status: "first-contract-level-loading-target",
        implementation_status: "proof-contract-defined-execution-deferred",
        validation_mode: "contract-shape-only",
        startup_loader_contract_schema: "adenc.adenos.startup_loader_contract.v1",
        artifact_contract_schema: "adenc.adenos.artifact_contract.v1",
        runtime_service_contract_schema: "adenc.adenos.runtime_service.v1",
        required_published_artifacts: PULSEOS_X64_PUBLISHED_ARTIFACTS,
        required_startup_entry_symbol: "adenos_start",
        required_loader_manifest_schema: "adenc.adenos.launch.v1",
        required_loader_manifest_path: "bin/launch.json",
        required_loader_capabilities: PULSEOS_X64_LOADING_PROOF_REQUIRED_LOADER_CAPABILITIES,
        required_runtime_bootstrap_sequence: PULSEOS_X64_RUNTIME_BOOTSTRAP_SEQUENCE,
        success_conditions: PULSEOS_X64_LOADING_PROOF_SUCCESS_CONDITIONS,
        excluded_claims: PULSEOS_X64_LOADING_PROOF_EXCLUDED_CLAIMS,
    }
}
