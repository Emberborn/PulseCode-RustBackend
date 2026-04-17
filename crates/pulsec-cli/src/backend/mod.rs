mod adapters;
mod analysis;
mod emission;
mod host_bootstrap;
mod support;
mod target_neutral;

use std::collections::{BTreeMap, HashMap, HashSet};
use std::env;
use std::fs;
use std::path::{Path, PathBuf};

pub(crate) use self::adapters::resolve_plan_target_adapter_metadata;
pub(crate) use self::support::PlanTargetAdapterMetadata;
pub use self::host_bootstrap::RustHostBootstrapBackend;
use pulsec_core::intermediate::{
    IrBinaryOp, IrBlock, IrField, IrFieldInit, IrFieldInitArg, IrInstr, IrTerminator, IrUnaryOp, IrValueId,
    IrValueKind,
};
use pulsec_core::{IrClass, IrMethod, IrProgram, IrVisibility};

const TRACE_PUSH_SYMBOL: &str = "pulsec_rt_tracePush";
const TRACE_UPDATE_SYMBOL: &str = "pulsec_rt_traceUpdateTop";
const TRACE_POP_SYMBOL: &str = "pulsec_rt_tracePop";
const TRACE_DUMP_SYMBOL: &str = "pulsec_rt_traceDump";
const EXC_PUSH_HANDLER_SYMBOL: &str = "pulsec_rt_pushExceptionHandler";
const EXC_POP_HANDLER_SYMBOL: &str = "pulsec_rt_popExceptionHandler";
const EXC_TAKE_PENDING_SYMBOL: &str = "pulsec_rt_takePendingException";
const EXC_THROW_SYMBOL: &str = "pulsec_rt_throw";
const WRITE_RAW_SYMBOL: &str = "pulsec_rt_writeRaw";
const ARC_HEADER_SCHEMA: &str = "pulsec.arc.header.v1";
const ARC_HANDLE_KIND: &str = "u64-slot32-gen32-handle";
const ARC_HANDLE_NULL: u32 = 0;
const ARC_HEADER_WORD_SIZE_BITS: u32 = 32;
const ARC_HEADER_WORD_COUNT: u32 = 4;
const ARC_REFCOUNT_BITS: u32 = 32;
const ARC_REFCOUNT_SATURATION_GUARD: u32 = 0xFFFF_FFFE;
const ARC_KIND_TAG_OBJECT: u32 = 1;
const ARC_KIND_TAG_ARRAY: u32 = 2;
const ARC_KIND_TAG_STRING: u32 = 3;
const ARC_KIND_TAG_COLLECTION: u32 = 4;
const ARC_CYCLE_SCHEMA: &str = "pulsec.arc.cycle.v1";
const ARC_CYCLE_YOUNG_WINDOW: u32 = 64;
const ARC_CYCLE_FULL_INTERVAL_TICKS: u32 = 8;
const ARC_CYCLE_LAG_ZERO_RECLAIM_LIMIT: u32 = 1024;
const ALLOCATOR_POLICY_SCHEMA: &str = "pulsec.alloc.policy.v1";
const ALLOCATOR_BACKEND: &str = "win64-process-heap";
const HANDLE_SLOT_INITIAL_CAPACITY: u32 = 63;
const HANDLE_SLOT_CAPACITY: u32 = ARC_HANDLE_SLOT_MASK;
const OBJECT_SLOT_CAPACITY: u32 = HANDLE_SLOT_CAPACITY;
const POINTER_ALIGNMENT_BYTES: u32 = 8;
const LANE_ALIGNMENT_BYTES: u32 = 4;
const LIST_INIT_CAPACITY: u32 = 16;
const ARRAY_MAX_LENGTH: u32 = i32::MAX as u32;
const LIST_MAX_CAPACITY: u32 = ARRAY_MAX_LENGTH;
const LIST_GROWTH_FACTOR_NUM: u32 = 2;
const LIST_GROWTH_FACTOR_DEN: u32 = 1;
const LIST_SHRINK_HYSTERESIS_MULT: u32 = 4;
const MAP_INIT_CAPACITY: u32 = 16;
const MAP_MAX_CAPACITY: u32 = ARRAY_MAX_LENGTH;
const MAP_GROWTH_FACTOR_NUM: u32 = 2;
const MAP_GROWTH_FACTOR_DEN: u32 = 1;
const MAP_SHRINK_HYSTERESIS_MULT: u32 = 4;
const RT_OBJECT_COUNTER_SYMBOL: &str = "pulsec_rt_obj_counter";
const RT_OBJECT_CLASS_IDS_SYMBOL: &str = "pulsec_rt_obj_class_ids";
const RT_OBJECT_CLASS_IDS_INIT_SYMBOL: &str = "pulsec_rt_obj_class_ids_init";
const RT_OBJECT_CLASS_IDS_HEAP_OWNED_SYMBOL: &str = "pulsec_rt_obj_class_ids_heap_owned";
const OBJECT_NEW_SYMBOL: &str = "pulsec_rt_objectNew";
const OBJECT_CLASS_ID_SYMBOL: &str = "pulsec_rt_objectClassId";
const OBJECT_CLASS_NAME_SYMBOL: &str = "pulsec_rt_objectClassName";
const OBJECT_HASH_CODE_SYMBOL: &str = "pulsec_rt_objectHashCode";
const SYSTEM_CURRENT_TIME_MILLIS_SYMBOL: &str = "pulsec_rt_currentTimeMillis";
const SYSTEM_NANO_TIME_SYMBOL: &str = "pulsec_rt_nanoTime";
const SYSTEM_EXIT_SYMBOL: &str = "pulsec_rt_systemExit";
const STRING_CHAR_AT_SYMBOL: &str = "pulsec_rt_stringCharAt";
const CHAR_TO_STRING_SYMBOL: &str = "pulsec_rt_charToString";
const DISPATCH_NULL_PANIC_SYMBOL: &str = "pulsec_rt_dispatchNullReceiverPanic";
const DISPATCH_TYPE_PANIC_SYMBOL: &str = "pulsec_rt_dispatchInvalidTypePanic";

const STRING_SLOT_BYTES: u32 = 4096;
const ARC_ARG_SPILL_STRIDE: usize = 8;
const ARC_ARG_SPILL_MAX: usize = 4;
const ARC_SCRATCH_EXTRA_SLOTS: usize = 7;
const MAX_NESTED_CALL_ARG_PRESERVE_DEPTH: usize = 256;
const FRAME_BUDGET_WARN_BYTES: usize = 1024;
const FRAME_BUDGET_FAIL_BYTES: usize = 4096;
const ARC_HANDLE_SLOT_MASK: u32 = 0xFFFF_FFFF;
const ARC_HANDLE_GEN_SHIFT: u32 = 32;
const THREADING_MODEL_SCHEMA: &str = "pulsec.runtime.threading.v1";
const THREADING_MODEL: &str = "single-threaded";
const ARC_ATOMICITY: &str = "non-atomic";

#[derive(Clone, Debug)]
pub struct BackendArtifact {
    pub classes: usize,
    pub methods: usize,
    pub fields: usize,
    pub ir_artifact_path: PathBuf,
    pub native_plan_path: PathBuf,
    pub object_path: PathBuf,
    pub exe_path: Option<PathBuf>,
    pub runtime_library_path: Option<PathBuf>,
    pub runtime_import_library_path: Option<PathBuf>,
    pub link_report_path: PathBuf,
    pub entry_codegen: String,
    pub link_plan: NativeLinkPlan,
}

#[derive(Debug, Clone, Default)]
pub struct NativeLinkPlan {
    pub startup_objects: Vec<PathBuf>,
    pub app_owned_objects: Vec<PathBuf>,
    pub runtime_owned_objects: Vec<PathBuf>,
    pub system_inputs: Vec<PathBuf>,
    pub shared_runtime_exports: Vec<String>,
}

#[derive(Debug, Clone)]
pub struct SharedLinkArtifacts {
    pub exe_path: Option<PathBuf>,
    pub runtime_library_path: PathBuf,
    pub runtime_import_library_path: PathBuf,
}

pub trait BackendAdapter {
    fn emit(&self, ir: &IrProgram, out_dir: &Path) -> Result<BackendArtifact, String>;
}

#[cfg(test)]
mod tests;
