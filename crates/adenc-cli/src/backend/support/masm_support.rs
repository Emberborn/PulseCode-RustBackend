use super::*;
use adenc_core::intermediate::IrValue;

pub(crate) struct ArcFieldDispatch {
    pub(crate) teardown_proc: String,
    pub(crate) scan_edges_proc: String,
    pub(crate) invalidate_edges_proc: String,
}
pub(crate) const RUNTIME_THREAD_SAFETY: &str = "not-thread-safe";
pub(crate) const CONTAINER_THREAD_SAFETY: &str = "not-thread-safe";
pub(crate) const OBJECT_MODEL_SCHEMA: &str = "adenc.object.layout.v1";
pub(crate) const OBJECT_LAYOUT_VERSION: u32 = 1;
pub(crate) const OBJECT_HEADER_BYTES: u32 = 16;
pub(crate) const OBJECT_FIELD_SLOT_BYTES: u32 = 8;
pub(crate) const OBJECT_ALIGNMENT_BYTES: u32 = 8;
pub(crate) const STATIC_STORAGE_SCHEMA: &str = "adenc.static.storage.v1";
pub(crate) const CONSTRUCTOR_MODEL_SCHEMA: &str = "adenc.constructor.model.v1";
pub(crate) const CLASS_ALLOC_SCHEMA: &str = "adenc.class.alloc.v1";
pub(crate) const DISPATCH_SCHEMA: &str = "adenc.dispatch.schema.v1";
pub(crate) const TYPE_ID_SCHEMA: &str = "adenc.typeid.schema.v1";
pub(crate) const OBJECT_MODEL_ABI_SCHEMA: &str = "adenc.object_model.abi.v1";
pub(crate) const ABI_VERSION_SCHEMA: &str = "adenc.runtime.abi.v1";
pub(crate) const ABI_VERSION_V2: u32 = 2;
pub(crate) const OBJECT_MODEL_ABI_VERSION_V1: u32 = 1;
pub(crate) const CLASS_ID_IN_SET_SYMBOL: &str = "adenc_rt_classIdInSet";
pub(crate) const NATIVE_CALLBACK_SLOTS_PER_ARITY: usize = 16;

pub(crate) fn debug_allocator_enabled() -> bool {
    match env::var("PULSEC_DEBUG_ALLOC") {
        Ok(v) => {
            let n = v.trim().to_ascii_lowercase();
            matches!(n.as_str(), "1" | "true" | "yes" | "on")
        }
        Err(_) => false,
    }
}

pub(crate) fn parse_abi_version(raw: &str) -> Option<u32> {
    let t = raw.trim().to_ascii_lowercase();
    let core = t.strip_prefix('v').unwrap_or(&t);
    core.parse::<u32>().ok()
}

pub(crate) fn emitted_runtime_abi_version() -> u32 {
    match env::var("PULSEC_FORCE_RUNTIME_ABI_VERSION") {
        Ok(v) => parse_abi_version(&v).unwrap_or(ABI_VERSION_V2),
        Err(_) => ABI_VERSION_V2,
    }
}

pub(crate) fn emitted_object_model_abi_version() -> u32 {
    match env::var("PULSEC_FORCE_OBJECT_MODEL_ABI_VERSION") {
        Ok(v) => parse_abi_version(&v).unwrap_or(OBJECT_MODEL_ABI_VERSION_V1),
        Err(_) => OBJECT_MODEL_ABI_VERSION_V1,
    }
}

pub(crate) fn lookup_local_decl_type(method: &IrMethod, local_name: &str) -> Option<String> {
    if let Some(param) = method.params.iter().find(|p| p.name == local_name) {
        return Some(param.ty.clone());
    }
    let mut last_match: Option<String> = None;
    for block in &method.blocks {
        for instr in &block.instructions {
            if let IrInstr::DeclareLocal { name, ty, .. } = instr {
                if name == local_name {
                    last_match = Some(ty.clone());
                }
            }
        }
    }
    last_match
}

pub(crate) fn value_dotted_path(method: &IrMethod, value_id: IrValueId) -> Option<String> {
    let value = method.values.get(value_id as usize)?;
    match &value.kind {
        IrValueKind::LocalRef(name) => Some(name.clone()),
        IrValueKind::MemberAccess { object, member } => {
            let mut path = value_dotted_path(method, *object)?;
            path.push('.');
            path.push_str(member);
            Some(path)
        }
        _ => None,
    }
}

pub(crate) fn normalize_type_token(ty: &str) -> String {
    if let Some(stripped) = ty.strip_suffix("[]") {
        return format!("{}Arr", normalize_type_token(stripped));
    }
    let raw = ty.split('<').next().unwrap_or(ty);
    raw.rsplit('.').next().unwrap_or(raw).to_string()
}

pub(crate) fn masm_db_payload(text: &str) -> String {
    if text.is_empty() {
        return "0".to_string();
    }
    if text
        .as_bytes()
        .iter()
        .all(|b| (32..=126).contains(b) && *b != b'"')
    {
        return format!("\"{}\"", text);
    }
    text.as_bytes()
        .iter()
        .map(|b| b.to_string())
        .collect::<Vec<_>>()
        .join(", ")
}

pub(crate) fn emit_masm_db(out: &mut String, label: &str, text: &str) {
    if text.is_empty() {
        out.push_str(&format!("{label} db 0\n"));
        return;
    }
    let bytes = text.as_bytes();
    let use_inline_string =
        bytes.len() <= 64 && bytes.iter().all(|b| (32..=126).contains(b) && *b != b'"');
    if use_inline_string {
        out.push_str(&format!("{label} db {}\n", masm_db_payload(text)));
        return;
    }
    const CHUNK_BYTES: usize = 32;
    let mut offset = 0usize;
    while offset < bytes.len() {
        let end = std::cmp::min(offset + CHUNK_BYTES, bytes.len());
        let chunk = bytes[offset..end]
            .iter()
            .map(|b| b.to_string())
            .collect::<Vec<_>>()
            .join(", ");
        if offset == 0 {
            out.push_str(&format!("{label} db {chunk}\n"));
        } else {
            out.push_str(&format!("    db {chunk}\n"));
        }
        offset = end;
    }
}

pub(crate) fn masm_db_len(text: &str) -> usize {
    text.len()
}

pub(crate) fn masm_field_data_directive(field: &IrField) -> String {
    if field.is_static {
        if uses_qword_field_storage(&field.ty) {
            return match field.init.as_ref() {
                Some(IrFieldInit::Int(v)) => format!("dq {}", v),
                Some(IrFieldInit::Bool(v)) => format!("dq {}", if *v { 1 } else { 0 }),
                Some(IrFieldInit::Double(v)) => format!("dq {}", v),
                Some(IrFieldInit::Float(v)) => format!("dq {}", v),
                Some(IrFieldInit::NewObject { .. }) => "dq 0".to_string(),
                None => "dq 0".to_string(),
            };
        }
        match field.init.as_ref() {
            Some(IrFieldInit::Int(v)) => format!("dd {}", v),
            Some(IrFieldInit::Bool(v)) => format!("dd {}", if *v { 1 } else { 0 }),
            Some(IrFieldInit::Float(v)) => format!("dd {}", v),
            Some(IrFieldInit::Double(v)) => format!("dd {}", v),
            Some(IrFieldInit::NewObject { .. }) => "dd 0".to_string(),
            None => "dd 0".to_string(),
        }
    } else {
        if uses_qword_field_storage(&field.ty) {
            format!("dq {} dup(0)", HANDLE_SLOT_INITIAL_CAPACITY + 1)
        } else {
            format!("dd {} dup(0)", HANDLE_SLOT_INITIAL_CAPACITY + 1)
        }
    }
}

pub(crate) fn emit_runtime_data_tables(out: &mut String) {
    let rows = HANDLE_SLOT_INITIAL_CAPACITY + 1;
    let debug_alloc = if debug_allocator_enabled() { 1 } else { 0 };
    let runtime_abi = emitted_runtime_abi_version();
    let object_model_abi = emitted_object_model_abi_version();
    out.push_str("public rt_slot_capacity\n");
    out.push_str("rt_handle_next dd 0\n");
    out.push_str(&format!(
        "rt_slot_capacity dd {}\n",
        HANDLE_SLOT_INITIAL_CAPACITY
    ));
    out.push_str("public rt_runtime_init_state\n");
    out.push_str("rt_runtime_init_state dd 0\n");
    out.push_str("public rt_runtime_init_epoch\n");
    out.push_str("rt_runtime_init_epoch dd 0\n");
    out.push_str("rt_str_count dd 0\n");
    out.push_str("rt_str_lens_ptr dq 0\n");
    out.push_str("rt_str_data_ptr dq 0\n");
    out.push_str(&format!("rt_tmpbuf db {} dup(0)\n", STRING_SLOT_BYTES));
    out.push_str(&format!("rt_tmp_concat db {} dup(0)\n", STRING_SLOT_BYTES));
    out.push_str("rt_tmp_concat_len dd 0\n");
    out.push_str("rt_tmp_arr_slot dd 0\n");
    out.push_str("rt_tmp_arr_len dd 0\n");
    out.push_str("rt_tmp_arr_bytes dq 0\n");
    out.push_str("rt_tmp_size dd 0\n");
    out.push_str("rt_tmp_arg_key dq 0\n");
    out.push_str("rt_tmp_arg_val dq 0\n");
    out.push_str("rt_tmp_ptr_a dq 0\n");
    out.push_str("rt_tmp_ptr_b dq 0\n");
    out.push_str("rt_tmp_ptr_c dq 0\n");
    out.push_str("rt_tmp_ptr_d dq 0\n");
    for arity in 0..=4 {
        out.push_str(&format!(
            "rt_native_callback{}_slots dd {} dup(0)\n",
            arity, NATIVE_CALLBACK_SLOTS_PER_ARITY
        ));
        for slot in 1..=NATIVE_CALLBACK_SLOTS_PER_ARITY {
            let symbol = mangle_native_callback_trampoline_symbol(arity, slot);
            if slot == 1 {
                out.push_str(&format!("rt_native_callback{}_entrypoints dq {}\n", arity, symbol));
            } else {
                out.push_str(&format!("    dq {}\n", symbol));
            }
        }
    }
    out.push_str("rt_true db 't','r','u','e'\n");
    out.push_str("rt_false db 'f','a','l','s','e'\n");
    out.push_str("rt_newline db 13,10\n");
    out.push_str("rt_empty db 0\n\n");
    out.push_str(&format!("rt_compiler_abi_expected dd {}\n", ABI_VERSION_V2));
    out.push_str(&format!("rt_runtime_abi_version dd {}\n", runtime_abi));
    out.push_str("rt_abi_mismatch_err db \"Runtime ABI mismatch\"\n");
    out.push_str("rt_abi_mismatch_err_len equ $ - rt_abi_mismatch_err\n\n");
    out.push_str(&format!(
        "rt_compiler_object_model_abi_expected dd {}\n",
        OBJECT_MODEL_ABI_VERSION_V1
    ));
    out.push_str(&format!(
        "rt_runtime_object_model_abi_version dd {}\n",
        object_model_abi
    ));
    out.push_str("rt_object_model_abi_mismatch_err db \"Object model ABI mismatch\"\n");
    out.push_str(
        "rt_object_model_abi_mismatch_err_len equ $ - rt_object_model_abi_mismatch_err\n\n",
    );
    out.push_str(&format!("rt_debug_alloc_mode dd {}\n", debug_alloc));
    out.push_str("rt_debug_arc_retain_err db \"Debug allocator: invalid ARC retain\"\n");
    out.push_str("rt_debug_arc_retain_err_len equ $ - rt_debug_arc_retain_err\n");
    out.push_str("rt_debug_arc_release_err db \"Debug allocator: invalid ARC release\"\n");
    out.push_str("rt_debug_arc_release_err_len equ $ - rt_debug_arc_release_err\n\n");
    out.push_str("rt_parse_int_err db 'I','n','v','a','l','i','d',' ','i','n','t','e','g','e','r',' ','l','i','t','e','r','a','l'\n");
    out.push_str("rt_parse_long_err db 'I','n','v','a','l','i','d',' ','l','o','n','g',' ','l','i','t','e','r','a','l'\n");
    out.push_str("rt_parse_bool_err db 'I','n','v','a','l','i','d',' ','b','o','o','l','e','a','n',' ','l','i','t','e','r','a','l'\n");
    out.push_str("rt_parse_uint_err db 'I','n','v','a','l','i','d',' ','u','i','n','t',' ','l','i','t','e','r','a','l'\n");
    out.push_str("rt_parse_ulong_err db 'I','n','v','a','l','i','d',' ','u','l','o','n','g',' ','l','i','t','e','r','a','l'\n\n");
    out.push_str("rt_arc_gen_overflow_err db 'A','R','C',' ','g','e','n','e','r','a','t','i','o','n',' ','o','v','e','r','f','l','o','w'\n");
    out.push_str("rt_arc_gen_overflow_err_len equ $ - rt_arc_gen_overflow_err\n");
    out.push_str("rt_weak_generation_overflow_err db 'W','e','a','k',' ','g','e','n','e','r','a','t','i','o','n',' ','o','v','e','r','f','l','o','w'\n");
    out.push_str("rt_weak_generation_overflow_err_len equ $ - rt_weak_generation_overflow_err\n");
    out.push_str("rt_weak_exhausted_err db 'W','e','a','k',' ','h','a','n','d','l','e',' ','t','a','b','l','e',' ','e','x','h','a','u','s','t','e','d'\n");
    out.push_str("rt_weak_exhausted_err_len equ $ - rt_weak_exhausted_err\n");
    out.push_str("rt_arc_refcount_saturation_err db 'A','R','C',' ','r','e','f','c','o','u','n','t',' ','s','a','t','u','r','a','t','i','o','n'\n");
    out.push_str("rt_arc_refcount_saturation_err_len equ $ - rt_arc_refcount_saturation_err\n");
    out.push_str("rt_arc_cycle_lag_err db 'A','R','C',' ','c','y','c','l','e',' ','d','e','t','e','c','t','o','r',' ','l','a','g'\n");
    out.push_str("rt_arc_cycle_lag_err_len equ $ - rt_arc_cycle_lag_err\n\n");
    out.push_str("rt_array_alloc_err db 'A','r','r','a','y',' ','a','l','l','o','c','a','t','i','o','n',' ','f','a','i','l','e','d'\n");
    out.push_str("rt_array_alloc_err_len equ $ - rt_array_alloc_err\n\n");
    out.push_str("rt_string_alloc_err db 'S','t','r','i','n','g',' ','a','l','l','o','c','a','t','i','o','n',' ','f','a','i','l','e','d'\n");
    out.push_str("rt_string_alloc_err_len equ $ - rt_string_alloc_err\n");
    out.push_str("rt_list_alloc_err db 'L','i','s','t',' ','a','l','l','o','c','a','t','i','o','n',' ','f','a','i','l','e','d'\n");
    out.push_str("rt_list_alloc_err_len equ $ - rt_list_alloc_err\n");
    out.push_str("rt_map_alloc_err db 'M','a','p',' ','a','l','l','o','c','a','t','i','o','n',' ','f','a','i','l','e','d'\n");
    out.push_str("rt_map_alloc_err_len equ $ - rt_map_alloc_err\n");
    out.push_str("rt_list_growth_err db 'L','i','s','t',' ','c','a','p','a','c','i','t','y',' ','e','x','h','a','u','s','t','e','d'\n");
    out.push_str("rt_list_growth_err_len equ $ - rt_list_growth_err\n");
    out.push_str("rt_map_growth_err db 'M','a','p',' ','c','a','p','a','c','i','t','y',' ','e','x','h','a','u','s','t','e','d'\n");
    out.push_str("rt_map_growth_err_len equ $ - rt_map_growth_err\n\n");
    out.push_str("rt_stale_handle_err db 'S','t','a','l','e',' ','r','u','n','t','i','m','e',' ','h','a','n','d','l','e'\n");
    out.push_str("rt_stale_handle_err_len equ $ - rt_stale_handle_err\n\n");
    out.push_str("rt_native_callback_exhausted_err db 'N','a','t','i','v','e',' ','c','a','l','l','b','a','c','k',' ','s','l','o','t','s',' ','e','x','h','a','u','s','t','e','d'\n");
    out.push_str("rt_native_callback_exhausted_err_len equ $ - rt_native_callback_exhausted_err\n");
    out.push_str("rt_native_callback_invalid_err db 'I','n','v','a','l','i','d',' ','n','a','t','i','v','e',' ','c','a','l','l','b','a','c','k',' ','s','l','o','t'\n");
    out.push_str("rt_native_callback_invalid_err_len equ $ - rt_native_callback_invalid_err\n\n");
    out.push_str("rt_fp_int_min dq 0C1E0000000000000h\n");
    out.push_str("rt_fp_long_min dq 0C3E0000000000000h\n\n");
    out.push_str("rt_dispatch_null_receiver_err db 'N','u','l','l',' ','d','i','s','p','a','t','c','h',' ','r','e','c','e','i','v','e','r'\n");
    out.push_str("rt_dispatch_null_receiver_err_len equ $ - rt_dispatch_null_receiver_err\n");
    out.push_str("rt_dispatch_invalid_type_err db 'I','n','v','a','l','i','d',' ','d','i','s','p','a','t','c','h',' ','r','e','c','e','i','v','e','r',' ','t','y','p','e'\n");
    out.push_str("rt_dispatch_invalid_type_err_len equ $ - rt_dispatch_invalid_type_err\n\n");
    out.push_str("rt_object_alloc_err db 'O','b','j','e','c','t',' ','s','l','o','t',' ','c','a','p','a','c','i','t','y',' ','e','x','h','a','u','s','t','e','d'\n");
    out.push_str("rt_object_alloc_err_len equ $ - rt_object_alloc_err\n\n");
    out.push_str("rt_string_index_oob_err db 'S','t','r','i','n','g',' ','i','n','d','e','x',' ','o','u','t',' ','o','f',' ','b','o','u','n','d','s'\n");
    out.push_str("rt_string_index_oob_err_len equ $ - rt_string_index_oob_err\n");
    out.push_str("rt_string_substring_bounds_err db 'S','u','b','s','t','r','i','n','g',' ','b','o','u','n','d','s',' ','o','u','t',' ','o','f',' ','r','a','n','g','e'\n");
    out.push_str("rt_string_substring_bounds_err_len equ $ - rt_string_substring_bounds_err\n\n");
    out.push_str("rt_arr_count dd 0\n");
    out.push_str(&format!("rt_arr_len dd {} dup(0)\n", rows));
    out.push_str(&format!("rt_arr_alive dd {} dup(0)\n", rows));
    out.push_str(&format!("rt_arr_i_ptr dq {} dup(0)\n", rows));
    out.push_str(&format!("rt_arr_s_ptr dq {} dup(0)\n", rows));
    out.push_str("rt_arr_heap_owned dd 0\n");
    out.push_str("rt_arr_len_ptr dq 0\n");
    out.push_str("rt_arr_alive_ptr dq 0\n");
    out.push_str("rt_arr_i_ptr_ptr dq 0\n");
    out.push_str("rt_arr_s_ptr_ptr dq 0\n");
    out.push_str("rt_list_count dd 0\n");
    out.push_str(&format!("rt_list_size dd {} dup(0)\n", rows));
    out.push_str(&format!("rt_list_cap dd {} dup(0)\n", rows));
    out.push_str(&format!("rt_list_alive dd {} dup(0)\n", rows));
    out.push_str(&format!("rt_list_kind dd {} dup(0)\n", rows));
    out.push_str(&format!("rt_list_i_ptr dq {} dup(0)\n", rows));
    out.push_str(&format!("rt_list_s_ptr dq {} dup(0)\n", rows));
    out.push_str("rt_list_heap_owned dd 0\n");
    out.push_str("rt_list_size_ptr dq 0\n");
    out.push_str("rt_list_cap_ptr dq 0\n");
    out.push_str("rt_list_alive_ptr dq 0\n");
    out.push_str("rt_list_kind_ptr dq 0\n");
    out.push_str("rt_list_i_ptr_ptr dq 0\n");
    out.push_str("rt_list_s_ptr_ptr dq 0\n");
    out.push_str("rt_map_count dd 0\n");
    out.push_str(&format!("rt_map_size dd {} dup(0)\n", rows));
    out.push_str(&format!("rt_map_cap dd {} dup(0)\n", rows));
    out.push_str(&format!("rt_map_alive dd {} dup(0)\n", rows));
    out.push_str(&format!("rt_map_keys_ptr dq {} dup(0)\n", rows));
    out.push_str(&format!("rt_map_tags_ptr dq {} dup(0)\n", rows));
    out.push_str(&format!("rt_map_i_ptr dq {} dup(0)\n", rows));
    out.push_str(&format!("rt_map_s_ptr dq {} dup(0)\n\n", rows));
    out.push_str("rt_map_heap_owned dd 0\n");
    out.push_str("rt_map_size_ptr dq 0\n");
    out.push_str("rt_map_cap_ptr dq 0\n");
    out.push_str("rt_map_alive_ptr dq 0\n");
    out.push_str("rt_map_keys_ptr_ptr dq 0\n");
    out.push_str("rt_map_tags_ptr_ptr dq 0\n");
    out.push_str("rt_map_i_ptr_ptr dq 0\n");
    out.push_str("rt_map_s_ptr_ptr dq 0\n\n");
    out.push_str("public rt_arc_refcounts_tbl\n");
    out.push_str("public rt_arc_kinds_tbl\n");
    out.push_str("public rt_arc_flags_tbl\n");
    out.push_str(&format!("rt_arc_refcounts_tbl dd {} dup(0)\n", rows));
    out.push_str(&format!("rt_arc_kinds_tbl dd {} dup(0)\n", rows));
    out.push_str(&format!("rt_arc_flags_tbl dd {} dup(0)\n", rows));
    out.push_str(&format!("rt_arc_meta_tbl dd {} dup(0)\n", rows));
    out.push_str(&format!("rt_arc_generation_tbl dd {} dup(0)\n", rows));
    out.push_str("rt_arc_free_head dd 0\n");
    out.push_str(&format!("rt_arc_free_next_tbl dd {} dup(0)\n", rows));
    out.push_str("rt_arc_heap_owned dd 0\n");
    out.push_str("rt_weak_next dd 0\n");
    out.push_str("rt_weak_free_head dd 0\n");
    out.push_str("rt_weak_heap_owned dd 0\n");
    out.push_str("rt_weak_free_next_ptr dq 0\n");
    out.push_str("rt_weak_target_slot_ptr dq 0\n");
    out.push_str("rt_weak_target_gen_ptr dq 0\n");
    out.push_str("rt_weak_generation_ptr dq 0\n");
    out.push_str(&format!("rt_weak_free_next dd {} dup(0)\n", rows));
    out.push_str(&format!("rt_weak_target_slot dd {} dup(0)\n", rows));
    out.push_str(&format!("rt_weak_target_gen dd {} dup(0)\n", rows));
    out.push_str(&format!("rt_weak_generation dd {} dup(0)\n", rows));
    out.push_str("rt_arc_cycle_epoch dd 0\n");
    out.push_str("rt_arc_cycle_young_cursor dd 1\n");
    out.push_str("rt_arc_cycle_last_reclaimed dd 0\n");
    out.push_str("rt_arc_cycle_zero_reclaim_streak dd 0\n");
    out.push_str("rt_trace_depth dd 0\n");
    out.push_str("rt_trace_ptrs dq 1024 dup(0)\n");
    out.push_str("rt_trace_lens dd 1024 dup(0)\n");
    out.push_str("rt_trace_hdr db 'S','t','a','c','k',' ','t','r','a','c','e',':',13,10\n");
    out.push_str("rt_trace_hdr_len equ $ - rt_trace_hdr\n");
    out.push_str("rt_trace_prefix db ' ',' ','a','t',' '\n");
    out.push_str("rt_trace_prefix_len equ $ - rt_trace_prefix\n\n");
    out.push_str("rt_exc_depth dd 0\n");
    out.push_str("rt_exc_target_ptrs dq 1024 dup(0)\n");
    out.push_str("rt_exc_saved_rsp dq 1024 dup(0)\n");
    out.push_str("rt_exc_trace_depths dd 1024 dup(0)\n");
    out.push_str("rt_pending_exception dq 0\n");
    out.push_str("rt_exception_stack_overflow_err db 'E','x','c','e','p','t','i','o','n',' ','h','a','n','d','l','e','r',' ','s','t','a','c','k',' ','o','v','e','r','f','l','o','w'\n");
    out.push_str("rt_exception_stack_overflow_err_len equ $ - rt_exception_stack_overflow_err\n\n");
    out.push_str("rt_arc_refcounts textequ <r12>\n");
    out.push_str("rt_arc_kinds textequ <r13>\n");
    out.push_str("rt_arc_flags textequ <r14>\n");
    out.push_str("rt_arc_meta textequ <r15>\n");
    out.push_str("rt_arc_generation textequ <rdi>\n");
    out.push_str("rt_arc_free_next textequ <rsi>\n\n");
}

pub(crate) fn method_param_type_tokens(method: &IrMethod) -> Vec<String> {
    method
        .params
        .iter()
        .map(|p| normalize_type_token(&p.ty))
        .collect()
}

pub(crate) fn value_type_token(method: &IrMethod, value_id: IrValueId) -> Option<String> {
    let value = method.values.get(value_id as usize)?;
    if let IrValueKind::LocalRef(ref name) = value.kind {
        if value.ty != "unknown" {
            return Some(normalize_type_token(&value.ty));
        }
        if let Some(ty) = lookup_local_decl_type(method, name) {
            return Some(normalize_type_token(&ty));
        }
    }
    match value.kind {
        IrValueKind::Unary { op, operand } => {
            let operand_ty = value_type_token(method, operand)
                .or_else(|| (value.ty != "unknown").then(|| normalize_type_token(&value.ty)))?;
            match op {
                IrUnaryOp::Not => Some("boolean".to_string()),
                IrUnaryOp::Neg => Some(lowered_unary_numeric_ty(&operand_ty)),
                IrUnaryOp::BitNot => lowered_shift_ty(&operand_ty),
            }
        }
        IrValueKind::Binary { op, left, right } => {
            let left_ty = value_type_token(method, left)?;
            let right_ty = value_type_token(method, right)?;
            lowered_binary_value_ty(op, &left_ty, &right_ty)
                .or_else(|| (value.ty != "unknown").then(|| normalize_type_token(&value.ty)))
        }
        IrValueKind::IntLiteral(_) => {
            if value.ty != "unknown" {
                Some(normalize_type_token(&value.ty))
            } else {
                Some("int".to_string())
            }
        }
        IrValueKind::BoolLiteral(_) => Some("boolean".to_string()),
        IrValueKind::StringLiteral(_) => Some("String".to_string()),
        IrValueKind::NullLiteral => Some("null".to_string()),
        IrValueKind::ArrayLength { .. } => Some("int".to_string()),
        IrValueKind::ArrayGet { ref element_ty, .. } => Some(normalize_type_token(element_ty)),
        IrValueKind::Cast { ref ty, .. } => Some(normalize_type_token(ty)),
        _ if value.ty != "unknown" => Some(normalize_type_token(&value.ty)),
        _ => None,
    }
}

pub(crate) fn lowered_binary_value_ty(
    op: IrBinaryOp,
    left_ty: &str,
    right_ty: &str,
) -> Option<String> {
    match op {
        IrBinaryOp::Add => {
            if is_string_type_name(left_ty) || is_string_type_name(right_ty) {
                Some("String".to_string())
            } else {
                Some(lowered_numeric_binary_ty(left_ty, right_ty))
            }
        }
        IrBinaryOp::Sub | IrBinaryOp::Mul | IrBinaryOp::Div | IrBinaryOp::Mod => {
            Some(lowered_numeric_binary_ty(left_ty, right_ty))
        }
        IrBinaryOp::BitAnd | IrBinaryOp::BitOr | IrBinaryOp::BitXor => {
            if normalize_type_token(left_ty) == "boolean"
                && normalize_type_token(right_ty) == "boolean"
            {
                Some("boolean".to_string())
            } else {
                lowered_integral_binary_ty(left_ty, right_ty)
            }
        }
        IrBinaryOp::ShiftLeft | IrBinaryOp::ShiftRight | IrBinaryOp::UnsignedShiftRight => {
            lowered_shift_ty(left_ty)
        }
        IrBinaryOp::Eq
        | IrBinaryOp::NotEq
        | IrBinaryOp::Less
        | IrBinaryOp::LessEq
        | IrBinaryOp::Greater
        | IrBinaryOp::GreaterEq => Some("boolean".to_string()),
    }
}

pub(crate) fn lowered_unary_numeric_ty(operand_ty: &str) -> String {
    match normalize_type_token(operand_ty).as_str() {
        "byte" | "short" | "char" => "int".to_string(),
        "ubyte" | "ushort" => "uint".to_string(),
        other => other.to_string(),
    }
}

fn signed_rank(ty: &str) -> Option<u8> {
    match normalize_type_token(ty).as_str() {
        "byte" => Some(1),
        "short" => Some(2),
        "char" => Some(2),
        "int" => Some(3),
        "long" => Some(4),
        "float" => Some(5),
        "double" => Some(6),
        _ => None,
    }
}

fn unsigned_rank(ty: &str) -> Option<u8> {
    match normalize_type_token(ty).as_str() {
        "ubyte" => Some(1),
        "ushort" => Some(2),
        "uint" => Some(3),
        "ulong" => Some(4),
        _ => None,
    }
}

fn lowered_numeric_binary_ty(left_ty: &str, right_ty: &str) -> String {
    let left = normalize_type_token(left_ty);
    let right = normalize_type_token(right_ty);
    match (signed_rank(&left), signed_rank(&right)) {
        (Some(left_rank), Some(right_rank)) => {
            let ty = if left_rank >= right_rank { left } else { right };
            match ty.as_str() {
                "byte" | "short" | "char" => "int".to_string(),
                _ => ty,
            }
        }
        _ => match (unsigned_rank(&left), unsigned_rank(&right)) {
            (Some(left_rank), Some(right_rank)) => {
                if left_rank.max(right_rank) >= 4 {
                    "ulong".to_string()
                } else {
                    "uint".to_string()
                }
            }
            _ => match (signed_rank(&left), unsigned_rank(&right)) {
                (Some(signed_rank), Some(unsigned_rank)) => {
                    if signed_rank >= 5 {
                        left
                    } else {
                        match unsigned_rank {
                            1 | 2 => match left.as_str() {
                                "long" => "long".to_string(),
                                _ => "int".to_string(),
                            },
                            3 => "long".to_string(),
                            _ => "int".to_string(),
                        }
                    }
                }
                _ => match (unsigned_rank(&left), signed_rank(&right)) {
                    (Some(unsigned_rank), Some(signed_rank)) => {
                        if signed_rank >= 5 {
                            right
                        } else {
                            match unsigned_rank {
                                1 | 2 => match right.as_str() {
                                    "long" => "long".to_string(),
                                    _ => "int".to_string(),
                                },
                                3 => "long".to_string(),
                                _ => "int".to_string(),
                            }
                        }
                    }
                    _ => "int".to_string(),
                },
            },
        },
    }
}

fn is_integral_ty(ty: &str) -> bool {
    matches!(
        normalize_type_token(ty).as_str(),
        "byte" | "short" | "int" | "long" | "char" | "ubyte" | "ushort" | "uint" | "ulong"
    )
}

fn lowered_integral_binary_ty(left_ty: &str, right_ty: &str) -> Option<String> {
    if !is_integral_ty(left_ty) || !is_integral_ty(right_ty) {
        return None;
    }
    Some(lowered_numeric_binary_ty(left_ty, right_ty))
}

pub(crate) fn lowered_shift_ty(left_ty: &str) -> Option<String> {
    match normalize_type_token(left_ty).as_str() {
        "byte" | "short" | "char" => Some("int".to_string()),
        "ubyte" | "ushort" => Some("uint".to_string()),
        "int" => Some("int".to_string()),
        "uint" => Some("uint".to_string()),
        "long" => Some("long".to_string()),
        "ulong" => Some("ulong".to_string()),
        _ => None,
    }
}

pub(crate) fn is_primitive_type_name(ty: &str) -> bool {
    let simple = ty.rsplit('.').next().unwrap_or(ty);
    matches!(
        simple,
        "void"
            | "boolean"
            | "byte"
            | "short"
            | "int"
            | "long"
            | "float"
            | "double"
            | "char"
            | "ubyte"
            | "ushort"
            | "uint"
            | "ulong"
    )
}

pub(crate) fn is_arc_managed_type_name(ty: &str) -> bool {
    if ty == "unknown" || ty == "null" {
        return false;
    }
    if ty.ends_with("[]") {
        return true;
    }
    if is_primitive_type_name(ty) {
        return false;
    }
    true
}

pub(crate) fn is_string_type_name(ty: &str) -> bool {
    ty == "String" || ty.ends_with(".String")
}

pub(crate) fn class_requires_native_cleanup(package: &str, class_name: &str) -> bool {
    matches!(
        (package, class_name),
        ("aden.interop", "NativeBuffer")
            | ("aden.interop", "NativeLibrary")
            | ("aden.interop", "NativeCallbackHandle")
    )
}

pub(crate) fn is_handle_type_name(ty: &str) -> bool {
    is_arc_managed_type_name(ty)
}

pub(crate) fn is_wide_integer_type_name(ty: &str) -> bool {
    matches!(normalize_type_token(ty).as_str(), "long" | "ulong")
}

pub(crate) fn uses_qword_scalar_type_name(ty: &str) -> bool {
    is_wide_integer_type_name(ty) || matches!(normalize_type_token(ty).as_str(), "float" | "double")
}

pub(crate) fn uses_qword_field_storage(ty: &str) -> bool {
    is_handle_type_name(ty) || uses_qword_scalar_type_name(ty)
}

pub(crate) fn value_declared_type(
    method: &IrMethod,
    value_id: IrValueId,
    local_types: &HashMap<String, String>,
    field_types: &HashMap<String, String>,
    current_class_name: &str,
) -> Option<String> {
    let value = method.values.get(value_id as usize)?;
    if value.ty != "unknown" {
        return Some(value.ty.clone());
    }
    match &value.kind {
        IrValueKind::LocalRef(name) => local_types
            .get(name)
            .cloned()
            .or_else(|| field_types.get(name).cloned()),
        IrValueKind::ThisRef => Some(current_class_name.to_string()),
        IrValueKind::SuperRef => class_super_of(current_class_name),
        IrValueKind::MemberAccess { object, member } => {
            let obj_value = method.values.get(*object as usize)?;
            if matches!(obj_value.kind, IrValueKind::ThisRef | IrValueKind::SuperRef) {
                return field_types.get(member).cloned();
            }
            if let IrValueKind::LocalRef(local_name) = &obj_value.kind {
                if local_types
                    .get(local_name)
                    .map(|t| t == current_class_name)
                    .unwrap_or(false)
                {
                    return field_types.get(member).cloned();
                }
            }
            None
        }
        _ => None,
    }
}

pub(crate) fn value_is_arc_managed(
    method: &IrMethod,
    value_id: IrValueId,
    local_types: &HashMap<String, String>,
    field_types: &HashMap<String, String>,
    current_class_name: &str,
) -> bool {
    let Some(value) = method.values.get(value_id as usize) else {
        return false;
    };
    let declared_ty = value_declared_type(
        method,
        value_id,
        local_types,
        field_types,
        current_class_name,
    )
    .unwrap_or_else(|| value.ty.clone());
    is_arc_managed_type_name(&declared_ty)
}

pub(crate) fn value_is_alias_like(method: &IrMethod, value_id: IrValueId) -> bool {
    let Some(value) = method.values.get(value_id as usize) else {
        return false;
    };
    matches!(
        value.kind,
        IrValueKind::LocalRef(_)
            | IrValueKind::ThisRef
            | IrValueKind::SuperRef
            | IrValueKind::MemberAccess { .. }
    )
}

pub(crate) fn value_requires_arc_retain_on_store(method: &IrMethod, value_id: IrValueId) -> bool {
    let Some(value) = method.values.get(value_id as usize) else {
        return false;
    };
    if matches!(value.kind, IrValueKind::Cast { .. }) && is_arc_managed_type_name(&value.ty) {
        return true;
    }
    if matches!(value.kind, IrValueKind::Call { .. }) {
        // Call results are already the post-call value in `rax`.
        // Storing them into an ARC local/field should transfer that result,
        // not add another strong retain on top of it.
        return false;
    }
    value_is_alias_like(method, value_id)
}

pub(crate) fn masm_local_slot_count(method: &IrMethod) -> usize {
    let mut local_count = 0usize;
    let mut seen_locals: HashSet<String> = HashSet::new();
    for block in &method.blocks {
        for instr in &block.instructions {
            if let IrInstr::DeclareLocal { name, .. } = instr {
                if seen_locals.insert(name.clone()) {
                    local_count += 1;
                }
            }
        }
    }
    local_count + method.params.len() + if method.is_static { 0 } else { 1 }
}

pub(crate) fn masm_outgoing_stack_arg_slots(method: &IrMethod) -> usize {
    method
        .values
        .iter()
        .filter_map(|v| match &v.kind {
            IrValueKind::Call { args, .. } => Some(args.len().saturating_sub(3)),
            IrValueKind::NewObject { args, .. } => Some(args.len().saturating_sub(4)),
            _ => None,
        })
        .max()
        .unwrap_or(0)
}

pub(crate) fn masm_max_call_arg_count(method: &IrMethod) -> usize {
    method
        .values
        .iter()
        .filter_map(|v| match &v.kind {
            IrValueKind::Call { args, .. } => Some(args.len()),
            IrValueKind::NewObject { args, .. } => Some(args.len()),
            _ => None,
        })
        .max()
        .unwrap_or(0)
}

pub(crate) fn masm_arc_arg_spill_count(method: &IrMethod) -> usize {
    std::cmp::max(ARC_ARG_SPILL_MAX, masm_max_call_arg_count(method))
}

pub(crate) fn masm_local_base_offset(method: &IrMethod) -> usize {
    let call_area_end = 40 + (masm_outgoing_stack_arg_slots(method) * 8);
    std::cmp::max(64, (call_area_end + 7) & !7)
}

pub(crate) fn masm_binary_temp_count(method: &IrMethod) -> usize {
    method
        .values
        .iter()
        .filter(|v| {
            matches!(
                v.kind,
                IrValueKind::Binary { .. } | IrValueKind::SwitchExpr { .. }
            )
        })
        .count()
}

pub(crate) fn masm_binary_temp_slot(method: &IrMethod, value_id: IrValueId) -> Option<usize> {
    let mut slot = 0usize;
    for value in &method.values {
        if matches!(
            value.kind,
            IrValueKind::Binary { .. } | IrValueKind::SwitchExpr { .. }
        ) {
            if value.id == value_id {
                return Some(slot);
            }
            slot += 1;
        }
    }
    None
}

pub(crate) fn masm_binary_tmp_base(method: &IrMethod) -> usize {
    let local_slots = masm_local_slot_count(method);
    let local_base = masm_local_base_offset(method);
    let end = if local_slots == 0 {
        local_base
    } else {
        local_base + (local_slots * 8)
    };
    (end + 7) & !7
}

pub(crate) fn masm_binary_tmp_offset(method: &IrMethod, value_id: IrValueId) -> Option<usize> {
    let slot = masm_binary_temp_slot(method, value_id)?;
    Some(masm_binary_tmp_base(method) + (slot * 8))
}

pub(crate) fn masm_arc_spill_base(method: &IrMethod) -> usize {
    let binary_end = masm_binary_tmp_base(method) + (masm_binary_temp_count(method) * 8);
    (binary_end + 7) & !7
}

fn value_nested_call_preserve_depth(
    method: &IrMethod,
    value_id: IrValueId,
    memo: &mut HashMap<IrValueId, usize>,
) -> usize {
    if let Some(depth) = memo.get(&value_id) {
        return *depth;
    }
    let Some(value) = method.values.get(value_id as usize) else {
        return 0;
    };
    let depth = match &value.kind {
        IrValueKind::Call { callee, args } => {
            let child = std::iter::once(*callee)
                .chain(args.iter().copied())
                .map(|id| value_nested_call_preserve_depth(method, id, memo))
                .max()
                .unwrap_or(0);
            1 + child
        }
        IrValueKind::NewObject { args, .. } => {
            1 + args
                .iter()
                .copied()
                .map(|id| value_nested_call_preserve_depth(method, id, memo))
                .max()
                .unwrap_or(0)
        }
        IrValueKind::Unary { operand, .. }
        | IrValueKind::Cast { value: operand, .. }
        | IrValueKind::InstanceOf { value: operand, .. }
        | IrValueKind::ArrayLength { array: operand }
        | IrValueKind::MemberAccess {
            object: operand, ..
        } => value_nested_call_preserve_depth(method, *operand, memo),
        IrValueKind::Binary { left, right, .. } => std::cmp::max(
            value_nested_call_preserve_depth(method, *left, memo),
            value_nested_call_preserve_depth(method, *right, memo),
        ),
        IrValueKind::Conditional {
            condition,
            then_value,
            else_value,
        } => [
            value_nested_call_preserve_depth(method, *condition, memo),
            value_nested_call_preserve_depth(method, *then_value, memo),
            value_nested_call_preserve_depth(method, *else_value, memo),
        ]
        .into_iter()
        .max()
        .unwrap_or(0),
        IrValueKind::SwitchExpr {
            expr,
            cases,
            default,
        } => {
            let mut max_depth = value_nested_call_preserve_depth(method, *expr, memo);
            for (case, result) in cases {
                max_depth = std::cmp::max(
                    max_depth,
                    value_nested_call_preserve_depth(method, *case, memo),
                );
                max_depth = std::cmp::max(
                    max_depth,
                    value_nested_call_preserve_depth(method, *result, memo),
                );
            }
            std::cmp::max(
                max_depth,
                value_nested_call_preserve_depth(method, *default, memo),
            )
        }
        IrValueKind::ArrayNew { lengths, .. }
        | IrValueKind::ArrayNewInitialized {
            values: lengths, ..
        } => lengths
            .iter()
            .copied()
            .map(|id| value_nested_call_preserve_depth(method, id, memo))
            .max()
            .unwrap_or(0),
        IrValueKind::ArrayGet { array, index, .. } => std::cmp::max(
            value_nested_call_preserve_depth(method, *array, memo),
            value_nested_call_preserve_depth(method, *index, memo),
        ),
        IrValueKind::ArraySet {
            array,
            index,
            value,
            ..
        } => [
            value_nested_call_preserve_depth(method, *array, memo),
            value_nested_call_preserve_depth(method, *index, memo),
            value_nested_call_preserve_depth(method, *value, memo),
        ]
        .into_iter()
        .max()
        .unwrap_or(0),
        _ => 0,
    };
    memo.insert(value_id, depth);
    depth
}

pub(crate) fn masm_nested_call_preserve_depth_budget(method: &IrMethod) -> usize {
    let mut memo: HashMap<IrValueId, usize> = HashMap::new();
    method
        .values
        .iter()
        .map(|value| value_nested_call_preserve_depth(method, value.id, &mut memo))
        .max()
        .unwrap_or(0)
}

pub(crate) fn arc_arg_spill_offset(method: &IrMethod, arg_index: usize) -> usize {
    masm_arc_spill_base(method) + (arg_index * ARC_ARG_SPILL_STRIDE)
}

pub(crate) fn masm_arc_local_tmp_offset(method: &IrMethod) -> usize {
    arc_arg_spill_offset(method, masm_arc_arg_spill_count(method))
}

pub(crate) fn masm_call_retval_spill_offset(method: &IrMethod) -> usize {
    arc_arg_spill_offset(method, masm_arc_arg_spill_count(method) + 1)
}

pub(crate) fn masm_call_receiver_spill_offset(method: &IrMethod) -> usize {
    masm_call_receiver_spill_offset_at_depth(method, 0)
}

pub(crate) fn masm_call_receiver_spill_offset_at_depth(method: &IrMethod, depth: usize) -> usize {
    arc_arg_spill_offset(
        method,
        masm_arc_arg_spill_count(method) + 2 + (depth * (masm_arc_arg_spill_count(method) + 1)),
    )
}

pub(crate) fn masm_call_arg_preserve_offset(method: &IrMethod, slot: usize) -> usize {
    masm_call_receiver_spill_offset(method) + ((slot + 1) * 8)
}

pub(crate) fn masm_nested_call_arg_preserve_offset_at_depth(
    method: &IrMethod,
    depth: usize,
    arg_index: usize,
) -> usize {
    masm_call_receiver_spill_offset_at_depth(method, depth + 1) + ((arg_index + 1) * 8)
}

pub(crate) fn masm_outgoing_stack_arg_offset(stack_arg_slot: usize) -> usize {
    32 + (stack_arg_slot * 8)
}

fn masm_array_temp_slot_width(value: &IrValue) -> usize {
    match &value.kind {
        IrValueKind::ArrayNewInitialized { .. } => 1,
        IrValueKind::ArrayNew { lengths, .. } if lengths.len() > 1 => lengths.len(),
        IrValueKind::ArrayGet { .. } => 1,
        IrValueKind::ArraySet { .. } => 2,
        _ => 0,
    }
}

pub(crate) fn masm_array_init_temp_count(method: &IrMethod) -> usize {
    method.values.iter().map(masm_array_temp_slot_width).sum()
}

pub(crate) fn masm_array_init_temp_slot(method: &IrMethod, value_id: IrValueId) -> Option<usize> {
    let mut slot = 0usize;
    for value in &method.values {
        let width = masm_array_temp_slot_width(value);
        if width == 0 {
            continue;
        }
        if value.id == value_id {
            return Some(slot);
        }
        slot += width;
    }
    None
}

pub(crate) fn masm_array_init_tmp_base(method: &IrMethod) -> usize {
    let nested_preserve_depth = masm_nested_call_preserve_depth_budget(method);
    let spill_end = masm_arc_spill_base(method)
        + ((masm_arc_arg_spill_count(method)
            + ARC_SCRATCH_EXTRA_SLOTS
            + (nested_preserve_depth * (masm_arc_arg_spill_count(method) + 1)))
            * ARC_ARG_SPILL_STRIDE);
    (spill_end + 7) & !7
}

pub(crate) fn masm_array_init_tmp_offset(method: &IrMethod, value_id: IrValueId) -> Option<usize> {
    let slot = masm_array_init_temp_slot(method, value_id)?;
    Some(masm_array_init_tmp_base(method) + (slot * 8))
}

pub(crate) fn masm_array_init_tmp_offset_at(
    method: &IrMethod,
    value_id: IrValueId,
    slot_index: usize,
) -> Option<usize> {
    let base = masm_array_init_temp_slot(method, value_id)?;
    Some(masm_array_init_tmp_base(method) + ((base + slot_index) * 8))
}
