// RB-07 layer ownership: Rust-host bootstrap orchestration belongs here.
// The current implementation shard lives under `backend/analysis/analysis_support.rs`.
mod ownership_model;
mod runtime_contract;

pub(crate) use self::ownership_model::{resolve_runtime_ownership_model, RuntimeOwnershipModel};
pub(crate) use self::runtime_contract::{
    resolve_host_bootstrap_runtime_contract, HostBootstrapRuntimeContract,
};
pub use super::analysis::RustHostBootstrapBackend;
