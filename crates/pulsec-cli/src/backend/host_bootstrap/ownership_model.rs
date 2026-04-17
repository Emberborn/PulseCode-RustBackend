use super::runtime_contract::resolve_host_bootstrap_runtime_contract;
use crate::backend::adapters::resolve_requested_target_runtime_service_contract;

const RUNTIME_OWNERSHIP_MODEL_SCHEMA: &str = "pulsec.runtime.ownership.rebase.v1";
const RUNTIME_OWNERSHIP_MODEL_STATUS: &str = "rb-14-explicit-three-way-split";
const PULSE_OWNED_NAMESPACE_FAMILIES: &[&str] = &[
    "pulse.lang.*",
    "pulse.io.*",
    "pulse.collections.*",
    "pulse.math.*",
    "pulse.memory.*",
    "pulse.rt.*",
];
const HOST_BOOTSTRAP_PROCEDURE_FAMILIES: &[&str] = &[
    "lifecycle",
    "core-runtime-bridge",
    "trace-exception",
    "portable-stdlib-bridge",
];
const HOST_BOOTSTRAP_RUNTIME_STATE_FAMILIES: &[&str] = &[
    "object-and-class-id-metadata",
    "slot-allocator-state",
    "arc-and-cycle-state",
    "weak-reference-state",
    "container-registries",
    "trace-abi-and-scratch-state",
];
const ADAPTER_OWNED_CATEGORIES: &[&str] = &[
    "startup-entry-and-exit-boundary",
    "system-service-imports",
    "system-link-inputs",
    "loader-and-publication-shape",
    "requested-target-runtime-service-implementation",
];
const FORBIDDEN_BLENDS: &[&str] = &[
    "public-pulse-surface-must-not-be-recast-as-adapter-owned",
    "runtime-private-state-must-not-become-app-or-stdlib-owned-storage",
    "windows-service-imports-must-not-become-portable-runtime-or-pulseos-defaults",
    "startup-loader-publication-must-stay-adapter-owned",
];

#[derive(Debug, Clone)]
pub(crate) struct RuntimeOwnershipModel {
    pub(crate) schema: &'static str,
    pub(crate) contract_status: &'static str,
    pub(crate) pulse_owned_namespace_families: &'static [&'static str],
    pub(crate) pulse_owned_rule: &'static str,
    pub(crate) retained_host_bootstrap_runtime_schema: &'static str,
    pub(crate) host_bootstrap_procedure_families: &'static [&'static str],
    pub(crate) host_bootstrap_bridge_families: &'static [&'static str],
    pub(crate) host_bootstrap_runtime_state_families: &'static [&'static str],
    pub(crate) active_adapter_owned_categories: &'static [&'static str],
    pub(crate) active_adapter_service_imports: &'static [&'static str],
    pub(crate) requested_target_service_contract_schema: Option<&'static str>,
    pub(crate) requested_target_service_contract_status: &'static str,
    pub(crate) forbidden_blends: &'static [&'static str],
}

pub(crate) fn resolve_runtime_ownership_model(
    requested_target_id: &str,
) -> Result<RuntimeOwnershipModel, String> {
    let bootstrap_contract = resolve_host_bootstrap_runtime_contract(requested_target_id)?;
    let requested_target_service_contract =
        resolve_requested_target_runtime_service_contract(requested_target_id)?;
    let requested_target_service_contract_schema =
        requested_target_service_contract.map(|contract| contract.schema);
    let requested_target_service_contract_status =
        if requested_target_service_contract_schema.is_some() {
            "published-first-slice-contract"
        } else {
            "not-published-for-this-target"
        };

    Ok(RuntimeOwnershipModel {
        schema: RUNTIME_OWNERSHIP_MODEL_SCHEMA,
        contract_status: RUNTIME_OWNERSHIP_MODEL_STATUS,
        pulse_owned_namespace_families: PULSE_OWNED_NAMESPACE_FAMILIES,
        pulse_owned_rule:
            "language-facing behavior belongs in Pulse stdlib/runtime code unless it genuinely requires bootstrap runtime or adapter glue",
        retained_host_bootstrap_runtime_schema: bootstrap_contract.schema,
        host_bootstrap_procedure_families: HOST_BOOTSTRAP_PROCEDURE_FAMILIES,
        host_bootstrap_bridge_families: bootstrap_contract.portable_stdlib_bridge_families,
        host_bootstrap_runtime_state_families: HOST_BOOTSTRAP_RUNTIME_STATE_FAMILIES,
        active_adapter_owned_categories: ADAPTER_OWNED_CATEGORIES,
        active_adapter_service_imports: bootstrap_contract.adapter_service_imports,
        requested_target_service_contract_schema,
        requested_target_service_contract_status,
        forbidden_blends: FORBIDDEN_BLENDS,
    })
}
