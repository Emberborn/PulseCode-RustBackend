use super::*;

use crate::cli::target_model::{
    resolve_target_descriptor, TargetDescriptor, WINDOWS_X64_TARGET_ID,
};

#[derive(Debug, Clone, Copy)]
pub(crate) struct PlanTargetAdapterMetadata {
    pub(crate) requested_target: TargetDescriptor,
    pub(crate) active_target: TargetDescriptor,
    pub(crate) resolution: &'static str,
    pub(crate) artifact_family: &'static str,
    pub(crate) artifact_status: &'static str,
    pub(crate) runtime_abi_family: &'static str,
    pub(crate) runtime_abi_status: &'static str,
}

#[derive(Debug, Clone, Copy)]
pub(crate) struct BackendContract {
    pub(crate) target_descriptor: &'static TargetDescriptor,
    pub(crate) target_triple: &'static str,
    pub(crate) object_format: &'static str,
    pub(crate) entry_symbol: &'static str,
    pub(crate) calling_convention: &'static str,
    pub(crate) runtime_symbols: &'static [&'static str],
}

pub(crate) fn windows_x64_backend_contract() -> BackendContract {
    BackendContract {
        target_descriptor: resolve_target_descriptor(WINDOWS_X64_TARGET_ID)
            .expect("windows target descriptor"),
        target_triple: "x86_64-pc-windows-msvc",
        object_format: "coff",
        entry_symbol: "main",
        calling_convention: "system",
        runtime_symbols: &[
            "pulse.rt.Intrinsics.consoleReadLine",
            "pulse.rt.Intrinsics.consoleWriteLine",
            "pulse.rt.Intrinsics.consoleWrite",
            "pulse.rt.Intrinsics.consoleErrorWriteLine",
            "pulse.rt.Intrinsics.consoleErrorWrite",
            "pulse.rt.Intrinsics.panic",
            "pulse.rt.Intrinsics.stringConcat",
            "pulse.rt.Intrinsics.stringLength",
            "pulse.rt.Intrinsics.objectClassName",
            "pulse.rt.Intrinsics.objectHashCode",
            "pulse.lang.String.runtimeConcat",
            "pulse.lang.String.runtimeLength",
            "pulse.lang.String.runtimeCharAt",
            "pulse.lang.String.runtimeFromChar",
            "pulse.rt.Intrinsics.pushExceptionHandler",
            "pulse.rt.Intrinsics.popExceptionHandler",
            "pulse.rt.Intrinsics.takePendingException",
            "pulse.rt.Intrinsics.throwPending",
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
            "pulse.rt.Intrinsics.hostCreateDirectory",
            "pulse.rt.Intrinsics.hostWriteAllText",
            "pulse.rt.Intrinsics.hostCopyFile",
            "pulse.rt.Intrinsics.hostRunShellProcess",
            "pulse.memory.Memory.retain",
            "pulse.memory.Memory.release",
            "pulse.memory.Memory.cycleYoungPass",
            "pulse.memory.Memory.cycleFullPass",
            "pulse.memory.Memory.cycleTick",
            "pulse.memory.Memory.weakNew",
            "pulse.memory.Memory.weakGet",
            "pulse.memory.Memory.weakClear",
            "pulse.lang.System.currentTimeMillis",
            "pulse.lang.System.nanoTime",
            "pulse.lang.System.exit",
            "pulse.io.Console.writeLine",
            "pulse.io.File.readAllText",
        ],
    }
}

pub(crate) fn default_stdlib_symbols() -> HashMap<(String, String), String> {
    let mut out = HashMap::new();
    out.insert(
        ("Intrinsics".to_string(), "consoleReadLine".to_string()),
        "pulsec_rt_consoleReadLine".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "consoleWriteLine".to_string()),
        "pulsec_rt_consoleWriteLine".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "consoleWrite".to_string()),
        "pulsec_rt_consoleWrite".to_string(),
    );
    out.insert(
        (
            "Intrinsics".to_string(),
            "consoleErrorWriteLine".to_string(),
        ),
        "pulsec_rt_consoleErrorWriteLine".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "consoleErrorWrite".to_string()),
        "pulsec_rt_consoleErrorWrite".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "panic".to_string()),
        "pulsec_rt_panic".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "stringConcat".to_string()),
        "pulsec_rt_stringConcat".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "stringLength".to_string()),
        "pulsec_rt_stringLength".to_string(),
    );
    out.insert(
        (
            "Intrinsics".to_string(),
            "__dispatchNullReceiverPanic".to_string(),
        ),
        DISPATCH_NULL_PANIC_SYMBOL.to_string(),
    );
    out.insert(
        (
            "Intrinsics".to_string(),
            "__dispatchInvalidTypePanic".to_string(),
        ),
        DISPATCH_TYPE_PANIC_SYMBOL.to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "objectClassName".to_string()),
        OBJECT_CLASS_NAME_SYMBOL.to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "objectHashCode".to_string()),
        OBJECT_HASH_CODE_SYMBOL.to_string(),
    );
    out.insert(
        ("String".to_string(), "runtimeConcat".to_string()),
        "pulsec_rt_stringConcat".to_string(),
    );
    out.insert(
        ("String".to_string(), "runtimeLength".to_string()),
        "pulsec_rt_stringLength".to_string(),
    );
    out.insert(
        ("String".to_string(), "runtimeCharAt".to_string()),
        STRING_CHAR_AT_SYMBOL.to_string(),
    );
    out.insert(
        ("String".to_string(), "runtimeFromChar".to_string()),
        CHAR_TO_STRING_SYMBOL.to_string(),
    );
    out.insert(
        ("System".to_string(), "currentTimeMillis".to_string()),
        SYSTEM_CURRENT_TIME_MILLIS_SYMBOL.to_string(),
    );
    out.insert(
        ("System".to_string(), "nanoTime".to_string()),
        SYSTEM_NANO_TIME_SYMBOL.to_string(),
    );
    out.insert(
        ("System".to_string(), "exit".to_string()),
        SYSTEM_EXIT_SYMBOL.to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "arrayNew".to_string()),
        "pulsec_rt_arrayNew".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "arrayNewMulti".to_string()),
        "pulsec_rt_arrayNewMulti".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "arrayLength".to_string()),
        "pulsec_rt_arrayLength".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "arrayGetInt".to_string()),
        "pulsec_rt_arrayGetInt".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "arraySetInt".to_string()),
        "pulsec_rt_arraySetInt".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "arrayGetLong".to_string()),
        "pulsec_rt_arrayGetLong".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "arraySetLong".to_string()),
        "pulsec_rt_arraySetLong".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "arrayGetString".to_string()),
        "pulsec_rt_arrayGetString".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "arraySetString".to_string()),
        "pulsec_rt_arraySetString".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "listNew".to_string()),
        "pulsec_rt_listNew".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "listSize".to_string()),
        "pulsec_rt_listSize".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "listKind".to_string()),
        "pulsec_rt_listKind".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "listClear".to_string()),
        "pulsec_rt_listClear".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "listAddInt".to_string()),
        "pulsec_rt_listAddInt".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "listAddString".to_string()),
        "pulsec_rt_listAddString".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "listGetInt".to_string()),
        "pulsec_rt_listGetInt".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "listGetString".to_string()),
        "pulsec_rt_listGetString".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "mapNew".to_string()),
        "pulsec_rt_mapNew".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "mapSize".to_string()),
        "pulsec_rt_mapSize".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "mapClear".to_string()),
        "pulsec_rt_mapClear".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "mapContainsKey".to_string()),
        "pulsec_rt_mapContainsKey".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "mapPut".to_string()),
        "pulsec_rt_mapPut".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "mapPutInt".to_string()),
        "pulsec_rt_mapPutInt".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "mapGet".to_string()),
        "pulsec_rt_mapGet".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "mapGetInt".to_string()),
        "pulsec_rt_mapGetInt".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostExists".to_string()),
        "pulsec_rt_hostExists".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostIsFile".to_string()),
        "pulsec_rt_hostIsFile".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostIsDirectory".to_string()),
        "pulsec_rt_hostIsDirectory".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostReadAllText".to_string()),
        "pulsec_rt_hostReadAllText".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostListChildren".to_string()),
        "pulsec_rt_hostListChildren".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostCreateDirectory".to_string()),
        "pulsec_rt_hostCreateDirectory".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostWriteAllText".to_string()),
        "pulsec_rt_hostWriteAllText".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostCopyFile".to_string()),
        "pulsec_rt_hostCopyFile".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostRunShellProcess".to_string()),
        "pulsec_rt_hostRunShellProcess".to_string(),
    );
    out.insert(
        ("Memory".to_string(), "retain".to_string()),
        "pulsec_rt_arcRetain".to_string(),
    );
    out.insert(
        ("Memory".to_string(), "release".to_string()),
        "pulsec_rt_arcRelease".to_string(),
    );
    out.insert(
        ("Memory".to_string(), "cycleYoungPass".to_string()),
        "pulsec_rt_arcCycleYoungPass".to_string(),
    );
    out.insert(
        ("Memory".to_string(), "cycleFullPass".to_string()),
        "pulsec_rt_arcCycleFullPass".to_string(),
    );
    out.insert(
        ("Memory".to_string(), "cycleTick".to_string()),
        "pulsec_rt_arcCycleTick".to_string(),
    );
    out.insert(
        ("Memory".to_string(), "weakNew".to_string()),
        "pulsec_rt_weakNew".to_string(),
    );
    out.insert(
        ("Memory".to_string(), "weakGet".to_string()),
        "pulsec_rt_weakGet".to_string(),
    );
    out.insert(
        ("Memory".to_string(), "weakClear".to_string()),
        "pulsec_rt_weakClear".to_string(),
    );
    out
}

pub(crate) fn shared_runtime_exported_procedures() -> Vec<String> {
    let mut symbols = vec![
        "pulsec_rt_init".to_string(),
        "pulsec_rt_shutdown".to_string(),
        "pulsec_rt_stringFromBytes".to_string(),
        "pulsec_rt_fpToInt".to_string(),
        "pulsec_rt_fpToLong".to_string(),
        OBJECT_NEW_SYMBOL.to_string(),
        OBJECT_CLASS_ID_SYMBOL.to_string(),
        OBJECT_CLASS_NAME_SYMBOL.to_string(),
        OBJECT_HASH_CODE_SYMBOL.to_string(),
        TRACE_PUSH_SYMBOL.to_string(),
        TRACE_UPDATE_SYMBOL.to_string(),
        TRACE_POP_SYMBOL.to_string(),
        TRACE_DUMP_SYMBOL.to_string(),
        EXC_PUSH_HANDLER_SYMBOL.to_string(),
        EXC_POP_HANDLER_SYMBOL.to_string(),
        EXC_TAKE_PENDING_SYMBOL.to_string(),
        EXC_THROW_SYMBOL.to_string(),
        "pulsec_pulse_lang_IO_println__String".to_string(),
    ];
    symbols.extend(default_stdlib_symbols().into_values());
    symbols.sort();
    symbols.dedup();
    symbols
}

pub(crate) fn render_string_array(values: &[String]) -> String {
    values
        .iter()
        .map(|value| format!("\"{}\"", value))
        .collect::<Vec<_>>()
        .join(", ")
}

pub(crate) fn console_intrinsic_newline(owner: &str, member: &str) -> Option<bool> {
    match (owner, member) {
        ("Intrinsics", "consoleWriteLine") => Some(true),
        ("Intrinsics", "consoleWrite") => Some(false),
        _ => None,
    }
}

pub(crate) fn normalize_stdlib_owner(owner: &str) -> &str {
    match owner {
        "pulse.lang.IO" => "IO",
        "pulse.lang.Class" => "Class",
        "pulse.lang.String" => "String",
        "pulse.lang.Char" => "Char",
        "pulse.lang.Long" => "Long",
        "pulse.lang.UInteger" => "UInteger",
        "pulse.lang.ULong" => "ULong",
        "pulse.rt.Intrinsics" => "Intrinsics",
        "System.out" => "IO",
        other => other,
    }
}
