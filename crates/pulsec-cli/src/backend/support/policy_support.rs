use super::*;

pub(crate) struct BackendContract {
    pub(crate) target_triple: &'static str,
    pub(crate) object_format: &'static str,
    pub(crate) entry_symbol: &'static str,
    pub(crate) calling_convention: &'static str,
    pub(crate) runtime_symbols: &'static [&'static str],
}

pub(crate) fn default_backend_contract() -> BackendContract {
    BackendContract {
        target_triple: "x86_64-pc-windows-msvc",
        object_format: "coff",
        entry_symbol: "main",
        calling_convention: "system",
        runtime_symbols: &[
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
            "com.pulse.rt.Intrinsics.pushExceptionHandler",
            "com.pulse.rt.Intrinsics.popExceptionHandler",
            "com.pulse.rt.Intrinsics.takePendingException",
            "com.pulse.rt.Intrinsics.throwPending",
            "com.pulse.rt.Intrinsics.arrayNew",
            "com.pulse.rt.Intrinsics.arrayNewMulti",
            "com.pulse.rt.Intrinsics.arrayLength",
            "com.pulse.rt.Intrinsics.arrayGetInt",
            "com.pulse.rt.Intrinsics.arraySetInt",
            "com.pulse.rt.Intrinsics.arrayGetLong",
            "com.pulse.rt.Intrinsics.arraySetLong",
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
            "com.pulse.lang.IO.println",
            "com.pulse.lang.IO.print",
            "com.pulse.io.Console.writeLine",
            "com.pulse.io.File.readAllText",
            "com.pulse.math.Math.abs",
            "com.pulse.math.Math.max",
        ],
    }
}

pub(crate) fn default_stdlib_symbols() -> HashMap<(String, String), String> {
    let mut out = HashMap::new();
    out.insert(
        ("IO".to_string(), "println".to_string()),
        "pulsec_std_com_pulse_lang_IO_println".to_string(),
    );
    out.insert(
        ("IO".to_string(), "print".to_string()),
        "pulsec_std_com_pulse_lang_IO_print".to_string(),
    );
    out.insert(
        ("Math".to_string(), "max".to_string()),
        "pulsec_std_com_pulse_math_Math_max".to_string(),
    );
    out.insert(
        ("Math".to_string(), "abs".to_string()),
        "pulsec_std_com_pulse_math_Math_abs".to_string(),
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
        ("Intrinsics".to_string(), "panic".to_string()),
        "pulsec_rt_panic".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "__dispatchNullReceiverPanic".to_string()),
        DISPATCH_NULL_PANIC_SYMBOL.to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "__dispatchInvalidTypePanic".to_string()),
        DISPATCH_TYPE_PANIC_SYMBOL.to_string(),
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
        ("Intrinsics".to_string(), "intToString".to_string()),
        "pulsec_rt_intToString".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "booleanToString".to_string()),
        "pulsec_rt_booleanToString".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "parseInt".to_string()),
        "pulsec_rt_parseInt".to_string(),
    );
    out.insert(
        ("Intrinsics".to_string(), "parseBoolean".to_string()),
        "pulsec_rt_parseBoolean".to_string(),
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
        ("Class".to_string(), "runtimeSimpleName".to_string()),
        CLASS_SIMPLE_NAME_SYMBOL.to_string(),
    );
    out.insert(
        ("Class".to_string(), "runtimePackageName".to_string()),
        CLASS_PACKAGE_NAME_SYMBOL.to_string(),
    );
    out.insert(
        ("String".to_string(), "runtimeCharAt".to_string()),
        STRING_CHAR_AT_SYMBOL.to_string(),
    );
    out.insert(
        ("String".to_string(), "runtimeSubstring".to_string()),
        STRING_SUBSTRING_SYMBOL.to_string(),
    );
    out.insert(
        ("String".to_string(), "runtimeFromChar".to_string()),
        CHAR_TO_STRING_SYMBOL.to_string(),
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
        ("IO", "println")
        | ("Intrinsics", "consoleWriteLine")
        | ("System.out", "println") => Some(true),
        ("IO", "print")
        | ("Intrinsics", "consoleWrite")
        | ("System.out", "print") => Some(false),
        _ => None,
    }
}

pub(crate) fn normalize_stdlib_owner(owner: &str) -> &str {
    match owner {
        "com.pulse.lang.IO" => "IO",
        "com.pulse.lang.Class" => "Class",
        "com.pulse.lang.String" => "String",
        "com.pulse.rt.Intrinsics" => "Intrinsics",
        "System.out" => "IO",
        other => other,
    }
}



