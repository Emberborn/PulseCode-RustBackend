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
            "aden.rt.Intrinsics.consoleReadLine",
            "aden.rt.Intrinsics.consoleWriteLine",
            "aden.rt.Intrinsics.consoleWrite",
            "aden.rt.Intrinsics.consoleErrorWriteLine",
            "aden.rt.Intrinsics.consoleErrorWrite",
            "aden.rt.Intrinsics.panic",
            "aden.rt.Intrinsics.stringConcat",
            "aden.rt.Intrinsics.stringLength",
            "aden.rt.Intrinsics.objectClassName",
            "aden.rt.Intrinsics.objectHashCode",
            "aden.lang.String.runtimeConcat",
            "aden.lang.String.runtimeLength",
            "aden.lang.String.runtimeCharAt",
            "aden.lang.String.runtimeFromChar",
            "aden.rt.Intrinsics.pushExceptionHandler",
            "aden.rt.Intrinsics.popExceptionHandler",
            "aden.rt.Intrinsics.takePendingException",
            "aden.rt.Intrinsics.throwPending",
            "aden.rt.Intrinsics.arrayNew",
            "aden.rt.Intrinsics.arrayNewMulti",
            "aden.rt.Intrinsics.arrayLength",
            "aden.rt.Intrinsics.arrayGetInt",
            "aden.rt.Intrinsics.arraySetInt",
            "aden.rt.Intrinsics.arrayGetLong",
            "aden.rt.Intrinsics.arraySetLong",
            "aden.rt.Intrinsics.arrayGetString",
            "aden.rt.Intrinsics.arraySetString",
            "aden.rt.Intrinsics.listNew",
            "aden.rt.Intrinsics.listSize",
            "aden.rt.Intrinsics.listKind",
            "aden.rt.Intrinsics.listClear",
            "aden.rt.Intrinsics.listAddInt",
            "aden.rt.Intrinsics.listAddString",
            "aden.rt.Intrinsics.listGetInt",
            "aden.rt.Intrinsics.listGetString",
            "aden.rt.Intrinsics.mapNew",
            "aden.rt.Intrinsics.mapSize",
            "aden.rt.Intrinsics.mapClear",
            "aden.rt.Intrinsics.mapContainsKey",
            "aden.rt.Intrinsics.mapPut",
            "aden.rt.Intrinsics.mapPutInt",
            "aden.rt.Intrinsics.mapGet",
            "aden.rt.Intrinsics.mapGetInt",
            "aden.rt.Intrinsics.hostExists",
            "aden.rt.Intrinsics.hostIsFile",
            "aden.rt.Intrinsics.hostIsDirectory",
            "aden.rt.Intrinsics.hostReadAllText",
            "aden.rt.Intrinsics.hostListChildren",
            "aden.rt.Intrinsics.hostCreateDirectory",
            "aden.rt.Intrinsics.hostWriteAllText",
            "aden.rt.Intrinsics.hostCopyFile",
            "aden.rt.Intrinsics.hostAllocBytes",
            "aden.rt.Intrinsics.hostFreeBytes",
            "aden.rt.Intrinsics.hostReadByte",
            "aden.rt.Intrinsics.hostWriteByte",
            "aden.rt.Intrinsics.hostCopyBytes",
            "aden.rt.Intrinsics.hostReadLong",
            "aden.rt.Intrinsics.hostWriteLong",
            "aden.rt.Intrinsics.hostStringUtf8Length",
            "aden.rt.Intrinsics.hostAllocUtf8Z",
            "aden.rt.Intrinsics.hostStringFromUtf8",
            "aden.rt.Intrinsics.hostStringFromUtf8Z",
            "aden.rt.Intrinsics.hostLoadDynamicLibrary",
            "aden.rt.Intrinsics.hostLookupLoadedDynamicLibrary",
            "aden.rt.Intrinsics.hostLookupSelfDynamicLibrary",
            "aden.rt.Intrinsics.hostFreeDynamicLibrary",
            "aden.rt.Intrinsics.hostResolveDynamicSymbol",
            "aden.rt.Intrinsics.hostCallNative0",
            "aden.rt.Intrinsics.hostCallNative1",
            "aden.rt.Intrinsics.hostCallNative2",
            "aden.rt.Intrinsics.hostCallNative3",
            "aden.rt.Intrinsics.hostCallNative4",
            "aden.rt.Intrinsics.hostRegisterNativeCallback0",
            "aden.rt.Intrinsics.hostGetNativeCallbackAddress0",
            "aden.rt.Intrinsics.hostUnregisterNativeCallback0",
            "aden.rt.Intrinsics.hostRegisterNativeCallback1",
            "aden.rt.Intrinsics.hostGetNativeCallbackAddress1",
            "aden.rt.Intrinsics.hostUnregisterNativeCallback1",
            "aden.rt.Intrinsics.hostRegisterNativeCallback2",
            "aden.rt.Intrinsics.hostGetNativeCallbackAddress2",
            "aden.rt.Intrinsics.hostUnregisterNativeCallback2",
            "aden.rt.Intrinsics.hostRegisterNativeCallback3",
            "aden.rt.Intrinsics.hostGetNativeCallbackAddress3",
            "aden.rt.Intrinsics.hostUnregisterNativeCallback3",
            "aden.rt.Intrinsics.hostRegisterNativeCallback4",
            "aden.rt.Intrinsics.hostGetNativeCallbackAddress4",
            "aden.rt.Intrinsics.hostUnregisterNativeCallback4",
            "aden.rt.Intrinsics.hostRunShellProcess",
            "aden.memory.Memory.retain",
            "aden.memory.Memory.release",
            "aden.memory.Memory.cycleYoungPass",
            "aden.memory.Memory.cycleFullPass",
            "aden.memory.Memory.cycleTick",
            "aden.memory.Memory.weakNew",
            "aden.memory.Memory.weakGet",
            "aden.memory.Memory.weakClear",
            "aden.lang.System.currentTimeMillis",
            "aden.lang.System.nanoTime",
            "aden.lang.System.exit",
            "aden.io.Console.writeLine",
            "aden.io.File.readAllText",
        ],
    }
}

pub(crate) fn default_stdlib_symbols() -> HashMap<(String, String), String> {
    let mut out = HashMap::new();
    out.insert(
        ("Intrinsics".to_string(), "consoleReadLine".to_string()),
        "adenc_rt_consoleReadLine".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "consoleWriteLine".to_string()),
        "adenc_rt_consoleWriteLine".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "consoleWrite".to_string()),
        "adenc_rt_consoleWrite".to_string(),
    );
    out.insert(
        (
            "Intrinsics".to_string(),
            "consoleErrorWriteLine".to_string(),
        ),
        "adenc_rt_consoleErrorWriteLine".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "consoleErrorWrite".to_string()),
        "adenc_rt_consoleErrorWrite".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "panic".to_string()),
        "adenc_rt_panic".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "stringConcat".to_string()),
        "adenc_rt_stringConcat".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "stringLength".to_string()),
        "adenc_rt_stringLength".to_string(),
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
        "adenc_rt_stringConcat".to_string(),
    );
    out.insert(
        ("String".to_string(), "runtimeLength".to_string()),
        "adenc_rt_stringLength".to_string(),
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
        "adenc_rt_arrayNew".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "arrayNewMulti".to_string()),
        "adenc_rt_arrayNewMulti".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "arrayLength".to_string()),
        "adenc_rt_arrayLength".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "arrayGetInt".to_string()),
        "adenc_rt_arrayGetInt".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "arraySetInt".to_string()),
        "adenc_rt_arraySetInt".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "arrayGetLong".to_string()),
        "adenc_rt_arrayGetLong".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "arraySetLong".to_string()),
        "adenc_rt_arraySetLong".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "arrayGetString".to_string()),
        "adenc_rt_arrayGetString".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "arraySetString".to_string()),
        "adenc_rt_arraySetString".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "listNew".to_string()),
        "adenc_rt_listNew".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "listSize".to_string()),
        "adenc_rt_listSize".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "listKind".to_string()),
        "adenc_rt_listKind".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "listClear".to_string()),
        "adenc_rt_listClear".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "listAddInt".to_string()),
        "adenc_rt_listAddInt".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "listAddString".to_string()),
        "adenc_rt_listAddString".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "listGetInt".to_string()),
        "adenc_rt_listGetInt".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "listGetString".to_string()),
        "adenc_rt_listGetString".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "mapNew".to_string()),
        "adenc_rt_mapNew".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "mapSize".to_string()),
        "adenc_rt_mapSize".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "mapClear".to_string()),
        "adenc_rt_mapClear".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "mapContainsKey".to_string()),
        "adenc_rt_mapContainsKey".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "mapPut".to_string()),
        "adenc_rt_mapPut".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "mapPutInt".to_string()),
        "adenc_rt_mapPutInt".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "mapGet".to_string()),
        "adenc_rt_mapGet".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "mapGetInt".to_string()),
        "adenc_rt_mapGetInt".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostExists".to_string()),
        "adenc_rt_hostExists".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostIsFile".to_string()),
        "adenc_rt_hostIsFile".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostIsDirectory".to_string()),
        "adenc_rt_hostIsDirectory".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostReadAllText".to_string()),
        "adenc_rt_hostReadAllText".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostListChildren".to_string()),
        "adenc_rt_hostListChildren".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostCreateDirectory".to_string()),
        "adenc_rt_hostCreateDirectory".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostWriteAllText".to_string()),
        "adenc_rt_hostWriteAllText".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostCopyFile".to_string()),
        "adenc_rt_hostCopyFile".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostAllocBytes".to_string()),
        "adenc_rt_hostAllocBytes".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostFreeBytes".to_string()),
        "adenc_rt_hostFreeBytes".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostReadByte".to_string()),
        "adenc_rt_hostReadByte".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostWriteByte".to_string()),
        "adenc_rt_hostWriteByte".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostCopyBytes".to_string()),
        "adenc_rt_hostCopyBytes".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostReadLong".to_string()),
        "adenc_rt_hostReadLong".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostWriteLong".to_string()),
        "adenc_rt_hostWriteLong".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostStringUtf8Length".to_string()),
        "adenc_rt_hostStringUtf8Length".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostAllocUtf8Z".to_string()),
        "adenc_rt_hostAllocUtf8Z".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostStringFromUtf8".to_string()),
        "adenc_rt_hostStringFromUtf8".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostStringFromUtf8Z".to_string()),
        "adenc_rt_hostStringFromUtf8Z".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostLoadDynamicLibrary".to_string()),
        "adenc_rt_hostLoadDynamicLibrary".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostLookupLoadedDynamicLibrary".to_string()),
        "adenc_rt_hostLookupLoadedDynamicLibrary".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostLookupSelfDynamicLibrary".to_string()),
        "adenc_rt_hostLookupSelfDynamicLibrary".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostFreeDynamicLibrary".to_string()),
        "adenc_rt_hostFreeDynamicLibrary".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostResolveDynamicSymbol".to_string()),
        "adenc_rt_hostResolveDynamicSymbol".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostCallNative0".to_string()),
        "adenc_rt_hostCallNative0".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostCallNative1".to_string()),
        "adenc_rt_hostCallNative1".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostCallNative2".to_string()),
        "adenc_rt_hostCallNative2".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostCallNative3".to_string()),
        "adenc_rt_hostCallNative3".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostCallNative4".to_string()),
        "adenc_rt_hostCallNative4".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostRegisterNativeCallback0".to_string()),
        "adenc_rt_hostRegisterNativeCallback0".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostGetNativeCallbackAddress0".to_string()),
        "adenc_rt_hostGetNativeCallbackAddress0".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostUnregisterNativeCallback0".to_string()),
        "adenc_rt_hostUnregisterNativeCallback0".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostRegisterNativeCallback1".to_string()),
        "adenc_rt_hostRegisterNativeCallback1".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostGetNativeCallbackAddress1".to_string()),
        "adenc_rt_hostGetNativeCallbackAddress1".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostUnregisterNativeCallback1".to_string()),
        "adenc_rt_hostUnregisterNativeCallback1".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostRegisterNativeCallback2".to_string()),
        "adenc_rt_hostRegisterNativeCallback2".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostGetNativeCallbackAddress2".to_string()),
        "adenc_rt_hostGetNativeCallbackAddress2".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostUnregisterNativeCallback2".to_string()),
        "adenc_rt_hostUnregisterNativeCallback2".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostRegisterNativeCallback3".to_string()),
        "adenc_rt_hostRegisterNativeCallback3".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostGetNativeCallbackAddress3".to_string()),
        "adenc_rt_hostGetNativeCallbackAddress3".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostUnregisterNativeCallback3".to_string()),
        "adenc_rt_hostUnregisterNativeCallback3".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostRegisterNativeCallback4".to_string()),
        "adenc_rt_hostRegisterNativeCallback4".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostGetNativeCallbackAddress4".to_string()),
        "adenc_rt_hostGetNativeCallbackAddress4".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostUnregisterNativeCallback4".to_string()),
        "adenc_rt_hostUnregisterNativeCallback4".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostRunShellProcess".to_string()),
        "adenc_rt_hostRunShellProcess".to_string(),
    );
    out.insert(
        ("Memory".to_string(), "retain".to_string()),
        "adenc_rt_arcRetain".to_string(),
    );
    out.insert(
        ("Memory".to_string(), "release".to_string()),
        "adenc_rt_arcRelease".to_string(),
    );
    out.insert(
        ("Memory".to_string(), "cycleYoungPass".to_string()),
        "adenc_rt_arcCycleYoungPass".to_string(),
    );
    out.insert(
        ("Memory".to_string(), "cycleFullPass".to_string()),
        "adenc_rt_arcCycleFullPass".to_string(),
    );
    out.insert(
        ("Memory".to_string(), "cycleTick".to_string()),
        "adenc_rt_arcCycleTick".to_string(),
    );
    out.insert(
        ("Memory".to_string(), "weakNew".to_string()),
        "adenc_rt_weakNew".to_string(),
    );
    out.insert(
        ("Memory".to_string(), "weakGet".to_string()),
        "adenc_rt_weakGet".to_string(),
    );
    out.insert(
        ("Memory".to_string(), "weakClear".to_string()),
        "adenc_rt_weakClear".to_string(),
    );
    out
}

pub(crate) fn shared_runtime_exported_procedures() -> Vec<String> {
    let mut symbols = vec![
        "adenc_rt_init".to_string(),
        "adenc_rt_shutdown".to_string(),
        "adenc_rt_stringFromBytes".to_string(),
        "adenc_rt_fpToInt".to_string(),
        "adenc_rt_fpToLong".to_string(),
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
        "adenc_aden_lang_IO_println__String".to_string(),
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
        "aden.lang.IO" => "IO",
        "aden.lang.Class" => "Class",
        "aden.lang.String" => "String",
        "aden.lang.Char" => "Char",
        "aden.lang.Long" => "Long",
        "aden.lang.UInteger" => "UInteger",
        "aden.lang.ULong" => "ULong",
        "aden.rt.Intrinsics" => "Intrinsics",
        "System.out" => "IO",
        other => other,
    }
}
