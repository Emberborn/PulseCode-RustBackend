    use super::analysis::{
        class_implements_interface_runtime, install_class_finality_resolution,
        install_class_interfaces_resolution, install_class_super_resolution,
        install_interface_type_resolution, install_method_finality_resolution,
        install_method_visibility_resolution, is_interface_type, render_native_build_plan,
        render_native_build_plan_with_output_mode,
    };
    use super::emission::{
        emit_array_get_proc, emit_array_set_proc, emit_checked_reference_cast,
        emit_instanceof_check, emit_list_add_proc, emit_list_get_proc, emit_map_contains_proc,
        emit_map_get_proc, emit_map_put_proc, emit_runtime_init_proc, emit_runtime_shutdown_proc,
        emit_startup_entry_proc, emit_virtual_dispatch_call, is_devirtualizable_instance_call,
        resolve_method_staticness_for_call, resolve_method_symbol_for_call,
        shared_runtime_export_symbols,
    };
    use super::support::{
        default_backend_contract, default_stdlib_symbols, emit_runtime_data_tables,
    };
    use super::{DISPATCH_NULL_PANIC_SYMBOL, DISPATCH_TYPE_PANIC_SYMBOL, WRITE_RAW_SYMBOL};
    use pulsec_core::{IrMethod, IrProgram, IrVisibility};
    use pulsec_core::intermediate::{IrBlock, IrTerminator};
    use std::collections::{HashMap, HashSet};
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

    fn expected_intrinsics_surface() -> Vec<&'static str> {
        vec![
            "com.pulse.rt.Intrinsics.consoleWriteLine",
            "com.pulse.rt.Intrinsics.consoleWrite",
            "com.pulse.rt.Intrinsics.panic",
            "com.pulse.rt.Intrinsics.stringConcat",
            "com.pulse.rt.Intrinsics.stringLength",
            "com.pulse.rt.Intrinsics.intToString",
            "com.pulse.rt.Intrinsics.booleanToString",
            "com.pulse.rt.Intrinsics.parseInt",
            "com.pulse.rt.Intrinsics.parseBoolean",
            "com.pulse.rt.Intrinsics.objectClassName",
            "com.pulse.rt.Intrinsics.objectHashCode",
            "com.pulse.lang.Class.runtimeSimpleName",
            "com.pulse.lang.Class.runtimePackageName",
            "com.pulse.lang.String.runtimeCharAt",
            "com.pulse.lang.String.runtimeSubstring",
            "com.pulse.lang.String.runtimeFromChar",
            "com.pulse.rt.Intrinsics.arrayNew",
            "com.pulse.rt.Intrinsics.arrayNewMulti",
            "com.pulse.rt.Intrinsics.arrayLength",
            "com.pulse.rt.Intrinsics.arrayGetInt",
            "com.pulse.rt.Intrinsics.arraySetInt",
            "com.pulse.rt.Intrinsics.arrayGetString",
            "com.pulse.rt.Intrinsics.arraySetString",
            "com.pulse.rt.Intrinsics.listNew",
            "com.pulse.rt.Intrinsics.listSize",
            "com.pulse.rt.Intrinsics.listClear",
            "com.pulse.rt.Intrinsics.listAddInt",
            "com.pulse.rt.Intrinsics.listAddString",
            "com.pulse.rt.Intrinsics.listGetInt",
            "com.pulse.rt.Intrinsics.listGetString",
            "com.pulse.rt.Intrinsics.mapNew",
            "com.pulse.rt.Intrinsics.mapSize",
            "com.pulse.rt.Intrinsics.mapClear",
            "com.pulse.rt.Intrinsics.mapContainsKey",
            "com.pulse.rt.Intrinsics.mapPut",
            "com.pulse.rt.Intrinsics.mapPutInt",
            "com.pulse.rt.Intrinsics.mapGet",
            "com.pulse.rt.Intrinsics.mapGetInt",
            "com.pulse.memory.Memory.retain",
            "com.pulse.memory.Memory.release",
            "com.pulse.memory.Memory.cycleYoungPass",
            "com.pulse.memory.Memory.cycleFullPass",
            "com.pulse.memory.Memory.cycleTick",
            "com.pulse.memory.Memory.weakNew",
            "com.pulse.memory.Memory.weakGet",
            "com.pulse.memory.Memory.weakClear",
        ]
    }

    fn expected_native_runtime_symbols() -> Vec<&'static str> {
        vec![
            "pulsec_rt_consoleWrite",
            "pulsec_rt_consoleWriteLine",
            "pulsec_rt_panic",
            "pulsec_rt_stringConcat",
            "pulsec_rt_stringLength",
            "pulsec_rt_intToString",
            "pulsec_rt_booleanToString",
            "pulsec_rt_parseInt",
            "pulsec_rt_parseBoolean",
            "pulsec_rt_objectClassName",
            "pulsec_rt_objectHashCode",
            "pulsec_rt_classSimpleName",
            "pulsec_rt_classPackageName",
            "pulsec_rt_stringCharAt",
            "pulsec_rt_stringSubstring",
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
        let contract = default_backend_contract();
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
            let method = if let Some(method) = intrinsic.strip_prefix("com.pulse.rt.Intrinsics.") {
                method
            } else if let Some(method) = intrinsic.strip_prefix("com.pulse.memory.Memory.") {
                method
            } else if let Some(method) = intrinsic.strip_prefix("com.pulse.lang.Class.") {
                method
            } else if let Some(method) = intrinsic.strip_prefix("com.pulse.lang.String.") {
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
            "cmp qword ptr [r11+r9*8], rdx",
            "cmp qword ptr [r10+rax*8], rdx",
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
            assert!(doc.contains(needle), "shared runtime ABI doc missing '{}'", needle);
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
            exports.iter().all(|symbol| !symbol.starts_with("pulsec_rt_obj_")),
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
            "pulsec_std_com_pulse_lang_IO_println",
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
            assert!(doc.contains(needle), "shared runtime ABI compatibility doc missing '{}'", needle);
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
            assert!(plan.contains(needle), "shared runtime ABI compatibility plan missing '{}'", needle);
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
            assert!(doc.contains(needle), "shared runtime state layout doc missing '{}'", needle);
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
            assert!(doc.contains(needle), "shared runtime ABI bootstrap doc missing '{}'", needle);
        }

        let policy_path = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
            .join("..")
            .join("..")
            .join("docs")
            .join("RUNTIME_OWNERSHIP_POLICY.md");
        let policy = fs::read_to_string(&policy_path).expect("read RUNTIME_OWNERSHIP_POLICY.md");
        for needle in ["rt_runtime_init_state", "rt_runtime_init_epoch"] {
            assert!(policy.contains(needle), "runtime ownership policy missing '{}'", needle);
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
            assert!(init_src.contains(needle), "runtime init source missing '{}'", needle);
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
            assert!(startup_src.contains(needle), "startup bootstrap source missing '{}'", needle);
        }
        assert!(
            startup_src.find("call pulsec_rt_init").unwrap() < startup_src.find("call app_entry").unwrap(),
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
            assert!(doc.contains(needle), "shared runtime ABI shutdown doc missing '{}'", needle);
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
            assert!(shutdown_src.contains(needle), "runtime shutdown source missing '{}'", needle);
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
        for needle in ["call pulsec_rt_init", "call app_entry", "call pulsec_rt_shutdown", "call ExitProcess"] {
            assert!(startup_src.contains(needle), "startup lifecycle source missing '{}'", needle);
        }
        assert!(
            startup_src.find("call app_entry").unwrap() < startup_src.find("call pulsec_rt_shutdown").unwrap()
                && startup_src.find("call pulsec_rt_shutdown").unwrap() < startup_src.find("call ExitProcess").unwrap(),
            "startup shutdown order must be app entry -> runtime shutdown -> ExitProcess\n{}",
            startup_src
        );
    }

    #[test]
    fn c2_01_native_plan_contains_locked_arc_header_contract() {
        let plan = render_native_build_plan(&IrProgram { classes: vec![] }, PathBuf::from("build/pulsec.ir.txt").as_path());
        assert!(plan.contains("\"memory_model\""), "native plan missing memory model section");
        assert!(plan.contains("\"strategy\": \"arc\""), "native plan missing ARC strategy");
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
        assert!(plan.contains("IO.obj"));
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
        let plan =
            render_native_build_plan(&IrProgram { classes: vec![] }, PathBuf::from("build/pulsec.ir.txt").as_path());
        assert!(plan.contains("\"allocator\""), "native plan missing allocator section");
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
            plan.contains(&format!("\"warn_bytes\": {}", super::FRAME_BUDGET_WARN_BYTES)),
            "native plan missing frame budget warn threshold"
        );
        assert!(
            plan.contains(&format!("\"fail_bytes\": {}", super::FRAME_BUDGET_FAIL_BYTES)),
            "native plan missing frame budget fail threshold"
        );
    }

    #[test]
    fn c2_23_native_plan_contains_threading_contract() {
        let plan =
            render_native_build_plan(&IrProgram { classes: vec![] }, PathBuf::from("build/pulsec.ir.txt").as_path());
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
        let plan =
            render_native_build_plan(&IrProgram { classes: vec![] }, PathBuf::from("build/pulsec.ir.txt").as_path());
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
        let plan =
            render_native_build_plan(&IrProgram { classes: vec![] }, PathBuf::from("build/pulsec.ir.txt").as_path());
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
        let plan =
            render_native_build_plan(&IrProgram { classes: vec![] }, PathBuf::from("build/pulsec.ir.txt").as_path());
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
        let plan =
            render_native_build_plan(&IrProgram { classes: vec![] }, PathBuf::from("build/pulsec.ir.txt").as_path());
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
        let plan =
            render_native_build_plan(&IrProgram { classes: vec![] }, PathBuf::from("build/pulsec.ir.txt").as_path());
        assert!(
            plan.contains("\"allocation\""),
            "native plan missing class allocation section"
        );
        assert!(
            plan.contains("\"schema\": \"pulsec.class.alloc.v1\""),
            "native plan missing class allocation schema lock"
        );
        assert!(
            plan.contains("\"size_formula\": \"header_bytes + (instance_field_count * field_slot_bytes)\""),
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
        let plan =
            render_native_build_plan(&IrProgram { classes: vec![] }, PathBuf::from("build/pulsec.ir.txt").as_path());
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
        let plan =
            render_native_build_plan(&IrProgram { classes: vec![] }, PathBuf::from("build/pulsec.ir.txt").as_path());
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
            assert!(is_devirtualizable_instance_call("FinalType", "virt", &[], &method));
            assert!(is_devirtualizable_instance_call("Base", "fin", &[], &method));
            assert!(is_devirtualizable_instance_call("Base", "priv", &[], &method));
            assert!(!is_devirtualizable_instance_call("Base", "virt", &[], &method));
        });
    }

    #[test]
    fn c3_12_native_plan_contains_type_id_schema_contract() {
        let plan =
            render_native_build_plan(&IrProgram { classes: vec![] }, PathBuf::from("build/pulsec.ir.txt").as_path());
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
            out.contains("cmp ecx, 0"),
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
        let mut instanceof_src = String::new();
        emit_instanceof_check(&mut instanceof_src, "instof", &[2, 5]);
        assert!(
            instanceof_src.contains("call pulsec_rt_objectClassId"),
            "instanceof must resolve class-id through runtime procedure boundary"
        );
        assert!(
            !instanceof_src.contains("mov r10, qword ptr [pulsec_rt_obj_class_ids]"),
            "instanceof must not dereference runtime-private class-id table directly"
        );
        assert!(
            instanceof_src.contains("cmp edx, 2") && instanceof_src.contains("cmp edx, 5"),
            "instanceof must compare runtime class-id against assignable target ids"
        );

        let mut cast_src = String::new();
        emit_checked_reference_cast(&mut cast_src, "cast", &[3], "panic_invalid_cast");
        assert!(
            cast_src.contains("call pulsec_rt_objectClassId"),
            "checked cast must resolve class-id through runtime procedure boundary"
        );
        assert!(
            !cast_src.contains("mov r10, qword ptr [pulsec_rt_obj_class_ids]"),
            "checked cast must not dereference runtime-private class-id table directly"
        );
        assert!(
            cast_src.contains("cmp edx, 3"),
            "checked cast must compare runtime class-id against allowed target ids"
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
        let plan =
            render_native_build_plan(&IrProgram { classes: vec![] }, PathBuf::from("build/pulsec.ir.txt").as_path());
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

            let resolved = resolve_method_symbol_for_call(
                "Derived",
                "ping",
                &[],
                &method,
                &method_symbols,
                &method_symbols_by_sig,
            );
            assert_eq!(resolved.as_deref(), Some("sym_base_ping"));

            let unresolved = resolve_method_symbol_for_call(
                "Missing",
                "ping",
                &[],
                &method,
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
            let method_staticness =
                HashMap::from([(("Base".to_string(), "ping".to_string()), false)]);
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
