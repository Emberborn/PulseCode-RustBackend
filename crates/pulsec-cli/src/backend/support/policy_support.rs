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
            "pulse.rt.Intrinsics.hostAllocBytes",
            "pulse.rt.Intrinsics.hostFreeBytes",
            "pulse.rt.Intrinsics.hostReadByte",
            "pulse.rt.Intrinsics.hostWriteByte",
            "pulse.rt.Intrinsics.hostCopyBytes",
            "pulse.rt.Intrinsics.hostReadLong",
            "pulse.rt.Intrinsics.hostWriteLong",
            "pulse.rt.Intrinsics.hostStringUtf8Length",
            "pulse.rt.Intrinsics.hostAllocUtf8Z",
            "pulse.rt.Intrinsics.hostStringFromUtf8",
            "pulse.rt.Intrinsics.hostStringFromUtf8Z",
            "pulse.rt.Intrinsics.hostLoadDynamicLibrary",
            "pulse.rt.Intrinsics.hostLookupLoadedDynamicLibrary",
            "pulse.rt.Intrinsics.hostLookupSelfDynamicLibrary",
            "pulse.rt.Intrinsics.hostFreeDynamicLibrary",
            "pulse.rt.Intrinsics.hostResolveDynamicSymbol",
            "pulse.rt.Intrinsics.hostCallNative0",
            "pulse.rt.Intrinsics.hostCallNative1",
            "pulse.rt.Intrinsics.hostCallNative2",
            "pulse.rt.Intrinsics.hostCallNative3",
            "pulse.rt.Intrinsics.hostCallNative4",
            "pulse.rt.Intrinsics.hostRegisterNativeCallback0",
            "pulse.rt.Intrinsics.hostGetNativeCallbackAddress0",
            "pulse.rt.Intrinsics.hostUnregisterNativeCallback0",
            "pulse.rt.Intrinsics.hostRegisterNativeCallback1",
            "pulse.rt.Intrinsics.hostGetNativeCallbackAddress1",
            "pulse.rt.Intrinsics.hostUnregisterNativeCallback1",
            "pulse.rt.Intrinsics.hostRegisterNativeCallback2",
            "pulse.rt.Intrinsics.hostGetNativeCallbackAddress2",
            "pulse.rt.Intrinsics.hostUnregisterNativeCallback2",
            "pulse.rt.Intrinsics.hostRegisterNativeCallback3",
            "pulse.rt.Intrinsics.hostGetNativeCallbackAddress3",
            "pulse.rt.Intrinsics.hostUnregisterNativeCallback3",
            "pulse.rt.Intrinsics.hostRegisterNativeCallback4",
            "pulse.rt.Intrinsics.hostGetNativeCallbackAddress4",
            "pulse.rt.Intrinsics.hostUnregisterNativeCallback4",
            "pulse.rt.Intrinsics.hostRunShellProcess",
            "pulse.rt.Intrinsics.hostStartThread",
            "pulse.rt.Intrinsics.hostCreateMutex",
            "pulse.rt.Intrinsics.hostCreateEvent",
            "pulse.rt.Intrinsics.hostWaitHandle",
            "pulse.rt.Intrinsics.hostReleaseMutex",
            "pulse.rt.Intrinsics.hostSetEvent",
            "pulse.rt.Intrinsics.hostResetEvent",
            "pulse.rt.Intrinsics.hostCloseHandle",
            "pulse.rt.Intrinsics.hostCreateSemaphore",
            "pulse.rt.Intrinsics.hostReleaseSemaphore",
            "pulse.rt.Intrinsics.hostAtomicLoadInt",
            "pulse.rt.Intrinsics.hostAtomicStoreInt",
            "pulse.rt.Intrinsics.hostAtomicCompareExchangeInt",
            "pulse.rt.Intrinsics.hostAtomicExchangeInt",
            "pulse.rt.Intrinsics.hostAtomicFetchAddInt",
            "pulse.rt.Intrinsics.hostAtomicLoadLong",
            "pulse.rt.Intrinsics.hostAtomicStoreLong",
            "pulse.rt.Intrinsics.hostAtomicCompareExchangeLong",
            "pulse.rt.Intrinsics.hostAtomicExchangeLong",
            "pulse.rt.Intrinsics.hostAtomicFetchAddLong",
            "pulse.rt.Intrinsics.hostAtomicLoadReference",
            "pulse.rt.Intrinsics.hostAtomicStoreReference",
            "pulse.rt.Intrinsics.hostAtomicCompareAndSetReference",
            "pulse.rt.Intrinsics.hostAtomicExchangeReference",
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
            "pulse.lang.Thread.sleep",
            "pulse.lang.Thread.yieldNow",
            "pulse.lang.Thread.currentThreadId",
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
        ("Thread".to_string(), "sleep".to_string()),
        THREAD_SLEEP_SYMBOL.to_string(),
    );
    out.insert(
        ("Thread".to_string(), "yieldNow".to_string()),
        THREAD_YIELD_SYMBOL.to_string(),
    );
    out.insert(
        ("Thread".to_string(), "currentThreadId".to_string()),
        THREAD_CURRENT_ID_SYMBOL.to_string(),
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
        ("Intrinsics".to_string(), "hostAllocBytes".to_string()),
        "pulsec_rt_hostAllocBytes".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostFreeBytes".to_string()),
        "pulsec_rt_hostFreeBytes".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostReadByte".to_string()),
        "pulsec_rt_hostReadByte".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostWriteByte".to_string()),
        "pulsec_rt_hostWriteByte".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostCopyBytes".to_string()),
        "pulsec_rt_hostCopyBytes".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostReadLong".to_string()),
        "pulsec_rt_hostReadLong".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostWriteLong".to_string()),
        "pulsec_rt_hostWriteLong".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostStringUtf8Length".to_string()),
        "pulsec_rt_hostStringUtf8Length".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostAllocUtf8Z".to_string()),
        "pulsec_rt_hostAllocUtf8Z".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostStringFromUtf8".to_string()),
        "pulsec_rt_hostStringFromUtf8".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostStringFromUtf8Z".to_string()),
        "pulsec_rt_hostStringFromUtf8Z".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostLoadDynamicLibrary".to_string()),
        "pulsec_rt_hostLoadDynamicLibrary".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostLookupLoadedDynamicLibrary".to_string()),
        "pulsec_rt_hostLookupLoadedDynamicLibrary".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostLookupSelfDynamicLibrary".to_string()),
        "pulsec_rt_hostLookupSelfDynamicLibrary".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostFreeDynamicLibrary".to_string()),
        "pulsec_rt_hostFreeDynamicLibrary".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostResolveDynamicSymbol".to_string()),
        "pulsec_rt_hostResolveDynamicSymbol".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostCallNative0".to_string()),
        "pulsec_rt_hostCallNative0".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostCallNative1".to_string()),
        "pulsec_rt_hostCallNative1".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostCallNative2".to_string()),
        "pulsec_rt_hostCallNative2".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostCallNative3".to_string()),
        "pulsec_rt_hostCallNative3".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostCallNative4".to_string()),
        "pulsec_rt_hostCallNative4".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostRegisterNativeCallback0".to_string()),
        "pulsec_rt_hostRegisterNativeCallback0".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostGetNativeCallbackAddress0".to_string()),
        "pulsec_rt_hostGetNativeCallbackAddress0".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostUnregisterNativeCallback0".to_string()),
        "pulsec_rt_hostUnregisterNativeCallback0".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostRegisterNativeCallback1".to_string()),
        "pulsec_rt_hostRegisterNativeCallback1".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostGetNativeCallbackAddress1".to_string()),
        "pulsec_rt_hostGetNativeCallbackAddress1".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostUnregisterNativeCallback1".to_string()),
        "pulsec_rt_hostUnregisterNativeCallback1".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostRegisterNativeCallback2".to_string()),
        "pulsec_rt_hostRegisterNativeCallback2".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostGetNativeCallbackAddress2".to_string()),
        "pulsec_rt_hostGetNativeCallbackAddress2".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostUnregisterNativeCallback2".to_string()),
        "pulsec_rt_hostUnregisterNativeCallback2".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostRegisterNativeCallback3".to_string()),
        "pulsec_rt_hostRegisterNativeCallback3".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostGetNativeCallbackAddress3".to_string()),
        "pulsec_rt_hostGetNativeCallbackAddress3".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostUnregisterNativeCallback3".to_string()),
        "pulsec_rt_hostUnregisterNativeCallback3".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostRegisterNativeCallback4".to_string()),
        "pulsec_rt_hostRegisterNativeCallback4".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostGetNativeCallbackAddress4".to_string()),
        "pulsec_rt_hostGetNativeCallbackAddress4".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostUnregisterNativeCallback4".to_string()),
        "pulsec_rt_hostUnregisterNativeCallback4".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostRunShellProcess".to_string()),
        "pulsec_rt_hostRunShellProcess".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostStartThread".to_string()),
        HOST_START_THREAD_SYMBOL.to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostCreateMutex".to_string()),
        HOST_CREATE_MUTEX_SYMBOL.to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostCreateEvent".to_string()),
        HOST_CREATE_EVENT_SYMBOL.to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostWaitHandle".to_string()),
        HOST_WAIT_HANDLE_SYMBOL.to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostReleaseMutex".to_string()),
        HOST_RELEASE_MUTEX_SYMBOL.to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostSetEvent".to_string()),
        HOST_SET_EVENT_SYMBOL.to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostResetEvent".to_string()),
        HOST_RESET_EVENT_SYMBOL.to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostCloseHandle".to_string()),
        HOST_CLOSE_HANDLE_SYMBOL.to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostCreateSemaphore".to_string()),
        HOST_CREATE_SEMAPHORE_SYMBOL.to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostReleaseSemaphore".to_string()),
        HOST_RELEASE_SEMAPHORE_SYMBOL.to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostAtomicLoadInt".to_string()),
        HOST_ATOMIC_LOAD_INT_SYMBOL.to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostAtomicStoreInt".to_string()),
        HOST_ATOMIC_STORE_INT_SYMBOL.to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostAtomicCompareExchangeInt".to_string()),
        HOST_ATOMIC_COMPARE_EXCHANGE_INT_SYMBOL.to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostAtomicExchangeInt".to_string()),
        HOST_ATOMIC_EXCHANGE_INT_SYMBOL.to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostAtomicFetchAddInt".to_string()),
        HOST_ATOMIC_FETCH_ADD_INT_SYMBOL.to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostAtomicLoadLong".to_string()),
        HOST_ATOMIC_LOAD_LONG_SYMBOL.to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostAtomicStoreLong".to_string()),
        HOST_ATOMIC_STORE_LONG_SYMBOL.to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostAtomicCompareExchangeLong".to_string()),
        HOST_ATOMIC_COMPARE_EXCHANGE_LONG_SYMBOL.to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostAtomicExchangeLong".to_string()),
        HOST_ATOMIC_EXCHANGE_LONG_SYMBOL.to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostAtomicFetchAddLong".to_string()),
        HOST_ATOMIC_FETCH_ADD_LONG_SYMBOL.to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostAtomicLoadReference".to_string()),
        HOST_ATOMIC_LOAD_REFERENCE_SYMBOL.to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostAtomicStoreReference".to_string()),
        HOST_ATOMIC_STORE_REFERENCE_SYMBOL.to_string(),
    );
    out.insert(
        (
            "Intrinsics".to_string(),
            "hostAtomicCompareAndSetReference".to_string(),
        ),
        HOST_ATOMIC_COMPARE_AND_SET_REFERENCE_SYMBOL.to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "hostAtomicExchangeReference".to_string()),
        HOST_ATOMIC_EXCHANGE_REFERENCE_SYMBOL.to_string(),
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
        "pulse.lang.System" => "System",
        "pulse.lang.Thread" => "Thread",
        "pulse.lang.Char" => "Char",
        "pulse.lang.Long" => "Long",
        "pulse.lang.UInteger" => "UInteger",
        "pulse.lang.ULong" => "ULong",
        "pulse.rt.Intrinsics" => "Intrinsics",
        "System.out" => "IO",
        other => other,
    }
}
