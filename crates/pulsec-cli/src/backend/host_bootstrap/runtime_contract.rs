use crate::backend::adapters::resolve_host_bootstrap_target_adapter;
use crate::backend::support::default_stdlib_symbols;

const HOST_BOOTSTRAP_RUNTIME_SCHEMA: &str = "pulsec.host_bootstrap.runtime.v1";
const HOST_BOOTSTRAP_RUNTIME_STATUS: &str = "minimum-retained-bootstrap-surface";
const HOST_BOOTSTRAP_RUNTIME_OWNER: &str = "rust-host-bootstrap-layer";
const HOST_BOOTSTRAP_RUNTIME_PURPOSE: &str =
    "keep compiler artifact emission and executable validation moving during target-adapter transition";
const HOST_BOOTSTRAP_STDLIB_BRIDGE_FAMILIES: &[&str] = &[
    "console-io",
    "string-and-number-text",
    "time-and-process",
    "array-runtime",
    "list-runtime",
    "map-runtime",
    "memory-ownership",
    "math-helpers",
];
const HOST_BOOTSTRAP_LIFECYCLE_PROCEDURES: &[&str] = &["pulsec_rt_init", "pulsec_rt_shutdown"];
const HOST_BOOTSTRAP_CORE_RUNTIME_PROCEDURES: &[&str] = &[
    "pulsec_rt_stringFromBytes",
    super::super::OBJECT_NEW_SYMBOL,
    super::super::OBJECT_CLASS_ID_SYMBOL,
    super::super::OBJECT_CLASS_NAME_SYMBOL,
    super::super::OBJECT_HASH_CODE_SYMBOL,
];
const HOST_BOOTSTRAP_TRACE_EXCEPTION_PROCEDURES: &[&str] = &[
    super::super::TRACE_PUSH_SYMBOL,
    super::super::TRACE_UPDATE_SYMBOL,
    super::super::TRACE_POP_SYMBOL,
    super::super::TRACE_DUMP_SYMBOL,
    super::super::EXC_PUSH_HANDLER_SYMBOL,
    super::super::EXC_POP_HANDLER_SYMBOL,
    super::super::EXC_TAKE_PENDING_SYMBOL,
    super::super::EXC_THROW_SYMBOL,
];

#[derive(Debug, Clone)]
pub(crate) struct HostBootstrapRuntimeContract {
    pub(crate) schema: &'static str,
    pub(crate) contract_status: &'static str,
    pub(crate) implementation_owner: &'static str,
    pub(crate) purpose: &'static str,
    pub(crate) lifecycle_procedures: &'static [&'static str],
    pub(crate) core_runtime_procedures: &'static [&'static str],
    pub(crate) trace_exception_procedures: &'static [&'static str],
    pub(crate) portable_stdlib_bridge_families: &'static [&'static str],
    pub(crate) portable_stdlib_bridge_symbols: Vec<String>,
    pub(crate) adapter_service_imports: &'static [&'static str],
}

pub(crate) fn resolve_host_bootstrap_runtime_contract(
    requested_target_id: &str,
) -> Result<HostBootstrapRuntimeContract, String> {
    let adapter = resolve_host_bootstrap_target_adapter(requested_target_id)?;
    let mut portable_stdlib_bridge_symbols =
        default_stdlib_symbols().into_values().collect::<Vec<_>>();
    portable_stdlib_bridge_symbols.sort();
    portable_stdlib_bridge_symbols.dedup();

    Ok(HostBootstrapRuntimeContract {
        schema: HOST_BOOTSTRAP_RUNTIME_SCHEMA,
        contract_status: HOST_BOOTSTRAP_RUNTIME_STATUS,
        implementation_owner: HOST_BOOTSTRAP_RUNTIME_OWNER,
        purpose: HOST_BOOTSTRAP_RUNTIME_PURPOSE,
        lifecycle_procedures: HOST_BOOTSTRAP_LIFECYCLE_PROCEDURES,
        core_runtime_procedures: HOST_BOOTSTRAP_CORE_RUNTIME_PROCEDURES,
        trace_exception_procedures: HOST_BOOTSTRAP_TRACE_EXCEPTION_PROCEDURES,
        portable_stdlib_bridge_families: HOST_BOOTSTRAP_STDLIB_BRIDGE_FAMILIES,
        portable_stdlib_bridge_symbols,
        adapter_service_imports: adapter.runtime_service_imports(),
    })
}
