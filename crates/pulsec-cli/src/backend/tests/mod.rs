// Backend contract suite: target-neutral and requested-target contract
// assertions live here, while codegen/runtime execution assertions remain
// Windows x64 adapter-backed until more adapters execute.

use super::adapters::windows_x64::{
    windows_x64_artifact_contract, windows_x64_runtime_service_imports,
    windows_x64_startup_loader_contract, windows_x64_target_adapter,
};
use super::BackendAdapter;
use super::adapters::TargetAdapter;
use super::adapters::{
    resolve_active_adapter_artifact_contract, resolve_active_adapter_startup_loader_contract,
    resolve_active_backend_contract, resolve_host_bootstrap_target_adapter,
    resolve_planned_link_plan, resolve_requested_target_artifact_contract,
    resolve_requested_target_executable_loading_proof_target,
    resolve_requested_target_runtime_service_contract,
    resolve_requested_target_startup_loader_contract,
};
use super::analysis::{
    class_implements_interface_runtime, install_class_finality_resolution,
    install_class_interfaces_resolution, install_class_super_resolution,
    install_interface_type_resolution, install_method_finality_resolution,
    install_method_visibility_resolution, is_interface_type, render_native_build_plan,
    render_native_build_plan_with_output_mode,
    render_native_build_plan_with_target_and_output_mode,
};
use super::emission::{
    begin_class_id_set_table_collection,
    emit_arc_teardown_proc, emit_array_get_proc, emit_array_new_proc, emit_array_set_proc,
    emit_checked_reference_cast, emit_ensure_slot_capacity_proc, emit_instanceof_check,
    emit_list_add_proc, emit_list_get_proc, emit_map_contains_proc, emit_map_get_proc,
    emit_map_put_proc, emit_runtime_init_proc, emit_runtime_shutdown_proc, emit_startup_entry_proc,
    take_class_id_set_tables,
    emit_virtual_dispatch_call, is_devirtualizable_instance_call,
    resolve_method_staticness_for_call, resolve_method_symbol_for_call,
    shared_runtime_export_symbols,
};
use super::host_bootstrap::{
    resolve_host_bootstrap_runtime_contract, resolve_runtime_ownership_model,
};
use super::resolve_plan_target_adapter_metadata;
use super::support::{
    default_stdlib_symbols, emit_runtime_data_tables, mangle_method_symbol,
    windows_x64_backend_contract,
};
use super::{
    DISPATCH_NULL_PANIC_SYMBOL, DISPATCH_TYPE_PANIC_SYMBOL, RustHostBootstrapBackend,
    WRITE_RAW_SYMBOL,
};
use pulsec_core::intermediate::{
    IrBinaryOp, IrBlock, IrParam, IrSourceLoc, IrTerminator, IrValue, IrValueKind,
};
use pulsec_core::{IrMethod, IrProgram, IrVisibility};
use std::collections::{BTreeMap, HashMap, HashSet};
use std::fs;
use std::path::PathBuf;
use std::sync::{Mutex, OnceLock};

fn empty_method() -> IrMethod {
    IrMethod {
        name: "test".to_string(),
        return_type: Some("void".to_string()),
        is_varargs: false,
        is_static: true,
        is_final: false,
        visibility: IrVisibility::Public,
        is_constructor: false,
        params: vec![],
        stmt_count: 0,
        values: vec![],
        blocks: vec![IrBlock {
            id: 0,
            instructions: vec![],
            terminator: IrTerminator::Stop,
        }],
    }
}

fn with_resolution_lock<T>(f: impl FnOnce() -> T) -> T {
    static LOCK: OnceLock<Mutex<()>> = OnceLock::new();
    let guard = LOCK
        .get_or_init(|| Mutex::new(()))
        .lock()
        .expect("resolution lock");
    let out = f();
    drop(guard);
    out
}

fn test_source_loc(line: usize, statement_index: usize) -> IrSourceLoc {
    IrSourceLoc {
        source_file: "Main.pulse".to_string(),
        class_name: "Main".to_string(),
        method_name: "main".to_string(),
        source_line: line,
        statement_index,
    }
}

fn minimal_trace_ir_program(package_name: &str) -> IrProgram {
    IrProgram {
        classes: vec![pulsec_core::IrClass {
            package_name: package_name.to_string(),
            name: "Main".to_string(),
            is_interface: false,
            is_annotation: false,
            is_enum: false,
            enum_constants: vec![],
            is_final: false,
            super_class: None,
            interfaces: vec![],
            fields: vec![],
            methods: vec![IrMethod {
                name: "main".to_string(),
                return_type: Some("void".to_string()),
                is_varargs: false,
                is_static: true,
                is_final: false,
                visibility: IrVisibility::Public,
                is_constructor: false,
                params: vec![],
                stmt_count: 1,
                values: vec![],
                blocks: vec![IrBlock {
                    id: 0,
                    instructions: vec![],
                    terminator: IrTerminator::Return {
                        value: None,
                        source: test_source_loc(7, 0),
                    },
                }],
            }],
        }],
    }
}

fn expected_intrinsics_surface() -> Vec<&'static str> {
    vec![
        "pulse.rt.Intrinsics.consoleReadLine",
        "pulse.rt.Intrinsics.consoleWriteLine",
        "pulse.rt.Intrinsics.consoleWrite",
        "pulse.rt.Intrinsics.panic",
        "pulse.rt.Intrinsics.objectClassName",
        "pulse.rt.Intrinsics.objectHashCode",
        "pulse.lang.String.runtimeConcat",
        "pulse.lang.String.runtimeLength",
        "pulse.lang.String.runtimeCharAt",
        "pulse.lang.String.runtimeFromChar",
        "pulse.rt.Intrinsics.arrayNew",
        "pulse.rt.Intrinsics.arrayNewMulti",
        "pulse.rt.Intrinsics.arrayLength",
        "pulse.rt.Intrinsics.arrayGetInt",
        "pulse.rt.Intrinsics.arraySetInt",
        "pulse.rt.Intrinsics.arrayGetLong",
        "pulse.rt.Intrinsics.arraySetLong",
        "pulse.rt.Intrinsics.arrayGetString",
        "pulse.rt.Intrinsics.arraySetString",
        "pulse.rt.Intrinsics.listNew",
        "pulse.rt.Intrinsics.listSize",
        "pulse.rt.Intrinsics.listKind",
        "pulse.rt.Intrinsics.listClear",
        "pulse.rt.Intrinsics.listAddInt",
        "pulse.rt.Intrinsics.listAddString",
        "pulse.rt.Intrinsics.listGetInt",
        "pulse.rt.Intrinsics.listGetString",
        "pulse.rt.Intrinsics.mapNew",
        "pulse.rt.Intrinsics.mapSize",
        "pulse.rt.Intrinsics.mapClear",
        "pulse.rt.Intrinsics.mapContainsKey",
        "pulse.rt.Intrinsics.mapPut",
        "pulse.rt.Intrinsics.mapPutInt",
        "pulse.rt.Intrinsics.mapGet",
        "pulse.rt.Intrinsics.mapGetInt",
        "pulse.rt.Intrinsics.hostExists",
        "pulse.rt.Intrinsics.hostIsFile",
        "pulse.rt.Intrinsics.hostIsDirectory",
        "pulse.rt.Intrinsics.hostReadAllText",
        "pulse.rt.Intrinsics.hostListChildren",
        "pulse.memory.Memory.retain",
        "pulse.memory.Memory.release",
        "pulse.memory.Memory.cycleYoungPass",
        "pulse.memory.Memory.cycleFullPass",
        "pulse.memory.Memory.cycleTick",
        "pulse.memory.Memory.weakNew",
        "pulse.memory.Memory.weakGet",
        "pulse.memory.Memory.weakClear",
    ]
}

fn expected_native_runtime_symbols() -> Vec<&'static str> {
    vec![
        "pulsec_rt_consoleReadLine",
        "pulsec_rt_consoleWrite",
        "pulsec_rt_consoleWriteLine",
        "pulsec_rt_panic",
        "pulsec_rt_stringConcat",
        "pulsec_rt_stringLength",
        "pulsec_rt_objectClassName",
        "pulsec_rt_objectHashCode",
        "pulsec_rt_stringCharAt",
        "pulsec_rt_charToString",
        "pulsec_rt_arrayNew",
        "pulsec_rt_arrayNewMulti",
        "pulsec_rt_arrayLength",
        "pulsec_rt_arrayGetInt",
        "pulsec_rt_arraySetInt",
        "pulsec_rt_arrayGetLong",
        "pulsec_rt_arraySetLong",
        "pulsec_rt_arrayGetString",
        "pulsec_rt_arraySetString",
        "pulsec_rt_listNew",
        "pulsec_rt_listSize",
        "pulsec_rt_listKind",
        "pulsec_rt_listClear",
        "pulsec_rt_listAddInt",
        "pulsec_rt_listAddString",
        "pulsec_rt_listGetInt",
        "pulsec_rt_listGetString",
        "pulsec_rt_mapNew",
        "pulsec_rt_mapSize",
        "pulsec_rt_mapClear",
        "pulsec_rt_mapContainsKey",
        "pulsec_rt_mapPut",
        "pulsec_rt_mapPutInt",
        "pulsec_rt_mapGet",
        "pulsec_rt_mapGetInt",
        "pulsec_rt_hostExists",
        "pulsec_rt_hostIsFile",
        "pulsec_rt_hostIsDirectory",
        "pulsec_rt_hostReadAllText",
        "pulsec_rt_hostListChildren",
        "pulsec_rt_arcRetain",
        "pulsec_rt_arcRelease",
        "pulsec_rt_arcCycleYoungPass",
        "pulsec_rt_arcCycleFullPass",
        "pulsec_rt_arcCycleTick",
        "pulsec_rt_weakNew",
        "pulsec_rt_weakGet",
        "pulsec_rt_weakClear",
    ]
}

#[test]
fn m3_14_intrinsic_surface_is_locked_in_backend_contract() {
    let contract = windows_x64_backend_contract();
    let actual: HashSet<&str> = contract.runtime_symbols.iter().copied().collect();
    let expected: HashSet<&str> = expected_intrinsics_surface().into_iter().collect();
    let missing: Vec<&str> = expected.difference(&actual).copied().collect();
    assert!(
        missing.is_empty(),
        "backend contract missing required intrinsic coverage: {:?}",
        missing
    );
}

#[test]
fn rb_06_windows_target_metadata_resolves_to_active_windows_adapter() {
    let metadata =
        resolve_plan_target_adapter_metadata("windows-x64", "fat").expect("windows metadata");
    assert_eq!(metadata.requested_target.target_id, "windows-x64");
    assert_eq!(metadata.active_target.target_id, "windows-x64");
    assert_eq!(metadata.resolution, "selected-target-active-adapter");
    assert_eq!(metadata.artifact_family, "windows-pe-coff-fat-executable");
    assert_eq!(
        metadata.runtime_abi_family,
        "pulsec-runtime-abi-v2-embedded-windows-bootstrap"
    );
}

#[test]
fn rb_06_non_windows_target_metadata_is_explicit_about_windows_bootstrap_fallback() {
    let metadata =
        resolve_plan_target_adapter_metadata("pulseos-x64", "shared").expect("pulseos metadata");
    assert_eq!(metadata.requested_target.target_id, "pulseos-x64");
    assert_eq!(metadata.active_target.target_id, "windows-x64");
    assert_eq!(
        metadata.resolution,
        "selected-target-not-yet-implemented-using-windows-host-bootstrap"
    );
    assert_eq!(metadata.artifact_family, "windows-pe-coff-shared-runtime");
    assert_eq!(
        metadata.runtime_abi_family,
        "pulsec-runtime-abi-v2-shared-windows-bootstrap"
    );
}

#[test]
fn rb_07_backend_layers_export_target_neutral_host_bootstrap_and_adapter_surfaces() {
    let _backend = super::host_bootstrap::RustHostBootstrapBackend::default();
    let metadata = super::adapters::resolve_plan_target_adapter_metadata("windows-x64", "fat")
        .expect("windows metadata");
    assert_eq!(metadata.active_target.target_id, "windows-x64");

    let plan = super::target_neutral::render_native_build_plan(
        &IrProgram { classes: vec![] },
        PathBuf::from("build/pulsec.ir.txt").as_path(),
    );
    let normalized =
        super::target_neutral::normalize_class_owner_name("Thing", &["Thing".to_string()]);
    assert_eq!(normalized.as_deref(), Some("Thing"));
    assert!(plan.contains("\"schema\": \"pulsec.native.plan.v1\""));
}

#[test]
fn rb_08_adapter_registry_routes_current_targets_through_one_host_bootstrap_seam() {
    for requested_target in ["windows-x64", "pulseos-x64", "linux-x64", "macos-arm64"] {
        let adapter = resolve_host_bootstrap_target_adapter(requested_target)
            .expect("adapter should resolve");
        let contract = adapter.backend_contract();
        assert_eq!(contract.target_descriptor.target_id, "windows-x64");
        assert_eq!(
            adapter.artifact_family("fat"),
            "windows-pe-coff-fat-executable"
        );
        assert_eq!(
            adapter.runtime_abi_family("shared"),
            "pulsec-runtime-abi-v2-shared-windows-bootstrap"
        );
    }
}

#[test]
fn rb_08_active_backend_contract_resolution_flows_through_adapter_registry() {
    let default_contract = windows_x64_backend_contract();
    let resolved_contract =
        resolve_active_backend_contract("pulseos-x64").expect("contract should resolve");
    assert_eq!(
        resolved_contract.target_descriptor.target_id,
        default_contract.target_descriptor.target_id
    );
    assert_eq!(
        resolved_contract.target_triple,
        default_contract.target_triple
    );
    assert_eq!(
        resolved_contract.object_format,
        default_contract.object_format
    );
    assert_eq!(
        resolved_contract.entry_symbol,
        default_contract.entry_symbol
    );
    assert_eq!(
        resolved_contract.calling_convention,
        default_contract.calling_convention
    );
}

#[test]
fn rb_09_windows_x64_adapter_exposes_current_host_bootstrap_contract() {
    let adapter = windows_x64_target_adapter();
    let contract = adapter.backend_contract();
    assert_eq!(contract.target_descriptor.target_id, "windows-x64");
    assert_eq!(contract.target_triple, "x86_64-pc-windows-msvc");
    assert_eq!(contract.object_format, "coff");
    assert_eq!(contract.entry_symbol, "main");
    assert_eq!(contract.calling_convention, "system");
    assert_eq!(
        adapter.artifact_family("fat"),
        "windows-pe-coff-fat-executable"
    );
    assert_eq!(
        adapter.artifact_family("shared"),
        "windows-pe-coff-shared-runtime"
    );
    assert_eq!(
        adapter.runtime_abi_family("fat"),
        "pulsec-runtime-abi-v2-embedded-windows-bootstrap"
    );
    assert_eq!(
        adapter.runtime_abi_family("shared"),
        "pulsec-runtime-abi-v2-shared-windows-bootstrap"
    );
}

#[test]
fn rb_10_planned_link_plan_defaults_resolve_through_adapter_registry() {
    let plan = resolve_planned_link_plan("pulseos-x64", &IrProgram { classes: vec![] })
        .expect("planned link plan should resolve");
    assert_eq!(
        plan.startup_objects,
        vec![PathBuf::from("obj/runtime/Startup.obj")]
    );
    assert_eq!(
        plan.runtime_owned_objects,
        vec![PathBuf::from("obj/runtime/StdlibRuntime.obj")]
    );
    assert_eq!(plan.system_inputs, vec![PathBuf::from("kernel32.lib")]);
    assert!(plan.app_owned_objects.is_empty());
}

#[test]
fn rb_11_windows_runtime_service_imports_are_adapter_owned_not_portable_runtime_symbols() {
    let portable_contract = windows_x64_backend_contract();
    let portable_symbols: HashSet<&str> =
        portable_contract.runtime_symbols.iter().copied().collect();
    let adapter_imports: HashSet<&str> = windows_x64_runtime_service_imports()
        .iter()
        .copied()
        .collect();

    for os_symbol in [
        "GetStdHandle",
        "WriteFile",
        "ExitProcess",
        "GetProcessHeap",
        "HeapAlloc",
        "HeapFree",
        "GetSystemTimeAsFileTime",
    ] {
        assert!(
            adapter_imports.contains(os_symbol),
            "windows x64 adapter import inventory missing '{}'",
            os_symbol
        );
        assert!(
            !portable_symbols.contains(os_symbol),
            "portable runtime contract must not expose adapter-owned import '{}'",
            os_symbol
        );
    }
}

#[test]
fn rb_12_host_bootstrap_runtime_contract_keeps_minimum_portable_surface_explicit() {
    let contract =
        resolve_host_bootstrap_runtime_contract("pulseos-x64").expect("host bootstrap contract");
    assert_eq!(contract.schema, "pulsec.host_bootstrap.runtime.v1");
    assert_eq!(
        contract.contract_status,
        "minimum-retained-bootstrap-surface"
    );
    assert_eq!(contract.implementation_owner, "rust-host-bootstrap-layer");
    assert_eq!(
        contract.lifecycle_procedures,
        ["pulsec_rt_init", "pulsec_rt_shutdown"]
    );
    assert!(contract
        .core_runtime_procedures
        .contains(&"pulsec_rt_objectClassId"));
    assert!(contract
        .trace_exception_procedures
        .contains(&"pulsec_rt_traceUpdateTop"));
    assert!(
        contract
            .portable_stdlib_bridge_families
            .contains(&"array-runtime")
            && contract
                .portable_stdlib_bridge_families
                .contains(&"memory-ownership")
    );
    assert!(contract
        .portable_stdlib_bridge_symbols
        .contains(&"pulsec_rt_arrayNew".to_string()));
    assert!(contract
        .portable_stdlib_bridge_symbols
        .contains(&"pulsec_rt_arcCycleTick".to_string()));
    assert!(
        contract.adapter_service_imports.contains(&"GetProcessHeap")
            && contract.adapter_service_imports.contains(&"WriteFile")
    );
    assert!(!contract
        .portable_stdlib_bridge_symbols
        .contains(&"GetProcessHeap".to_string()));
}

#[test]
fn rb_12_native_plan_emits_host_bootstrap_runtime_contract() {
    let plan = render_native_build_plan_with_output_mode(
        &IrProgram { classes: vec![] },
        PathBuf::from("build/pulsec.ir.txt").as_path(),
        "shared",
        "launcher",
    );
    for needle in [
        "\"host_bootstrap_runtime\": {",
        "\"schema\": \"pulsec.host_bootstrap.runtime.v1\"",
        "\"contract_status\": \"minimum-retained-bootstrap-surface\"",
        "\"implementation_owner\": \"rust-host-bootstrap-layer\"",
        "\"lifecycle_procedures\": [\"pulsec_rt_init\", \"pulsec_rt_shutdown\"]",
        "\"core_runtime_procedures\": [\"pulsec_rt_stringFromBytes\", \"pulsec_rt_objectNew\", \"pulsec_rt_objectClassId\", \"pulsec_rt_objectClassName\", \"pulsec_rt_objectHashCode\"]",
        "\"trace_exception_procedures\": [\"pulsec_rt_tracePush\", \"pulsec_rt_traceUpdateTop\", \"pulsec_rt_tracePop\", \"pulsec_rt_traceDump\", \"pulsec_rt_pushExceptionHandler\", \"pulsec_rt_popExceptionHandler\", \"pulsec_rt_takePendingException\", \"pulsec_rt_throw\"]",
        "\"required_procedure_count\":",
        "\"runtime_service_imports\": [\"GetStdHandle\", \"WriteFile\", \"ExitProcess\", \"GetProcessHeap\", \"HeapAlloc\", \"HeapFree\", \"GetSystemTimeAsFileTime\", \"CreateProcessA\", \"WaitForSingleObject\", \"GetExitCodeProcess\"]",
        "\"startup_entry\": \"adapter-owned\"",
        "\"system_inputs\": \"adapter-owned\"",
    ] {
        assert!(
            plan.contains(needle),
            "native plan missing RB-12 host bootstrap runtime contract needle '{}'",
            needle
        );
    }
}

#[test]
fn rb_13_pulseos_runtime_service_contract_is_explicit_and_honest() {
    let contract = resolve_requested_target_runtime_service_contract("pulseos-x64")
        .expect("pulseos contract should resolve")
        .expect("pulseos contract should be published");
    assert_eq!(contract.schema, "pulsec.pulseos.runtime_service.v1");
    assert_eq!(contract.contract_status, "first-slice-meeting-milestone");
    assert_eq!(contract.target_id, "pulseos-x64");
    assert_eq!(
        contract.implementation_status,
        "contract-defined-not-yet-implemented"
    );
    assert_eq!(
        contract.console_capabilities,
        [
            "pulseos.console.write_utf8",
            "pulseos.console.write_line_utf8",
        ]
    );
    assert_eq!(contract.panic_capabilities, ["pulseos.panic.abort_utf8"]);
    assert_eq!(contract.process_capabilities, ["pulseos.process.exit_i32"]);
    assert!(contract
        .file_capabilities
        .contains(&"pulseos.file.open_read"));
    assert!(contract
        .service_capabilities
        .contains(&"pulseos.service.request"));
    assert_eq!(contract.text_encoding, "utf8");
    assert_eq!(contract.handle_model, "opaque-handle-reserved-not-frozen");
    assert!(contract
        .deferred_items
        .contains(&"startup entry symbol and loader handoff"));
}

#[test]
fn rb_13_native_plan_emits_requested_pulseos_runtime_service_contract() {
    let pulseos_plan = render_native_build_plan_with_target_and_output_mode(
        &IrProgram { classes: vec![] },
        PathBuf::from("build/pulsec.ir.txt").as_path(),
        "pulseos-x64",
        "fat",
        "main",
    );
    for needle in [
        "\"requested_target_runtime_service_abi\": {",
        "\"schema\": \"pulsec.pulseos.runtime_service.v1\"",
        "\"contract_status\": \"first-slice-meeting-milestone\"",
        "\"target_id\": \"pulseos-x64\"",
        "\"implementation_status\": \"contract-defined-not-yet-implemented\"",
        "\"pulseos.console.write_utf8\"",
        "\"pulseos.panic.abort_utf8\"",
        "\"pulseos.process.exit_i32\"",
        "\"pulseos.file.open_read\"",
        "\"pulseos.service.request\"",
        "\"payload_shape\": \"service-specific-binary-layout-deferred\"",
    ] {
        assert!(
            pulseos_plan.contains(needle),
            "native plan missing RB-13 PulseOS runtime-service contract needle '{}'",
            needle
        );
    }

    let windows_plan = render_native_build_plan_with_target_and_output_mode(
        &IrProgram { classes: vec![] },
        PathBuf::from("build/pulsec.ir.txt").as_path(),
        "windows-x64",
        "fat",
        "main",
    );
    assert!(
        windows_plan.contains("\"requested_target_runtime_service_abi\": null"),
        "windows native plan should not pretend to publish a PulseOS runtime-service contract"
    );
}

#[test]
fn rb_14_runtime_ownership_model_splits_pulse_bootstrap_and_adapter_surfaces() {
    let model = resolve_runtime_ownership_model("pulseos-x64")
        .expect("runtime ownership model should resolve");
    assert_eq!(model.schema, "pulsec.runtime.ownership.rebase.v1");
    assert_eq!(model.contract_status, "rb-14-explicit-three-way-split");
    assert!(model
        .pulse_owned_namespace_families
        .contains(&"pulse.collections.*"));
    assert_eq!(
        model.retained_host_bootstrap_runtime_schema,
        "pulsec.host_bootstrap.runtime.v1"
    );
    assert!(model
        .host_bootstrap_bridge_families
        .contains(&"memory-ownership"));
    assert!(model
        .host_bootstrap_runtime_state_families
        .contains(&"arc-and-cycle-state"));
    assert!(model
        .active_adapter_owned_categories
        .contains(&"requested-target-runtime-service-implementation"));
    assert!(model
        .active_adapter_service_imports
        .contains(&"GetProcessHeap"));
    assert_eq!(
        model.requested_target_service_contract_schema,
        Some("pulsec.pulseos.runtime_service.v1")
    );
    assert_eq!(
        model.requested_target_service_contract_status,
        "published-first-slice-contract"
    );
    assert!(model
        .forbidden_blends
        .contains(&"windows-service-imports-must-not-become-portable-runtime-or-pulseos-defaults"));
}

#[test]
fn rb_14_native_plan_emits_runtime_ownership_model() {
    let pulseos_plan = render_native_build_plan_with_target_and_output_mode(
        &IrProgram { classes: vec![] },
        PathBuf::from("build/pulsec.ir.txt").as_path(),
        "pulseos-x64",
        "fat",
        "main",
    );
    for needle in [
        "\"runtime_ownership_model\": {",
        "\"schema\": \"pulsec.runtime.ownership.rebase.v1\"",
        "\"contract_status\": \"rb-14-explicit-three-way-split\"",
        "\"namespace_families\": [\"pulse.lang.*\", \"pulse.io.*\", \"pulse.collections.*\", \"pulse.math.*\", \"pulse.memory.*\", \"pulse.rt.*\"]",
        "\"retained_runtime_contract_schema\": \"pulsec.host_bootstrap.runtime.v1\"",
        "\"portable_bridge_families\": [\"console-io\", \"string-and-number-text\", \"time-and-process\", \"array-runtime\", \"list-runtime\", \"map-runtime\", \"memory-ownership\", \"math-helpers\"]",
        "\"runtime_private_state_families\": [\"object-and-class-id-metadata\", \"slot-allocator-state\", \"arc-and-cycle-state\", \"weak-reference-state\", \"container-registries\", \"trace-abi-and-scratch-state\"]",
        "\"active_adapter_service_imports\": [\"GetStdHandle\", \"WriteFile\", \"ExitProcess\", \"GetProcessHeap\", \"HeapAlloc\", \"HeapFree\", \"GetSystemTimeAsFileTime\", \"CreateProcessA\", \"WaitForSingleObject\", \"GetExitCodeProcess\"]",
        "\"requested_target_service_contract_schema\": \"pulsec.pulseos.runtime_service.v1\"",
        "\"requested_target_service_contract_status\": \"published-first-slice-contract\"",
        "\"startup_loader_publication\": \"adapter-owned\"",
    ] {
        assert!(
            pulseos_plan.contains(needle),
            "native plan missing RB-14 runtime ownership model needle '{}'",
            needle
        );
    }

    let windows_plan = render_native_build_plan_with_target_and_output_mode(
        &IrProgram { classes: vec![] },
        PathBuf::from("build/pulsec.ir.txt").as_path(),
        "windows-x64",
        "fat",
        "main",
    );
    assert!(windows_plan.contains("\"runtime_ownership_model\": {"));
    assert!(windows_plan.contains("\"requested_target_service_contract_schema\": null"));
    assert!(windows_plan.contains(
        "\"requested_target_service_contract_status\": \"not-published-for-this-target\""
    ));
}

#[test]
fn rb_15_windows_and_pulseos_artifact_contracts_are_distinct() {
    let active_windows = resolve_active_adapter_artifact_contract("windows-x64", "shared")
        .expect("active windows artifact contract should resolve");
    assert_eq!(
        active_windows.schema,
        "pulsec.windows_x64.artifact_contract.v1"
    );
    assert_eq!(active_windows.target_id, "windows-x64");
    assert_eq!(
        active_windows.artifact_family,
        "windows-pe-coff-shared-runtime"
    );
    assert_eq!(active_windows.runtime_packaging, "peer-runtime-library");
    assert!(active_windows
        .companion_artifact_kinds
        .contains(&"runtime_library"));

    let pulseos_requested = resolve_requested_target_artifact_contract("pulseos-x64", "shared")
        .expect("pulseos artifact contract should resolve")
        .expect("pulseos artifact contract should be published");
    assert_eq!(
        pulseos_requested.schema,
        "pulsec.pulseos.artifact_contract.v1"
    );
    assert_eq!(pulseos_requested.target_id, "pulseos-x64");
    assert_eq!(
        pulseos_requested.artifact_family,
        "pulseos-program-image-contract"
    );
    assert_eq!(
        pulseos_requested.requested_output_mode_status,
        "shared-request-collapses-to-first-slice-single-image-layout"
    );
    assert_eq!(
        pulseos_requested.runtime_packaging,
        "shared-request-collapses-to-single-image-runtime-bootstrap"
    );
    assert!(pulseos_requested
        .deferred_items
        .contains(&"separate shared-runtime publication lane"));

    let direct_windows = windows_x64_artifact_contract("fat");
    assert_eq!(direct_windows.target_id, "windows-x64");
    assert_eq!(
        direct_windows.artifact_family,
        "windows-pe-coff-fat-executable"
    );
}

#[test]
fn rb_15_native_plan_emits_active_and_requested_artifact_contracts() {
    let pulseos_plan = render_native_build_plan_with_target_and_output_mode(
        &IrProgram { classes: vec![] },
        PathBuf::from("build/pulsec.ir.txt").as_path(),
        "pulseos-x64",
        "shared",
        "launcher",
    );
    for needle in [
        "\"artifact_contracts\": {",
        "\"active_adapter\": {",
        "\"schema\": \"pulsec.windows_x64.artifact_contract.v1\"",
        "\"artifact_family\": \"windows-pe-coff-shared-runtime\"",
        "\"runtime_packaging\": \"peer-runtime-library\"",
        "\"publication_shape\": \"profile-bin-lib-layout\"",
        "\"requested_target\": {",
        "\"schema\": \"pulsec.pulseos.artifact_contract.v1\"",
        "\"artifact_family\": \"pulseos-program-image-contract\"",
        "\"requested_output_mode_status\": \"shared-request-collapses-to-first-slice-single-image-layout\"",
        "\"executable_artifact_kind\": \"pulseos-program-image\"",
        "\"runtime_packaging\": \"shared-request-collapses-to-single-image-runtime-bootstrap\"",
        "\"publication_shape\": \"profile-bin-layout-with-launch-manifest\"",
    ] {
        assert!(
            pulseos_plan.contains(needle),
            "native plan missing RB-15 artifact contract needle '{}'",
            needle
        );
    }

    let windows_plan = render_native_build_plan_with_target_and_output_mode(
        &IrProgram { classes: vec![] },
        PathBuf::from("build/pulsec.ir.txt").as_path(),
        "windows-x64",
        "fat",
        "main",
    );
    assert!(windows_plan.contains("\"artifact_contracts\": {"));
    assert!(windows_plan.contains("\"requested_target\": {"));
    assert!(windows_plan.contains("\"schema\": \"pulsec.windows_x64.artifact_contract.v1\""));
    assert!(windows_plan.contains("\"artifact_family\": \"windows-pe-coff-fat-executable\""));
}

#[test]
fn rb_16_windows_and_pulseos_startup_loader_contracts_are_explicit() {
    let active_windows = resolve_active_adapter_startup_loader_contract("windows-x64", "shared")
        .expect("active windows startup/loader contract should resolve");
    assert_eq!(
        active_windows.schema,
        "pulsec.windows_x64.startup_loader_contract.v1"
    );
    assert_eq!(active_windows.startup_entry_symbol, "mainCRTStartup");
    assert_eq!(active_windows.startup_entry_abi, "win64-pe-entry");
    assert_eq!(
        active_windows.loader_manifest_schema,
        Some("pulsec.shared.launch.v1")
    );
    assert_eq!(active_windows.loader_manifest_path, Some("bin/launch.txt"));
    assert!(active_windows
        .runtime_bootstrap_sequence
        .contains(&"pulsec_rt_shutdown"));

    let pulseos_requested =
        resolve_requested_target_startup_loader_contract("pulseos-x64", "shared")
            .expect("pulseos startup/loader contract should resolve")
            .expect("pulseos startup/loader contract should be published");
    assert_eq!(
        pulseos_requested.schema,
        "pulsec.pulseos.startup_loader_contract.v1"
    );
    assert_eq!(pulseos_requested.target_id, "pulseos-x64");
    assert_eq!(
        pulseos_requested.contract_status,
        "first-slice-startup-loader-contract"
    );
    assert_eq!(pulseos_requested.startup_entry_symbol, "pulseos_start");
    assert_eq!(
        pulseos_requested.startup_entry_abi,
        "pulseos-loader-entry-v1"
    );
    assert_eq!(
        pulseos_requested.loader_handoff_kind,
        "opaque-startup-context-handle"
    );
    assert_eq!(
        pulseos_requested.loader_manifest_schema,
        Some("pulsec.pulseos.launch.v1")
    );
    assert_eq!(
        pulseos_requested.loader_manifest_path,
        Some("bin/launch.json")
    );
    assert_eq!(
        pulseos_requested.runtime_companion_policy,
        "shared-request-collapses-to-single-image-layout"
    );
    assert!(pulseos_requested
        .published_artifacts
        .contains(&"bin/launch.json"));
    assert!(pulseos_requested
        .deferred_items
        .contains(&"separate shared-runtime publication lane"));

    let direct_windows = windows_x64_startup_loader_contract("fat");
    assert_eq!(direct_windows.target_id, "windows-x64");
    assert_eq!(direct_windows.startup_entry_symbol, "mainCRTStartup");
    assert_eq!(direct_windows.loader_manifest_schema, None);
}

#[test]
fn rb_16_native_plan_emits_active_and_requested_startup_loader_contracts() {
    let pulseos_plan = render_native_build_plan_with_target_and_output_mode(
        &IrProgram { classes: vec![] },
        PathBuf::from("build/pulsec.ir.txt").as_path(),
        "pulseos-x64",
        "shared",
        "launcher",
    );
    for needle in [
        "\"startup_loader_contracts\": {",
        "\"active_adapter\": {",
        "\"schema\": \"pulsec.windows_x64.startup_loader_contract.v1\"",
        "\"startup_entry_symbol\": \"mainCRTStartup\"",
        "\"loader_manifest_schema\": \"pulsec.shared.launch.v1\"",
        "\"loader_manifest_path\": \"bin/launch.txt\"",
        "\"requested_target\": {",
        "\"schema\": \"pulsec.pulseos.startup_loader_contract.v1\"",
        "\"startup_entry_symbol\": \"pulseos_start\"",
        "\"startup_entry_abi\": \"pulseos-loader-entry-v1\"",
        "\"loader_handoff_kind\": \"opaque-startup-context-handle\"",
        "\"publication_shape\": \"profile-bin-layout-with-launch-manifest\"",
        "\"published_artifacts\": [\"bin/<entry>\", \"bin/launch.json\"]",
        "\"loader_manifest_schema\": \"pulsec.pulseos.launch.v1\"",
        "\"loader_manifest_path\": \"bin/launch.json\"",
        "\"runtime_companion_policy\": \"shared-request-collapses-to-single-image-layout\"",
    ] {
        assert!(
            pulseos_plan.contains(needle),
            "native plan missing RB-16 startup/loader contract needle '{}'",
            needle
        );
    }

    let windows_plan = render_native_build_plan_with_target_and_output_mode(
        &IrProgram { classes: vec![] },
        PathBuf::from("build/pulsec.ir.txt").as_path(),
        "windows-x64",
        "fat",
        "main",
    );
    assert!(windows_plan.contains("\"startup_loader_contracts\": {"));
    assert!(windows_plan.contains("\"requested_target\": {"));
    assert!(windows_plan.contains("\"schema\": \"pulsec.windows_x64.startup_loader_contract.v1\""));
    assert!(windows_plan.contains("\"startup_entry_symbol\": \"mainCRTStartup\""));
    assert!(windows_plan.contains("\"loader_manifest_schema\": null"));
}

#[test]
fn rb_17_pulseos_executable_loading_proof_target_is_explicit() {
    let proof = resolve_requested_target_executable_loading_proof_target("pulseos-x64", "shared")
        .expect("pulseos loading proof target should resolve")
        .expect("pulseos loading proof target should be published");
    assert_eq!(proof.schema, "pulsec.pulseos.loading_proof_target.v1");
    assert_eq!(proof.target_id, "pulseos-x64");
    assert_eq!(proof.requested_output_mode, "shared");
    assert_eq!(proof.proof_status, "first-contract-level-loading-target");
    assert_eq!(
        proof.implementation_status,
        "proof-contract-defined-execution-deferred"
    );
    assert_eq!(proof.validation_mode, "contract-shape-only");
    assert_eq!(
        proof.startup_loader_contract_schema,
        "pulsec.pulseos.startup_loader_contract.v1"
    );
    assert_eq!(
        proof.artifact_contract_schema,
        "pulsec.pulseos.artifact_contract.v1"
    );
    assert_eq!(
        proof.runtime_service_contract_schema,
        "pulsec.pulseos.runtime_service.v1"
    );
    assert!(proof.required_published_artifacts.contains(&"bin/<entry>"));
    assert!(proof
        .required_published_artifacts
        .contains(&"bin/launch.json"));
    assert_eq!(proof.required_startup_entry_symbol, "pulseos_start");
    assert_eq!(
        proof.required_loader_manifest_schema,
        "pulsec.pulseos.launch.v1"
    );
    assert_eq!(proof.required_loader_manifest_path, "bin/launch.json");
    assert!(proof
        .required_loader_capabilities
        .contains(&"provide-opaque-startup-context-for-runtime-services"));
    assert!(proof
        .required_runtime_bootstrap_sequence
        .contains(&"pulsec_rt_init"));
    assert!(proof
        .success_conditions
        .contains(&"startup-entry-symbol-pulseos_start-is-resolvable"));
    assert!(proof
        .excluded_claims
        .contains(&"does-not-prove-real-loader-execution-yet"));

    let windows = resolve_requested_target_executable_loading_proof_target("windows-x64", "fat")
        .expect("windows loading proof target should resolve");
    assert!(windows.is_none());
}

#[test]
fn rb_17_native_plan_emits_requested_pulseos_executable_loading_proof_target() {
    let pulseos_plan = render_native_build_plan_with_target_and_output_mode(
        &IrProgram { classes: vec![] },
        PathBuf::from("build/pulsec.ir.txt").as_path(),
        "pulseos-x64",
        "shared",
        "launcher",
    );
    for needle in [
        "\"requested_target_executable_loading_proof_target\": {",
        "\"schema\": \"pulsec.pulseos.loading_proof_target.v1\"",
        "\"target_id\": \"pulseos-x64\"",
        "\"proof_status\": \"first-contract-level-loading-target\"",
        "\"implementation_status\": \"proof-contract-defined-execution-deferred\"",
        "\"validation_mode\": \"contract-shape-only\"",
        "\"startup_loader_contract_schema\": \"pulsec.pulseos.startup_loader_contract.v1\"",
        "\"artifact_contract_schema\": \"pulsec.pulseos.artifact_contract.v1\"",
        "\"runtime_service_contract_schema\": \"pulsec.pulseos.runtime_service.v1\"",
        "\"required_published_artifacts\": [\"bin/<entry>\", \"bin/launch.json\"]",
        "\"required_startup_entry_symbol\": \"pulseos_start\"",
        "\"required_loader_manifest_schema\": \"pulsec.pulseos.launch.v1\"",
        "\"required_loader_manifest_path\": \"bin/launch.json\"",
        "\"required_loader_capabilities\": [\"map-primary-program-image-before-entry\", \"resolve-pulseos_start-from-primary-image\", \"provide-opaque-startup-context-for-runtime-services\", \"surface-launch-manifest-metadata-from-bin-launch.json\", \"propagate-returned-i32-as-process-exit-code\"]",
        "\"success_conditions\": [\"primary-program-image-is-published-at-bin-entry\", \"launch-manifest-is-published-at-bin-launch-json\", \"startup-entry-symbol-pulseos_start-is-resolvable\", \"loader-handoff-enables-published-runtime-service-capabilities\", \"runtime-bootstrap-sequence-reaches-app-entry-and-exit-code-return\"]",
    ] {
        assert!(
            pulseos_plan.contains(needle),
            "native plan missing RB-17 executable-loading proof target needle '{}'",
            needle
        );
    }

    let windows_plan = render_native_build_plan_with_target_and_output_mode(
        &IrProgram { classes: vec![] },
        PathBuf::from("build/pulsec.ir.txt").as_path(),
        "windows-x64",
        "fat",
        "main",
    );
    assert!(windows_plan.contains("\"requested_target_executable_loading_proof_target\": null"));
}

#[test]
fn m3_14_native_runtime_symbol_inventory_is_locked() {
    let symbols = default_stdlib_symbols();
    let actual: HashSet<String> = symbols.values().cloned().collect();
    let expected: HashSet<String> = expected_native_runtime_symbols()
        .into_iter()
        .map(|s| s.to_string())
        .collect();
    let missing: Vec<String> = expected.difference(&actual).cloned().collect();
    assert!(
        missing.is_empty(),
        "missing runtime symbols in backend map: {:?}",
        missing
    );
}

#[test]
fn m3_14_runtime_intrinsics_doc_mentions_locked_surface() {
    let doc_path = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..")
        .join("docs")
        .join("RUNTIME_INTRINSICS_ABI.md");
    let doc = fs::read_to_string(&doc_path).expect("read RUNTIME_INTRINSICS_ABI.md");

    for intrinsic in expected_intrinsics_surface() {
        let method = if let Some(method) = intrinsic.strip_prefix("pulse.rt.Intrinsics.") {
            method
        } else if let Some(method) = intrinsic.strip_prefix("pulse.memory.Memory.") {
            method
        } else if let Some(method) = intrinsic.strip_prefix("pulse.lang.Class.") {
            method
        } else if let Some(method) = intrinsic.strip_prefix("pulse.lang.String.") {
            method
        } else if let Some(method) = intrinsic.strip_prefix("pulse.lang.Char.") {
            method
        } else if let Some(method) = intrinsic.strip_prefix("pulse.lang.Double.") {
            method
        } else if let Some(method) = intrinsic.strip_prefix("pulse.lang.Long.") {
            method
        } else if let Some(method) = intrinsic.strip_prefix("pulse.lang.UInteger.") {
            method
        } else if let Some(method) = intrinsic.strip_prefix("pulse.lang.ULong.") {
            method
        } else {
            panic!("intrinsic prefix");
        };
        assert!(
            doc.contains(method),
            "ABI doc missing intrinsic method '{}'",
            method
        );
    }
    for symbol in expected_native_runtime_symbols() {
        assert!(
            doc.contains(symbol),
            "ABI doc missing native symbol '{}'",
            symbol
        );
    }
}

#[test]
fn c2_08_handle_lanes_use_qword_storage_in_emitted_runtime_bridge() {
    let mut src = String::new();
    emit_array_new_proc(&mut src, "pulsec_rt_arrayNew");
    emit_array_get_proc(&mut src, "pulsec_rt_arrayGetString", "rt_arr_s_ptr");
    emit_array_set_proc(&mut src, "pulsec_rt_arraySetString", "rt_arr_s_ptr");
    emit_list_add_proc(&mut src, "pulsec_rt_listAddString", "rt_list_s_ptr");
    emit_list_get_proc(&mut src, "pulsec_rt_listGetString", "rt_list_s_ptr");
    emit_map_contains_proc(&mut src, "pulsec_rt_mapContainsKey");
    emit_map_put_proc(&mut src, "pulsec_rt_mapPut", false);
    emit_map_get_proc(&mut src, "pulsec_rt_mapGet", false);

    for needle in [
        "mov rax, qword ptr [r9+rdx*8]",
        "mov qword ptr [r10+rdx*8], r8",
        "mov qword ptr [r11+r8*8], rcx",
        "mov rax, qword ptr [r11+rdx*8]",
        "mov rcx, qword ptr [r11+r9*8]",
        "mov rcx, qword ptr [r10+rax*8]",
        "mov qword ptr [r10+rax*8], rdx",
        "mov qword ptr [r10+r9*8], rdx",
        "mov rax, qword ptr [rax+r9*8]",
    ] {
        assert!(
            src.contains(needle),
            "runtime emitter lost 64-bit handle lane op '{}'",
            needle
        );
    }

    let zeroed_allocs = src
        .matches("mov edx, 8\n    mov r8, qword ptr [rt_tmp_arr_bytes]\n    call HeapAlloc")
        .count();
    assert!(
        zeroed_allocs >= 2,
        "arrayNew must request zeroed HeapAlloc storage for both array lanes"
    );
}

#[test]
fn e2_01_runtime_ownership_inventory_mentions_blocking_shared_boundary_surfaces() {
    let doc_path = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..")
        .join("docs")
        .join("RUNTIME_OWNERSHIP_INVENTORY.md");
    let doc = fs::read_to_string(&doc_path).expect("read RUNTIME_OWNERSHIP_INVENTORY.md");

    for needle in [
        "pulsec.runtime.ownership.inventory.v1",
        "pulsec_rt_obj_class_ids",
        "rt_arc_refcounts_tbl",
        "rt_weak_generation",
        "rt_list_count",
        "rt_map_count",
        "rt_trace_depth",
        "collect_object_field_storage_symbols(...)",
        "Resolution in `E2-06`",
        "CLASS_SUPER_RESOLUTION",
    ] {
        assert!(
            doc.contains(needle),
            "runtime ownership inventory missing '{}'",
            needle
        );
    }
}

#[test]
fn e2_02_runtime_ownership_policy_locks_runtime_private_vs_app_visible_boundary() {
    let doc_path = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..")
        .join("docs")
        .join("RUNTIME_OWNERSHIP_POLICY.md");
    let doc = fs::read_to_string(&doc_path).expect("read RUNTIME_OWNERSHIP_POLICY.md");

    for needle in [
        "pulsec.runtime.ownership.policy.v1",
        "Runtime-Private",
        "App-Visible Through ABI Only",
        "App-Owned",
        "pulsec_rt_init",
        "pulsec_rt_objectNew",
        "pulsec_rt_arcRetain",
        "collect_object_field_storage_symbols(...)",
        "removed in `E2-06`",
        "User field storage symbols",
        "Compiler resolution caches",
    ] {
        assert!(
            doc.contains(needle),
            "runtime ownership policy missing '{}'",
            needle
        );
    }
}

#[test]
fn e2_03_shared_runtime_abi_doc_and_plan_lock_import_boundary() {
    let doc_path = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..")
        .join("docs")
        .join("SHARED_RUNTIME_ABI.md");
    let doc = fs::read_to_string(&doc_path).expect("read SHARED_RUNTIME_ABI.md");
    for needle in [
        "pulsec.shared_runtime.abi.v1",
        "pulsec_rt_init",
        "pulsec_rt_shutdown",
        "pulsec_rt_objectNew",
        "pulsec_rt_objectClassId",
        "pulsec_rt_arcRetain",
        "pulsec_rt_dispatchNullReceiverPanic",
        "procedure-only",
        "Removed Coupling",
    ] {
        assert!(
            doc.contains(needle),
            "shared runtime ABI doc missing '{}'",
            needle
        );
    }

    let plan = render_native_build_plan_with_output_mode(
        &IrProgram { classes: vec![] },
        PathBuf::from("build/pulsec.ir.txt").as_path(),
        "shared",
        "launcher",
    );
    for needle in [
            "\"shared_runtime_abi\": {",
            "\"schema\": \"pulsec.shared_runtime.abi.v1\"",
            "\"mode\": \"shared\"",
            "\"kind\": \"procedure_only\"",
            "\"pulsec_rt_init\"",
            "\"pulsec_rt_shutdown\"",
            "\"pulsec_rt_objectNew\"",
            "\"pulsec_rt_objectClassId\"",
            "\"pulsec_rt_arcRetain\"",
            "\"pulsec_rt_dispatchNullReceiverPanic\"",
            "\"forbidden_data_import_patterns\": [\"rt_arc_*\", \"rt_weak_*\", \"rt_list_*\", \"rt_map_*\", \"rt_arr_*\", \"pulsec_rt_obj_*\"]",
            "\"exports\": {",
            "\"visibility\": \"minimal_versioned_abi\"",
            "\"init_sequence\": [\"startup_entry\", \"pulsec_rt_init\", \"app_entry\", \"pulsec_rt_shutdown\", \"ExitProcess\"]",
            "\"user_field_storage_imports\": \"removed_in_e2_06\"",
        ] {
            assert!(plan.contains(needle), "shared runtime ABI plan missing '{}'", needle);
        }
}

#[test]
fn e1_09_shared_runtime_export_policy_is_minimal_and_procedure_only() {
    let exports = shared_runtime_export_symbols();
    assert!(
        exports.iter().all(|symbol| !symbol.starts_with("rt_")),
        "shared runtime export set must not expose runtime-private rt_* data: {:?}",
        exports
    );
    assert!(
        exports
            .iter()
            .all(|symbol| !symbol.starts_with("pulsec_rt_obj_")),
        "shared runtime export set must not expose runtime-private object tables: {:?}",
        exports
    );
    for required in [
        "pulsec_rt_init",
        "pulsec_rt_shutdown",
        "pulsec_rt_objectNew",
        "pulsec_rt_objectClassId",
        "pulsec_rt_consoleWriteLine",
        "pulsec_rt_arcRetain",
        "pulsec_rt_mapPutInt",
        "pulsec_pulse_lang_IO_println__String",
    ] {
        assert!(
            exports.iter().any(|symbol| symbol == required),
            "shared runtime export set missing required ABI procedure '{}'",
            required
        );
    }
}

#[test]
fn e2_04_shared_runtime_abi_compatibility_policy_is_locked() {
    let doc_path = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..")
        .join("docs")
        .join("SHARED_RUNTIME_ABI.md");
    let doc = fs::read_to_string(&doc_path).expect("read SHARED_RUNTIME_ABI.md");
    for needle in [
        "Versioning and Compatibility Policy",
        "runtime_abi_schema = pulsec.runtime.abi.v1",
        "runtime_abi_version = 2",
        "object_model_abi_schema = pulsec.object_model.abi.v1",
        "object_model_abi_version = 1",
        "version_source = pulsec_toolchain_semver",
        "deterministic-fail-fast",
        "Runtime ABI mismatch",
        "Object model ABI mismatch",
    ] {
        assert!(
            doc.contains(needle),
            "shared runtime ABI compatibility doc missing '{}'",
            needle
        );
    }

    let plan = render_native_build_plan_with_output_mode(
        &IrProgram { classes: vec![] },
        PathBuf::from("build/pulsec.ir.txt").as_path(),
        "shared",
        "launcher",
    );
    for needle in [
        "\"compatibility\": {",
        "\"runtime_abi_schema\": \"pulsec.runtime.abi.v1\"",
        "\"runtime_abi_version\": 2",
        "\"object_model_abi_schema\": \"pulsec.object_model.abi.v1\"",
        "\"object_model_abi_version\": 1",
        "\"version_source\": \"pulsec_toolchain_semver\"",
        "\"mismatch_policy\": \"deterministic-fail-fast\"",
    ] {
        assert!(
            plan.contains(needle),
            "shared runtime ABI compatibility plan missing '{}'",
            needle
        );
    }
}

#[test]
fn e2_05_shared_runtime_state_layout_is_locked_to_runtime_library_storage() {
    let doc_path = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..")
        .join("docs")
        .join("SHARED_RUNTIME_STATE_LAYOUT.md");
    let doc = fs::read_to_string(&doc_path).expect("read SHARED_RUNTIME_STATE_LAYOUT.md");
    for needle in [
        "pulsec.shared_runtime.state_layout.v1",
        "runtime metadata/state placement is `runtime_library_storage`",
        "allocator state placement is `runtime_library_storage`",
        "pulsec_rt_obj_class_ids",
        "rt_handle_next",
        "rt_slot_capacity",
        "rt_arc_refcounts_tbl",
        "rt_weak_generation",
        "rt_list_*",
        "rt_map_*",
        "app-owned per-class field-capacity helpers",
    ] {
        assert!(
            doc.contains(needle),
            "shared runtime state layout doc missing '{}'",
            needle
        );
    }

    let plan = render_native_build_plan_with_output_mode(
        &IrProgram { classes: vec![] },
        PathBuf::from("build/pulsec.ir.txt").as_path(),
        "shared",
        "launcher",
    );
    for needle in [
            "\"runtime_state_layout\": {",
            "\"schema\": \"pulsec.shared_runtime.state_layout.v1\"",
            "\"metadata_state\": \"runtime_library_storage\"",
            "\"allocator_state\": \"runtime_library_storage\"",
            "\"object_metadata_symbols\": [\"pulsec_rt_obj_counter\", \"pulsec_rt_obj_class_ids\", \"pulsec_rt_obj_class_ids_init\", \"pulsec_rt_obj_class_ids_heap_owned\"]",
            "\"allocator_symbols\": [\"rt_handle_next\", \"rt_slot_capacity\", \"rt_arc_free_head\", \"rt_arc_free_next_tbl\", \"rt_arc_heap_owned\"]",
            "\"arc_symbols\": [\"rt_arc_refcounts_tbl\", \"rt_arc_kinds_tbl\", \"rt_arc_flags_tbl\", \"rt_arc_meta_tbl\", \"rt_arc_generation_tbl\"]",
            "\"weak_symbols\": [\"rt_weak_next\", \"rt_weak_free_head\", \"rt_weak_generation\"]",
            "\"container_registry_symbols\": [\"rt_arr_*\", \"rt_list_*\", \"rt_map_*\", \"rt_str_*\"]",
            "\"user_field_storage_runtime_dependency\": \"removed_in_e2_06\"",
        ] {
            assert!(plan.contains(needle), "shared runtime state layout plan missing '{}'", needle);
        }
}

#[test]
fn e2_09_shared_boundary_plan_emits_explicit_ownership_import_and_lookup_metadata() {
    let plan = render_native_build_plan_with_output_mode(
        &IrProgram { classes: vec![] },
        PathBuf::from("build/pulsec.ir.txt").as_path(),
        "shared",
        "launcher",
    );
    for needle in [
            "\"shared_boundary\": {",
            "\"schema\": \"pulsec.shared_boundary.v1\"",
            "\"mode\": \"shared\"",
            "\"participants\": {",
            "\"app\": \"app_executable\"",
            "\"runtime\": \"shared_runtime_library\"",
            "\"ownership_boundary\": {",
            "\"app_owned\": [\"startup_object\", \"user_method_objects\"]",
            "\"runtime_owned\": [\"runtime_private_state\", \"allocator_state\", \"container_registries\", \"trace_state\"]",
            "\"cross_boundary_access\": \"procedure_imports_and_lookup_metadata_only\"",
            "\"import_boundary\": {",
            "\"app_import_kind\": \"import_library\"",
            "\"runtime_visibility\": \"minimal_versioned_abi\"",
            "\"runtime_private_data_imports\": \"forbidden\"",
            "\"runtime_lookup_metadata\": {",
            "\"schema\": \"pulsec.shared_runtime.lookup.v1\"",
            "\"lookup_policy\": \"relative-sibling-runtime\"",
            "\"published_build\": {",
            "\"launch_descriptor\": \"bin/launch.txt\"",
            "\"runtime_library\": \"../lib/pulsecore-",
            "\"runtime_import_library\": \"../lib/pulsecore-",
            "\"staged_package\": {",
            "\"launch_descriptor\": \"staging/bin/launch.txt\"",
            "\"runtime_library\": \"../libraries/pulsecore-",
            "\"runtime_import_library\": \"../libraries/pulsecore-",
        ] {
            assert!(plan.contains(needle), "shared boundary plan missing '{}'", needle);
        }
}

#[test]
fn e2_07_runtime_init_and_startup_bootstrap_are_locked() {
    let doc_path = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..")
        .join("docs")
        .join("SHARED_RUNTIME_ABI.md");
    let doc = fs::read_to_string(&doc_path).expect("read SHARED_RUNTIME_ABI.md");
    for needle in [
        "rt_runtime_init_state",
        "rt_runtime_init_epoch",
        "idempotent",
        "startup imports and calls `pulsec_rt_init`",
    ] {
        assert!(
            doc.contains(needle),
            "shared runtime ABI bootstrap doc missing '{}'",
            needle
        );
    }

    let policy_path = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..")
        .join("docs")
        .join("RUNTIME_OWNERSHIP_POLICY.md");
    let policy = fs::read_to_string(&policy_path).expect("read RUNTIME_OWNERSHIP_POLICY.md");
    for needle in ["rt_runtime_init_state", "rt_runtime_init_epoch"] {
        assert!(
            policy.contains(needle),
            "runtime ownership policy missing '{}'",
            needle
        );
    }

    let mut init_src = String::new();
    emit_runtime_data_tables(&mut init_src);
    init_src.push_str(".code\n");
    emit_runtime_init_proc(&mut init_src, "pulsec_rt_init", WRITE_RAW_SYMBOL);
    for needle in [
        "public rt_runtime_init_state",
        "public rt_runtime_init_epoch",
        "cmp dword ptr [rt_runtime_init_state], 1",
        "mov dword ptr [rt_runtime_init_state], 1",
        "mov eax, dword ptr [rt_runtime_init_epoch]",
        "mov dword ptr [rt_runtime_init_epoch], eax",
    ] {
        assert!(
            init_src.contains(needle),
            "runtime init source missing '{}'",
            needle
        );
    }

    let mut startup_src = String::new();
    startup_src.push_str("option casemap:none\n");
    startup_src.push_str("extrn ExitProcess:proc\n");
    startup_src.push_str("extrn pulsec_rt_init:proc\n");
    startup_src.push_str("extrn app_entry:proc\n\n");
    startup_src.push_str(".code\n");
    emit_startup_entry_proc(
        &mut startup_src,
        "mainCRTStartup",
        "pulsec_rt_init",
        "pulsec_rt_shutdown",
        "app_entry",
    );
    for needle in [
        "mainCRTStartup proc",
        "call pulsec_rt_init",
        "call app_entry",
        "call ExitProcess",
    ] {
        assert!(
            startup_src.contains(needle),
            "startup bootstrap source missing '{}'",
            needle
        );
    }
    assert!(
        startup_src.find("call pulsec_rt_init").unwrap()
            < startup_src.find("call app_entry").unwrap(),
        "startup bootstrap must call runtime init before app entry\n{}",
        startup_src
    );
}

#[test]
fn e2_08_runtime_shutdown_boundary_is_locked() {
    let doc_path = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..")
        .join("docs")
        .join("SHARED_RUNTIME_ABI.md");
    let doc = fs::read_to_string(&doc_path).expect("read SHARED_RUNTIME_ABI.md");
    for needle in [
        "pulsec_rt_shutdown",
        "startup calls `pulsec_rt_shutdown`",
        "startup remains responsible for the final process exit call",
    ] {
        assert!(
            doc.contains(needle),
            "shared runtime ABI shutdown doc missing '{}'",
            needle
        );
    }

    let mut shutdown_src = String::new();
    emit_runtime_data_tables(&mut shutdown_src);
    shutdown_src.push_str(".code\n");
    emit_runtime_shutdown_proc(&mut shutdown_src, "pulsec_rt_shutdown");
    for needle in [
        "pulsec_rt_shutdown proc",
        "cmp dword ptr [rt_runtime_init_state], 1",
        "call HeapFree",
        "mov qword ptr [rt_str_lens_ptr], 0",
        "mov qword ptr [rt_str_data_ptr], 0",
        "mov dword ptr [rt_runtime_init_state], 0",
    ] {
        assert!(
            shutdown_src.contains(needle),
            "runtime shutdown source missing '{}'",
            needle
        );
    }

    let mut startup_src = String::new();
    startup_src.push_str("option casemap:none\n");
    startup_src.push_str("extrn ExitProcess:proc\n");
    startup_src.push_str("extrn pulsec_rt_init:proc\n");
    startup_src.push_str("extrn pulsec_rt_shutdown:proc\n");
    startup_src.push_str("extrn app_entry:proc\n\n");
    startup_src.push_str(".code\n");
    emit_startup_entry_proc(
        &mut startup_src,
        "mainCRTStartup",
        "pulsec_rt_init",
        "pulsec_rt_shutdown",
        "app_entry",
    );
    for needle in [
        "call pulsec_rt_init",
        "call app_entry",
        "call pulsec_rt_shutdown",
        "call ExitProcess",
    ] {
        assert!(
            startup_src.contains(needle),
            "startup lifecycle source missing '{}'",
            needle
        );
    }
    assert!(
        startup_src.find("call app_entry").unwrap()
            < startup_src.find("call pulsec_rt_shutdown").unwrap()
            && startup_src.find("call pulsec_rt_shutdown").unwrap()
                < startup_src.find("call ExitProcess").unwrap(),
        "startup shutdown order must be app entry -> runtime shutdown -> ExitProcess\n{}",
        startup_src
    );
}

#[test]
fn c2_01_native_plan_contains_locked_arc_header_contract() {
    let plan = render_native_build_plan(
        &IrProgram { classes: vec![] },
        PathBuf::from("build/pulsec.ir.txt").as_path(),
    );
    assert!(
        plan.contains("\"memory_model\""),
        "native plan missing memory model section"
    );
    assert!(
        plan.contains("\"strategy\": \"arc\""),
        "native plan missing ARC strategy"
    );
    assert!(
        plan.contains("\"header_schema\": \"pulsec.arc.header.v1\""),
        "native plan missing ARC header schema"
    );
    assert!(
        plan.contains("\"abi_version\": \"v2\""),
        "native plan missing ABI version lock"
    );
    assert!(
        plan.contains("\"words\": [\"kind_tag\", \"refcount\", \"flags\", \"meta_index\"]"),
        "native plan missing ARC header word lock"
    );
    assert!(
        plan.contains("\"refcount_saturation_guard\": 4294967294"),
        "native plan missing refcount saturation guard lock"
    );
}

#[test]
fn e1_02_native_plan_shared_output_topology_is_locked() {
    let plan = render_native_build_plan_with_output_mode(
        &IrProgram { classes: vec![] },
        PathBuf::from("build/pulsec.ir.txt").as_path(),
        "shared",
        "launcher",
    );
    assert!(plan.contains("\"outputs\": {"));
    assert!(plan.contains("\"mode\": \"shared\""));
    assert!(plan.contains("\"entrypoint\": \"launcher\""));
    assert!(plan.contains("\"id\": \"runtime_library\""));
    assert!(plan.contains("\"kind\": \"dll\""));
    assert!(plan.contains("\"id\": \"runtime_import_library\""));
    assert!(plan.contains("\"kind\": \"import_lib\""));
    assert!(plan.contains("\"id\": \"runtime_lookup_metadata\""));
}

#[test]
fn e1_03_shared_runtime_binary_naming_is_locked() {
    let plan = render_native_build_plan_with_output_mode(
        &IrProgram { classes: vec![] },
        PathBuf::from("build/pulsec.ir.txt").as_path(),
        "shared",
        "launcher",
    );
    let version = env!("CARGO_PKG_VERSION");
    assert!(plan.contains("\"base_name\": \"pulsecore\""));
    assert!(plan.contains(&format!("\"file_name\": \"pulsecore-{version}.dll\"")));
    assert!(plan.contains(&format!("\"file_name\": \"pulsecore-{version}.lib\"")));
    assert!(plan.contains("\"version_source\": \"pulsec_toolchain_semver\""));
    assert!(plan.contains(&format!("\"version\": \"{version}\"")));
}

#[test]
fn e1_05_native_plan_locks_app_vs_runtime_link_ownership() {
    let plan = render_native_build_plan_with_output_mode(
        &IrProgram { classes: vec![] },
        PathBuf::from("build/pulsec.ir.txt").as_path(),
        "shared",
        "launcher",
    );
    assert!(plan.contains("\"link_plan\": {"));
    assert!(plan.contains("\"startup_objects\": ["));
    assert!(plan.contains("Startup.obj"));
    assert!(plan.contains("\"app_owned_objects\": ["));
    assert!(plan.contains("\"runtime_owned_objects\": ["));
    assert!(plan.contains("StdlibRuntime.obj"));
    assert!(plan.contains("\"owner\": \"app_executable\""));
    assert!(plan.contains("\"owner\": \"shared_runtime_candidate\""));
    assert!(plan.contains(
            "{ \"id\": \"app_executable\", \"consumes\": [\"startup_objects\", \"app_owned_objects\", \"runtime_import_library\", \"system_inputs\"], \"linkage_kind\": \"import_library\", \"runtime_load\": \"peer_runtime_library\""
        ));
    assert!(plan.contains(&format!(
        "\"runtime_artifact\": \"pulsecore-{}.dll\"",
        env!("CARGO_PKG_VERSION")
    )));
    assert!(plan.contains(&format!(
        "\"import_artifact\": \"pulsecore-{}.lib\"",
        env!("CARGO_PKG_VERSION")
    )));
    assert!(plan.contains(
            "{ \"id\": \"runtime_library\", \"consumes\": [\"runtime_owned_objects\", \"system_inputs\"], \"linkage_kind\": \"shared_runtime_library\" }"
        ));
}

#[test]
fn e1_02_native_plan_fat_output_topology_is_locked() {
    let plan = render_native_build_plan_with_output_mode(
        &IrProgram { classes: vec![] },
        PathBuf::from("build/pulsec.ir.txt").as_path(),
        "fat",
        "main",
    );
    assert!(plan.contains("\"outputs\": {"));
    assert!(plan.contains("\"mode\": \"fat\""));
    assert!(plan.contains("\"entrypoint\": \"main\""));
    assert!(plan.contains("\"id\": \"app_executable\""));
    assert!(plan.contains("\"id\": \"runtime_payload\""));
    assert!(plan.contains("\"kind\": \"embedded\""));
}

#[test]
fn c2_08_native_plan_contains_locked_allocator_policy_contract() {
    let plan = render_native_build_plan(
        &IrProgram { classes: vec![] },
        PathBuf::from("build/pulsec.ir.txt").as_path(),
    );
    assert!(
        plan.contains("\"allocator\""),
        "native plan missing allocator section"
    );
    assert!(
        plan.contains("\"schema\": \"pulsec.alloc.policy.v1\""),
        "native plan missing allocator schema lock"
    );
    assert!(
        plan.contains("\"backend\": \"win64-process-heap\""),
        "native plan missing allocator backend lock"
    );
    assert!(
        plan.contains(&format!(
            "\"slot_capacity\": {}",
            super::HANDLE_SLOT_CAPACITY
        )),
        "native plan missing slot capacity lock"
    );
    assert!(
        plan.contains(&format!(
            "\"slot_capacity_initial\": {}",
            super::HANDLE_SLOT_INITIAL_CAPACITY
        )),
        "native plan missing initial slot capacity lock"
    );
    assert!(
        plan.contains("\"slot_capacity_growth\": \"runtime-doubling\""),
        "native plan missing slot growth policy lock"
    );
    assert!(
        plan.contains("\"pointer_bytes\": 8"),
        "native plan missing pointer alignment lock"
    );
    assert!(
        plan.contains("\"lane_bytes\": { \"int\": 4, \"handle\": 8 }"),
        "native plan missing lane alignment lock"
    );
    assert!(
        plan.contains("\"container_storage\""),
        "native plan missing container storage section"
    );
    assert!(
        plan.contains("\"list\"")
            && plan.contains("\"init_capacity\": 16")
            && plan.contains(&format!("\"max_capacity\": {}", super::LIST_MAX_CAPACITY))
            && plan.contains("\"growth_factor\": { \"numerator\": 2, \"denominator\": 1 }")
            && plan.contains("\"shrink\": { \"hysteresis_trigger_multiplier\": 4 }"),
        "native plan missing list growth policy lock"
    );
    assert!(
        plan.contains("\"map\"")
            && plan.contains("\"init_capacity\": 16")
            && plan.contains(&format!("\"max_capacity\": {}", super::MAP_MAX_CAPACITY))
            && plan.contains("\"growth_factor\": { \"numerator\": 2, \"denominator\": 1 }")
            && plan.contains("\"shrink\": { \"hysteresis_trigger_multiplier\": 4 }"),
        "native plan missing map growth policy lock"
    );
    assert!(
        plan.contains("\"failure_mode\": \"deterministic-fatal\""),
        "native plan missing allocator failure mode lock"
    );
    assert!(
        plan.contains("\"frame_budget\""),
        "native plan missing frame budget section"
    );
    assert!(
        plan.contains(&format!(
            "\"warn_bytes\": {}",
            super::FRAME_BUDGET_WARN_BYTES
        )),
        "native plan missing frame budget warn threshold"
    );
    assert!(
        plan.contains(&format!(
            "\"fail_bytes\": {}",
            super::FRAME_BUDGET_FAIL_BYTES
        )),
        "native plan missing frame budget fail threshold"
    );
}

#[test]
fn c2_23_native_plan_contains_threading_contract() {
    let plan = render_native_build_plan(
        &IrProgram { classes: vec![] },
        PathBuf::from("build/pulsec.ir.txt").as_path(),
    );
    assert!(
        plan.contains("\"threading\""),
        "native plan missing threading contract section"
    );
    assert!(
        plan.contains("\"schema\": \"pulsec.runtime.threading.v1\""),
        "native plan missing threading schema lock"
    );
    assert!(
        plan.contains("\"model\": \"single-threaded\""),
        "native plan missing threading model lock"
    );
    assert!(
        plan.contains("\"arc_atomicity\": \"non-atomic\""),
        "native plan missing ARC atomicity lock"
    );
    assert!(
        plan.contains("\"runtime_thread_safety\": \"not-thread-safe\""),
        "native plan missing runtime thread safety lock"
    );
    assert!(
        plan.contains("\"container_thread_safety\": \"not-thread-safe\""),
        "native plan missing container thread safety lock"
    );
}

#[test]
fn c2_24_native_plan_contains_abi_compatibility_contract() {
    let plan = render_native_build_plan(
        &IrProgram { classes: vec![] },
        PathBuf::from("build/pulsec.ir.txt").as_path(),
    );
    assert!(
        plan.contains("\"abi_compatibility\""),
        "native plan missing ABI compatibility section"
    );
    assert!(
        plan.contains("\"schema\": \"pulsec.runtime.abi.v1\""),
        "native plan missing ABI compatibility schema"
    );
    assert!(
        plan.contains("\"compiler_abi_version\": 2"),
        "native plan missing compiler ABI version lock"
    );
    assert!(
        plan.contains("\"runtime_abi_version\": 2"),
        "native plan missing runtime ABI version lock"
    );
    assert!(
        plan.contains("\"mismatch_policy\": \"deterministic-fail-fast\""),
        "native plan missing ABI mismatch policy lock"
    );
}

#[test]
fn c3_01_native_plan_contains_object_layout_contract() {
    let plan = render_native_build_plan(
        &IrProgram { classes: vec![] },
        PathBuf::from("build/pulsec.ir.txt").as_path(),
    );
    assert!(
        plan.contains("\"object_model\""),
        "native plan missing object model section"
    );
    assert!(
        plan.contains("\"schema\": \"pulsec.object.layout.v1\""),
        "native plan missing object model schema lock"
    );
    assert!(
        plan.contains("\"layout_version\": 1"),
        "native plan missing object layout version lock"
    );
    assert!(
        plan.contains("\"header_bytes\": 16"),
        "native plan missing object header size lock"
    );
    assert!(
        plan.contains("\"field_slot_bytes\": 8"),
        "native plan missing object field slot size lock"
    );
    assert!(
        plan.contains("\"alignment_bytes\": 8"),
        "native plan missing object alignment lock"
    );
    assert!(
        plan.contains("\"field_ordering\": \"declaration-order\""),
        "native plan missing object field ordering lock"
    );
    assert!(
        plan.contains("\"inherited_field_placement\": \"base-prefix-then-derived\""),
        "native plan missing inherited-field placement lock"
    );
}

#[test]
fn c3_02_native_plan_contains_static_storage_contract() {
    let plan = render_native_build_plan(
        &IrProgram { classes: vec![] },
        PathBuf::from("build/pulsec.ir.txt").as_path(),
    );
    assert!(
        plan.contains("\"static_storage\""),
        "native plan missing static storage section"
    );
    assert!(
        plan.contains("\"schema\": \"pulsec.static.storage.v1\""),
        "native plan missing static storage schema lock"
    );
    assert!(
        plan.contains("\"owner_model\": \"class-owned\""),
        "native plan missing static storage owner model lock"
    );
    assert!(
        plan.contains("\"symbol_model\": \"per-class-field-symbol\""),
        "native plan missing static storage symbol model lock"
    );
    assert!(
        plan.contains("\"initialization_order\": \"declaration-order-within-class\""),
        "native plan missing static field init-order lock"
    );
    assert!(
        plan.contains("\"class_reference_read\": \"allowed\"")
            && plan.contains("\"class_reference_write\": \"allowed\"")
            && plan.contains("\"instance_reference_read\": \"forbidden\"")
            && plan.contains("\"instance_reference_write\": \"forbidden\""),
        "native plan missing static storage access-rule lock"
    );
}

#[test]
fn c3_03_native_plan_contains_constructor_model_contract() {
    let plan = render_native_build_plan(
        &IrProgram { classes: vec![] },
        PathBuf::from("build/pulsec.ir.txt").as_path(),
    );
    assert!(
        plan.contains("\"constructor_model\""),
        "native plan missing constructor model section"
    );
    assert!(
        plan.contains("\"schema\": \"pulsec.constructor.model.v1\""),
        "native plan missing constructor model schema lock"
    );
    assert!(
        plan.contains("\"receiver_allocation\": \"allocated-before-body\""),
        "native plan missing constructor receiver-allocation lock"
    );
    assert!(
        plan.contains("\"chaining\": \"explicit-this-super-unsupported\""),
        "native plan missing constructor chaining lock"
    );
    assert!(
        plan.contains("\"return_behavior\": \"implicit-receiver\""),
        "native plan missing constructor return behavior lock"
    );
}

#[test]
fn c3_04_native_plan_contains_class_allocation_contract() {
    let plan = render_native_build_plan(
        &IrProgram { classes: vec![] },
        PathBuf::from("build/pulsec.ir.txt").as_path(),
    );
    assert!(
        plan.contains("\"allocation\""),
        "native plan missing class allocation section"
    );
    assert!(
        plan.contains("\"schema\": \"pulsec.class.alloc.v1\""),
        "native plan missing class allocation schema lock"
    );
    assert!(
        plan.contains(
            "\"size_formula\": \"header_bytes + (instance_field_count * field_slot_bytes)\""
        ),
        "native plan missing class allocation size-formula lock"
    );
    assert!(
        plan.contains("\"allocator_integration\": \"slot-allocator-with-class-size-metadata\""),
        "native plan missing class allocation integration lock"
    );
    assert!(
        plan.contains("\"class_size_table\": ["),
        "native plan missing class size table"
    );
}

#[test]
fn c3_06_native_plan_contains_dispatch_schema_contract() {
    let plan = render_native_build_plan(
        &IrProgram { classes: vec![] },
        PathBuf::from("build/pulsec.ir.txt").as_path(),
    );
    assert!(
        plan.contains("\"dispatch\""),
        "native plan missing dispatch section"
    );
    assert!(
        plan.contains("\"schema\": \"pulsec.dispatch.schema.v1\""),
        "native plan missing dispatch schema lock"
    );
    assert!(
        plan.contains("\"slot_assignment\": \"deterministic-lexicographic-signature\""),
        "native plan missing slot assignment lock"
    );
    assert!(
        plan.contains("\"slot_table\": ["),
        "native plan missing dispatch slot table"
    );
}

#[test]
fn c3_10_native_plan_contains_safe_devirtualization_contract() {
    let plan = render_native_build_plan(
        &IrProgram { classes: vec![] },
        PathBuf::from("build/pulsec.ir.txt").as_path(),
    );
    assert!(
        plan.contains("\"devirtualization\""),
        "native plan missing devirtualization section"
    );
    assert!(
        plan.contains("\"mode\": \"safe-fast-paths\""),
        "native plan missing devirtualization mode lock"
    );
    assert!(
        plan.contains("\"final-method-direct\"")
            && plan.contains("\"private-method-direct\"")
            && plan.contains("\"final-class-direct\""),
        "native plan missing devirtualization rule locks"
    );
    assert!(
        plan.contains("\"parity_requirement\": \"behavioral-equivalence-with-runtime-dispatch\""),
        "native plan missing devirtualization parity requirement lock"
    );
}

#[test]
fn c3_10_safe_devirtualization_rules_are_resolved() {
    with_resolution_lock(|| {
        install_class_super_resolution(&HashMap::new());
        install_class_finality_resolution(&HashMap::from([
            ("FinalType".to_string(), true),
            ("Base".to_string(), false),
        ]));
        install_method_finality_resolution(&HashMap::from([
            (("Base".to_string(), "fin".to_string(), vec![]), true),
            (("Base".to_string(), "virt".to_string(), vec![]), false),
            (("Base".to_string(), "priv".to_string(), vec![]), false),
        ]));
        install_method_visibility_resolution(&HashMap::from([
            (
                ("Base".to_string(), "fin".to_string(), vec![]),
                IrVisibility::Public,
            ),
            (
                ("Base".to_string(), "virt".to_string(), vec![]),
                IrVisibility::Public,
            ),
            (
                ("Base".to_string(), "priv".to_string(), vec![]),
                IrVisibility::Private,
            ),
        ]));

        let method = empty_method();
        assert!(is_devirtualizable_instance_call(
            "FinalType",
            "virt",
            &[],
            &method
        ));
        assert!(is_devirtualizable_instance_call(
            "Base",
            "fin",
            &[],
            &method
        ));
        assert!(is_devirtualizable_instance_call(
            "Base",
            "priv",
            &[],
            &method
        ));
        assert!(!is_devirtualizable_instance_call(
            "Base",
            "virt",
            &[],
            &method
        ));
    });
}

#[test]
fn c3_12_native_plan_contains_type_id_schema_contract() {
    let plan = render_native_build_plan(
        &IrProgram { classes: vec![] },
        PathBuf::from("build/pulsec.ir.txt").as_path(),
    );
    assert!(
        plan.contains("\"type_ids\""),
        "native plan missing type-id section"
    );
    assert!(
        plan.contains("\"schema\": \"pulsec.typeid.schema.v1\""),
        "native plan missing type-id schema lock"
    );
    assert!(
        plan.contains("\"class_id_width_bits\": 32"),
        "native plan missing class-id width lock"
    );
    assert!(
        plan.contains("\"class_table\": ["),
        "native plan missing class-id table"
    );
}

#[test]
fn e2_10_virtual_dispatch_codegen_uses_runtime_class_id_proc_boundary() {
    let mut out = String::new();
    emit_virtual_dispatch_call(
        &mut out,
        "vd",
        "sym_default",
        &[1, 7],
        &[(7, "sym_derived".to_string())],
    );
    assert!(
        out.contains("test rcx, rcx"),
        "virtual dispatch must guard null receiver before class-id lookup"
    );
    assert!(
        out.contains("call pulsec_rt_objectClassId"),
        "virtual dispatch must resolve class-id through runtime procedure boundary"
    );
    assert!(
        !out.contains("mov r10, qword ptr [pulsec_rt_obj_class_ids]"),
        "virtual dispatch must not dereference runtime-private class-id table directly"
    );
    assert!(
        out.contains("call pulsec_rt_dispatchNullReceiverPanic"),
        "virtual dispatch must panic deterministically on null receiver"
    );
    assert!(
        out.contains("call pulsec_rt_dispatchInvalidTypePanic"),
        "virtual dispatch must panic deterministically on invalid receiver type"
    );
    assert!(
        out.contains("cmp eax, 7"),
        "virtual dispatch must compare loaded class-id against override class ids"
    );
}

#[test]
fn e2_10_instanceof_and_checked_cast_codegen_use_runtime_class_id_proc_boundary() {
    begin_class_id_set_table_collection();
    let mut instanceof_src = String::new();
    emit_instanceof_check(&mut instanceof_src, "instof", &[2, 5]);
    let tables = take_class_id_set_tables();
    assert_eq!(tables.len(), 1, "instanceof should register one shared class-id table");
    assert!(
        instanceof_src.contains("test rax, rax") && instanceof_src.contains("mov rcx, rax"),
        "instanceof must preserve packed 64-bit object handles before class-id lookup"
    );
    assert!(
        instanceof_src.contains("call pulsec_rt_objectClassId"),
        "instanceof must resolve class-id through runtime procedure boundary"
    );
    assert!(
        !instanceof_src.contains("mov r10, qword ptr [pulsec_rt_obj_class_ids]"),
        "instanceof must not dereference runtime-private class-id table directly"
    );
    assert!(
        instanceof_src.contains("call pulsec_rt_classIdInSet"),
        "instanceof must route class-id membership through the shared helper"
    );
    assert!(
        !instanceof_src.contains("cmp edx, 2") && !instanceof_src.contains("cmp edx, 5"),
        "instanceof must stop inlining the class-id compare ladder once the helper is in use"
    );

    begin_class_id_set_table_collection();
    let mut cast_src = String::new();
    emit_checked_reference_cast(&mut cast_src, "cast", &[3], "panic_invalid_cast");
    let tables = take_class_id_set_tables();
    assert_eq!(tables.len(), 1, "checked cast should register one shared class-id table");
    assert!(
        cast_src.contains("test rax, rax") && cast_src.contains("mov rcx, rax"),
        "checked cast must preserve packed 64-bit object handles before class-id lookup"
    );
    assert!(
        cast_src.contains("call pulsec_rt_objectClassId"),
        "checked cast must resolve class-id through runtime procedure boundary"
    );
    assert!(
        cast_src.contains("mov qword ptr [rsp+40], rax")
            && cast_src.contains("mov rax, qword ptr [rsp+40]"),
        "checked cast must preserve the original object handle across the runtime class-id call"
    );
    assert!(
        !cast_src.contains("mov r10, qword ptr [pulsec_rt_obj_class_ids]"),
        "checked cast must not dereference runtime-private class-id table directly"
    );
    assert!(
        !cast_src.contains("mov r8, rax"),
        "checked cast must not preserve the original object handle in a volatile register across the runtime call"
    );
    assert!(
        cast_src.contains("call pulsec_rt_classIdInSet"),
        "checked cast must route class-id membership through the shared helper"
    );
    assert!(
        !cast_src.contains("cmp edx, 3"),
        "checked cast must stop inlining the class-id compare ladder once the helper is in use"
    );
}

#[test]
fn e2_11_release_asm_omits_statement_trace_payload_while_debug_keeps_it() {
    let stdlib_ir = minimal_trace_ir_program("pulse.lang");
    let app_ir = minimal_trace_ir_program("app.core");
    let temp_root = std::env::temp_dir().join(format!(
        "pulsec_trace_emit_lock_{}_{}",
        std::process::id(),
        std::time::SystemTime::now()
            .duration_since(std::time::UNIX_EPOCH)
            .expect("system time")
            .as_nanos()
    ));
    let release_stdlib_dir = temp_root.join("release_stdlib");
    let debug_stdlib_dir = temp_root.join("debug_stdlib");
    let release_app_dir = temp_root.join("release_app");

    let release_backend = RustHostBootstrapBackend {
        linker_override: None,
        target_id: "windows-x64".to_string(),
        output_mode: "fat".to_string(),
        output_entry: "main".to_string(),
        emit_statement_trace_metadata: false,
    };
    let debug_backend = RustHostBootstrapBackend {
        linker_override: None,
        target_id: "windows-x64".to_string(),
        output_mode: "fat".to_string(),
        output_entry: "main".to_string(),
        emit_statement_trace_metadata: true,
    };

    let release_artifact = release_backend
        .emit(&stdlib_ir, &release_stdlib_dir)
        .expect("emit release stdlib backend artifact");
    let debug_artifact = debug_backend
        .emit(&stdlib_ir, &debug_stdlib_dir)
        .expect("emit debug stdlib backend artifact");
    let release_app_artifact = release_backend
        .emit(&app_ir, &release_app_dir)
        .expect("emit release app backend artifact");
    assert_eq!(release_artifact.entry_codegen, "masm-split-stdlib");
    assert_eq!(debug_artifact.entry_codegen, "masm-split-stdlib");
    assert_eq!(release_app_artifact.entry_codegen, "masm-split-stdlib");

    let release_stdlib_asm =
        fs::read_to_string(release_stdlib_dir.join("obj/pulse/lang/Main.asm"))
            .expect("read release stdlib asm");
    let debug_stdlib_asm =
        fs::read_to_string(debug_stdlib_dir.join("obj/pulse/lang/Main.asm"))
            .expect("read debug stdlib asm");
    let release_app_asm = fs::read_to_string(release_app_dir.join("obj/app/core/Main.asm"))
        .expect("read release app asm");

    assert!(
        release_stdlib_asm.contains("trace_m0 db"),
        "release stdlib asm must keep method-level trace frames for runtime stack traces"
    );
    assert!(
        !release_stdlib_asm.contains("_trace_s0"),
        "release stdlib asm must omit statement/file-line trace payload"
    );
    assert!(
        !release_stdlib_asm.contains("pulsec_rt_traceUpdateTop"),
        "release stdlib asm must omit statement trace update calls"
    );
    assert!(
        debug_stdlib_asm.contains("_trace_s0"),
        "debug stdlib asm must keep statement/file-line trace payload"
    );
    assert!(
        debug_stdlib_asm.contains("pulsec_rt_traceUpdateTop"),
        "debug stdlib asm must keep statement trace update calls"
    );
    assert!(
        release_app_asm.contains("_trace_s0"),
        "release app asm must keep user-code statement trace payload for runtime stack traces"
    );
    assert!(
        release_app_asm.contains("pulsec_rt_traceUpdateTop"),
        "release app asm must keep user-code statement trace updates"
    );

    let _ = fs::remove_dir_all(temp_root);
}

#[test]
fn e2_12_backend_symbol_mangling_caps_long_identifiers_for_masm() {
    let param_types = vec!["String".to_string(); 48];
    let symbol = mangle_method_symbol(
        "author.build",
        "BuildPublicationWriter",
        "writeBuildConfigPlan",
        &param_types,
    );

    assert!(
        symbol.len() <= 140,
        "expected backend symbol length cap for MASM, got {} bytes: {}",
        symbol.len(),
        symbol
    );
    assert!(
        symbol.starts_with("pulsec_author_build_BuildPublicationWriter_writeBuildConfigPlan"),
        "expected stable readable prefix on shortened symbol: {}",
        symbol
    );
    assert!(
        symbol.contains("_h"),
        "expected deterministic hash suffix on shortened symbol: {}",
        symbol
    );
}

#[test]
fn c3_13_dispatch_boundary_panic_symbols_are_mapped() {
    let symbols = default_stdlib_symbols();
    let values: HashSet<String> = symbols.values().cloned().collect();
    assert!(
        values.contains(DISPATCH_NULL_PANIC_SYMBOL),
        "missing null-dispatch panic symbol mapping in stdlib symbols"
    );
    assert!(
        values.contains(DISPATCH_TYPE_PANIC_SYMBOL),
        "missing invalid-dispatch-type panic symbol mapping in stdlib symbols"
    );
}

#[test]
fn c3_14_native_plan_contains_object_model_abi_compatibility_contract() {
    let plan = render_native_build_plan(
        &IrProgram { classes: vec![] },
        PathBuf::from("build/pulsec.ir.txt").as_path(),
    );
    assert!(
        plan.contains("\"object_model\""),
        "native plan missing object-model section"
    );
    assert!(
        plan.contains("\"abi_compatibility\""),
        "native plan missing object-model ABI compatibility section"
    );
    assert!(
        plan.contains("\"schema\": \"pulsec.object_model.abi.v1\""),
        "native plan missing object-model ABI schema lock"
    );
    assert!(
        plan.contains("\"compiler_object_model_abi_version\": 1")
            && plan.contains("\"runtime_object_model_abi_version\": 1"),
        "native plan missing object-model ABI version lock fields"
    );
    assert!(
        plan.contains("\"mismatch_policy\": \"deterministic-fail-fast\""),
        "native plan missing object-model ABI mismatch policy lock"
    );
}

#[test]
fn c3_07_method_symbol_resolution_walks_super_chain_without_global_fallback() {
    with_resolution_lock(|| {
        install_class_super_resolution(&HashMap::from([(
            "Derived".to_string(),
            "Base".to_string(),
        )]));
        let method = empty_method();
        let method_symbols = HashMap::from([
            (
                ("Base".to_string(), "ping".to_string()),
                "sym_base_ping".to_string(),
            ),
            (
                ("Unrelated".to_string(), "ping".to_string()),
                "sym_unrelated_ping".to_string(),
            ),
        ]);
        let method_symbols_by_sig = HashMap::from([
            (
                ("Base".to_string(), "ping".to_string(), vec![]),
                "sym_base_ping".to_string(),
            ),
            (
                ("Unrelated".to_string(), "ping".to_string(), vec![]),
                "sym_unrelated_ping".to_string(),
            ),
        ]);
        let class_names = vec![
            "Base".to_string(),
            "Derived".to_string(),
            "Unrelated".to_string(),
        ];
        let field_types = HashMap::new();

        let resolved = resolve_method_symbol_for_call(
            "Derived",
            "ping",
            &[],
            &method,
            "Derived",
            &class_names,
            &field_types,
            &method_symbols,
            &method_symbols_by_sig,
        );
        assert_eq!(resolved.as_deref(), Some("sym_base_ping"));

        let unresolved = resolve_method_symbol_for_call(
            "Missing",
            "ping",
            &[],
            &method,
            "Derived",
            &class_names,
            &field_types,
            &method_symbols,
            &method_symbols_by_sig,
        );
        assert!(
            unresolved.is_none(),
            "resolution must not fall back to unrelated class methods"
        );
    });
}

#[test]
fn c3_07_method_staticness_resolution_walks_super_chain_without_global_fallback() {
    with_resolution_lock(|| {
        install_class_super_resolution(&HashMap::from([(
            "Derived".to_string(),
            "Base".to_string(),
        )]));
        let method = empty_method();
        let method_staticness = HashMap::from([(("Base".to_string(), "ping".to_string()), false)]);
        let method_staticness_by_sig = HashMap::from([
            (("Base".to_string(), "ping".to_string(), vec![]), false),
            (("Unrelated".to_string(), "ping".to_string(), vec![]), true),
        ]);

        let resolved = resolve_method_staticness_for_call(
            "Derived",
            "ping",
            &[],
            &method,
            &method_staticness,
            &method_staticness_by_sig,
        );
        assert_eq!(resolved, Some(false));

        let unresolved = resolve_method_staticness_for_call(
            "Missing",
            "ping",
            &[],
            &method,
            &method_staticness,
            &method_staticness_by_sig,
        );
        assert!(
            unresolved.is_none(),
            "staticness resolution must not fall back to unrelated class methods"
        );
    });
}

#[test]
fn c3_07_method_symbol_resolution_prefers_long_overload_for_long_binary_expression() {
    with_resolution_lock(|| {
        let mut method = empty_method();
        method.params = vec![
            IrParam {
                name: "epochSeconds".to_string(),
                ty: "long".to_string(),
            },
            IrParam {
                name: "millisPerSecond".to_string(),
                ty: "long".to_string(),
            },
        ];
        let source = IrSourceLoc {
            source_file: "test".to_string(),
            class_name: "pulse.time.Instant".to_string(),
            method_name: "ofEpochSeconds".to_string(),
            source_line: 1,
            statement_index: 0,
        };
        method.values = vec![
            IrValue {
                id: 0,
                ty: "long".to_string(),
                kind: IrValueKind::LocalRef("epochSeconds".to_string()),
                source: source.clone(),
            },
            IrValue {
                id: 1,
                ty: "long".to_string(),
                kind: IrValueKind::LocalRef("millisPerSecond".to_string()),
                source: source.clone(),
            },
            IrValue {
                id: 2,
                ty: "unknown".to_string(),
                kind: IrValueKind::Binary {
                    op: IrBinaryOp::Mul,
                    left: 0,
                    right: 1,
                },
                source,
            },
        ];

        let method_symbols = HashMap::from([
            (
                ("Instant".to_string(), "Instant".to_string()),
                "sym_ctor_default".to_string(),
            ),
        ]);
        let method_symbols_by_sig = HashMap::from([
            (
                ("Instant".to_string(), "Instant".to_string(), vec!["int".to_string()]),
                "sym_ctor_int".to_string(),
            ),
            (
                ("Instant".to_string(), "Instant".to_string(), vec!["long".to_string()]),
                "sym_ctor_long".to_string(),
            ),
        ]);
        let class_names = vec!["Instant".to_string()];
        let field_types = HashMap::new();

        let resolved = resolve_method_symbol_for_call(
            "Instant",
            "Instant",
            &[2],
            &method,
            "Instant",
            &class_names,
            &field_types,
            &method_symbols,
            &method_symbols_by_sig,
        );
        assert_eq!(resolved.as_deref(), Some("sym_ctor_long"));
    });
}

#[test]
fn c3_08_interface_resolution_tracks_runtime_implementers() {
    with_resolution_lock(|| {
        install_interface_type_resolution(&HashSet::from(["Task".to_string()]));
        install_class_interfaces_resolution(&HashMap::from([
            ("Worker".to_string(), vec!["Task".to_string()]),
            ("Runner".to_string(), vec!["Other".to_string()]),
        ]));
        assert!(is_interface_type("Task"));
        assert!(class_implements_interface_runtime("Worker", "Task"));
        assert!(!class_implements_interface_runtime("Runner", "Task"));
    });
}

#[test]
fn c2_01_runtime_intrinsics_doc_mentions_arc_header_contract() {
    let doc_path = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..")
        .join("docs")
        .join("RUNTIME_INTRINSICS_ABI.md");
    let doc = fs::read_to_string(&doc_path).expect("read RUNTIME_INTRINSICS_ABI.md");
    assert!(
        doc.contains("ARC Header Contract (C2-01)"),
        "ABI doc missing C2-01 ARC header contract section"
    );
    assert!(
        doc.contains("pulsec.arc.header.v1"),
        "ABI doc missing ARC header schema version"
    );
    assert!(
        doc.contains("kind_tag") && doc.contains("refcount") && doc.contains("meta_index"),
        "ABI doc missing ARC header field lock"
    );
    assert!(
        doc.contains("refcount_saturation_guard"),
        "ABI doc missing refcount saturation guard"
    );
}

#[test]
fn c2_08_slot_capacity_growth_copy_loops_stop_at_the_old_capacity_boundary() {
    let mut asm = String::new();
    emit_ensure_slot_capacity_proc(&mut asm, "pulsec_rt_ensureSlotCapacity");

    assert!(
        asm.contains("cmp ecx, dword ptr [rsp+256]\n    jae ")
            && !asm.contains("cmp ecx, dword ptr [rsp+256]\n    ja "),
        "slot-capacity growth proc regressed to an off-by-one ecx copy bound"
    );
    assert!(
        asm.contains("cmp eax, dword ptr [rsp+256]\n    jae ")
            && !asm.contains("cmp eax, dword ptr [rsp+256]\n    ja "),
        "slot-capacity growth proc regressed to an off-by-one eax copy bound"
    );
}

#[test]
fn c2_08_arc_teardown_uses_stack_local_state_for_recursive_release_loops() {
    let mut asm = String::new();
    emit_arc_teardown_proc(&mut asm, "pulsec_rt_arcTeardown", &BTreeMap::new());

    for needle in [
        "mov dword ptr [rsp+32], ecx",
        "mov dword ptr [rsp+36], eax",
        "mov qword ptr [rsp+56], r11",
        "mov dword ptr [rsp+64], 0",
        "mov ecx, dword ptr [rsp+64]",
    ] {
        assert!(
            asm.contains(needle),
            "arc teardown proc missing stack-local recursive teardown state '{}'",
            needle
        );
    }

    for forbidden in [
        "mov dword ptr [rt_tmp_arr_slot]",
        "mov dword ptr [rt_tmp_arr_len]",
        "mov dword ptr [rt_tmp_size]",
        "mov qword ptr [rt_tmp_ptr_a]",
        "mov qword ptr [rt_tmp_ptr_b]",
        "mov qword ptr [rt_tmp_ptr_d]",
    ] {
        assert!(
            !asm.contains(forbidden),
            "arc teardown proc regressed to shared recursive scratch state '{}'",
            forbidden
        );
    }
}
