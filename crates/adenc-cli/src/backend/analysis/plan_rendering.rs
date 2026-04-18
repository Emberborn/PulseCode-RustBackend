use super::*;
use crate::backend::adapters::{
    resolve_active_adapter_artifact_contract, resolve_active_adapter_startup_loader_contract,
    resolve_active_backend_contract, resolve_planned_link_plan,
    resolve_requested_target_artifact_contract,
    resolve_requested_target_executable_loading_proof_target,
    resolve_requested_target_runtime_service_contract,
    resolve_requested_target_startup_loader_contract, TargetArtifactContract,
    TargetExecutableLoadingProofTarget, TargetStartupLoaderContract,
};
use crate::backend::host_bootstrap::{
    resolve_host_bootstrap_runtime_contract, resolve_runtime_ownership_model,
    HostBootstrapRuntimeContract, RuntimeOwnershipModel,
};
use crate::backend::resolve_plan_target_adapter_metadata;

#[cfg(test)]
use crate::cli::target_model::WINDOWS_X64_TARGET_ID;

fn render_class_size_table(ir: &IrProgram) -> String {
    let mut rows = ir
        .classes
        .iter()
        .map(|class| {
            format!(
                "{{ \"class\": \"{}.{}\", \"instance_field_count\": {}, \"instance_size_bytes\": {} }}",
                class.package_name,
                class.name,
                instance_field_count(class),
                instance_size_bytes(class)
            )
        })
        .collect::<Vec<_>>();
    rows.sort();
    rows.join(", ")
}

fn render_dispatch_slot_table(ir: &IrProgram) -> String {
    let mut classes = ir
        .classes
        .iter()
        .map(|class| {
            let mut methods = class
                .methods
                .iter()
                .filter(|method| !method.is_static && !method.is_constructor)
                .map(|method| {
                    let params = method
                        .params
                        .iter()
                        .map(|p| p.ty.clone())
                        .collect::<Vec<_>>()
                        .join(", ");
                    format!("\"{}({})\"", method.name, params)
                })
                .collect::<Vec<_>>();
            methods.sort();
            format!(
                "{{ \"class\": \"{}.{}\", \"virtual_methods\": [{}] }}",
                class.package_name,
                class.name,
                methods.join(", ")
            )
        })
        .collect::<Vec<_>>();
    classes.sort();
    classes.join(", ")
}

fn render_type_id_table(ir: &IrProgram) -> String {
    let mut classes = ir
        .classes
        .iter()
        .map(|class| {
            format!(
                "{{ \"class\": \"{}.{}\", \"class_id\": {} }}",
                class.package_name,
                class.name,
                class_id_of(&class.name).unwrap_or(0)
            )
        })
        .collect::<Vec<_>>();
    classes.sort();
    classes.join(", ")
}

fn render_native_outputs_topology(output_mode: &str, output_entry: &str) -> String {
    let (runtime_library_name, runtime_import_lib_name) = shared_runtime_artifact_names();
    let runtime_version = env!("CARGO_PKG_VERSION");
    match output_mode {
        "shared" => format!(
            concat!(
                "{{\n",
                "    \"mode\": \"shared\",\n",
                "    \"entrypoint\": \"{}\",\n",
                "    \"artifacts\": [\n",
                "      {{ \"id\": \"app_executable\", \"kind\": \"exe\", \"file_name\": \"{}.exe\" }},\n",
                "      {{ \"id\": \"runtime_library\", \"kind\": \"dll\", \"base_name\": \"adencore\", \"file_name\": \"{}\", \"version_source\": \"adenc_toolchain_semver\", \"version\": \"{}\" }},\n",
                "      {{ \"id\": \"runtime_import_library\", \"kind\": \"import_lib\", \"base_name\": \"adencore\", \"file_name\": \"{}\", \"version_source\": \"adenc_toolchain_semver\", \"version\": \"{}\" }},\n",
                "      {{ \"id\": \"runtime_lookup_metadata\", \"kind\": \"metadata\", \"file_name\": \"launch.txt\" }}\n",
                "    ]\n",
                "  }}"
            ),
            output_entry,
            output_entry,
            runtime_library_name,
            runtime_version,
            runtime_import_lib_name,
            runtime_version
        ),
        _ => format!(
            concat!(
                "{{\n",
                "    \"mode\": \"fat\",\n",
                "    \"entrypoint\": \"{}\",\n",
                "    \"artifacts\": [\n",
                "      {{ \"id\": \"app_executable\", \"kind\": \"exe\", \"file_name\": \"{}.exe\" }},\n",
                "      {{ \"id\": \"runtime_payload\", \"kind\": \"embedded\" }}\n",
                "    ]\n",
                "  }}"
            ),
            output_entry, output_entry
        ),
    }
}

fn render_runtime_lookup_metadata(output_mode: &str) -> String {
    let (runtime_library_name, runtime_import_lib_name) = shared_runtime_artifact_names();
    match output_mode {
        "shared" => format!(
            concat!(
                "{{\n",
                "    \"schema\": \"adenc.shared_runtime.lookup.v1\",\n",
                "    \"mode\": \"shared\",\n",
                "    \"runtime_load\": \"peer_runtime_library\",\n",
                "    \"lookup_policy\": \"relative-sibling-runtime\",\n",
                "    \"published_build\": {{\n",
                "      \"launch_descriptor\": \"bin/launch.txt\",\n",
                "      \"runtime_library\": \"../lib/{}\",\n",
                "      \"runtime_import_library\": \"../lib/{}\"\n",
                "    }},\n",
                "    \"staged_package\": {{\n",
                "      \"launch_descriptor\": \"staging/bin/launch.txt\",\n",
                "      \"runtime_library\": \"../libraries/{}\",\n",
                "      \"runtime_import_library\": \"../libraries/{}\"\n",
                "    }}\n",
                "  }}"
            ),
            runtime_library_name,
            runtime_import_lib_name,
            runtime_library_name,
            runtime_import_lib_name
        ),
        _ => "{\n    \"schema\": \"adenc.shared_runtime.lookup.v1\",\n    \"mode\": \"fat\",\n    \"runtime_load\": \"embedded_runtime_payload\"\n  }".to_string(),
    }
}

pub(crate) fn shared_runtime_artifact_names() -> (String, String) {
    let runtime_binary_base = "adencore";
    let runtime_binary_version = env!("CARGO_PKG_VERSION");
    (
        format!("{runtime_binary_base}-{runtime_binary_version}.dll"),
        format!("{runtime_binary_base}-{runtime_binary_version}.lib"),
    )
}

fn render_link_plan_topology(
    ir: &IrProgram,
    target_id: &str,
    output_mode: &str,
    link_plan: Option<&NativeLinkPlan>,
) -> String {
    let planned =
        resolve_planned_link_plan(target_id, ir).expect("planned link plan should resolve");
    let link_plan = link_plan.unwrap_or(&planned);
    let render_paths = |paths: &[PathBuf], owner: &str, kind: &str| -> String {
        paths
            .iter()
            .map(|path| {
                format!(
                    "{{ \"path\": \"{}\", \"owner\": \"{}\", \"kind\": \"{}\" }}",
                    path.display(),
                    owner,
                    kind
                )
            })
            .collect::<Vec<_>>()
            .join(", ")
    };
    let startup_objects = render_paths(
        &link_plan.startup_objects,
        "app_executable",
        "startup_object",
    );
    let app_owned_objects =
        render_paths(&link_plan.app_owned_objects, "app_executable", "app_object");
    let runtime_owned_objects = render_paths(
        &link_plan.runtime_owned_objects,
        "shared_runtime_candidate",
        "runtime_stdlib_object",
    );
    let system_inputs = render_paths(&link_plan.system_inputs, "linker", "system_input");
    let link_targets = match output_mode {
        "shared" => format!(
            concat!(
                "{{ \"id\": \"app_executable\", \"consumes\": [\"startup_objects\", \"app_owned_objects\", \"runtime_import_library\", \"system_inputs\"], ",
                "\"linkage_kind\": \"import_library\", \"runtime_load\": \"peer_runtime_library\", \"runtime_artifact\": \"{}\", \"import_artifact\": \"{}\" }},\n",
                "      {{ \"id\": \"runtime_library\", \"consumes\": [\"runtime_owned_objects\", \"system_inputs\"], ",
                "\"linkage_kind\": \"shared_runtime_library\" }}"
            ),
            shared_runtime_artifact_names().0,
            shared_runtime_artifact_names().1,
        ),
        _ => "{ \"id\": \"app_executable\", \"consumes\": [\"startup_objects\", \"app_owned_objects\", \"runtime_owned_objects\", \"system_inputs\"] }".to_string(),
    };

    format!(
        concat!(
            "{{\n",
            "    \"startup_objects\": [{}],\n",
            "    \"app_owned_objects\": [{}],\n",
            "    \"runtime_owned_objects\": [{}],\n",
            "    \"system_inputs\": [{}],\n",
            "    \"link_targets\": [\n",
            "      {}\n",
            "    ]\n",
            "  }}"
        ),
        startup_objects, app_owned_objects, runtime_owned_objects, system_inputs, link_targets
    )
}

fn render_shared_runtime_abi_boundary(output_mode: &str) -> String {
    let imported_procedures = shared_runtime_exported_procedures();
    let exported_procedures = shared_runtime_exported_procedures();
    let forbidden_data_import_patterns = [
        "\"rt_arc_*\"",
        "\"rt_weak_*\"",
        "\"rt_list_*\"",
        "\"rt_map_*\"",
        "\"rt_arr_*\"",
        "\"adenc_rt_obj_*\"",
    ]
    .join(", ");
    let forbidden_private_export_patterns =
        ["\"rt_*\"", "\"adenc_rt_obj_*\"", "\"adenc_rt_class_*\""].join(", ");
    let runtime_role = if output_mode == "shared" {
        "\"shared_runtime_library\""
    } else {
        "\"embedded_runtime_payload\""
    };
    let runtime_state_layout = concat!(
        "{\n",
        "      \"schema\": \"adenc.shared_runtime.state_layout.v1\",\n",
        "      \"metadata_state\": \"runtime_library_storage\",\n",
        "      \"allocator_state\": \"runtime_library_storage\",\n",
        "      \"object_metadata_symbols\": [\"adenc_rt_obj_counter\", \"adenc_rt_obj_class_ids\", \"adenc_rt_obj_class_ids_init\", \"adenc_rt_obj_class_ids_heap_owned\"],\n",
        "      \"allocator_symbols\": [\"rt_handle_next\", \"rt_slot_capacity\", \"rt_arc_free_head\", \"rt_arc_free_next_tbl\", \"rt_arc_heap_owned\"],\n",
        "      \"arc_symbols\": [\"rt_arc_refcounts_tbl\", \"rt_arc_kinds_tbl\", \"rt_arc_flags_tbl\", \"rt_arc_meta_tbl\", \"rt_arc_generation_tbl\"],\n",
        "      \"weak_symbols\": [\"rt_weak_next\", \"rt_weak_free_head\", \"rt_weak_generation\"],\n",
        "      \"container_registry_symbols\": [\"rt_arr_*\", \"rt_list_*\", \"rt_map_*\", \"rt_str_*\"],\n",
        "      \"user_field_storage_runtime_dependency\": \"removed_in_e2_06\"\n",
        "    }"
    );
    format!(
        concat!(
            "{{\n",
            "    \"schema\": \"adenc.shared_runtime.abi.v1\",\n",
            "    \"mode\": \"{}\",\n",
            "    \"compatibility\": {{\n",
            "      \"runtime_abi_schema\": \"{}\",\n",
            "      \"runtime_abi_version\": {},\n",
            "      \"object_model_abi_schema\": \"{}\",\n",
            "      \"object_model_abi_version\": {},\n",
            "      \"version_source\": \"adenc_toolchain_semver\",\n",
            "      \"mismatch_policy\": \"deterministic-fail-fast\"\n",
            "    }},\n",
            "    \"executable_role\": \"app_executable\",\n",
            "    \"runtime_role\": {},\n",
            "    \"imports\": {{\n",
            "      \"kind\": \"procedure_only\",\n",
            "      \"required\": [{}],\n",
            "      \"forbidden_data_import_patterns\": [{}]\n",
            "    }},\n",
            "    \"exports\": {{\n",
            "      \"kind\": \"procedure_only\",\n",
            "      \"visibility\": \"minimal_versioned_abi\",\n",
            "      \"required\": [{}],\n",
            "      \"forbidden_private_export_patterns\": [{}],\n",
            "      \"version_source\": \"adenc_toolchain_semver\"\n",
            "    }},\n",
            "    \"init_sequence\": [\"startup_entry\", \"adenc_rt_init\", \"app_entry\", \"adenc_rt_shutdown\", \"ExitProcess\"],\n",
            "    \"ownership\": {{\n",
            "      \"runtime_private_state\": \"runtime_image\",\n",
            "      \"startup_object\": \"app_image\",\n",
            "      \"user_method_objects\": \"app_image\"\n",
            "    }},\n",
            "    \"runtime_state_layout\": {},\n",
            "    \"transition_status\": {{\n",
            "      \"user_field_storage_imports\": \"removed_in_e2_06\",\n",
            "      \"runtime_bookkeeping_policy\": \"runtime_independent_of_app_field_storage\"\n",
            "    }}\n",
            "  }}"
        ),
        output_mode,
        ABI_VERSION_SCHEMA,
        ABI_VERSION_V2,
        OBJECT_MODEL_ABI_SCHEMA,
        OBJECT_MODEL_ABI_VERSION_V1,
        runtime_role,
        render_string_array(&imported_procedures),
        forbidden_data_import_patterns,
        render_string_array(&exported_procedures),
        forbidden_private_export_patterns,
        runtime_state_layout
    )
}

fn render_shared_boundary_contract(output_mode: &str) -> String {
    let runtime_lookup_metadata = render_runtime_lookup_metadata(output_mode);
    let app_role = "\"app_executable\"";
    let runtime_role = if output_mode == "shared" {
        "\"shared_runtime_library\""
    } else {
        "\"embedded_runtime_payload\""
    };
    format!(
        concat!(
            "{{\n",
            "    \"schema\": \"adenc.shared_boundary.v1\",\n",
            "    \"mode\": \"{}\",\n",
            "    \"participants\": {{\n",
            "      \"app\": {},\n",
            "      \"runtime\": {}\n",
            "    }},\n",
            "    \"ownership_boundary\": {{\n",
            "      \"app_owned\": [\"startup_object\", \"user_method_objects\"],\n",
            "      \"runtime_owned\": [\"runtime_private_state\", \"allocator_state\", \"container_registries\", \"trace_state\"],\n",
            "      \"cross_boundary_access\": \"procedure_imports_and_lookup_metadata_only\"\n",
            "    }},\n",
            "    \"import_boundary\": {{\n",
            "      \"app_import_kind\": \"import_library\",\n",
            "      \"runtime_visibility\": \"minimal_versioned_abi\",\n",
            "      \"runtime_private_data_imports\": \"forbidden\"\n",
            "    }},\n",
            "    \"runtime_lookup_metadata\": {}\n",
            "  }}"
        ),
        output_mode,
        app_role,
        runtime_role,
        runtime_lookup_metadata
    )
}

fn render_target_adapter_metadata(target_id: &str, output_mode: &str) -> String {
    let metadata = resolve_plan_target_adapter_metadata(target_id, output_mode)
        .expect("target adapter metadata should resolve");
    let requested = metadata.requested_target;
    let active = metadata.active_target;
    format!(
        concat!(
            "{{\n",
            "    \"requested\": {{\n",
            "      \"target_id\": \"{}\",\n",
            "      \"os_family\": \"{}\",\n",
            "      \"arch\": \"{}\",\n",
            "      \"support_level\": \"{}\",\n",
            "      \"lane_name\": \"{}\",\n",
            "      \"lane_kind\": \"{}\",\n",
            "      \"bootstrap_status\": \"{}\",\n",
            "      \"strategic_status\": \"{}\",\n",
            "      \"adapter_status\": \"{}\"\n",
            "    }},\n",
            "    \"active\": {{\n",
            "      \"target_id\": \"{}\",\n",
            "      \"os_family\": \"{}\",\n",
            "      \"arch\": \"{}\",\n",
            "      \"support_level\": \"{}\",\n",
            "      \"lane_name\": \"{}\",\n",
            "      \"lane_kind\": \"{}\",\n",
            "      \"bootstrap_status\": \"{}\",\n",
            "      \"strategic_status\": \"{}\",\n",
            "      \"adapter_status\": \"{}\"\n",
            "    }},\n",
            "    \"resolution\": \"{}\",\n",
            "    \"artifact_family\": {{\n",
            "      \"id\": \"{}\",\n",
            "      \"status\": \"{}\"\n",
            "    }},\n",
            "    \"runtime_abi_family\": {{\n",
            "      \"id\": \"{}\",\n",
            "      \"status\": \"{}\"\n",
            "    }}\n",
            "  }}"
        ),
        requested.target_id,
        requested.os_family,
        requested.arch,
        requested.support_level.as_str(),
        requested.lane_name,
        requested.lane_kind.as_str(),
        requested.bootstrap_status(),
        requested.strategic_status(),
        requested.adapter_status(),
        active.target_id,
        active.os_family,
        active.arch,
        active.support_level.as_str(),
        active.lane_name,
        active.lane_kind.as_str(),
        active.bootstrap_status(),
        active.strategic_status(),
        active.adapter_status(),
        metadata.resolution,
        metadata.artifact_family,
        metadata.artifact_status,
        metadata.runtime_abi_family,
        metadata.runtime_abi_status
    )
}

fn render_host_bootstrap_runtime_contract(target_id: &str) -> String {
    let contract: HostBootstrapRuntimeContract = resolve_host_bootstrap_runtime_contract(target_id)
        .expect("host bootstrap runtime contract should resolve");
    format!(
        concat!(
            "{{\n",
            "    \"schema\": \"{}\",\n",
            "    \"contract_status\": \"{}\",\n",
            "    \"implementation_owner\": \"{}\",\n",
            "    \"purpose\": \"{}\",\n",
            "    \"lifecycle_procedures\": [{}],\n",
            "    \"core_runtime_procedures\": [{}],\n",
            "    \"trace_exception_procedures\": [{}],\n",
            "    \"portable_stdlib_bridge\": {{\n",
            "      \"families\": [{}],\n",
            "      \"required_procedures\": [{}],\n",
            "      \"required_procedure_count\": {}\n",
            "    }},\n",
            "    \"adapter_owned_exclusions\": {{\n",
            "      \"runtime_service_imports\": [{}],\n",
            "      \"startup_entry\": \"adapter-owned\",\n",
            "      \"system_inputs\": \"adapter-owned\",\n",
            "      \"artifact_publication\": \"adapter-owned\"\n",
            "    }}\n",
            "  }}"
        ),
        contract.schema,
        contract.contract_status,
        contract.implementation_owner,
        contract.purpose,
        render_str_slice(contract.lifecycle_procedures),
        render_str_slice(contract.core_runtime_procedures),
        render_str_slice(contract.trace_exception_procedures),
        render_str_slice(contract.portable_stdlib_bridge_families),
        render_string_array(&contract.portable_stdlib_bridge_symbols),
        contract.portable_stdlib_bridge_symbols.len(),
        render_str_slice(contract.adapter_service_imports)
    )
}

fn render_requested_target_runtime_service_contract(target_id: &str) -> String {
    let Some(contract) = resolve_requested_target_runtime_service_contract(target_id)
        .expect("requested target runtime-service contract should resolve")
    else {
        return "null".to_string();
    };

    format!(
        concat!(
            "{{\n",
            "    \"schema\": \"{}\",\n",
            "    \"contract_status\": \"{}\",\n",
            "    \"target_id\": \"{}\",\n",
            "    \"implementation_status\": \"{}\",\n",
            "    \"purpose\": \"{}\",\n",
            "    \"console\": {{\n",
            "      \"capabilities\": [{}],\n",
            "      \"text_encoding\": \"{}\"\n",
            "    }},\n",
            "    \"panic\": {{\n",
            "      \"capabilities\": [{}],\n",
            "      \"behavior\": \"{}\"\n",
            "    }},\n",
            "    \"process\": {{\n",
            "      \"capabilities\": [{}],\n",
            "      \"exit_code_type\": \"{}\"\n",
            "    }},\n",
            "    \"minimal_path_file_seams\": {{\n",
            "      \"path_capabilities\": [{}],\n",
            "      \"file_capabilities\": [{}],\n",
            "      \"handle_model\": \"{}\"\n",
            "    }},\n",
            "    \"minimal_service_seams\": {{\n",
            "      \"capabilities\": [{}],\n",
            "      \"payload_shape\": \"service-specific-binary-layout-deferred\"\n",
            "    }},\n",
            "    \"deferred_items\": [{}]\n",
            "  }}"
        ),
        contract.schema,
        contract.contract_status,
        contract.target_id,
        contract.implementation_status,
        contract.purpose,
        render_str_slice(contract.console_capabilities),
        contract.text_encoding,
        render_str_slice(contract.panic_capabilities),
        contract.panic_behavior,
        render_str_slice(contract.process_capabilities),
        contract.exit_code_type,
        render_str_slice(contract.path_capabilities),
        render_str_slice(contract.file_capabilities),
        contract.handle_model,
        render_str_slice(contract.service_capabilities),
        render_str_slice(contract.deferred_items)
    )
}

fn render_runtime_ownership_model(target_id: &str) -> String {
    let model: RuntimeOwnershipModel =
        resolve_runtime_ownership_model(target_id).expect("runtime ownership model should resolve");
    let requested_target_service_contract_schema =
        if let Some(schema) = model.requested_target_service_contract_schema {
            format!("\"{}\"", schema)
        } else {
            "null".to_string()
        };

    format!(
        concat!(
            "{{\n",
            "    \"schema\": \"{}\",\n",
            "    \"contract_status\": \"{}\",\n",
            "    \"aden_owned_surface\": {{\n",
            "      \"namespace_families\": [{}],\n",
            "      \"ownership_rule\": \"{}\"\n",
            "    }},\n",
            "    \"rust_host_bootstrap_owned_surface\": {{\n",
            "      \"retained_runtime_contract_schema\": \"{}\",\n",
            "      \"procedure_families\": [{}],\n",
            "      \"portable_bridge_families\": [{}],\n",
            "      \"runtime_private_state_families\": [{}]\n",
            "    }},\n",
            "    \"adapter_owned_surface\": {{\n",
            "      \"active_categories\": [{}],\n",
            "      \"active_adapter_service_imports\": [{}],\n",
            "      \"requested_target_service_contract_schema\": {},\n",
            "      \"requested_target_service_contract_status\": \"{}\",\n",
            "      \"startup_loader_publication\": \"adapter-owned\"\n",
            "    }},\n",
            "    \"forbidden_blends\": [{}]\n",
            "  }}"
        ),
        model.schema,
        model.contract_status,
        render_str_slice(model.aden_owned_namespace_families),
        model.aden_owned_rule,
        model.retained_host_bootstrap_runtime_schema,
        render_str_slice(model.host_bootstrap_procedure_families),
        render_str_slice(model.host_bootstrap_bridge_families),
        render_str_slice(model.host_bootstrap_runtime_state_families),
        render_str_slice(model.active_adapter_owned_categories),
        render_str_slice(model.active_adapter_service_imports),
        requested_target_service_contract_schema,
        model.requested_target_service_contract_status,
        render_str_slice(model.forbidden_blends)
    )
}

fn render_artifact_contract(contract: &TargetArtifactContract) -> String {
    format!(
        concat!(
            "{{\n",
            "    \"schema\": \"{}\",\n",
            "    \"target_id\": \"{}\",\n",
            "    \"requested_output_mode\": \"{}\",\n",
            "    \"contract_status\": \"{}\",\n",
            "    \"implementation_status\": \"{}\",\n",
            "    \"artifact_family\": \"{}\",\n",
            "    \"requested_output_mode_status\": \"{}\",\n",
            "    \"executable_artifact_kind\": \"{}\",\n",
            "    \"runtime_packaging\": \"{}\",\n",
            "    \"publication_shape\": \"{}\",\n",
            "    \"companion_artifact_kinds\": [{}],\n",
            "    \"naming_policy\": \"{}\",\n",
            "    \"deferred_items\": [{}]\n",
            "  }}"
        ),
        contract.schema,
        contract.target_id,
        contract.requested_output_mode,
        contract.contract_status,
        contract.implementation_status,
        contract.artifact_family,
        contract.requested_output_mode_status,
        contract.executable_artifact_kind,
        contract.runtime_packaging,
        contract.publication_shape,
        render_str_slice(contract.companion_artifact_kinds),
        contract.naming_policy,
        render_str_slice(contract.deferred_items)
    )
}

fn render_artifact_contracts(target_id: &str, output_mode: &str) -> String {
    let active = resolve_active_adapter_artifact_contract(target_id, output_mode)
        .expect("active adapter artifact contract should resolve");
    let requested = resolve_requested_target_artifact_contract(target_id, output_mode)
        .expect("requested target artifact contract should resolve");
    let requested_render = if let Some(contract) = requested.as_ref() {
        render_artifact_contract(contract)
    } else {
        "null".to_string()
    };

    format!(
        concat!(
            "{{\n",
            "    \"active_adapter\": {},\n",
            "    \"requested_target\": {}\n",
            "  }}"
        ),
        render_artifact_contract(&active),
        requested_render
    )
}

fn render_startup_loader_contract(contract: &TargetStartupLoaderContract) -> String {
    let loader_manifest_schema = if let Some(schema) = contract.loader_manifest_schema {
        format!("\"{}\"", schema)
    } else {
        "null".to_string()
    };
    let loader_manifest_path = if let Some(path) = contract.loader_manifest_path {
        format!("\"{}\"", path)
    } else {
        "null".to_string()
    };

    format!(
        concat!(
            "{{\n",
            "    \"schema\": \"{}\",\n",
            "    \"target_id\": \"{}\",\n",
            "    \"requested_output_mode\": \"{}\",\n",
            "    \"contract_status\": \"{}\",\n",
            "    \"implementation_status\": \"{}\",\n",
            "    \"startup_entry_symbol\": \"{}\",\n",
            "    \"startup_entry_abi\": \"{}\",\n",
            "    \"loader_handoff_kind\": \"{}\",\n",
            "    \"runtime_bootstrap_sequence\": [{}],\n",
            "    \"loader_expectations\": [{}],\n",
            "    \"publication_shape\": \"{}\",\n",
            "    \"published_artifacts\": [{}],\n",
            "    \"loader_manifest_schema\": {},\n",
            "    \"loader_manifest_path\": {},\n",
            "    \"runtime_companion_policy\": \"{}\",\n",
            "    \"debug_metadata_policy\": \"{}\",\n",
            "    \"deferred_items\": [{}]\n",
            "  }}"
        ),
        contract.schema,
        contract.target_id,
        contract.requested_output_mode,
        contract.contract_status,
        contract.implementation_status,
        contract.startup_entry_symbol,
        contract.startup_entry_abi,
        contract.loader_handoff_kind,
        render_str_slice(contract.runtime_bootstrap_sequence),
        render_str_slice(contract.loader_expectations),
        contract.publication_shape,
        render_str_slice(contract.published_artifacts),
        loader_manifest_schema,
        loader_manifest_path,
        contract.runtime_companion_policy,
        contract.debug_metadata_policy,
        render_str_slice(contract.deferred_items)
    )
}

fn render_startup_loader_contracts(target_id: &str, output_mode: &str) -> String {
    let active = resolve_active_adapter_startup_loader_contract(target_id, output_mode)
        .expect("active adapter startup/loader contract should resolve");
    let requested = resolve_requested_target_startup_loader_contract(target_id, output_mode)
        .expect("requested target startup/loader contract should resolve");
    let requested_render = if let Some(contract) = requested.as_ref() {
        render_startup_loader_contract(contract)
    } else {
        "null".to_string()
    };

    format!(
        concat!(
            "{{\n",
            "    \"active_adapter\": {},\n",
            "    \"requested_target\": {}\n",
            "  }}"
        ),
        render_startup_loader_contract(&active),
        requested_render
    )
}

fn render_executable_loading_proof_target(target: &TargetExecutableLoadingProofTarget) -> String {
    format!(
        concat!(
            "{{\n",
            "    \"schema\": \"{}\",\n",
            "    \"target_id\": \"{}\",\n",
            "    \"requested_output_mode\": \"{}\",\n",
            "    \"proof_status\": \"{}\",\n",
            "    \"implementation_status\": \"{}\",\n",
            "    \"validation_mode\": \"{}\",\n",
            "    \"startup_loader_contract_schema\": \"{}\",\n",
            "    \"artifact_contract_schema\": \"{}\",\n",
            "    \"runtime_service_contract_schema\": \"{}\",\n",
            "    \"required_published_artifacts\": [{}],\n",
            "    \"required_startup_entry_symbol\": \"{}\",\n",
            "    \"required_loader_manifest_schema\": \"{}\",\n",
            "    \"required_loader_manifest_path\": \"{}\",\n",
            "    \"required_loader_capabilities\": [{}],\n",
            "    \"required_runtime_bootstrap_sequence\": [{}],\n",
            "    \"success_conditions\": [{}],\n",
            "    \"excluded_claims\": [{}]\n",
            "  }}"
        ),
        target.schema,
        target.target_id,
        target.requested_output_mode,
        target.proof_status,
        target.implementation_status,
        target.validation_mode,
        target.startup_loader_contract_schema,
        target.artifact_contract_schema,
        target.runtime_service_contract_schema,
        render_str_slice(target.required_published_artifacts),
        target.required_startup_entry_symbol,
        target.required_loader_manifest_schema,
        target.required_loader_manifest_path,
        render_str_slice(target.required_loader_capabilities),
        render_str_slice(target.required_runtime_bootstrap_sequence),
        render_str_slice(target.success_conditions),
        render_str_slice(target.excluded_claims)
    )
}

fn render_requested_target_executable_loading_proof_target(
    target_id: &str,
    output_mode: &str,
) -> String {
    let Some(target) =
        resolve_requested_target_executable_loading_proof_target(target_id, output_mode)
            .expect("requested target executable-loading proof target should resolve")
    else {
        return "null".to_string();
    };

    render_executable_loading_proof_target(&target)
}

fn render_str_slice(values: &[&str]) -> String {
    values
        .iter()
        .map(|value| format!("\"{}\"", value))
        .collect::<Vec<_>>()
        .join(", ")
}

#[cfg(test)]
pub(crate) fn render_native_build_plan(ir: &IrProgram, ir_path: &Path) -> String {
    render_native_build_plan_with_target_and_output_mode(
        ir,
        ir_path,
        WINDOWS_X64_TARGET_ID,
        "fat",
        "main",
    )
}

#[cfg(test)]
pub(crate) fn render_native_build_plan_with_output_mode(
    ir: &IrProgram,
    ir_path: &Path,
    output_mode: &str,
    output_entry: &str,
) -> String {
    render_native_build_plan_with_target_and_output_mode(
        ir,
        ir_path,
        WINDOWS_X64_TARGET_ID,
        output_mode,
        output_entry,
    )
}

#[cfg(test)]
pub(crate) fn render_native_build_plan_with_target_and_output_mode(
    ir: &IrProgram,
    ir_path: &Path,
    target_id: &str,
    output_mode: &str,
    output_entry: &str,
) -> String {
    render_native_build_plan_with_output_mode_and_link_plan(
        ir,
        ir_path,
        target_id,
        output_mode,
        output_entry,
        None,
    )
}

pub(crate) fn render_native_build_plan_with_output_mode_and_link_plan(
    ir: &IrProgram,
    ir_path: &Path,
    target_id: &str,
    output_mode: &str,
    output_entry: &str,
    link_plan: Option<&NativeLinkPlan>,
) -> String {
    let frame_report = collect_frame_budget_report(ir);
    let debug_alloc_enabled = debug_allocator_enabled();
    let runtime_abi = emitted_runtime_abi_version();
    let object_model_abi = emitted_object_model_abi_version();
    let contract =
        resolve_active_backend_contract(target_id).expect("active backend contract should resolve");
    let mut classes = ir
        .classes
        .iter()
        .map(|c| format!("{}.{}", c.package_name, c.name))
        .collect::<Vec<_>>();
    classes.sort();
    classes.dedup();

    let methods = ir.classes.iter().map(|c| c.methods.len()).sum::<usize>();
    let fields = ir.classes.iter().map(|c| c.fields.len()).sum::<usize>();
    let class_count = ir.classes.len();
    let runtime = contract
        .runtime_symbols
        .iter()
        .map(|s| format!("\"{}\"", s))
        .collect::<Vec<_>>()
        .join(", ");
    let class_list = classes
        .iter()
        .map(|s| format!("\"{}\"", s))
        .collect::<Vec<_>>()
        .join(", ");
    let class_size_table = render_class_size_table(ir);
    let dispatch_slot_table = render_dispatch_slot_table(ir);
    let type_id_table = render_type_id_table(ir);
    let target_adapter_metadata = render_target_adapter_metadata(target_id, output_mode);
    let host_bootstrap_runtime = render_host_bootstrap_runtime_contract(target_id);
    let requested_target_runtime_service_abi =
        render_requested_target_runtime_service_contract(target_id);
    let runtime_ownership_model = render_runtime_ownership_model(target_id);
    let artifact_contracts = render_artifact_contracts(target_id, output_mode);
    let startup_loader_contracts = render_startup_loader_contracts(target_id, output_mode);
    let requested_target_executable_loading_proof_target =
        render_requested_target_executable_loading_proof_target(target_id, output_mode);
    let outputs_topology = render_native_outputs_topology(output_mode, output_entry);
    let link_plan_topology = render_link_plan_topology(ir, target_id, output_mode, link_plan);
    let shared_runtime_abi = render_shared_runtime_abi_boundary(output_mode);
    let shared_boundary_contract = render_shared_boundary_contract(output_mode);

    format!(
        concat!(
            "{{\n",
            "  \"schema\": \"adenc.native.plan.v1\",\n",
            "  \"target_adapter\": {},\n",
            "  \"host_bootstrap_runtime\": {},\n",
            "  \"requested_target_runtime_service_abi\": {},\n",
            "  \"runtime_ownership_model\": {},\n",
            "  \"artifact_contracts\": {},\n",
            "  \"startup_loader_contracts\": {},\n",
            "  \"requested_target_executable_loading_proof_target\": {},\n",
            "  \"target\": {{\n",
            "    \"triple\": \"{}\",\n",
            "    \"object_format\": \"{}\"\n",
            "  }},\n",
            "  \"entry\": {{\n",
            "    \"symbol\": \"{}\",\n",
            "    \"calling_convention\": \"{}\"\n",
            "  }},\n",
            "  \"runtime\": {{\n",
            "    \"abi_version\": \"v2\",\n",
            "    \"abi_compatibility\": {{\n",
            "      \"schema\": \"{}\",\n",
            "      \"compiler_abi_version\": {},\n",
            "      \"runtime_abi_version\": {},\n",
            "      \"mismatch_policy\": \"deterministic-fail-fast\"\n",
            "    }},\n",
            "    \"required_symbols\": [{}],\n",
            "    \"memory_model\": {{\n",
            "      \"strategy\": \"arc\",\n",
            "      \"header_schema\": \"{}\",\n",
            "      \"handle\": {{\n",
            "        \"kind\": \"{}\",\n",
            "        \"null_handle\": {}\n",
            "      }},\n",
            "      \"arc_header\": {{\n",
            "        \"word_size_bits\": {},\n",
            "        \"word_count\": {},\n",
            "        \"words\": [\"kind_tag\", \"refcount\", \"flags\", \"meta_index\"],\n",
            "        \"refcount_bits\": {},\n",
            "        \"refcount_saturation_guard\": {},\n",
            "        \"kind_tags\": {{\n",
            "          \"object\": {},\n",
            "          \"array\": {},\n",
            "          \"string\": {},\n",
            "          \"collection\": {}\n",
            "        }}\n",
            "      }},\n",
            "      \"allocator\": {{\n",
            "        \"schema\": \"{}\",\n",
            "        \"backend\": \"{}\",\n",
            "        \"slot_capacity\": {},\n",
            "        \"slot_capacity_initial\": {},\n",
            "        \"slot_capacity_growth\": \"runtime-doubling\",\n",
            "        \"alignment\": {{\n",
            "          \"pointer_bytes\": {},\n",
            "          \"lane_bytes\": {{ \"int\": {}, \"handle\": {} }}\n",
            "        }},\n",
            "        \"array_storage\": {{\n",
            "          \"lanes\": [\"int\", \"string_handle\"],\n",
            "          \"backing\": \"per-instance-heap\"\n",
            "        }},\n",
            "        \"container_storage\": {{\n",
            "          \"list\": {{\n",
            "            \"init_capacity\": {},\n",
            "            \"max_capacity\": {},\n",
            "            \"growth_factor\": {{ \"numerator\": {}, \"denominator\": {} }},\n",
            "            \"shrink\": {{ \"hysteresis_trigger_multiplier\": {} }}\n",
            "          }},\n",
            "          \"map\": {{\n",
            "            \"init_capacity\": {},\n",
            "            \"max_capacity\": {},\n",
            "            \"growth_factor\": {{ \"numerator\": {}, \"denominator\": {} }},\n",
            "            \"shrink\": {{ \"hysteresis_trigger_multiplier\": {} }}\n",
            "          }}\n",
            "        }},\n",
            "        \"failure_mode\": \"deterministic-fatal\"\n",
            "      }},\n",
            "      \"cycle_detector\": {{\n",
            "        \"schema\": \"{}\",\n",
            "        \"strategy\": \"trial-deletion\",\n",
            "        \"cadence\": {{\n",
            "          \"young_window\": {},\n",
            "          \"full_interval_ticks\": {}\n",
            "        }},\n",
            "        \"failure_semantics\": {{\n",
            "          \"zero_reclaim_lag_limit\": {},\n",
            "          \"lag_action\": \"track\"\n",
            "        }},\n",
            "        \"passes\": [\"young\", \"full\"],\n",
            "        \"tick_entry\": \"arcCycleTick\"\n",
            "      }},\n",
            "      \"frame_budget\": {{\n",
            "        \"warn_bytes\": {},\n",
            "        \"fail_bytes\": {},\n",
            "        \"max_frame_bytes\": {},\n",
            "        \"max_frame_method\": \"{}\",\n",
            "        \"warn_violations\": {},\n",
            "        \"fail_violations\": {}\n",
            "      }},\n",
            "      \"debug_allocator\": {{\n",
            "        \"enabled\": {}\n",
            "      }},\n",
            "      \"threading\": {{\n",
            "        \"schema\": \"{}\",\n",
            "        \"model\": \"{}\",\n",
            "        \"arc_atomicity\": \"{}\",\n",
            "        \"runtime_thread_safety\": \"{}\",\n",
            "        \"container_thread_safety\": \"{}\"\n",
            "      }},\n",
            "      \"object_model\": {{\n",
            "        \"schema\": \"{}\",\n",
            "        \"layout_version\": {},\n",
            "        \"instance_layout\": {{\n",
            "          \"header_bytes\": {},\n",
            "          \"field_slot_bytes\": {},\n",
            "          \"alignment_bytes\": {},\n",
            "          \"field_ordering\": \"declaration-order\",\n",
            "          \"inherited_field_placement\": \"base-prefix-then-derived\"\n",
            "        }},\n",
            "        \"static_storage\": {{\n",
            "          \"schema\": \"{}\",\n",
            "          \"owner_model\": \"class-owned\",\n",
            "          \"symbol_model\": \"per-class-field-symbol\",\n",
            "          \"initialization_order\": \"declaration-order-within-class\",\n",
            "          \"access_rules\": {{\n",
            "            \"class_reference_read\": \"allowed\",\n",
            "            \"class_reference_write\": \"allowed\",\n",
            "            \"instance_reference_read\": \"forbidden\",\n",
            "            \"instance_reference_write\": \"forbidden\"\n",
            "          }}\n",
            "        }},\n",
            "        \"dispatch\": {{\n",
            "          \"schema\": \"{}\",\n",
            "          \"slot_assignment\": \"deterministic-lexicographic-signature\",\n",
            "          \"virtual_call_mode\": \"planned-runtime-vtable\",\n",
            "          \"interface_call_mode\": \"planned-runtime-interface-bridge\",\n",
            "          \"devirtualization\": {{\n",
            "            \"mode\": \"safe-fast-paths\",\n",
            "            \"rules\": [\"static-direct\", \"super-direct\", \"final-method-direct\", \"private-method-direct\", \"final-class-direct\"],\n",
            "            \"parity_requirement\": \"behavioral-equivalence-with-runtime-dispatch\"\n",
            "          }},\n",
            "          \"slot_table\": [{}]\n",
            "        }},\n",
            "        \"constructor_model\": {{\n",
            "          \"schema\": \"{}\",\n",
            "          \"receiver_allocation\": \"allocated-before-body\",\n",
            "          \"chaining\": \"explicit-this-super-unsupported\",\n",
            "          \"implicit_super\": \"not-emitted\",\n",
            "          \"return_behavior\": \"implicit-receiver\",\n",
            "          \"failure_mode\": \"deterministic-fatal\"\n",
            "        }},\n",
            "        \"allocation\": {{\n",
            "          \"schema\": \"{}\",\n",
            "          \"size_formula\": \"header_bytes + (instance_field_count * field_slot_bytes)\",\n",
            "          \"allocator_integration\": \"slot-allocator-with-class-size-metadata\",\n",
            "          \"class_size_table\": [{}]\n",
            "        }},\n",
            "        \"type_ids\": {{\n",
            "          \"schema\": \"{}\",\n",
            "          \"class_id_width_bits\": 32,\n",
            "          \"source\": \"deterministic-class-order\",\n",
            "          \"class_table\": [{}]\n",
            "        }},\n",
            "        \"abi_compatibility\": {{\n",
            "          \"schema\": \"{}\",\n",
            "          \"version\": {},\n",
            "          \"compiler_object_model_abi_version\": {},\n",
            "          \"runtime_object_model_abi_version\": {},\n",
            "          \"mismatch_policy\": \"deterministic-fail-fast\"\n",
            "        }}\n",
            "      }}\n",
            "    }}\n",
            "  }},\n",
            "  \"inputs\": {{\n",
            "    \"ir_artifact\": \"{}\"\n",
            "  }},\n",
            "  \"outputs\": {},\n",
            "  \"shared_boundary\": {},\n",
            "  \"shared_runtime_abi\": {},\n",
            "  \"link_plan\": {},\n",
            "  \"summary\": {{\n",
            "    \"classes\": {},\n",
            "    \"methods\": {},\n",
            "    \"fields\": {}\n",
            "  }},\n",
            "  \"class_names\": [{}]\n",
            "}}\n"
        ),
        target_adapter_metadata,
        host_bootstrap_runtime,
        requested_target_runtime_service_abi,
        runtime_ownership_model,
        artifact_contracts,
        startup_loader_contracts,
        requested_target_executable_loading_proof_target,
        contract.target_triple,
        contract.object_format,
        contract.entry_symbol,
        contract.calling_convention,
        ABI_VERSION_SCHEMA,
        ABI_VERSION_V2,
        runtime_abi,
        runtime,
        ARC_HEADER_SCHEMA,
        ARC_HANDLE_KIND,
        ARC_HANDLE_NULL,
        ARC_HEADER_WORD_SIZE_BITS,
        ARC_HEADER_WORD_COUNT,
        ARC_REFCOUNT_BITS,
        ARC_REFCOUNT_SATURATION_GUARD,
        ARC_KIND_TAG_OBJECT,
        ARC_KIND_TAG_ARRAY,
        ARC_KIND_TAG_STRING,
        ARC_KIND_TAG_COLLECTION,
        ALLOCATOR_POLICY_SCHEMA,
        ALLOCATOR_BACKEND,
        HANDLE_SLOT_CAPACITY,
        HANDLE_SLOT_INITIAL_CAPACITY,
        POINTER_ALIGNMENT_BYTES,
        LANE_ALIGNMENT_BYTES,
        POINTER_ALIGNMENT_BYTES,
        LIST_INIT_CAPACITY,
        LIST_MAX_CAPACITY,
        LIST_GROWTH_FACTOR_NUM,
        LIST_GROWTH_FACTOR_DEN,
        LIST_SHRINK_HYSTERESIS_MULT,
        MAP_INIT_CAPACITY,
        MAP_MAX_CAPACITY,
        MAP_GROWTH_FACTOR_NUM,
        MAP_GROWTH_FACTOR_DEN,
        MAP_SHRINK_HYSTERESIS_MULT,
        ARC_CYCLE_SCHEMA,
        ARC_CYCLE_YOUNG_WINDOW,
        ARC_CYCLE_FULL_INTERVAL_TICKS,
        ARC_CYCLE_LAG_ZERO_RECLAIM_LIMIT,
        FRAME_BUDGET_WARN_BYTES,
        FRAME_BUDGET_FAIL_BYTES,
        frame_report.max_frame_bytes,
        frame_report.max_frame_method,
        frame_report.warn_violations.len(),
        frame_report.fail_violations.len(),
        if debug_alloc_enabled { "true" } else { "false" },
        THREADING_MODEL_SCHEMA,
        THREADING_MODEL,
        ARC_ATOMICITY,
        RUNTIME_THREAD_SAFETY,
        CONTAINER_THREAD_SAFETY,
        OBJECT_MODEL_SCHEMA,
        OBJECT_LAYOUT_VERSION,
        OBJECT_HEADER_BYTES,
        OBJECT_FIELD_SLOT_BYTES,
        OBJECT_ALIGNMENT_BYTES,
        STATIC_STORAGE_SCHEMA,
        DISPATCH_SCHEMA,
        dispatch_slot_table,
        CONSTRUCTOR_MODEL_SCHEMA,
        CLASS_ALLOC_SCHEMA,
        class_size_table,
        TYPE_ID_SCHEMA,
        type_id_table,
        OBJECT_MODEL_ABI_SCHEMA,
        emitted_object_model_abi_version(),
        OBJECT_MODEL_ABI_VERSION_V1,
        object_model_abi,
        ir_path.display(),
        outputs_topology,
        shared_boundary_contract,
        shared_runtime_abi,
        link_plan_topology,
        class_count,
        methods,
        fields,
        class_list
    )
}
