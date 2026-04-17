use super::*;
use pulsec_core::intermediate::IrSourceLoc;
use std::cell::{Cell, RefCell};

thread_local! {
    static NESTED_ARG_PRESERVE_DEPTH: Cell<usize> = const { Cell::new(0) };
    static CLASS_ID_SET_TABLES: RefCell<Option<MasmClassIdSetRegistry>> = const { RefCell::new(None) };
    static CLASS_ID_SET_LABEL_COUNTER: Cell<usize> = const { Cell::new(0) };
}

#[derive(Default)]
struct MasmClassIdSetRegistry {
    labels_by_ids: HashMap<Vec<u32>, String>,
    ordered: Vec<(String, Vec<u32>)>,
}

fn current_nested_arg_preserve_depth() -> usize {
    NESTED_ARG_PRESERVE_DEPTH.with(|depth| depth.get())
}

fn with_nested_arg_preserve_depth<T>(f: impl FnOnce() -> T) -> T {
    NESTED_ARG_PRESERVE_DEPTH.with(|depth| {
        let current = depth.get();
        assert!(
            current < MAX_NESTED_CALL_ARG_PRESERVE_DEPTH,
            "nested call preserve depth exceeded compile-time budget"
        );
        depth.set(current + 1);
        let result = f();
        depth.set(current);
        result
    })
}

pub(crate) fn begin_class_id_set_table_collection() {
    CLASS_ID_SET_TABLES.with(|tables| {
        let mut tables = tables.borrow_mut();
        *tables = Some(MasmClassIdSetRegistry::default());
    });
}

pub(crate) fn take_class_id_set_tables() -> Vec<(String, Vec<u32>)> {
    CLASS_ID_SET_TABLES.with(|tables| {
        tables
            .borrow_mut()
            .take()
            .map(|registry| registry.ordered)
            .unwrap_or_default()
    })
}

fn register_class_id_set_table(target_class_ids: &[u32]) -> (String, usize) {
    CLASS_ID_SET_TABLES.with(|tables| {
        let mut tables = tables.borrow_mut();
        let registry = tables
            .as_mut()
            .expect("class-id set table collection must be active");
        let ids = target_class_ids.to_vec();
        if let Some(label) = registry.labels_by_ids.get(&ids) {
            return (label.clone(), ids.len());
        }
        let label = CLASS_ID_SET_LABEL_COUNTER.with(|counter| {
            let next = counter.get();
            counter.set(next + 1);
            format!("cidset_{}", next)
        });
        registry.labels_by_ids.insert(ids.clone(), label.clone());
        registry.ordered.push((label.clone(), ids.clone()));
        (label, ids.len())
    })
}

fn wrapper_primitive_type_name(ty: &str) -> Option<&'static str> {
    match normalize_type_token(ty).as_str() {
        "Byte" => Some("byte"),
        "Short" => Some("short"),
        "Integer" => Some("int"),
        "Long" => Some("long"),
        "Float" => Some("float"),
        "Double" => Some("double"),
        "Char" => Some("char"),
        "Boolean" => Some("boolean"),
        "UByte" => Some("ubyte"),
        "UShort" => Some("ushort"),
        "UInteger" => Some("uint"),
        "ULong" => Some("ulong"),
        _ => None,
    }
}

fn is_wrapper_type_name(ty: &str) -> bool {
    wrapper_primitive_type_name(ty).is_some()
}

fn primitive_wrapper_type_name(ty: &str) -> Option<&'static str> {
    match normalize_type_token(ty).as_str() {
        "byte" => Some("Byte"),
        "short" => Some("Short"),
        "int" => Some("Integer"),
        "long" => Some("Long"),
        "float" => Some("Float"),
        "double" => Some("Double"),
        "char" => Some("Char"),
        "boolean" => Some("Boolean"),
        "ubyte" => Some("UByte"),
        "ushort" => Some("UShort"),
        "uint" => Some("UInteger"),
        "ulong" => Some("ULong"),
        _ => None,
    }
}

fn call_targets_wrapper_box_object(
    method: &IrMethod,
    call_value_id: IrValueId,
    current_class_name: &str,
    class_names: &[String],
    local_types: &HashMap<String, String>,
    field_types: &HashMap<String, String>,
) -> bool {
    let Some(value) = method.values.get(call_value_id as usize) else {
        return false;
    };
    let IrValueKind::Call { callee, .. } = &value.kind else {
        return false;
    };
    let Some(callee_value) = method.values.get(*callee as usize) else {
        return false;
    };
    match &callee_value.kind {
        IrValueKind::LocalRef(name) => {
            name == "boxObject" && is_wrapper_type_name(current_class_name)
        }
        IrValueKind::MemberAccess { object, member } => {
            if member != "boxObject" {
                return false;
            }
            let current_package_name = class_package_owner_of(current_class_name)
                .map(|(package, _)| package)
                .unwrap_or_default();
            if let Some((owner_package, owner_class)) = resolve_static_field_owner(
                method,
                *object,
                &current_package_name,
                current_class_name,
                local_types,
                class_names,
            ) {
                return is_wrapper_type_name(&format!("{}.{}", owner_package, owner_class))
                    || is_wrapper_type_name(&owner_class);
            }
            resolve_member_access_owner_name(
                method,
                *object,
                current_class_name,
                class_names,
                field_types,
                local_types,
            )
            .map(|owner| is_wrapper_type_name(&owner))
            .unwrap_or(false)
        }
        _ => false,
    }
}

fn call_result_requires_arc_retain_on_store(
    method: &IrMethod,
    value_id: IrValueId,
    current_class_name: &str,
    class_names: &[String],
    local_types: &HashMap<String, String>,
    field_types: &HashMap<String, String>,
) -> bool {
    let Some(value) = method.values.get(value_id as usize) else {
        return false;
    };
    let IrValueKind::Call { callee, .. } = &value.kind else {
        return false;
    };
    let Some(callee_value) = method.values.get(*callee as usize) else {
        return false;
    };

    let current_package_name = class_package_owner_of(current_class_name)
        .map(|(package, _)| package)
        .unwrap_or_default();
    let (owner, member) = match &callee_value.kind {
        IrValueKind::LocalRef(name) => (current_class_name.to_string(), name.clone()),
        IrValueKind::MemberAccess { object, member } => {
            let owner = if let Some((owner_package, owner_class)) = resolve_static_field_owner(
                method,
                *object,
                &current_package_name,
                current_class_name,
                local_types,
                class_names,
            ) {
                format!("{}.{}", owner_package, owner_class)
            } else if let Some(owner_name) = resolve_member_access_owner_name(
                method,
                *object,
                current_class_name,
                class_names,
                field_types,
                local_types,
            ) {
                owner_name
            } else {
                return false;
            };
            (owner, member.clone())
        }
        _ => return false,
    };

    if owner == "pulse.memory.Memory" && member == "weakGet" {
        return false;
    }

    let owner_is_collection_like = owner.starts_with("pulse.collections.")
        || owner == "Array"
        || owner == "ArrayList"
        || owner == "LinkedList"
        || owner == "HashMap"
        || owner == "HashMapEntry"
        || owner == "LinkedListNode";
    if !owner_is_collection_like {
        return false;
    }

    matches!(
        member.as_str(),
        "get"
            | "getOrDefault"
            | "getFirst"
            | "getLast"
            | "remove"
            | "poll"
            | "removeFirst"
            | "removeLast"
            | "pollFirst"
            | "pollLast"
            | "pop"
            | "set"
            | "getNext"
            | "getPrevious"
            | "getKey"
            | "getValue"
            | "getObject"
            | "getString"
            | "entryFor"
            | "next"
            | "peek"
            | "peekFirst"
            | "peekLast"
            | "element"
            | "readEntryValue"
    )
}

fn latest_local_store_before_statement(
    method: &IrMethod,
    local_name: &str,
    statement_index: usize,
) -> Option<IrValueId> {
    let mut best: Option<(usize, usize, usize, IrValueId)> = None;
    for (block_idx, block) in method.blocks.iter().enumerate() {
        for (instr_idx, instr) in block.instructions.iter().enumerate() {
            let IrInstr::StoreLocal {
                name,
                value,
                source,
            } = instr
            else {
                continue;
            };
            if name != local_name || source.statement_index > statement_index {
                continue;
            }
            let candidate = (source.statement_index, block_idx, instr_idx, *value);
            if best
                .as_ref()
                .map(|current| candidate > *current)
                .unwrap_or(true)
            {
                best = Some(candidate);
            }
        }
    }
    best.map(|(_, _, _, value)| value)
}

fn wrapper_value_is_boxed_object_impl(
    method: &IrMethod,
    value_id: IrValueId,
    current_class_name: &str,
    class_names: &[String],
    local_types: &HashMap<String, String>,
    field_types: &HashMap<String, String>,
    method_symbols_by_sig: &HashMap<(String, String, Vec<String>), String>,
    visiting_values: &mut HashSet<IrValueId>,
) -> bool {
    if !visiting_values.insert(value_id) {
        return false;
    }
    let Some(value) = method.values.get(value_id as usize) else {
        return false;
    };
    let result = match &value.kind {
        IrValueKind::NewObject { class_name, .. } => is_wrapper_type_name(class_name),
        IrValueKind::Call { .. } => {
            call_targets_wrapper_box_object(
                method,
                value_id,
                current_class_name,
                class_names,
                local_types,
                field_types,
            ) || call_result_requires_arc_retain_on_store(
                method,
                value_id,
                current_class_name,
                class_names,
                local_types,
                field_types,
            )
        }
        IrValueKind::Cast { value: inner, ty } => {
            let target_ty = normalize_type_token(ty);
            if target_ty == "Object" {
                wrapper_value_is_boxed_object_impl(
                    method,
                    *inner,
                    current_class_name,
                    class_names,
                    local_types,
                    field_types,
                    method_symbols_by_sig,
                    visiting_values,
                )
            } else if is_wrapper_type_name(&target_ty) {
                let source_ty = primitive_cast_source_ty(method, *inner)
                    .or_else(|| {
                        resolve_backend_call_value_type(
                            method,
                            *inner,
                            current_class_name,
                            class_names,
                            field_types,
                            method_symbols_by_sig,
                        )
                        .map(|ty| normalize_type_token(&ty))
                    })
                    .unwrap_or_default();
                is_handle_type_name(&source_ty)
                    || normalize_type_token(&source_ty) == "Object"
                    || wrapper_value_is_boxed_object_impl(
                        method,
                        *inner,
                        current_class_name,
                        class_names,
                        local_types,
                        field_types,
                        method_symbols_by_sig,
                        visiting_values,
                    )
            } else {
                false
            }
        }
        IrValueKind::Conditional {
            then_value,
            else_value,
            ..
        } => {
            wrapper_value_is_boxed_object_impl(
                method,
                *then_value,
                current_class_name,
                class_names,
                local_types,
                field_types,
                method_symbols_by_sig,
                visiting_values,
            ) && wrapper_value_is_boxed_object_impl(
                method,
                *else_value,
                current_class_name,
                class_names,
                local_types,
                field_types,
                method_symbols_by_sig,
                visiting_values,
            )
        }
        IrValueKind::LocalRef(name) => {
            let local_ty = lookup_local_decl_type(method, name)
                .or_else(|| local_types.get(name).cloned())
                .unwrap_or_default();
            if !is_wrapper_type_name(&local_ty) {
                false
            } else if let Some(stored_value) =
                latest_local_store_before_statement(method, name, value.source.statement_index)
            {
                wrapper_value_is_boxed_object_impl(
                    method,
                    stored_value,
                    current_class_name,
                    class_names,
                    local_types,
                    field_types,
                    method_symbols_by_sig,
                    visiting_values,
                )
            } else {
                false
            }
        }
        _ => false,
    };
    visiting_values.remove(&value_id);
    result
}

fn wrapper_value_is_boxed_object(
    method: &IrMethod,
    value_id: IrValueId,
    current_class_name: &str,
    class_names: &[String],
    local_types: &HashMap<String, String>,
    field_types: &HashMap<String, String>,
    method_symbols_by_sig: &HashMap<(String, String, Vec<String>), String>,
) -> bool {
    let value_ty = value_declared_type(
        method,
        value_id,
        local_types,
        field_types,
        current_class_name,
    )
    .unwrap_or_else(|| {
        method
            .values
            .get(value_id as usize)
            .map(|value| value.ty.clone())
            .unwrap_or_default()
    });
    if !is_wrapper_type_name(&value_ty) {
        return false;
    }
    let mut visiting_values = HashSet::new();
    wrapper_value_is_boxed_object_impl(
        method,
        value_id,
        current_class_name,
        class_names,
        local_types,
        field_types,
        method_symbols_by_sig,
        &mut visiting_values,
    )
}

pub(crate) fn emit_arc_retain_from_eax(out: &mut String) {
    out.push_str("    mov rcx, rax\n");
    out.push_str("    call pulsec_rt_arcRetain\n");
}

pub(crate) fn emit_arc_release_from_eax(out: &mut String) {
    out.push_str("    mov rcx, rax\n");
    out.push_str("    call pulsec_rt_arcRelease\n");
}

fn emit_preserve_call_arg_registers(out: &mut String, method: &IrMethod) {
    out.push_str(&format!(
        "    mov qword ptr [rsp+{}], rdx\n",
        masm_call_arg_preserve_offset(method, 0)
    ));
    out.push_str(&format!(
        "    mov qword ptr [rsp+{}], r8\n",
        masm_call_arg_preserve_offset(method, 1)
    ));
    out.push_str(&format!(
        "    mov qword ptr [rsp+{}], r9\n",
        masm_call_arg_preserve_offset(method, 2)
    ));
}

fn emit_restore_call_arg_registers(out: &mut String, method: &IrMethod) {
    out.push_str(&format!(
        "    mov rdx, qword ptr [rsp+{}]\n",
        masm_call_arg_preserve_offset(method, 0)
    ));
    out.push_str(&format!(
        "    mov r8, qword ptr [rsp+{}]\n",
        masm_call_arg_preserve_offset(method, 1)
    ));
    out.push_str(&format!(
        "    mov r9, qword ptr [rsp+{}]\n",
        masm_call_arg_preserve_offset(method, 2)
    ));
}

fn emit_preserve_nested_arg_spills(out: &mut String, method: &IrMethod, count: usize) {
    let depth = current_nested_arg_preserve_depth();
    for idx in 0..count {
        out.push_str(&format!(
            "    mov rax, qword ptr [rsp+{}]\n",
            arc_arg_spill_offset(method, idx)
        ));
        out.push_str(&format!(
            "    mov qword ptr [rsp+{}], rax\n",
            masm_nested_call_arg_preserve_offset_at_depth(method, depth, idx)
        ));
    }
}

fn emit_restore_nested_arg_spills(out: &mut String, method: &IrMethod, count: usize) {
    let depth = current_nested_arg_preserve_depth();
    for idx in 0..count {
        out.push_str(&format!(
            "    mov rax, qword ptr [rsp+{}]\n",
            masm_nested_call_arg_preserve_offset_at_depth(method, depth, idx)
        ));
        out.push_str(&format!(
            "    mov qword ptr [rsp+{}], rax\n",
            arc_arg_spill_offset(method, idx)
        ));
    }
}

fn emit_restore_nested_arg_spills_preserving_rax(
    out: &mut String,
    method: &IrMethod,
    count: usize,
) {
    out.push_str(&format!(
        "    mov qword ptr [rsp+{}], rax\n",
        masm_call_retval_spill_offset(method)
    ));
    emit_restore_nested_arg_spills(out, method, count);
    out.push_str(&format!(
        "    mov rax, qword ptr [rsp+{}]\n",
        masm_call_retval_spill_offset(method)
    ));
}

fn emit_wrapper_box_call(
    out: &mut String,
    wrapper_ty: &str,
    primitive_ty: &str,
    method: &IrMethod,
    current_class_name: &str,
    class_names: &[String],
    field_types: &HashMap<String, String>,
    method_symbols: &HashMap<(String, String), String>,
    method_symbols_by_sig: &HashMap<(String, String, Vec<String>), String>,
) -> Result<(), String> {
    let owner = normalize_class_owner_name(wrapper_ty, class_names)
        .unwrap_or_else(|| wrapper_ty.to_string());
    let symbol = resolve_method_symbol_for_call(
        &owner,
        "boxObject",
        &[],
        method,
        current_class_name,
        class_names,
        field_types,
        method_symbols,
        method_symbols_by_sig,
    )
    .or_else(|| {
        method_symbols_by_sig
            .get(&(
                owner.clone(),
                "boxObject".to_string(),
                vec![primitive_ty.to_string()],
            ))
            .cloned()
    })
    .ok_or_else(|| format!("missing boxing helper for wrapper type '{}'", wrapper_ty))?;
    if uses_qword_scalar_type_name(primitive_ty) {
        out.push_str("    mov rcx, rax\n");
    } else {
        out.push_str("    mov ecx, eax\n");
    }
    out.push_str(&format!("    call {}\n", symbol));
    Ok(())
}

fn raw_runtime_handle_field(owner: &str, member: &str) -> bool {
    matches!(
        (normalize_type_token(owner).as_str(), member),
        ("Files", "textStore")
            | ("Files", "fileIndex")
            | ("Files", "directoryIndex")
            | ("Files", "modifiedStore")
            | ("Array", "handle")
            | ("pulse.io.Files", "textStore")
            | ("pulse.io.Files", "fileIndex")
            | ("pulse.io.Files", "directoryIndex")
            | ("pulse.io.Files", "modifiedStore")
            | ("pulse.collections.Array", "handle")
    )
}

fn value_requires_arc_retain_on_return(method: &IrMethod, value_id: IrValueId) -> bool {
    let Some(value) = method.values.get(value_id as usize) else {
        return false;
    };
    if matches!(value.kind, IrValueKind::Cast { .. }) && is_arc_managed_type_name(&value.ty) {
        return true;
    }
    if let IrValueKind::LocalRef(name) = &value.kind {
        if let Some(local_ty) = lookup_local_decl_type(method, name) {
            if is_arc_managed_type_name(&local_ty) {
                return true;
            }
        }
        if let Some(stored_value_id) =
            latest_local_store_before_statement(method, name, value.source.statement_index)
        {
            if let Some(stored_value) = method.values.get(stored_value_id as usize) {
                if matches!(stored_value.kind, IrValueKind::NewObject { .. }) {
                    return true;
                }
            }
        }
    }
    matches!(
        value.kind,
        IrValueKind::ThisRef | IrValueKind::SuperRef | IrValueKind::MemberAccess { .. }
    )
}

fn call_returns_raw_runtime_handle(
    method: &IrMethod,
    value_id: IrValueId,
    current_class_name: &str,
    class_names: &[String],
    local_types: &HashMap<String, String>,
    field_types: &HashMap<String, String>,
) -> bool {
    let Some(value) = method.values.get(value_id as usize) else {
        return false;
    };
    let IrValueKind::Call { callee, .. } = &value.kind else {
        return false;
    };
    let Some(callee_value) = method.values.get(*callee as usize) else {
        return false;
    };
    match &callee_value.kind {
        IrValueKind::MemberAccess { object, member } => {
            let owner = resolve_member_access_owner_name(
                method,
                *object,
                current_class_name,
                class_names,
                field_types,
                local_types,
            )
            .unwrap_or_default();
            let owner = normalize_class_owner_name(&owner, class_names).unwrap_or(owner);
            owner == "pulse.rt.Intrinsics"
                && matches!(member.as_str(), "arrayNew" | "listNew" | "mapNew")
        }
        _ => false,
    }
}

fn value_is_raw_runtime_handle_impl(
    method: &IrMethod,
    value_id: IrValueId,
    current_class_name: &str,
    class_names: &[String],
    local_types: &HashMap<String, String>,
    field_types: &HashMap<String, String>,
    visiting_values: &mut HashSet<IrValueId>,
) -> bool {
    if !visiting_values.insert(value_id) {
        return false;
    }
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
    if normalize_type_token(&declared_ty) != "long" {
        visiting_values.remove(&value_id);
        return false;
    }
    let result = match &value.kind {
        IrValueKind::Call { .. } => call_returns_raw_runtime_handle(
            method,
            value_id,
            current_class_name,
            class_names,
            local_types,
            field_types,
        ),
        IrValueKind::LocalRef(name) => {
            if let Some(stored_value) =
                latest_local_store_before_statement(method, name, value.source.statement_index)
            {
                value_is_raw_runtime_handle_impl(
                    method,
                    stored_value,
                    current_class_name,
                    class_names,
                    local_types,
                    field_types,
                    visiting_values,
                )
            } else {
                false
            }
        }
        IrValueKind::MemberAccess { object, member } => {
            let current_package_name = class_package_owner_of(current_class_name)
                .map(|(package, _)| package)
                .unwrap_or_default();
            if let Some((owner_package, owner_class)) = resolve_static_field_owner(
                method,
                *object,
                &current_package_name,
                current_class_name,
                local_types,
                class_names,
            ) {
                raw_runtime_handle_field(&format!("{}.{}", owner_package, owner_class), member)
            } else if matches!(
                method.values.get(*object as usize).map(|value| &value.kind),
                Some(IrValueKind::ThisRef) | Some(IrValueKind::SuperRef)
            ) {
                raw_runtime_handle_field(current_class_name, member)
            } else {
                false
            }
        }
        IrValueKind::Conditional {
            then_value,
            else_value,
            ..
        } => {
            value_is_raw_runtime_handle_impl(
                method,
                *then_value,
                current_class_name,
                class_names,
                local_types,
                field_types,
                visiting_values,
            ) && value_is_raw_runtime_handle_impl(
                method,
                *else_value,
                current_class_name,
                class_names,
                local_types,
                field_types,
                visiting_values,
            )
        }
        IrValueKind::Cast { value: inner, .. } => value_is_raw_runtime_handle_impl(
            method,
            *inner,
            current_class_name,
            class_names,
            local_types,
            field_types,
            visiting_values,
        ),
        _ => false,
    };
    visiting_values.remove(&value_id);
    result
}

fn value_is_raw_runtime_handle(
    method: &IrMethod,
    value_id: IrValueId,
    current_class_name: &str,
    class_names: &[String],
    local_types: &HashMap<String, String>,
    field_types: &HashMap<String, String>,
) -> bool {
    let mut visiting_values = HashSet::new();
    value_is_raw_runtime_handle_impl(
        method,
        value_id,
        current_class_name,
        class_names,
        local_types,
        field_types,
        &mut visiting_values,
    )
}

fn emit_constructor_receiver_setup(
    out: &mut String,
    class_name: &str,
    reuse_current_this: bool,
    current_class_name: &str,
    param_offsets: &HashMap<String, usize>,
) {
    if reuse_current_this && class_name == current_class_name {
        if let Some(this_offset) = param_offsets.get("__this") {
            out.push_str(&format!("    mov rcx, qword ptr [rsp+{}]\n", this_offset));
            return;
        }
    }
    out.push_str("    xor ecx, ecx\n");
}

fn emit_wrapper_unbox_call(
    out: &mut String,
    wrapper_ty: &str,
    method: &IrMethod,
    current_class_name: &str,
    class_names: &[String],
    field_types: &HashMap<String, String>,
    method_symbols: &HashMap<(String, String), String>,
    method_symbols_by_sig: &HashMap<(String, String, Vec<String>), String>,
) -> Result<(), String> {
    let owner = normalize_class_owner_name(wrapper_ty, class_names)
        .unwrap_or_else(|| wrapper_ty.to_string());
    let symbol = method_symbols_by_sig
        .get(&(
            owner.clone(),
            "unboxBoxed".to_string(),
            vec![normalize_type_token(&owner)],
        ))
        .cloned()
        .or_else(|| {
            resolve_method_symbol_for_call(
                &owner,
                "unboxBoxed",
                &[],
                method,
                current_class_name,
                class_names,
                field_types,
                method_symbols,
                method_symbols_by_sig,
            )
        })
        .ok_or_else(|| format!("missing unboxing helper for wrapper type '{}'", wrapper_ty))?;
    out.push_str("    mov rcx, rax\n");
    out.push_str(&format!("    call {}\n", symbol));
    Ok(())
}

fn emit_runtime_backed_method_wrapper(
    out: &mut String,
    current_class_name: &str,
    method: &IrMethod,
    stdlib_symbols: &HashMap<(String, String), String>,
    param_offsets: &HashMap<String, usize>,
) -> bool {
    let std_owner = normalize_stdlib_owner(current_class_name).to_string();
    let Some(symbol) = stdlib_symbols.get(&(std_owner, method.name.clone())) else {
        return false;
    };

    if !method.is_static {
        if let Some(this_offset) = param_offsets.get("__this") {
            out.push_str(&format!("    mov rcx, qword ptr [rsp+{}]\n", this_offset));
        } else {
            out.push_str("    mov rcx, rcx\n");
        }
    }
    for (idx, param) in method.params.iter().enumerate() {
        let Some(offset) = param_offsets.get(&param.name) else {
            continue;
        };
        let reg_idx = if method.is_static { idx } else { idx + 1 };
        if uses_qword_scalar_type_name(&param.ty) || is_handle_type_name(&param.ty) {
            out.push_str(&format!(
                "    mov {}, qword ptr [rsp+{}]\n",
                arg_register64(reg_idx),
                offset
            ));
        } else {
            out.push_str(&format!(
                "    mov {}, dword ptr [rsp+{}]\n",
                arg_register32(reg_idx),
                offset
            ));
        }
    }
    out.push_str(&format!("    call {}\n", symbol));
    true
}

fn emit_trace_update_for_source(
    out: &mut String,
    method_symbol: &str,
    source: &IrSourceLoc,
    last_trace_statement: &mut Option<usize>,
) {
    if source.source_line == 0 || *last_trace_statement == Some(source.statement_index) {
        return;
    }
    let label = format!("{}_trace_s{}", method_symbol, source.statement_index);
    out.push_str(&format!("    lea rcx, {}\n", label));
    out.push_str(&format!("    mov edx, {}_len\n", label));
    out.push_str(&format!("    call {}\n", TRACE_UPDATE_SYMBOL));
    *last_trace_statement = Some(source.statement_index);
}

fn primitive_cast_source_ty(method: &IrMethod, value_id: IrValueId) -> Option<String> {
    value_type_token(method, value_id).or_else(|| {
        let value = method.values.get(value_id as usize)?;
        if value.ty == "unknown" {
            None
        } else {
            Some(normalize_type_token(&value.ty))
        }
    })
}

fn emit_post_call_return_normalization(
    out: &mut String,
    method: &IrMethod,
    value_id: IrValueId,
    current_class_name: &str,
    class_names: &[String],
    field_types: &HashMap<String, String>,
    method_symbols_by_sig: &HashMap<(String, String, Vec<String>), String>,
) {
    let Some(return_ty) = resolve_backend_call_value_type(
        method,
        value_id,
        current_class_name,
        class_names,
        field_types,
        method_symbols_by_sig,
    ) else {
        return;
    };
    match normalize_type_token(&return_ty).as_str() {
        "byte" => {
            out.push_str("    movsx eax, al\n");
            out.push_str("    movsxd rax, eax\n");
        }
        "ubyte" => out.push_str("    movzx eax, al\n"),
        "short" => {
            out.push_str("    movsx eax, ax\n");
            out.push_str("    movsxd rax, eax\n");
        }
        "ushort" | "char" => out.push_str("    movzx eax, ax\n"),
        "int" => out.push_str("    movsxd rax, eax\n"),
        "uint" | "boolean" => out.push_str("    and rax, 0FFFFFFFFh\n"),
        _ => {}
    }
}

fn resolve_method_owner_and_param_types_for_call(
    owner: &str,
    member: &str,
    args: &[IrValueId],
    method: &IrMethod,
    current_class_name: &str,
    class_names: &[String],
    field_types: &HashMap<String, String>,
    method_symbols_by_sig: &HashMap<(String, String, Vec<String>), String>,
) -> Option<(String, Vec<String>, bool)> {
    let mut current = owner.to_string();
    loop {
        if let Some((sig, is_varargs)) = resolve_method_param_types_for_call_exact(
            &current,
            member,
            args,
            method,
            current_class_name,
            class_names,
            field_types,
            method_symbols_by_sig,
        ) {
            return Some((current, sig, is_varargs));
        }
        for iface in interfaces_of_type(&current) {
            if let Some((sig, is_varargs)) = resolve_method_param_types_for_call_exact(
                &iface,
                member,
                args,
                method,
                current_class_name,
                class_names,
                field_types,
                method_symbols_by_sig,
            ) {
                return Some((iface, sig, is_varargs));
            }
        }
        let Some(parent) = class_super_of(&current) else {
            return None;
        };
        current = parent;
    }
}

fn resolve_method_return_type_for_call(
    owner: &str,
    member: &str,
    args: &[IrValueId],
    method: &IrMethod,
    current_class_name: &str,
    class_names: &[String],
    field_types: &HashMap<String, String>,
    method_symbols_by_sig: &HashMap<(String, String, Vec<String>), String>,
) -> Option<String> {
    let (resolved_owner, sig, _) = resolve_method_owner_and_param_types_for_call(
        owner,
        member,
        args,
        method,
        current_class_name,
        class_names,
        field_types,
        method_symbols_by_sig,
    )?;
    method_return_type_of(&resolved_owner, member, &sig)
}

fn resolve_backend_call_value_type(
    method: &IrMethod,
    value_id: IrValueId,
    current_class_name: &str,
    class_names: &[String],
    field_types: &HashMap<String, String>,
    method_symbols_by_sig: &HashMap<(String, String, Vec<String>), String>,
) -> Option<String> {
    let value = method.values.get(value_id as usize)?;
    let IrValueKind::Call { callee, args } = &value.kind else {
        return None;
    };
    let callee_v = method.values.get(*callee as usize)?;
    match &callee_v.kind {
        IrValueKind::LocalRef(name) => {
            if class_names.iter().any(|c| c == name) {
                return Some(name.clone());
            }
            resolve_method_return_type_for_call(
                current_class_name,
                name,
                args,
                method,
                current_class_name,
                class_names,
                field_types,
                method_symbols_by_sig,
            )
        }
        IrValueKind::MemberAccess { object, member } => {
            let owner_v = method.values.get(*object as usize)?;
            let owner_name = match &owner_v.kind {
                IrValueKind::StringLiteral(_) => "String".to_string(),
                IrValueKind::ThisRef => current_class_name.to_string(),
                IrValueKind::SuperRef => class_super_of(current_class_name)
                    .unwrap_or_else(|| current_class_name.to_string()),
                IrValueKind::LocalRef(name) => name.clone(),
                IrValueKind::NewObject { class_name, .. } => class_name.clone(),
                IrValueKind::Call { .. } => {
                    if let Some(resolved_ty) = backend_resolution_arg_type(
                        method,
                        *object,
                        current_class_name,
                        class_names,
                        field_types,
                        method_symbols_by_sig,
                    ) {
                        normalize_class_owner_name(&resolved_ty, class_names).unwrap_or(resolved_ty)
                    } else {
                        return None;
                    }
                }
                IrValueKind::MemberAccess {
                    member: owner_member,
                    ..
                } => {
                    if let Some(normalized) = normalize_class_owner_name(&owner_v.ty, class_names) {
                        normalized
                    } else if let Some(resolved_ty) = backend_resolution_arg_type(
                        method,
                        *object,
                        current_class_name,
                        class_names,
                        field_types,
                        method_symbols_by_sig,
                    ) {
                        normalize_class_owner_name(&resolved_ty, class_names).unwrap_or(resolved_ty)
                    } else if let Some(field_ty) = field_types.get(owner_member) {
                        normalize_class_owner_name(field_ty, class_names)
                            .unwrap_or_else(|| field_ty.clone())
                    } else if let Some(path) = value_dotted_path(method, *object) {
                        path
                    } else {
                        return None;
                    }
                }
                _ => return None,
            };
            let resolved_owner = if owner_name == "System.out" || owner_name == "System.err" {
                normalize_class_owner_name("PrintStream", class_names)
                    .unwrap_or_else(|| "PrintStream".to_string())
            } else if let Some(normalized) = normalize_class_owner_name(&owner_name, class_names) {
                normalized
            } else if owner_name == "this" {
                current_class_name.to_string()
            } else if let Some(local_ty) = lookup_local_decl_type(method, &owner_name) {
                normalize_class_owner_name(&local_ty, class_names).unwrap_or(local_ty)
            } else if let Some(normalized) = normalize_class_owner_name(&owner_v.ty, class_names) {
                normalized
            } else if let Some(field_ty) = field_types.get(&owner_name) {
                normalize_class_owner_name(field_ty, class_names)
                    .unwrap_or_else(|| field_ty.clone())
            } else {
                owner_name
            };
            resolve_method_return_type_for_call(
                &resolved_owner,
                member,
                args,
                method,
                current_class_name,
                class_names,
                field_types,
                method_symbols_by_sig,
            )
        }
        _ => None,
    }
}

fn resolve_backend_runtime_value_type(
    method: &IrMethod,
    value_id: IrValueId,
    current_class_name: &str,
    class_names: &[String],
    local_types: &HashMap<String, String>,
    field_types: &HashMap<String, String>,
    method_symbols_by_sig: &HashMap<(String, String, Vec<String>), String>,
) -> Option<String> {
    let value = method.values.get(value_id as usize)?;
    if value.ty != "unknown" {
        return Some(value.ty.clone());
    }
    if let IrValueKind::LocalRef(name) = &value.kind {
        if let Some(local_ty) = local_types.get(name) {
            return Some(local_ty.clone());
        }
    }
    resolve_backend_call_value_type(
        method,
        value_id,
        current_class_name,
        class_names,
        field_types,
        method_symbols_by_sig,
    )
}

fn is_float_scalar_type_name(ty: &str) -> bool {
    matches!(normalize_type_token(ty).as_str(), "float" | "double")
}

fn is_double_scalar_type_name(ty: &str) -> bool {
    normalize_type_token(ty) == "double"
}

fn binary_uses_fp_math(method: &IrMethod, left: IrValueId, right: IrValueId) -> bool {
    let left_ty = primitive_cast_source_ty(method, left).unwrap_or_default();
    let right_ty = primitive_cast_source_ty(method, right).unwrap_or_default();
    is_float_scalar_type_name(&left_ty) || is_float_scalar_type_name(&right_ty)
}

fn binary_fp_result_is_float(method: &IrMethod, left: IrValueId, right: IrValueId) -> bool {
    let left_ty = primitive_cast_source_ty(method, left).unwrap_or_default();
    let right_ty = primitive_cast_source_ty(method, right).unwrap_or_default();
    !is_double_scalar_type_name(&left_ty)
        && !is_double_scalar_type_name(&right_ty)
        && (is_float_scalar_type_name(&left_ty) || is_float_scalar_type_name(&right_ty))
}

fn emit_int_rax_as_double_bits(out: &mut String, source_ty: &str) {
    match normalize_type_token(source_ty).as_str() {
        "byte" => {
            out.push_str("    movsx eax, al\n");
            out.push_str("    cvtsi2sd xmm0, eax\n");
        }
        "ubyte" => {
            out.push_str("    movzx eax, al\n");
            out.push_str("    cvtsi2sd xmm0, eax\n");
        }
        "short" => {
            out.push_str("    movsx eax, ax\n");
            out.push_str("    cvtsi2sd xmm0, eax\n");
        }
        "ushort" | "char" => {
            out.push_str("    movzx eax, ax\n");
            out.push_str("    cvtsi2sd xmm0, eax\n");
        }
        "int" => {
            out.push_str("    movsxd rax, eax\n");
            out.push_str("    cvtsi2sd xmm0, rax\n");
        }
        "uint" => {
            out.push_str("    and rax, 0FFFFFFFFh\n");
            out.push_str("    cvtsi2sd xmm0, rax\n");
        }
        "long" => {
            out.push_str("    cvtsi2sd xmm0, rax\n");
        }
        "ulong" => {
            out.push_str("    mov rdx, rax\n");
            out.push_str("    test rax, rax\n");
            out.push_str("    jns @F\n");
            out.push_str("    and edx, 1\n");
            out.push_str("    shr rax, 1\n");
            out.push_str("    or rax, rdx\n");
            out.push_str("    cvtsi2sd xmm0, rax\n");
            out.push_str("    addsd xmm0, xmm0\n");
            out.push_str("    jmp @F\n");
            out.push_str("@@:\n");
            out.push_str("    cvtsi2sd xmm0, rax\n");
            out.push_str("@@:\n");
        }
        _ => {
            out.push_str("    cvtsi2sd xmm0, rax\n");
        }
    }
}

fn emit_numeric_rax_as_fp_operand(out: &mut String, source_ty: &str) {
    if is_float_scalar_type_name(source_ty) {
        out.push_str("    movq xmm0, rax\n");
    } else {
        emit_int_rax_as_double_bits(out, source_ty);
    }
}

fn emit_round_fp_result_if_needed(out: &mut String, result_is_float: bool) {
    if result_is_float {
        out.push_str("    cvtsd2ss xmm0, xmm0\n");
        out.push_str("    cvtss2sd xmm0, xmm0\n");
    }
}

fn emit_fp_compare_to_bool(out: &mut String, op: &IrBinaryOp, label_seed: &str) {
    let unordered = format!("{}_unordered", label_seed);
    let done = format!("{}_done", label_seed);
    out.push_str("    ucomisd xmm0, xmm1\n");
    match op {
        IrBinaryOp::Eq => {
            out.push_str(&format!("    jp {}\n", unordered));
            out.push_str("    sete al\n");
        }
        IrBinaryOp::NotEq => {
            out.push_str(&format!("    jp {}\n", unordered));
            out.push_str("    setne al\n");
        }
        IrBinaryOp::Less => {
            out.push_str(&format!("    jp {}\n", unordered));
            out.push_str("    setb al\n");
        }
        IrBinaryOp::LessEq => {
            out.push_str(&format!("    jp {}\n", unordered));
            out.push_str("    setbe al\n");
        }
        IrBinaryOp::Greater => {
            out.push_str(&format!("    jp {}\n", unordered));
            out.push_str("    seta al\n");
        }
        IrBinaryOp::GreaterEq => {
            out.push_str(&format!("    jp {}\n", unordered));
            out.push_str("    setae al\n");
        }
        _ => unreachable!(),
    }
    out.push_str(&format!("    jmp {}\n", done));
    out.push_str(&format!("{}:\n", unordered));
    match op {
        IrBinaryOp::NotEq => out.push_str("    mov al, 1\n"),
        _ => out.push_str("    xor eax, eax\n"),
    }
    out.push_str(&format!("{}:\n", done));
    out.push_str("    movzx eax, al\n");
}

fn emit_post_fp_to_int_cast(out: &mut String, target_ty: &str) {
    match normalize_type_token(target_ty).as_str() {
        "byte" => out.push_str("    movsx eax, al\n"),
        "ubyte" => out.push_str("    movzx eax, al\n"),
        "short" => out.push_str("    movsx eax, ax\n"),
        "ushort" | "char" => out.push_str("    movzx eax, ax\n"),
        _ => {}
    }
}

fn emit_integral_cast(out: &mut String, source_ty: &str, target_ty: &str) {
    match normalize_type_token(target_ty).as_str() {
        "byte" => out.push_str("    movsx eax, al\n"),
        "ubyte" => out.push_str("    movzx eax, al\n"),
        "short" => out.push_str("    movsx eax, ax\n"),
        "ushort" | "char" => out.push_str("    movzx eax, ax\n"),
        "int" => match normalize_type_token(source_ty).as_str() {
            "byte" => out.push_str("    movsx eax, al\n"),
            "ubyte" => out.push_str("    movzx eax, al\n"),
            "short" => out.push_str("    movsx eax, ax\n"),
            "ushort" | "char" => out.push_str("    movzx eax, ax\n"),
            _ => {}
        },
        "uint" => match normalize_type_token(source_ty).as_str() {
            "byte" | "ubyte" => out.push_str("    movzx eax, al\n"),
            "short" | "ushort" | "char" => out.push_str("    movzx eax, ax\n"),
            _ => out.push_str("    and rax, 0FFFFFFFFh\n"),
        },
        "long" => match normalize_type_token(source_ty).as_str() {
            "byte" => {
                out.push_str("    movsx eax, al\n");
                out.push_str("    movsxd rax, eax\n");
            }
            "ubyte" => out.push_str("    movzx eax, al\n"),
            "short" => {
                out.push_str("    movsx eax, ax\n");
                out.push_str("    movsxd rax, eax\n");
            }
            "ushort" | "char" => out.push_str("    movzx eax, ax\n"),
            "int" => out.push_str("    movsxd rax, eax\n"),
            "uint" => out.push_str("    and rax, 0FFFFFFFFh\n"),
            _ => {}
        },
        "ulong" => match normalize_type_token(source_ty).as_str() {
            "byte" | "ubyte" => out.push_str("    movzx eax, al\n"),
            "short" | "ushort" | "char" => out.push_str("    movzx eax, ax\n"),
            "int" | "uint" => out.push_str("    and rax, 0FFFFFFFFh\n"),
            _ => {}
        },
        _ => {}
    }
}

fn emit_runtime_numeric_coercion(
    out: &mut String,
    source_ty: &str,
    target_ty: &str,
    method: &IrMethod,
    current_class_name: &str,
    class_names: &[String],
    field_types: &HashMap<String, String>,
    method_symbols: &HashMap<(String, String), String>,
    method_symbols_by_sig: &HashMap<(String, String, Vec<String>), String>,
) -> Result<(), String> {
    let mut source_ty = normalize_type_token(source_ty);
    let target_ty = normalize_type_token(target_ty);
    if is_wrapper_type_name(&source_ty) && is_primitive_type_name(&target_ty) {
        emit_wrapper_unbox_call(
            out,
            &source_ty,
            method,
            current_class_name,
            class_names,
            field_types,
            method_symbols,
            method_symbols_by_sig,
        )?;
        source_ty = wrapper_primitive_type_name(&source_ty)
            .expect("wrapper primitive type")
            .to_string();
    }
    if source_ty == target_ty {
        return Ok(());
    }
    if is_float_scalar_type_name(&source_ty) {
        match target_ty.as_str() {
            "float" => {
                out.push_str("    movq xmm0, rax\n");
                out.push_str("    cvtsd2ss xmm0, xmm0\n");
                out.push_str("    cvtss2sd xmm0, xmm0\n");
                out.push_str("    movq rax, xmm0\n");
            }
            "double" => {}
            "long" | "ulong" => {
                out.push_str("    mov rcx, rax\n");
                out.push_str("    call pulsec_rt_fpToLong\n");
            }
            "byte" | "ubyte" | "short" | "ushort" | "int" | "uint" | "char" => {
                out.push_str("    mov rcx, rax\n");
                out.push_str("    call pulsec_rt_fpToInt\n");
                emit_post_fp_to_int_cast(out, &target_ty);
            }
            _ => {}
        }
        return Ok(());
    }
    if is_float_scalar_type_name(&target_ty) {
        emit_numeric_rax_as_fp_operand(out, &source_ty);
        emit_round_fp_result_if_needed(out, target_ty == "float");
        out.push_str("    movq rax, xmm0\n");
        return Ok(());
    }
    emit_integral_cast(out, &source_ty, &target_ty);
    Ok(())
}

fn backend_signed_rank(ty: &str) -> Option<u8> {
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

fn backend_unsigned_rank(ty: &str) -> Option<u8> {
    match normalize_type_token(ty).as_str() {
        "ubyte" => Some(1),
        "ushort" => Some(2),
        "uint" => Some(3),
        "ulong" => Some(4),
        _ => None,
    }
}

fn backend_signed_widen_target_for_unsigned(actual: &str) -> Option<&'static str> {
    match normalize_type_token(actual).as_str() {
        "ubyte" => Some("short"),
        "ushort" => Some("int"),
        "uint" => Some("long"),
        "ulong" => Some("float"),
        _ => None,
    }
}

fn backend_unsigned_widen_target_for_signed(actual: &str) -> Option<&'static str> {
    match normalize_type_token(actual).as_str() {
        "char" => Some("ushort"),
        _ => None,
    }
}

fn backend_numeric_widening_allowed(expected: &str, actual: &str) -> bool {
    let expected = normalize_type_token(expected);
    let actual = normalize_type_token(actual);
    if expected == actual {
        return true;
    }
    match (backend_signed_rank(&expected), backend_signed_rank(&actual)) {
        (Some(expected_rank), Some(actual_rank)) => return actual_rank <= expected_rank,
        _ => {}
    }
    match (
        backend_unsigned_rank(&expected),
        backend_unsigned_rank(&actual),
    ) {
        (Some(expected_rank), Some(actual_rank)) => actual_rank <= expected_rank,
        _ => {
            if let Some(min_expected) = backend_signed_widen_target_for_unsigned(&actual) {
                if let (Some(expected_rank), Some(min_rank)) = (
                    backend_signed_rank(&expected),
                    backend_signed_rank(min_expected),
                ) {
                    return expected_rank >= min_rank;
                }
            }
            if let Some(min_expected) = backend_unsigned_widen_target_for_signed(&actual) {
                if let (Some(expected_rank), Some(min_rank)) = (
                    backend_unsigned_rank(&expected),
                    backend_unsigned_rank(min_expected),
                ) {
                    return expected_rank >= min_rank;
                }
            }
            false
        }
    }
}

fn backend_conversion_score(expected: &str, actual: &str) -> Option<u16> {
    let expected = normalize_type_token(expected);
    let actual = normalize_type_token(actual);
    if expected == actual {
        return Some(0);
    }
    if backend_numeric_widening_allowed(&expected, &actual) {
        return Some(1);
    }
    if let Some(score) = backend_reference_conversion_score(&expected, &actual) {
        return Some(score);
    }
    None
}

fn backend_reference_conversion_score(expected: &str, actual: &str) -> Option<u16> {
    if expected == "null" {
        return None;
    }
    if actual == "null" {
        return if is_primitive_type_name(expected) {
            None
        } else {
            Some(6)
        };
    }
    if is_primitive_type_name(expected) || is_primitive_type_name(actual) {
        return None;
    }
    if expected == "Object" {
        return Some(4);
    }
    if actual == "Object" {
        return None;
    }
    if type_assignable_to_backend(actual, expected) {
        return Some(3);
    }
    None
}

fn type_assignable_to_backend(actual: &str, expected: &str) -> bool {
    if actual == expected {
        return true;
    }
    if expected == "Object" && !is_primitive_type_name(actual) {
        return true;
    }
    if actual.ends_with("Arr") {
        return expected == "Object";
    }
    if interfaces_of_type(actual)
        .iter()
        .any(|iface| iface == expected)
    {
        return true;
    }
    let mut current = actual.to_string();
    while let Some(parent) = class_super_of(&current) {
        if parent == expected {
            return true;
        }
        current = parent;
    }
    false
}

fn lowered_assignment_target_matches_rhs(
    method: &IrMethod,
    rhs_value: IrValueId,
    target_ty: &str,
    current_class_name: &str,
    class_names: &[String],
    local_types: &HashMap<String, String>,
    field_types: &HashMap<String, String>,
    method_symbols_by_sig: &HashMap<(String, String, Vec<String>), String>,
) -> bool {
    if target_ty == "unknown" {
        return false;
    }
    if normalize_type_token(target_ty) == "long"
        && value_is_raw_runtime_handle(
            method,
            rhs_value,
            current_class_name,
            class_names,
            local_types,
            field_types,
        )
    {
        return true;
    }
    if is_wrapper_type_name(target_ty)
        && wrapper_value_is_boxed_object(
            method,
            rhs_value,
            current_class_name,
            class_names,
            local_types,
            field_types,
            method_symbols_by_sig,
        )
    {
        return true;
    }
    let Some(rhs_ty) = resolve_backend_runtime_value_type(
        method,
        rhs_value,
        current_class_name,
        class_names,
        local_types,
        field_types,
        method_symbols_by_sig,
    ) else {
        return false;
    };
    if rhs_ty == "void" || rhs_ty == "unknown" {
        return false;
    }
    let normalized_target = normalize_type_token(target_ty);
    let normalized_rhs = normalize_type_token(&rhs_ty);
    type_assignable_to_backend(&normalized_rhs, &normalized_target)
}

fn split_owner_package_and_class(candidate: &str) -> Option<(String, String)> {
    let raw = candidate.split('<').next().unwrap_or(candidate);
    let raw = raw.strip_suffix("[]").unwrap_or(raw);
    let idx = raw.rfind('.')?;
    let package = raw[..idx].to_string();
    let class_name = raw[idx + 1..].to_string();
    if package.is_empty() || class_name.is_empty() {
        return None;
    }
    Some((package, class_name))
}

fn resolve_class_owner_from_short_name(
    candidate: &str,
    current_package_name: &str,
    class_names: &[String],
) -> Option<(String, String)> {
    if let Some(owner) = class_package_owner_of(candidate) {
        return Some(owner);
    }
    let same_package = format!("{}.{}", current_package_name, candidate);
    if class_names.iter().any(|name| name == &same_package) {
        return Some((current_package_name.to_string(), candidate.to_string()));
    }
    let mut matches = class_names.iter().filter_map(|name| {
        name.strip_suffix(&format!(".{}", candidate))
            .map(|package| (package.to_string(), candidate.to_string()))
    });
    let first = matches.next()?;
    if matches.next().is_none() {
        Some(first)
    } else {
        None
    }
}

fn resolve_static_field_owner(
    method: &IrMethod,
    owner_value_id: IrValueId,
    current_package_name: &str,
    current_class_name: &str,
    local_types: &HashMap<String, String>,
    class_names: &[String],
) -> Option<(String, String)> {
    let owner_value = method.values.get(owner_value_id as usize)?;
    if let Some((package, class_name)) = split_owner_package_and_class(&owner_value.ty) {
        return Some((package, class_name));
    }
    match &owner_value.kind {
        IrValueKind::LocalRef(name) => {
            if name == current_class_name {
                return Some((
                    current_package_name.to_string(),
                    current_class_name.to_string(),
                ));
            }
            if let Some(owner) =
                resolve_class_owner_from_short_name(name, current_package_name, class_names)
            {
                return Some(owner);
            }
            if let Some(ty) = local_types.get(name) {
                if let Some((package, class_name)) = split_owner_package_and_class(ty) {
                    return Some((package, class_name));
                }
                if let Some(owner) =
                    resolve_class_owner_from_short_name(ty, current_package_name, class_names)
                {
                    return Some(owner);
                }
            } else if name
                .chars()
                .next()
                .map(|ch| ch.is_ascii_uppercase())
                .unwrap_or(false)
            {
                return Some((current_package_name.to_string(), name.clone()));
            }
            None
        }
        IrValueKind::MemberAccess { .. } => {
            let path = value_dotted_path(method, owner_value_id)?;
            split_owner_package_and_class(&path)
        }
        _ => None,
    }
}

fn collect_local_types_for_method(method: &IrMethod) -> HashMap<String, String> {
    let mut out = HashMap::new();
    for param in &method.params {
        out.insert(param.name.clone(), param.ty.clone());
    }
    for block in &method.blocks {
        for instr in &block.instructions {
            if let IrInstr::DeclareLocal { name, ty, .. } = instr {
                out.entry(name.clone()).or_insert_with(|| ty.clone());
            }
        }
    }
    out
}

fn resolve_member_access_value_type(
    method: &IrMethod,
    value_id: IrValueId,
    current_class_name: &str,
    class_names: &[String],
    field_types: &HashMap<String, String>,
    method_symbols_by_sig: &HashMap<(String, String, Vec<String>), String>,
) -> Option<String> {
    let value = method.values.get(value_id as usize)?;
    let IrValueKind::MemberAccess { object, member } = &value.kind else {
        return None;
    };

    let current_package_name = class_package_owner_of(current_class_name)
        .map(|(package, _)| package)
        .unwrap_or_default();
    let local_types = collect_local_types_for_method(method);

    if let Some((owner_package, owner_class)) = resolve_static_field_owner(
        method,
        *object,
        &current_package_name,
        current_class_name,
        &local_types,
        class_names,
    ) {
        if owner_package == current_package_name && owner_class == current_class_name {
            if let Some(field_ty) = field_types.get(member) {
                return Some(field_ty.clone());
            }
        }
        if let Some(field_ty) = field_type_of(&owner_package, &owner_class, member) {
            return Some(field_ty);
        }
    }

    let owner_value = method.values.get(*object as usize)?;
    let owner_ty = match &owner_value.kind {
        IrValueKind::ThisRef => Some(current_class_name.to_string()),
        IrValueKind::SuperRef => class_super_of(current_class_name),
        IrValueKind::LocalRef(name) => lookup_local_decl_type(method, name)
            .map(|ty| normalize_class_owner_name(&ty, class_names).unwrap_or(ty)),
        IrValueKind::NewObject { class_name, .. } => Some(
            normalize_class_owner_name(class_name, class_names)
                .unwrap_or_else(|| class_name.clone()),
        ),
        IrValueKind::Call { .. } => backend_resolution_arg_type(
            method,
            *object,
            current_class_name,
            class_names,
            field_types,
            method_symbols_by_sig,
        )
        .map(|ty| normalize_class_owner_name(&ty, class_names).unwrap_or(ty)),
        IrValueKind::MemberAccess { .. } => resolve_member_access_value_type(
            method,
            *object,
            current_class_name,
            class_names,
            field_types,
            method_symbols_by_sig,
        )
        .map(|ty| normalize_class_owner_name(&ty, class_names).unwrap_or(ty)),
        _ => None,
    }?;

    let (owner_package, owner_class) = class_package_owner_of(&owner_ty)?;
    if owner_package == current_package_name && owner_class == current_class_name {
        return field_types.get(member).cloned();
    }
    field_type_of(&owner_package, &owner_class, member)
}

fn value_is_call_callee(method: &IrMethod, value_id: IrValueId) -> bool {
    method.values.iter().any(|value| {
        matches!(
            value.kind,
            IrValueKind::Call { callee, .. } if callee == value_id
        )
    })
}

fn resolve_member_access_owner_name(
    method: &IrMethod,
    owner_value_id: IrValueId,
    current_class_name: &str,
    class_names: &[String],
    field_types: &HashMap<String, String>,
    local_types: &HashMap<String, String>,
) -> Option<String> {
    let owner_v = method.values.get(owner_value_id as usize)?;
    match &owner_v.kind {
        IrValueKind::StringLiteral(_) => Some("String".to_string()),
        IrValueKind::ThisRef => Some(current_class_name.to_string()),
        IrValueKind::SuperRef => Some(
            class_super_of(current_class_name).unwrap_or_else(|| current_class_name.to_string()),
        ),
        IrValueKind::LocalRef(name) => {
            if let Some(ty) = local_types.get(name) {
                normalize_class_owner_name(ty, class_names).or_else(|| Some(ty.clone()))
            } else {
                normalize_class_owner_name(&owner_v.ty, class_names)
            }
        }
        IrValueKind::NewObject { class_name, .. } => Some(class_name.clone()),
        IrValueKind::MemberAccess {
            object: owner_object,
            member: owner_member,
        } => {
            if let Some(normalized) = normalize_class_owner_name(&owner_v.ty, class_names) {
                Some(normalized)
            } else if let Some(field_ty) = field_types.get(owner_member) {
                normalize_class_owner_name(field_ty, class_names).or_else(|| Some(field_ty.clone()))
            } else {
                value_dotted_path(method, *owner_object)
            }
        }
        _ => normalize_class_owner_name(&owner_v.ty, class_names),
    }
}

fn compatible_backend_signature(
    owner: &str,
    member: &str,
    arg_types: &[String],
    method_symbols_by_sig: &HashMap<(String, String, Vec<String>), String>,
) -> Option<(Vec<String>, String)> {
    let mut best_score: Option<u16> = None;
    let mut best: Vec<(Vec<String>, String)> = Vec::new();
    for ((o, m, sig), sym) in method_symbols_by_sig {
        if o != owner || m != member {
            continue;
        }
        let is_varargs = method_is_varargs(o, m, sig);
        let Some(total) = backend_signature_match_score(sig, is_varargs, arg_types) else {
            continue;
        };
        match best_score {
            None => {
                best_score = Some(total);
                best.clear();
                best.push((sig.clone(), sym.clone()));
            }
            Some(existing) if total < existing => {
                best_score = Some(total);
                best.clear();
                best.push((sig.clone(), sym.clone()));
            }
            Some(existing) if total == existing => best.push((sig.clone(), sym.clone())),
            Some(_) => {}
        }
    }
    if best.len() == 1 {
        return best.into_iter().next();
    }
    None
}

fn backend_signature_match_score(
    expected: &[String],
    is_varargs: bool,
    actual: &[String],
) -> Option<u16> {
    if !is_varargs {
        if expected.len() != actual.len() {
            return None;
        }
    } else if actual.len() < expected.len().saturating_sub(1) {
        return None;
    }

    let mut total = 0u16;
    let fixed_count = if is_varargs {
        expected.len().saturating_sub(1)
    } else {
        expected.len()
    };
    for (expected_ty, actual_ty) in expected
        .iter()
        .take(fixed_count)
        .zip(actual.iter().take(fixed_count))
    {
        let score = backend_conversion_score(expected_ty, actual_ty)?;
        total = total.saturating_add(score);
    }
    if is_varargs {
        let vararg_array_ty = expected.last()?;
        let vararg_element_ty = vararg_array_ty
            .strip_suffix("[]")
            .unwrap_or(vararg_array_ty);
        let remaining = &actual[fixed_count..];
        if remaining.is_empty() {
            total = total.saturating_add(4);
        } else if remaining.len() == 1
            && backend_conversion_score(vararg_array_ty, &remaining[0]).is_some()
        {
            total = total.saturating_add(3);
        } else {
            total = total.saturating_add(5);
            for actual_ty in remaining {
                total =
                    total.saturating_add(backend_conversion_score(vararg_element_ty, actual_ty)?);
            }
        }
    }
    Some(total)
}

fn uses_qword_integer_math(ty: &str) -> bool {
    matches!(normalize_type_token(ty).as_str(), "long" | "ulong")
}

fn uses_unsigned_integer_math(ty: &str) -> bool {
    matches!(
        normalize_type_token(ty).as_str(),
        "ubyte" | "ushort" | "uint" | "ulong"
    )
}

fn binary_exec_mode(method: &IrMethod, left: IrValueId, right: IrValueId) -> (bool, bool) {
    let left_ty = primitive_cast_source_ty(method, left).unwrap_or_default();
    let right_ty = primitive_cast_source_ty(method, right).unwrap_or_default();
    let uses_qword = uses_qword_integer_math(&left_ty)
        || uses_qword_integer_math(&right_ty)
        || is_handle_type_name(&left_ty)
        || is_handle_type_name(&right_ty);
    let uses_unsigned =
        uses_unsigned_integer_math(&left_ty) || uses_unsigned_integer_math(&right_ty);
    (uses_qword, uses_unsigned)
}

#[allow(clippy::too_many_arguments)]
pub(crate) fn emit_call_args_with_arc_boundary(
    out: &mut String,
    method: &IrMethod,
    args: &[IrValueId],
    arg_reg_base: usize,
    current_method_is_static: bool,
    current_package_name: &str,
    current_class_name: &str,
    method_symbols: &HashMap<(String, String), String>,
    method_staticness: &HashMap<(String, String), bool>,
    method_symbols_by_sig: &HashMap<(String, String, Vec<String>), String>,
    method_staticness_by_sig: &HashMap<(String, String, Vec<String>), bool>,
    stdlib_symbols: &HashMap<(String, String), String>,
    class_names: &[String],
    field_symbols: &HashMap<String, String>,
    field_is_static: &HashMap<String, bool>,
    field_types: &HashMap<String, String>,
    class_object_counter_symbol: &str,
    local_types: &HashMap<String, String>,
    expected_types: Option<&[String]>,
    expected_is_varargs: bool,
    local_offsets: &HashMap<String, usize>,
    param_offsets: &HashMap<String, usize>,
    string_literals: &mut Vec<String>,
) -> Result<Vec<bool>, String> {
    let mut arc_flags = Vec::new();
    let mut use_64bit_arg = Vec::new();
    let fixed_count = if expected_is_varargs {
        expected_types
            .map(|types| types.len().saturating_sub(1))
            .unwrap_or(args.len())
    } else {
        args.len()
    };
    let direct_vararg_array_pass = if expected_is_varargs {
        if let Some(types) = expected_types {
            if args.len() == types.len() && !types.is_empty() {
                let last_arg_ty = value_declared_type(
                    method,
                    args[types.len() - 1],
                    local_types,
                    field_types,
                    current_class_name,
                )
                .map(|ty| normalize_type_token(&ty));
                last_arg_ty
                    .as_deref()
                    .map(|ty| ty == types[types.len() - 1])
                    .unwrap_or(false)
            } else {
                false
            }
        } else {
            false
        }
    } else {
        false
    };
    let emitted_arg_count = if expected_is_varargs && !direct_vararg_array_pass {
        expected_types
            .map(|types| types.len())
            .unwrap_or(args.len())
    } else {
        args.len()
    };

    for idx in 0..fixed_count.min(args.len()) {
        let arg_id = args[idx];
        let arg_ty = backend_resolution_arg_type(
            method,
            arg_id,
            current_class_name,
            class_names,
            field_types,
            method_symbols_by_sig,
        )
        .or_else(|| {
            value_declared_type(method, arg_id, local_types, field_types, current_class_name)
                .map(|ty| normalize_type_token(&ty))
        });
        let expected_ty = expected_types.and_then(|types| types.get(idx)).cloned();
        let wrapper_is_boxed_object = matches!(
            (arg_ty.as_deref(), expected_ty.as_deref()),
            (Some(source_ty), Some("Object"))
                if is_wrapper_type_name(source_ty)
                    && wrapper_value_is_boxed_object(
                        method,
                        arg_id,
                        current_class_name,
                        class_names,
                        local_types,
                        field_types,
                        method_symbols_by_sig,
                    )
        );
        let wrapper_boxes_to_object = matches!(
            (arg_ty.as_deref(), expected_ty.as_deref()),
            (Some(source_ty), Some("Object"))
                if is_wrapper_type_name(source_ty) && !wrapper_is_boxed_object
        );
        let primitive_boxes_to_object = matches!(
            (arg_ty.as_deref(), expected_ty.as_deref()),
            (Some(source_ty), Some("Object"))
                if primitive_wrapper_type_name(source_ty).is_some()
        );
        let primitive_boxes_to_wrapper = matches!(
            (arg_ty.as_deref(), expected_ty.as_deref()),
            (Some(source_ty), Some(target_ty))
                if is_primitive_type_name(source_ty) && is_wrapper_type_name(target_ty)
        );
        let call_result_is_arc_by_value_type = matches!(
            method.values.get(arg_id as usize),
            Some(value)
                if matches!(value.kind, IrValueKind::Call { .. })
                    && is_arc_managed_type_name(&value.ty)
        );
        let expected_arc_arg = expected_ty
            .as_deref()
            .map(is_arc_managed_type_name)
            .unwrap_or(false);
        let is_arc_arg = wrapper_is_boxed_object
            || wrapper_boxes_to_object
            || primitive_boxes_to_object
            || primitive_boxes_to_wrapper
            || call_result_is_arc_by_value_type
            || expected_arc_arg
            || value_is_arc_managed(method, arg_id, local_types, field_types, current_class_name)
            || value_is_raw_runtime_handle(
                method,
                arg_id,
                current_class_name,
                class_names,
                local_types,
                field_types,
            );
        let use_64 = is_arc_arg
            || expected_ty
                .as_deref()
                .map(|ty| is_handle_type_name(ty) || uses_qword_scalar_type_name(ty))
                .or_else(|| {
                    arg_ty
                        .as_deref()
                        .map(|ty| is_handle_type_name(ty) || uses_qword_scalar_type_name(ty))
                })
                .unwrap_or(false);
        let call_arg_needs_early_retain = is_arc_arg
            && matches!(
                method.values.get(arg_id as usize).map(|value| &value.kind),
                Some(IrValueKind::Call { .. })
            );
        emit_preserve_nested_arg_spills(out, method, idx);
        with_nested_arg_preserve_depth(|| {
            emit_value_to_eax_masm(
                out,
                method,
                arg_id,
                current_method_is_static,
                current_package_name,
                current_class_name,
                method_symbols,
                method_staticness,
                method_symbols_by_sig,
                method_staticness_by_sig,
                stdlib_symbols,
                class_names,
                field_symbols,
                field_is_static,
                field_types,
                class_object_counter_symbol,
                local_offsets,
                param_offsets,
                string_literals,
            )
        })?;
        emit_restore_nested_arg_spills_preserving_rax(out, method, idx);
        if let (Some(source_ty), Some(expected_ty)) = (arg_ty.as_deref(), expected_ty.as_deref()) {
            if expected_ty == "Object" && is_wrapper_type_name(source_ty) {
                if !wrapper_is_boxed_object {
                    emit_wrapper_box_call(
                        out,
                        source_ty,
                        wrapper_primitive_type_name(source_ty).unwrap(),
                        method,
                        current_class_name,
                        class_names,
                        field_types,
                        method_symbols,
                        method_symbols_by_sig,
                    )?;
                }
            } else if expected_ty == "Object" {
                if let Some(wrapper_ty) = primitive_wrapper_type_name(source_ty) {
                    emit_wrapper_box_call(
                        out,
                        wrapper_ty,
                        source_ty,
                        method,
                        current_class_name,
                        class_names,
                        field_types,
                        method_symbols,
                        method_symbols_by_sig,
                    )?;
                }
            } else if is_wrapper_type_name(expected_ty) && is_primitive_type_name(source_ty) {
                let primitive_target =
                    wrapper_primitive_type_name(expected_ty).expect("wrapper primitive type");
                emit_runtime_numeric_coercion(
                    out,
                    source_ty,
                    primitive_target,
                    method,
                    current_class_name,
                    class_names,
                    field_types,
                    method_symbols,
                    method_symbols_by_sig,
                )?;
                emit_wrapper_box_call(
                    out,
                    expected_ty,
                    primitive_target,
                    method,
                    current_class_name,
                    class_names,
                    field_types,
                    method_symbols,
                    method_symbols_by_sig,
                )?;
            } else {
                emit_runtime_numeric_coercion(
                    out,
                    source_ty,
                    expected_ty,
                    method,
                    current_class_name,
                    class_names,
                    field_types,
                    method_symbols,
                    method_symbols_by_sig,
                )?;
            }
        }
        if call_arg_needs_early_retain {
            emit_arc_retain_from_eax(out);
        }
        let spill_offset = arc_arg_spill_offset(method, idx);
        if use_64 {
            out.push_str(&format!("    mov qword ptr [rsp+{}], rax\n", spill_offset));
        } else {
            out.push_str("    and rax, 0FFFFFFFFh\n");
            out.push_str(&format!("    mov qword ptr [rsp+{}], rax\n", spill_offset));
        }
        if is_arc_arg && !call_arg_needs_early_retain {
            emit_arc_retain_from_eax(out);
            if use_64 {
                out.push_str(&format!("    mov rax, qword ptr [rsp+{}]\n", spill_offset));
            } else {
                out.push_str(&format!("    mov eax, dword ptr [rsp+{}]\n", spill_offset));
            }
        }
        arc_flags.push(is_arc_arg);
        use_64bit_arg.push(use_64);
    }

    if expected_is_varargs && !direct_vararg_array_pass {
        let expected_types =
            expected_types.ok_or_else(|| "Missing expected varargs signature".to_string())?;
        let vararg_array_ty = expected_types
            .last()
            .cloned()
            .ok_or_else(|| "Missing varargs array type".to_string())?;
        let vararg_element_ty = vararg_array_ty
            .strip_suffix("[]")
            .unwrap_or(vararg_array_ty.as_str())
            .to_string();
        let vararg_idx = fixed_count;
        let spill_offset = arc_arg_spill_offset(method, vararg_idx);
        let trailing = args.len().saturating_sub(fixed_count);
        out.push_str(&format!("    mov ecx, {}\n", trailing));
        out.push_str("    call pulsec_rt_arrayNew\n");
        out.push_str(&format!("    mov qword ptr [rsp+{}], rax\n", spill_offset));
        let uses_int_lane = native_array_uses_int_lane(&vararg_element_ty);
        let uses_qword_lane = native_array_uses_qword_scalar_lane(&vararg_element_ty);
        let set_symbol = if uses_int_lane {
            "pulsec_rt_arraySetInt"
        } else if uses_qword_lane {
            "pulsec_rt_arraySetLong"
        } else {
            "pulsec_rt_arraySetString"
        };
        for (item_idx, arg_id) in args.iter().skip(fixed_count).enumerate() {
            out.push_str(&format!("    mov rcx, qword ptr [rsp+{}]\n", spill_offset));
            out.push_str(&format!("    mov edx, {}\n", item_idx));
            let arg_ty = value_declared_type(
                method,
                *arg_id,
                local_types,
                field_types,
                current_class_name,
            )
            .map(|ty| normalize_type_token(&ty));
            let arg_ty = backend_resolution_arg_type(
                method,
                *arg_id,
                current_class_name,
                class_names,
                field_types,
                method_symbols_by_sig,
            )
            .or(arg_ty);
            emit_preserve_nested_arg_spills(out, method, fixed_count + 1);
            with_nested_arg_preserve_depth(|| {
                emit_value_to_eax_masm(
                    out,
                    method,
                    *arg_id,
                    current_method_is_static,
                    current_package_name,
                    current_class_name,
                    method_symbols,
                    method_staticness,
                    method_symbols_by_sig,
                    method_staticness_by_sig,
                    stdlib_symbols,
                    class_names,
                    field_symbols,
                    field_is_static,
                    field_types,
                    class_object_counter_symbol,
                    local_offsets,
                    param_offsets,
                    string_literals,
                )
            })?;
            emit_restore_nested_arg_spills_preserving_rax(out, method, fixed_count + 1);
            if let Some(source_ty) = arg_ty.as_deref() {
                emit_runtime_numeric_coercion(
                    out,
                    source_ty,
                    &vararg_element_ty,
                    method,
                    current_class_name,
                    class_names,
                    field_types,
                    method_symbols,
                    method_symbols_by_sig,
                )?;
            }
            if uses_int_lane {
                out.push_str("    mov r8d, eax\n");
            } else {
                out.push_str("    mov r8, rax\n");
            }
            out.push_str(&format!("    call {}\n", set_symbol));
        }
        arc_flags.push(true);
        use_64bit_arg.push(true);
    } else {
        for idx in fixed_count..args.len() {
            let arg_id = args[idx];
            let arg_ty = backend_resolution_arg_type(
                method,
                arg_id,
                current_class_name,
                class_names,
                field_types,
                method_symbols_by_sig,
            )
            .or_else(|| {
                value_declared_type(method, arg_id, local_types, field_types, current_class_name)
                    .map(|ty| normalize_type_token(&ty))
            });
            let expected_ty = expected_types.and_then(|types| types.get(idx)).cloned();
            let wrapper_is_boxed_object = matches!(
                (arg_ty.as_deref(), expected_ty.as_deref()),
                (Some(source_ty), Some("Object"))
                    if is_wrapper_type_name(source_ty)
                        && wrapper_value_is_boxed_object(
                            method,
                            arg_id,
                            current_class_name,
                            class_names,
                            local_types,
                            field_types,
                            method_symbols_by_sig,
                        )
            );
            let wrapper_boxes_to_object = matches!(
                (arg_ty.as_deref(), expected_ty.as_deref()),
                (Some(source_ty), Some("Object"))
                    if is_wrapper_type_name(source_ty) && !wrapper_is_boxed_object
            );
            let primitive_boxes_to_object = matches!(
                (arg_ty.as_deref(), expected_ty.as_deref()),
                (Some(source_ty), Some("Object"))
                    if primitive_wrapper_type_name(source_ty).is_some()
            );
            let primitive_boxes_to_wrapper = matches!(
                (arg_ty.as_deref(), expected_ty.as_deref()),
                (Some(source_ty), Some(target_ty))
                    if is_primitive_type_name(source_ty) && is_wrapper_type_name(target_ty)
            );
            let call_result_is_arc_by_value_type = matches!(
                method.values.get(arg_id as usize),
                Some(value)
                    if matches!(value.kind, IrValueKind::Call { .. })
                        && is_arc_managed_type_name(&value.ty)
            );
            let expected_arc_arg = expected_ty
                .as_deref()
                .map(is_arc_managed_type_name)
                .unwrap_or(false);
            let is_arc_arg = wrapper_is_boxed_object
                || wrapper_boxes_to_object
                || primitive_boxes_to_object
                || primitive_boxes_to_wrapper
                || call_result_is_arc_by_value_type
                || expected_arc_arg
                || value_is_arc_managed(
                    method,
                    arg_id,
                    local_types,
                    field_types,
                    current_class_name,
                );
            let use_64 = is_arc_arg
                || expected_ty
                    .as_deref()
                    .map(|ty| is_handle_type_name(ty) || uses_qword_scalar_type_name(ty))
                    .or_else(|| {
                        arg_ty
                            .as_deref()
                            .map(|ty| is_handle_type_name(ty) || uses_qword_scalar_type_name(ty))
                    })
                    .unwrap_or(false);
            let call_arg_needs_early_retain = is_arc_arg
                && matches!(
                    method.values.get(arg_id as usize).map(|value| &value.kind),
                    Some(IrValueKind::Call { .. })
                );
            emit_preserve_nested_arg_spills(out, method, idx);
            with_nested_arg_preserve_depth(|| {
                emit_value_to_eax_masm(
                    out,
                    method,
                    arg_id,
                    current_method_is_static,
                    current_package_name,
                    current_class_name,
                    method_symbols,
                    method_staticness,
                    method_symbols_by_sig,
                    method_staticness_by_sig,
                    stdlib_symbols,
                    class_names,
                    field_symbols,
                    field_is_static,
                    field_types,
                    class_object_counter_symbol,
                    local_offsets,
                    param_offsets,
                    string_literals,
                )
            })?;
            emit_restore_nested_arg_spills_preserving_rax(out, method, idx);
            if let (Some(source_ty), Some(expected_ty)) =
                (arg_ty.as_deref(), expected_ty.as_deref())
            {
                if expected_ty == "Object" && is_wrapper_type_name(source_ty) {
                    if !wrapper_is_boxed_object {
                        emit_wrapper_box_call(
                            out,
                            source_ty,
                            wrapper_primitive_type_name(source_ty).unwrap(),
                            method,
                            current_class_name,
                            class_names,
                            field_types,
                            method_symbols,
                            method_symbols_by_sig,
                        )?;
                    }
                } else if expected_ty == "Object" {
                    if let Some(wrapper_ty) = primitive_wrapper_type_name(source_ty) {
                        emit_wrapper_box_call(
                            out,
                            wrapper_ty,
                            source_ty,
                            method,
                            current_class_name,
                            class_names,
                            field_types,
                            method_symbols,
                            method_symbols_by_sig,
                        )?;
                    }
                } else if is_wrapper_type_name(expected_ty) && is_primitive_type_name(source_ty) {
                    let primitive_target =
                        wrapper_primitive_type_name(expected_ty).expect("wrapper primitive type");
                    emit_runtime_numeric_coercion(
                        out,
                        source_ty,
                        primitive_target,
                        method,
                        current_class_name,
                        class_names,
                        field_types,
                        method_symbols,
                        method_symbols_by_sig,
                    )?;
                    emit_wrapper_box_call(
                        out,
                        expected_ty,
                        primitive_target,
                        method,
                        current_class_name,
                        class_names,
                        field_types,
                        method_symbols,
                        method_symbols_by_sig,
                    )?;
                } else {
                    emit_runtime_numeric_coercion(
                        out,
                        source_ty,
                        expected_ty,
                        method,
                        current_class_name,
                        class_names,
                        field_types,
                        method_symbols,
                        method_symbols_by_sig,
                    )?;
                }
            }
            if call_arg_needs_early_retain {
                emit_arc_retain_from_eax(out);
            }
            let spill_offset = arc_arg_spill_offset(method, idx);
            if use_64 {
                out.push_str(&format!("    mov qword ptr [rsp+{}], rax\n", spill_offset));
            } else {
                out.push_str("    and rax, 0FFFFFFFFh\n");
                out.push_str(&format!("    mov qword ptr [rsp+{}], rax\n", spill_offset));
            }
            if is_arc_arg && !call_arg_needs_early_retain {
                emit_arc_retain_from_eax(out);
                if use_64 {
                    out.push_str(&format!("    mov rax, qword ptr [rsp+{}]\n", spill_offset));
                } else {
                    out.push_str(&format!("    mov eax, dword ptr [rsp+{}]\n", spill_offset));
                }
            }
            arc_flags.push(is_arc_arg);
            use_64bit_arg.push(use_64);
        }
    }
    let reg_arg_limit = 4usize.saturating_sub(arg_reg_base);
    for idx in 0..emitted_arg_count {
        let spill_offset = arc_arg_spill_offset(method, idx);
        if idx < reg_arg_limit {
            if use_64bit_arg[idx] {
                out.push_str(&format!("    mov rax, qword ptr [rsp+{}]\n", spill_offset));
                out.push_str(&format!(
                    "    mov {}, rax\n",
                    arg_register64(arg_reg_base + idx)
                ));
            } else {
                out.push_str(&format!("    mov eax, dword ptr [rsp+{}]\n", spill_offset));
                out.push_str(&format!(
                    "    mov {}, eax\n",
                    arg_register32(arg_reg_base + idx)
                ));
            }
        } else {
            let stack_slot = idx - reg_arg_limit;
            let stack_offset = masm_outgoing_stack_arg_offset(stack_slot);
            if use_64bit_arg[idx] {
                out.push_str(&format!("    mov rax, qword ptr [rsp+{}]\n", spill_offset));
                out.push_str(&format!("    mov qword ptr [rsp+{}], rax\n", stack_offset));
            } else {
                out.push_str(&format!("    mov eax, dword ptr [rsp+{}]\n", spill_offset));
                out.push_str(&format!("    mov dword ptr [rsp+{}], eax\n", stack_offset));
            }
        }
    }
    Ok(arc_flags)
}

pub(crate) fn emit_call_arg_releases(out: &mut String, method: &IrMethod, arc_flags: &[bool]) {
    if !arc_flags.iter().any(|flag| *flag) {
        return;
    }
    // Preserve call return value across ARC release calls.
    let ret_tmp = masm_call_retval_spill_offset(method);
    out.push_str(&format!("    mov qword ptr [rsp+{}], rax\n", ret_tmp));
    for (idx, is_arc_arg) in arc_flags.iter().enumerate() {
        if !is_arc_arg {
            continue;
        }
        let spill_offset = arc_arg_spill_offset(method, idx);
        out.push_str(&format!("    mov rax, qword ptr [rsp+{}]\n", spill_offset));
        emit_arc_release_from_eax(out);
    }
    out.push_str(&format!("    mov rax, qword ptr [rsp+{}]\n", ret_tmp));
}

fn native_array_uses_int_lane(element_ty: &str) -> bool {
    matches!(
        normalize_type_token(element_ty).as_str(),
        "boolean" | "byte" | "short" | "int" | "char" | "ubyte" | "ushort" | "uint"
    )
}

fn native_array_uses_qword_scalar_lane(element_ty: &str) -> bool {
    matches!(
        normalize_type_token(element_ty).as_str(),
        "long" | "ulong" | "float" | "double"
    )
}

#[allow(clippy::too_many_arguments)]
fn emit_array_new_initialized_value(
    out: &mut String,
    method: &IrMethod,
    value: &pulsec_core::intermediate::IrValue,
    element_ty: &str,
    dimensions: usize,
    values: &[IrValueId],
    current_method_is_static: bool,
    current_package_name: &str,
    current_class_name: &str,
    method_symbols: &HashMap<(String, String), String>,
    method_staticness: &HashMap<(String, String), bool>,
    method_symbols_by_sig: &HashMap<(String, String, Vec<String>), String>,
    method_staticness_by_sig: &HashMap<(String, String, Vec<String>), bool>,
    stdlib_symbols: &HashMap<(String, String), String>,
    class_names: &[String],
    field_symbols: &HashMap<String, String>,
    field_is_static: &HashMap<String, bool>,
    field_types: &HashMap<String, String>,
    class_object_counter_symbol: &str,
    local_offsets: &HashMap<String, usize>,
    param_offsets: &HashMap<String, usize>,
    string_literals: &mut Vec<String>,
) -> Result<(), String> {
    let tmp_offset = masm_array_init_tmp_offset(method, value.id)
        .ok_or_else(|| format!("Missing array init temp slot for value id {}", value.id))?;
    out.push_str(&format!("    mov ecx, {}\n", values.len()));
    out.push_str("    call pulsec_rt_arrayNew\n");
    out.push_str(&format!("    mov qword ptr [rsp+{}], rax\n", tmp_offset));
    let uses_int_lane = dimensions == 1 && native_array_uses_int_lane(element_ty);
    let uses_qword_scalar_lane = dimensions == 1 && native_array_uses_qword_scalar_lane(element_ty);
    let set_symbol = if uses_int_lane {
        "pulsec_rt_arraySetInt"
    } else if uses_qword_scalar_lane {
        "pulsec_rt_arraySetLong"
    } else {
        "pulsec_rt_arraySetString"
    };
    for (index, item) in values.iter().enumerate() {
        emit_value_to_eax_masm(
            out,
            method,
            *item,
            current_method_is_static,
            current_package_name,
            current_class_name,
            method_symbols,
            method_staticness,
            method_symbols_by_sig,
            method_staticness_by_sig,
            stdlib_symbols,
            class_names,
            field_symbols,
            field_is_static,
            field_types,
            class_object_counter_symbol,
            local_offsets,
            param_offsets,
            string_literals,
        )?;
        out.push_str(&format!("    mov rcx, qword ptr [rsp+{}]\n", tmp_offset));
        out.push_str(&format!("    mov edx, {}\n", index));
        if uses_int_lane {
            out.push_str("    mov r8d, eax\n");
        } else if uses_qword_scalar_lane {
            out.push_str("    mov r8, rax\n");
        } else {
            out.push_str("    mov r8, rax\n");
        }
        out.push_str(&format!("    call {}\n", set_symbol));
    }
    out.push_str(&format!("    mov rax, qword ptr [rsp+{}]\n", tmp_offset));
    Ok(())
}

fn backend_resolution_arg_type(
    method: &IrMethod,
    value_id: IrValueId,
    current_class_name: &str,
    class_names: &[String],
    field_types: &HashMap<String, String>,
    method_symbols_by_sig: &HashMap<(String, String, Vec<String>), String>,
) -> Option<String> {
    let value = method.values.get(value_id as usize)?;
    if matches!(value.kind, IrValueKind::MemberAccess { .. }) {
        if let Some(ty) = resolve_member_access_value_type(
            method,
            value_id,
            current_class_name,
            class_names,
            field_types,
            method_symbols_by_sig,
        ) {
            let normalized = normalize_type_token(&ty);
            if let Some(wrapper_primitive) = wrapper_primitive_type_name(&normalized) {
                return Some(wrapper_primitive.to_string());
            }
            return Some(normalized);
        }
    }
    if let IrValueKind::Unary { op, operand } = value.kind {
        let operand_ty = backend_resolution_arg_type(
            method,
            operand,
            current_class_name,
            class_names,
            field_types,
            method_symbols_by_sig,
        )?;
        return match op {
            IrUnaryOp::Not => Some("boolean".to_string()),
            IrUnaryOp::Neg => Some(lowered_unary_numeric_ty(&operand_ty)),
            IrUnaryOp::BitNot => lowered_shift_ty(&operand_ty),
        };
    }
    if let IrValueKind::Binary { op, left, right } = value.kind {
        let left_ty = backend_resolution_arg_type(
            method,
            left,
            current_class_name,
            class_names,
            field_types,
            method_symbols_by_sig,
        )?;
        let right_ty = backend_resolution_arg_type(
            method,
            right,
            current_class_name,
            class_names,
            field_types,
            method_symbols_by_sig,
        )?;
        if let Some(inferred) = lowered_binary_value_ty(op, &left_ty, &right_ty) {
            return Some(inferred);
        }
    }
    if let IrValueKind::Cast { value: inner, ty } = &value.kind {
        let target_ty = normalize_type_token(ty);
        let source_ty = primitive_cast_source_ty(method, *inner).or_else(|| {
            resolve_backend_call_value_type(
                method,
                *inner,
                current_class_name,
                class_names,
                field_types,
                method_symbols_by_sig,
            )
            .map(|ty| normalize_type_token(&ty))
        })?;
        if target_ty == "Object" && is_wrapper_type_name(&source_ty) {
            return Some("Object".to_string());
        }
        if is_wrapper_type_name(&target_ty) {
            if let Some(target_primitive) = wrapper_primitive_type_name(&target_ty) {
                if normalize_type_token(&source_ty) == target_primitive {
                    return Some(target_primitive.to_string());
                }
                if is_handle_type_name(&source_ty)
                    || normalize_type_token(&source_ty) == "Object"
                    || is_wrapper_type_name(&source_ty)
                {
                    return Some(target_ty);
                }
            }
        }
    }
    value_type_token(method, value_id).or_else(|| {
        resolve_backend_call_value_type(
            method,
            value_id,
            current_class_name,
            class_names,
            field_types,
            method_symbols_by_sig,
        )
        .map(|ty| normalize_type_token(&ty))
    })
}

pub(crate) fn resolve_method_symbol_for_call_exact(
    owner: &str,
    member: &str,
    args: &[IrValueId],
    method: &IrMethod,
    current_class_name: &str,
    class_names: &[String],
    field_types: &HashMap<String, String>,
    _method_symbols: &HashMap<(String, String), String>,
    method_symbols_by_sig: &HashMap<(String, String, Vec<String>), String>,
) -> Option<String> {
    let mut arg_types = Vec::with_capacity(args.len());
    let mut fully_typed = true;
    for arg in args {
        if let Some(t) = backend_resolution_arg_type(
            method,
            *arg,
            current_class_name,
            class_names,
            field_types,
            method_symbols_by_sig,
        ) {
            arg_types.push(t);
        } else {
            fully_typed = false;
            break;
        }
    }
    if fully_typed {
        if let Some(sym) =
            method_symbols_by_sig.get(&(owner.to_string(), member.to_string(), arg_types.clone()))
        {
            return Some(sym.clone());
        }
        if let Some((_, sym)) =
            compatible_backend_signature(owner, member, &arg_types, method_symbols_by_sig)
        {
            return Some(sym);
        }
    }
    let mut arity_matches: Vec<String> = Vec::new();
    for ((o, m, sig), sym) in method_symbols_by_sig {
        if o == owner && m == member && sig.len() == args.len() {
            arity_matches.push(sym.clone());
        }
    }
    arity_matches.sort();
    arity_matches.dedup();
    if arity_matches.len() == 1 {
        return arity_matches.into_iter().next();
    }
    None
}

pub(crate) fn resolve_method_param_types_for_call_exact(
    owner: &str,
    member: &str,
    args: &[IrValueId],
    method: &IrMethod,
    current_class_name: &str,
    class_names: &[String],
    field_types: &HashMap<String, String>,
    method_symbols_by_sig: &HashMap<(String, String, Vec<String>), String>,
) -> Option<(Vec<String>, bool)> {
    let mut arg_types = Vec::with_capacity(args.len());
    let mut fully_typed = true;
    for arg in args {
        if let Some(t) = backend_resolution_arg_type(
            method,
            *arg,
            current_class_name,
            class_names,
            field_types,
            method_symbols_by_sig,
        ) {
            arg_types.push(t);
        } else {
            fully_typed = false;
            break;
        }
    }
    if fully_typed {
        if method_symbols_by_sig.contains_key(&(
            owner.to_string(),
            member.to_string(),
            arg_types.clone(),
        )) {
            return Some((
                arg_types.clone(),
                method_is_varargs(owner, member, &arg_types),
            ));
        }
        if let Some((sig, _)) =
            compatible_backend_signature(owner, member, &arg_types, method_symbols_by_sig)
        {
            let is_varargs = method_is_varargs(owner, member, &sig);
            return Some((sig, is_varargs));
        }
    }
    let mut arity_matches: Vec<Vec<String>> = Vec::new();
    for (o, m, sig) in method_symbols_by_sig.keys() {
        if o == owner && m == member && sig.len() == args.len() {
            arity_matches.push(sig.clone());
        }
    }
    arity_matches.sort();
    arity_matches.dedup();
    if arity_matches.len() == 1 {
        let sig = arity_matches.into_iter().next()?;
        let is_varargs = method_is_varargs(owner, member, &sig);
        return Some((sig, is_varargs));
    }
    None
}

pub(crate) fn resolve_method_symbol_for_call(
    owner: &str,
    member: &str,
    args: &[IrValueId],
    method: &IrMethod,
    current_class_name: &str,
    class_names: &[String],
    field_types: &HashMap<String, String>,
    method_symbols: &HashMap<(String, String), String>,
    method_symbols_by_sig: &HashMap<(String, String, Vec<String>), String>,
) -> Option<String> {
    let mut current = owner.to_string();
    loop {
        if let Some(sym) = resolve_method_symbol_for_call_exact(
            &current,
            member,
            args,
            method,
            current_class_name,
            class_names,
            field_types,
            method_symbols,
            method_symbols_by_sig,
        ) {
            return Some(sym);
        }
        for iface in interfaces_of_type(&current) {
            if let Some(sym) = resolve_method_symbol_for_call_exact(
                &iface,
                member,
                args,
                method,
                current_class_name,
                class_names,
                field_types,
                method_symbols,
                method_symbols_by_sig,
            ) {
                return Some(sym);
            }
        }
        let Some(parent) = class_super_of(&current) else {
            return None;
        };
        current = parent;
    }
}

pub(crate) fn resolve_method_staticness_for_call_exact(
    owner: &str,
    member: &str,
    args: &[IrValueId],
    method: &IrMethod,
    method_staticness: &HashMap<(String, String), bool>,
    method_staticness_by_sig: &HashMap<(String, String, Vec<String>), bool>,
) -> Option<bool> {
    let mut arg_types = Vec::with_capacity(args.len());
    let mut fully_typed = true;
    for arg in args {
        if let Some(t) = value_type_token(method, *arg) {
            arg_types.push(t);
        } else {
            fully_typed = false;
            break;
        }
    }
    if fully_typed {
        if let Some(is_static) = method_staticness_by_sig.get(&(
            owner.to_string(),
            member.to_string(),
            arg_types.clone(),
        )) {
            return Some(*is_static);
        }
        let mut best_score: Option<u16> = None;
        let mut best: Vec<bool> = Vec::new();
        for ((o, m, sig), is_static) in method_staticness_by_sig {
            if o != owner || m != member {
                continue;
            }
            let Some(total) =
                backend_signature_match_score(sig, method_is_varargs(o, m, sig), &arg_types)
            else {
                continue;
            };
            match best_score {
                None => {
                    best_score = Some(total);
                    best.clear();
                    best.push(*is_static);
                }
                Some(existing) if total < existing => {
                    best_score = Some(total);
                    best.clear();
                    best.push(*is_static);
                }
                Some(existing) if total == existing => best.push(*is_static),
                Some(_) => {}
            }
        }
        best.sort();
        best.dedup();
        if best.len() == 1 {
            return best.into_iter().next();
        }
    }
    let mut arity_matches: Vec<bool> = Vec::new();
    for ((o, m, sig), is_static) in method_staticness_by_sig {
        if o == owner && m == member && sig.len() == args.len() {
            arity_matches.push(*is_static);
        }
    }
    arity_matches.sort();
    arity_matches.dedup();
    if arity_matches.len() == 1 {
        return arity_matches.into_iter().next();
    }
    method_staticness
        .get(&(owner.to_string(), member.to_string()))
        .copied()
}

pub(crate) fn resolve_method_staticness_for_call(
    owner: &str,
    member: &str,
    args: &[IrValueId],
    method: &IrMethod,
    method_staticness: &HashMap<(String, String), bool>,
    method_staticness_by_sig: &HashMap<(String, String, Vec<String>), bool>,
) -> Option<bool> {
    let owner_simple = owner.rsplit('.').next().unwrap_or(owner);
    let mut candidates = vec![owner.to_string()];
    for (candidate, _, _) in method_staticness_by_sig.keys() {
        if candidate == owner {
            continue;
        }
        if candidate.rsplit('.').next().unwrap_or(candidate) == owner_simple {
            candidates.push(candidate.clone());
        }
    }
    for (candidate, _) in method_staticness.keys() {
        if candidate == owner {
            continue;
        }
        if candidate.rsplit('.').next().unwrap_or(candidate) == owner_simple {
            candidates.push(candidate.clone());
        }
    }
    candidates.sort();
    candidates.dedup();

    for candidate_owner in candidates {
        let mut current = candidate_owner;
        loop {
            if let Some(is_static) = resolve_method_staticness_for_call_exact(
                &current,
                member,
                args,
                method,
                method_staticness,
                method_staticness_by_sig,
            ) {
                return Some(is_static);
            }
            for iface in interfaces_of_type(&current) {
                if let Some(is_static) = resolve_method_staticness_for_call_exact(
                    &iface,
                    member,
                    args,
                    method,
                    method_staticness,
                    method_staticness_by_sig,
                ) {
                    return Some(is_static);
                }
            }
            let Some(parent) = class_super_of(&current) else {
                break;
            };
            current = parent;
        }
    }
    None
}

pub(crate) fn resolve_method_finality_for_call_exact(
    owner: &str,
    member: &str,
    args: &[IrValueId],
    method: &IrMethod,
    method_finality_by_sig: &HashMap<(String, String, Vec<String>), bool>,
) -> Option<bool> {
    let mut arg_types = Vec::with_capacity(args.len());
    let mut fully_typed = true;
    for arg in args {
        if let Some(t) = value_type_token(method, *arg) {
            arg_types.push(t);
        } else {
            fully_typed = false;
            break;
        }
    }
    if fully_typed {
        if let Some(is_final) =
            method_finality_by_sig.get(&(owner.to_string(), member.to_string(), arg_types))
        {
            return Some(*is_final);
        }
    }
    let mut arity_matches: Vec<bool> = Vec::new();
    for ((o, m, sig), is_final) in method_finality_by_sig {
        if o == owner && m == member && sig.len() == args.len() {
            arity_matches.push(*is_final);
        }
    }
    arity_matches.sort();
    arity_matches.dedup();
    if arity_matches.len() == 1 {
        return arity_matches.into_iter().next();
    }
    None
}

pub(crate) fn resolve_method_finality_for_call(
    owner: &str,
    member: &str,
    args: &[IrValueId],
    method: &IrMethod,
    method_finality_by_sig: &HashMap<(String, String, Vec<String>), bool>,
) -> Option<bool> {
    let mut current = owner.to_string();
    loop {
        if let Some(is_final) = resolve_method_finality_for_call_exact(
            &current,
            member,
            args,
            method,
            method_finality_by_sig,
        ) {
            return Some(is_final);
        }
        for iface in interfaces_of_type(&current) {
            if let Some(is_final) = resolve_method_finality_for_call_exact(
                &iface,
                member,
                args,
                method,
                method_finality_by_sig,
            ) {
                return Some(is_final);
            }
        }
        let Some(parent) = class_super_of(&current) else {
            return None;
        };
        current = parent;
    }
}

pub(crate) fn resolve_method_visibility_for_call_exact(
    owner: &str,
    member: &str,
    args: &[IrValueId],
    method: &IrMethod,
    method_visibility_by_sig: &HashMap<(String, String, Vec<String>), IrVisibility>,
) -> Option<IrVisibility> {
    let mut arg_types = Vec::with_capacity(args.len());
    let mut fully_typed = true;
    for arg in args {
        if let Some(t) = value_type_token(method, *arg) {
            arg_types.push(t);
        } else {
            fully_typed = false;
            break;
        }
    }
    if fully_typed {
        if let Some(visibility) =
            method_visibility_by_sig.get(&(owner.to_string(), member.to_string(), arg_types))
        {
            return Some(*visibility);
        }
    }
    let mut arity_matches: Vec<IrVisibility> = Vec::new();
    for ((o, m, sig), visibility) in method_visibility_by_sig {
        if o == owner && m == member && sig.len() == args.len() {
            arity_matches.push(*visibility);
        }
    }
    arity_matches.sort_by_key(|v| match v {
        IrVisibility::Public => 0,
        IrVisibility::Protected => 1,
        IrVisibility::Package => 2,
        IrVisibility::Private => 3,
    });
    arity_matches.dedup();
    if arity_matches.len() == 1 {
        return arity_matches.into_iter().next();
    }
    None
}

pub(crate) fn resolve_method_visibility_for_call(
    owner: &str,
    member: &str,
    args: &[IrValueId],
    method: &IrMethod,
    method_visibility_by_sig: &HashMap<(String, String, Vec<String>), IrVisibility>,
) -> Option<IrVisibility> {
    let mut current = owner.to_string();
    loop {
        if let Some(visibility) = resolve_method_visibility_for_call_exact(
            &current,
            member,
            args,
            method,
            method_visibility_by_sig,
        ) {
            return Some(visibility);
        }
        for iface in interfaces_of_type(&current) {
            if let Some(visibility) = resolve_method_visibility_for_call_exact(
                &iface,
                member,
                args,
                method,
                method_visibility_by_sig,
            ) {
                return Some(visibility);
            }
        }
        let Some(parent) = class_super_of(&current) else {
            return None;
        };
        current = parent;
    }
}

pub(crate) fn is_devirtualizable_instance_call(
    owner: &str,
    member: &str,
    args: &[IrValueId],
    method: &IrMethod,
) -> bool {
    if class_is_final(owner) {
        return true;
    }
    let method_finality_by_sig = all_method_finality();
    let method_visibility_by_sig = all_method_visibility();
    if resolve_method_finality_for_call(owner, member, args, method, &method_finality_by_sig)
        .unwrap_or(false)
    {
        return true;
    }
    matches!(
        resolve_method_visibility_for_call(owner, member, args, method, &method_visibility_by_sig),
        Some(IrVisibility::Private)
    )
}

pub(crate) fn is_subclass_of(candidate: &str, ancestor: &str) -> bool {
    if candidate == ancestor {
        return true;
    }
    let mut current = candidate.to_string();
    loop {
        let Some(parent) = class_super_of(&current) else {
            return false;
        };
        if parent == ancestor {
            return true;
        }
        current = parent;
    }
}

pub(crate) fn collect_virtual_dispatch_overrides(
    owner: &str,
    member: &str,
    args: &[IrValueId],
    method: &IrMethod,
    current_class_name: &str,
    class_names: &[String],
    field_types: &HashMap<String, String>,
    method_symbols: &HashMap<(String, String), String>,
    method_symbols_by_sig: &HashMap<(String, String, Vec<String>), String>,
) -> Result<(String, Vec<(u32, String)>), String> {
    let default_target = resolve_method_symbol_for_call(
        owner,
        member,
        args,
        method,
        current_class_name,
        class_names,
        field_types,
        method_symbols,
        method_symbols_by_sig,
    )
    .ok_or_else(|| format!("Unknown call target '{}.{}'", owner, member))?;
    let mut overrides = Vec::new();
    let owner_is_interface = is_interface_type(owner);
    for (class_name, class_id) in all_class_ids() {
        let candidate = if owner_is_interface {
            class_implements_interface_runtime(&class_name, owner)
        } else {
            is_subclass_of(&class_name, owner)
        };
        if !candidate {
            continue;
        }
        if let Some(target) = resolve_method_symbol_for_call(
            &class_name,
            member,
            args,
            method,
            current_class_name,
            class_names,
            field_types,
            method_symbols,
            method_symbols_by_sig,
        ) {
            if target != default_target {
                overrides.push((class_id, target));
            }
        }
    }
    overrides.sort_by(|a, b| a.0.cmp(&b.0));
    overrides.dedup_by(|a, b| a.0 == b.0);
    Ok((default_target, overrides))
}

pub(crate) fn emit_virtual_dispatch_call(
    out: &mut String,
    label_seed: &str,
    default_target: &str,
    assignable_class_ids: &[u32],
    overrides: &[(u32, String)],
) {
    let label_null = format!("{}_null", label_seed);
    let label_type = format!("{}_type", label_seed);
    let label_default = format!("{}_default", label_seed);
    let label_done = format!("{}_done", label_seed);
    let label_assign_ok = format!("{}_assign_ok", label_seed);
    if overrides.is_empty() {
        out.push_str("    test rcx, rcx\n");
        out.push_str(&format!("    je {}\n", label_null));
        out.push_str(&format!("    call {}\n", default_target));
        out.push_str(&format!("    jmp {}\n", label_done));
        out.push_str(&format!("{}:\n", label_null));
        out.push_str(&format!("    call {}\n", DISPATCH_NULL_PANIC_SYMBOL));
        out.push_str(&format!("{}:\n", label_done));
        return;
    }
    if assignable_class_ids.is_empty() {
        out.push_str(&format!("    call {}\n", DISPATCH_TYPE_PANIC_SYMBOL));
        return;
    }
    out.push_str("    test rcx, rcx\n");
    out.push_str(&format!("    je {}\n", label_null));
    out.push_str("    sub rsp, 80\n");
    out.push_str("    mov qword ptr [rsp+40], rcx\n");
    out.push_str("    mov qword ptr [rsp+48], rdx\n");
    out.push_str("    mov qword ptr [rsp+56], r8\n");
    out.push_str("    mov qword ptr [rsp+64], r9\n");
    out.push_str(&format!("    call {}\n", OBJECT_CLASS_ID_SYMBOL));
    out.push_str("    test eax, eax\n");
    out.push_str(&format!("    jz {}\n", label_type));
    for class_id in assignable_class_ids {
        out.push_str(&format!("    cmp eax, {}\n", class_id));
        out.push_str(&format!("    je {}\n", label_assign_ok));
    }
    out.push_str(&format!("    jmp {}\n", label_type));
    out.push_str(&format!("{}:\n", label_assign_ok));
    for (idx, (class_id, _)) in overrides.iter().enumerate() {
        out.push_str(&format!("    cmp eax, {}\n", class_id));
        out.push_str(&format!("    je {}_ovr{}\n", label_seed, idx));
    }
    out.push_str(&format!("    jmp {}\n", label_default));
    for (idx, (_, target)) in overrides.iter().enumerate() {
        out.push_str(&format!("{}_ovr{}:\n", label_seed, idx));
        out.push_str("    mov rcx, qword ptr [rsp+40]\n");
        out.push_str("    mov rdx, qword ptr [rsp+48]\n");
        out.push_str("    mov r8, qword ptr [rsp+56]\n");
        out.push_str("    mov r9, qword ptr [rsp+64]\n");
        out.push_str("    add rsp, 80\n");
        out.push_str(&format!("    call {}\n", target));
        out.push_str(&format!("    jmp {}\n", label_done));
    }
    out.push_str(&format!("{}:\n", label_default));
    out.push_str("    mov rcx, qword ptr [rsp+40]\n");
    out.push_str("    mov rdx, qword ptr [rsp+48]\n");
    out.push_str("    mov r8, qword ptr [rsp+56]\n");
    out.push_str("    mov r9, qword ptr [rsp+64]\n");
    out.push_str("    add rsp, 80\n");
    out.push_str(&format!("    call {}\n", default_target));
    out.push_str(&format!("    jmp {}\n", label_done));
    out.push_str(&format!("{}:\n", label_null));
    out.push_str(&format!("    call {}\n", DISPATCH_NULL_PANIC_SYMBOL));
    out.push_str(&format!("    jmp {}\n", label_done));
    out.push_str(&format!("{}:\n", label_type));
    out.push_str("    add rsp, 80\n");
    out.push_str(&format!("    call {}\n", DISPATCH_TYPE_PANIC_SYMBOL));
    out.push_str(&format!("{}:\n", label_done));
}

pub(crate) fn collect_instanceof_class_ids(target_type: &str) -> Vec<u32> {
    let mut ids = Vec::new();
    let is_iface = is_interface_type(target_type);
    for (class_name, class_id) in all_class_ids() {
        let matches = if is_iface {
            class_implements_interface_runtime(&class_name, target_type)
        } else {
            is_subclass_of(&class_name, target_type)
        };
        if matches {
            ids.push(class_id);
        }
    }
    ids.sort();
    ids.dedup();
    ids
}

pub(crate) fn emit_instanceof_check(out: &mut String, label_seed: &str, target_class_ids: &[u32]) {
    let l_false = format!("{}_false", label_seed);
    let l_true = format!("{}_true", label_seed);
    let l_done = format!("{}_done", label_seed);
    let (table_label, table_len) = register_class_id_set_table(target_class_ids);

    out.push_str("    test rax, rax\n");
    out.push_str(&format!("    je {}\n", l_false));
    out.push_str("    mov rcx, rax\n");
    out.push_str(&format!("    call {}\n", OBJECT_CLASS_ID_SYMBOL));
    out.push_str("    mov edx, eax\n");
    out.push_str("    test edx, edx\n");
    out.push_str(&format!("    jz {}\n", l_false));
    out.push_str("    mov ecx, edx\n");
    out.push_str(&format!("    lea rdx, {}\n", table_label));
    out.push_str(&format!("    mov r8d, {}\n", table_len));
    out.push_str(&format!("    call {}\n", CLASS_ID_IN_SET_SYMBOL));
    out.push_str("    test eax, eax\n");
    out.push_str(&format!("    jnz {}\n", l_true));
    out.push_str(&format!("{}:\n", l_false));
    out.push_str("    xor eax, eax\n");
    out.push_str(&format!("    jmp {}\n", l_done));
    out.push_str(&format!("{}:\n", l_true));
    out.push_str("    mov eax, 1\n");
    out.push_str(&format!("{}:\n", l_done));
}

pub(crate) fn emit_checked_reference_cast(
    out: &mut String,
    label_seed: &str,
    target_class_ids: &[u32],
    panic_msg_label: &str,
) {
    let l_ok = format!("{}_ok", label_seed);
    let l_fail = format!("{}_fail", label_seed);
    let l_done = format!("{}_done", label_seed);
    let l_null = format!("{}_null", label_seed);
    let (table_label, table_len) = register_class_id_set_table(target_class_ids);

    out.push_str("    test rax, rax\n");
    out.push_str(&format!("    je {}\n", l_null));
    out.push_str("    mov qword ptr [rsp+40], rax\n");
    out.push_str("    mov rcx, rax\n");
    out.push_str(&format!("    call {}\n", OBJECT_CLASS_ID_SYMBOL));
    out.push_str("    mov edx, eax\n");
    out.push_str("    test edx, edx\n");
    out.push_str(&format!("    jz {}\n", l_fail));
    out.push_str("    mov ecx, edx\n");
    out.push_str(&format!("    lea rdx, {}\n", table_label));
    out.push_str(&format!("    mov r8d, {}\n", table_len));
    out.push_str(&format!("    call {}\n", CLASS_ID_IN_SET_SYMBOL));
    out.push_str("    test eax, eax\n");
    out.push_str(&format!("    jnz {}\n", l_ok));
    out.push_str(&format!("{}:\n", l_fail));
    out.push_str(&format!("    lea rcx, {}\n", panic_msg_label));
    out.push_str(&format!("    mov edx, {}_len\n", panic_msg_label));
    out.push_str("    call pulsec_rt_stringFromBytes\n");
    out.push_str("    mov rcx, rax\n");
    out.push_str("    call pulsec_rt_panic\n");
    out.push_str("    xor eax, eax\n");
    out.push_str(&format!("    jmp {}\n", l_done));
    out.push_str(&format!("{}:\n", l_null));
    out.push_str("    xor eax, eax\n");
    out.push_str(&format!("    jmp {}\n", l_done));
    out.push_str(&format!("{}:\n", l_ok));
    out.push_str("    mov rax, qword ptr [rsp+40]\n");
    out.push_str(&format!("{}:\n", l_done));
}

pub(crate) fn emit_masm_method_body(
    out: &mut String,
    current_package_name: &str,
    current_class_name: &str,
    method_symbol: &str,
    method: &IrMethod,
    method_symbols: &HashMap<(String, String), String>,
    method_staticness: &HashMap<(String, String), bool>,
    method_symbols_by_sig: &HashMap<(String, String, Vec<String>), String>,
    method_staticness_by_sig: &HashMap<(String, String, Vec<String>), bool>,
    stdlib_symbols: &HashMap<(String, String), String>,
    class_names: &[String],
    field_symbols: &HashMap<String, String>,
    field_is_static: &HashMap<String, bool>,
    field_types: &HashMap<String, String>,
    class_object_counter_symbol: &str,
    print_literals: &mut Vec<String>,
    trace_enabled: bool,
) -> Result<(), String> {
    let mut local_types: HashMap<String, String> = HashMap::new();
    let mut local_offsets: HashMap<String, usize> = HashMap::new();
    let mut next_local_slot = 0usize;
    for block in &method.blocks {
        for instr in &block.instructions {
            if let IrInstr::DeclareLocal { name, ty, .. } = instr {
                local_types.insert(name.clone(), ty.clone());
                if !local_offsets.contains_key(name) {
                    local_offsets.insert(name.clone(), next_local_slot);
                    next_local_slot += 1;
                }
            }
        }
    }
    for param in &method.params {
        local_types.insert(param.name.clone(), param.ty.clone());
    }
    let method_stack_size = masm_method_stack_size(method);
    let incoming_stack_base = method_stack_size + 40;
    let local_base = masm_local_base_offset(method);
    let mut param_offsets: HashMap<String, usize> = HashMap::new();
    let param_slot_base = if method.is_static {
        next_local_slot
    } else {
        let this_offset = local_base + (next_local_slot * 8);
        param_offsets.insert("__this".to_string(), this_offset);
        out.push_str(&format!("    mov qword ptr [rsp+{}], rcx\n", this_offset));
        next_local_slot + 1
    };
    for (idx, param) in method.params.iter().enumerate() {
        let slot = param_slot_base + idx;
        let offset = local_base + (slot * 8);
        param_offsets.insert(param.name.clone(), offset);
        let incoming_stack_slot = if method.is_static {
            idx.checked_sub(4)
        } else {
            idx.checked_sub(3)
        };
        let param_is_handle = is_handle_type_name(&param.ty);
        if let Some(stack_slot) = incoming_stack_slot {
            let incoming_offset = incoming_stack_base + (stack_slot * 8);
            if uses_qword_scalar_type_name(&param.ty) || param_is_handle {
                out.push_str(&format!(
                    "    mov rax, qword ptr [rsp+{}]\n",
                    incoming_offset
                ));
                out.push_str(&format!("    mov qword ptr [rsp+{}], rax\n", offset));
            } else {
                out.push_str(&format!(
                    "    mov eax, dword ptr [rsp+{}]\n",
                    incoming_offset
                ));
                out.push_str(&format!("    mov dword ptr [rsp+{}], eax\n", offset));
            }
            continue;
        }
        let reg_idx = if method.is_static { idx } else { idx + 1 };
        if uses_qword_scalar_type_name(&param.ty) || param_is_handle {
            out.push_str(&format!(
                "    mov qword ptr [rsp+{}], {}\n",
                offset,
                arg_register64(reg_idx)
            ));
        } else {
            out.push_str(&format!(
                "    mov dword ptr [rsp+{}], {}\n",
                offset,
                arg_register32(reg_idx)
            ));
        }
    }

    if emit_runtime_backed_method_wrapper(
        out,
        current_class_name,
        method,
        stdlib_symbols,
        &param_offsets,
    ) {
        let epilogue_label = format!("{}_epilogue", method_symbol);
        out.push_str(&format!("    jmp {}\n", epilogue_label));
        out.push_str(&format!("{}:\n", epilogue_label));
        return Ok(());
    }

    let mut initialized_arc_locals: HashSet<String> = HashSet::new();
    let mut initialized_arc_params: HashSet<String> = HashSet::new();
    for (name, slot) in &local_offsets {
        let Some(ty) = local_types.get(name) else {
            continue;
        };
        if is_arc_managed_type_name(ty) || is_wrapper_type_name(ty) {
            let offset = local_base + (slot * 8);
            out.push_str(&format!("    mov qword ptr [rsp+{}], 0\n", offset));
            initialized_arc_locals.insert(name.clone());
        }
    }

    if method.is_constructor {
        let ctor_reuse_label = format!("{}_ctor_reuse", method_symbol);
        let ctor_ready_label = format!("{}_ctor_ready", method_symbol);
        if let Some(this_offset) = param_offsets.get("__this") {
            out.push_str(&format!("    mov rax, qword ptr [rsp+{}]\n", this_offset));
            out.push_str("    test rax, rax\n");
            out.push_str(&format!("    jne {}\n", ctor_reuse_label));
        }
        let constructor_owner = normalize_class_owner_name(current_class_name, class_names)
            .unwrap_or_else(|| current_class_name.to_string());
        let class_id = class_id_of(&constructor_owner).unwrap_or(0);
        out.push_str(&format!("    mov ecx, {}\n", class_id));
        out.push_str(&format!("    call {}\n", OBJECT_NEW_SYMBOL));
        if field_is_static.values().any(|is_static| !*is_static) {
            let helper_symbol =
                mangle_class_field_capacity_proc_symbol(current_package_name, current_class_name);
            let tmp = masm_arc_local_tmp_offset(method);
            out.push_str(&format!("    mov qword ptr [rsp+{}], rax\n", tmp));
            out.push_str("    mov rcx, rax\n");
            out.push_str(&format!("    call {}\n", helper_symbol));
            out.push_str(&format!("    mov rax, qword ptr [rsp+{}]\n", tmp));
        }
        out.push_str(&format!("    jmp {}\n", ctor_ready_label));
        out.push_str(&format!("{}:\n", ctor_reuse_label));
        if let Some(this_offset) = param_offsets.get("__this") {
            out.push_str(&format!("    mov rax, qword ptr [rsp+{}]\n", this_offset));
        }
        out.push_str(&format!("{}:\n", ctor_ready_label));
        out.push_str("    mov rcx, rax\n");
        if let Some(this_offset) = param_offsets.get("__this") {
            out.push_str(&format!("    mov qword ptr [rsp+{}], rcx\n", this_offset));
        }
    }

    let epilogue_label = format!("{}_epilogue", method_symbol);
    let mut last_trace_statement: Option<usize> = None;

    for block in &method.blocks {
        let block_label = format!("{}_b{}", method_symbol, block.id);
        out.push_str(&format!("{}:\n", block_label));
        let mut i = 0usize;
        while i < block.instructions.len() {
            let instr = &block.instructions[i];
            let instr_source = match instr {
                IrInstr::DeclareLocal { source, .. }
                | IrInstr::StoreLocal { source, .. }
                | IrInstr::Eval { source, .. }
                | IrInstr::PushExceptionHandler { source, .. }
                | IrInstr::PopExceptionHandler { source, .. } => source,
            };
            if trace_enabled {
                emit_trace_update_for_source(
                    out,
                    method_symbol,
                    instr_source,
                    &mut last_trace_statement,
                );
            }

            if let IrInstr::PushExceptionHandler { handler_target, .. } = instr {
                out.push_str(&format!(
                    "    lea rcx, {}_b{}\n",
                    method_symbol, handler_target
                ));
                out.push_str("    lea rdx, [rsp]\n");
                out.push_str(&format!("    call {}\n", EXC_PUSH_HANDLER_SYMBOL));
                i += 1;
                continue;
            }
            if matches!(instr, IrInstr::PopExceptionHandler { .. }) {
                out.push_str(&format!("    call {}\n", EXC_POP_HANDLER_SYMBOL));
                i += 1;
                continue;
            }
            if let IrInstr::StoreLocal { value, .. } = instr {
                emit_value_to_eax_masm(
                    out,
                    method,
                    *value,
                    method.is_static,
                    current_package_name,
                    current_class_name,
                    method_symbols,
                    method_staticness,
                    method_symbols_by_sig,
                    method_staticness_by_sig,
                    stdlib_symbols,
                    class_names,
                    field_symbols,
                    field_is_static,
                    field_types,
                    class_object_counter_symbol,
                    &local_offsets,
                    &param_offsets,
                    print_literals,
                )?;
                if let IrInstr::StoreLocal { name, .. } = instr {
                    let target_ty = local_types
                        .get(name)
                        .cloned()
                        .or_else(|| {
                            method
                                .params
                                .iter()
                                .find(|p| p.name == *name)
                                .map(|p| p.ty.clone())
                        })
                        .or_else(|| field_types.get(name).cloned())
                        .unwrap_or_else(|| "unknown".to_string());
                    let target_is_raw_runtime_handle = normalize_type_token(&target_ty) == "long"
                        && value_is_raw_runtime_handle(
                            method,
                            *value,
                            current_class_name,
                            class_names,
                            &local_types,
                            field_types,
                        );
                    let retain_new = value_requires_arc_retain_on_store(method, *value)
                        || call_result_requires_arc_retain_on_store(
                            method,
                            *value,
                            current_class_name,
                            class_names,
                            &local_types,
                            field_types,
                        )
                        || target_is_raw_runtime_handle;
                    let wrapper_target_holds_boxed_object = is_wrapper_type_name(&target_ty)
                        && wrapper_value_is_boxed_object(
                            method,
                            *value,
                            current_class_name,
                            class_names,
                            &local_types,
                            field_types,
                            method_symbols_by_sig,
                        );
                    let is_wide_target = uses_qword_scalar_type_name(&target_ty)
                        || is_handle_type_name(&target_ty)
                        || wrapper_target_holds_boxed_object
                        || target_is_raw_runtime_handle;
                    let target_is_arc = is_arc_managed_type_name(&target_ty)
                        || wrapper_target_holds_boxed_object
                        || target_is_raw_runtime_handle;
                    if let Some(slot) = local_offsets.get(name) {
                        let offset = local_base + (slot * 8);
                        if target_is_arc {
                            let tmp = masm_arc_local_tmp_offset(method);
                            out.push_str(&format!("    mov qword ptr [rsp+{}], rax\n", tmp));
                            if retain_new {
                                out.push_str(&format!("    mov rax, qword ptr [rsp+{}]\n", tmp));
                                emit_arc_retain_from_eax(out);
                            }
                            if initialized_arc_locals.contains(name) {
                                out.push_str(&format!("    mov rax, qword ptr [rsp+{}]\n", offset));
                                emit_arc_release_from_eax(out);
                            }
                            out.push_str(&format!("    mov rax, qword ptr [rsp+{}]\n", tmp));
                        }
                        if is_wide_target {
                            out.push_str(&format!("    mov qword ptr [rsp+{}], rax\n", offset));
                        } else {
                            out.push_str(&format!("    mov dword ptr [rsp+{}], eax\n", offset));
                        }
                        if target_is_arc {
                            initialized_arc_locals.insert(name.clone());
                        }
                    } else if let Some(offset) = param_offsets.get(name) {
                        if target_is_arc {
                            let tmp = masm_arc_local_tmp_offset(method);
                            out.push_str(&format!("    mov qword ptr [rsp+{}], rax\n", tmp));
                            if retain_new {
                                out.push_str(&format!("    mov rax, qword ptr [rsp+{}]\n", tmp));
                                emit_arc_retain_from_eax(out);
                            }
                            out.push_str(&format!("    mov rax, qword ptr [rsp+{}]\n", offset));
                            emit_arc_release_from_eax(out);
                            out.push_str(&format!("    mov rax, qword ptr [rsp+{}]\n", tmp));
                        }
                        if is_wide_target {
                            out.push_str(&format!("    mov qword ptr [rsp+{}], rax\n", offset));
                        } else {
                            out.push_str(&format!("    mov dword ptr [rsp+{}], eax\n", offset));
                        }
                    }
                }
                i += 1;
                continue;
            }

            let IrInstr::Eval { value, source } = instr else {
                i += 1;
                continue;
            };
            let Some(v) = method.values.get(*value as usize) else {
                i += 1;
                continue;
            };

            if matches!(
                v.kind,
                IrValueKind::Call { .. } | IrValueKind::NewObject { .. }
            ) {
                let mut lookahead = i + 1;
                let mut skip_standalone_rhs = false;
                while let Some(next_instr) = block.instructions.get(lookahead) {
                    let candidate_source = match next_instr {
                        IrInstr::DeclareLocal { source, .. }
                        | IrInstr::StoreLocal { source, .. }
                        | IrInstr::Eval { source, .. }
                        | IrInstr::PushExceptionHandler { source, .. }
                        | IrInstr::PopExceptionHandler { source, .. } => source,
                    };
                    if candidate_source.statement_index != source.statement_index {
                        break;
                    }
                    let candidate_target = match next_instr {
                        IrInstr::Eval { value, .. } => *value,
                        _ => {
                            lookahead += 1;
                            continue;
                        }
                    };
                    if let Some(target_v) = method.values.get(candidate_target as usize) {
                        match &target_v.kind {
                            IrValueKind::LocalRef(target_name) => {
                                let target_ty = local_types
                                    .get(target_name)
                                    .cloned()
                                    .or_else(|| field_types.get(target_name).cloned())
                                    .unwrap_or_else(|| "unknown".to_string());
                                if lowered_assignment_target_matches_rhs(
                                    method,
                                    *value,
                                    &target_ty,
                                    current_class_name,
                                    class_names,
                                    &local_types,
                                    field_types,
                                    method_symbols_by_sig,
                                ) {
                                    skip_standalone_rhs = true;
                                    break;
                                }
                            }
                            IrValueKind::MemberAccess { object, member } => {
                                let static_owner = resolve_static_field_owner(
                                    method,
                                    *object,
                                    current_package_name,
                                    current_class_name,
                                    &local_types,
                                    class_names,
                                );
                                let is_same_class_owner = matches!(
                                    method.values.get(*object as usize).map(|obj| &obj.kind),
                                    Some(IrValueKind::ThisRef | IrValueKind::SuperRef)
                                ) || matches!(
                                    method.values.get(*object as usize).map(|obj| &obj.kind),
                                    Some(IrValueKind::LocalRef(name))
                                        if local_types
                                            .get(name)
                                            .map(|ty| ty == current_class_name)
                                            .unwrap_or(false)
                                ) || static_owner
                                    .as_ref()
                                    .map(|(package, class_name)| {
                                        package == current_package_name
                                            && class_name == current_class_name
                                    })
                                    .unwrap_or(false);
                                if is_same_class_owner || static_owner.is_some() {
                                    let target_ty = if is_same_class_owner {
                                        field_types
                                            .get(member)
                                            .cloned()
                                            .unwrap_or_else(|| "unknown".to_string())
                                    } else {
                                        target_v.ty.clone()
                                    };
                                    if lowered_assignment_target_matches_rhs(
                                        method,
                                        *value,
                                        &target_ty,
                                        current_class_name,
                                        class_names,
                                        &local_types,
                                        field_types,
                                        method_symbols_by_sig,
                                    ) {
                                        skip_standalone_rhs = true;
                                        break;
                                    }
                                }
                            }
                            _ => {}
                        }
                    }
                    lookahead += 1;
                }
                if skip_standalone_rhs {
                    i += 1;
                    continue;
                }
            }

            // Detect lowered assignment shape: Eval(target), Eval(value) with same statement index.
            if let IrValueKind::LocalRef(target_name) = &v.kind {
                if let Some(IrInstr::Eval {
                    value: rhs_value,
                    source: rhs_source,
                }) = block.instructions.get(i + 1)
                {
                    if rhs_source.statement_index == source.statement_index {
                        let target_ty = local_types
                            .get(target_name)
                            .cloned()
                            .or_else(|| field_types.get(target_name).cloned())
                            .unwrap_or_else(|| "unknown".to_string());
                        if !lowered_assignment_target_matches_rhs(
                            method,
                            *rhs_value,
                            &target_ty,
                            current_class_name,
                            class_names,
                            &local_types,
                            field_types,
                            method_symbols_by_sig,
                        ) {
                            i += 1;
                            continue;
                        }
                        let target_is_raw_runtime_handle = normalize_type_token(&target_ty)
                            == "long"
                            && value_is_raw_runtime_handle(
                                method,
                                *rhs_value,
                                current_class_name,
                                class_names,
                                &local_types,
                                field_types,
                            );
                        let retain_new = value_requires_arc_retain_on_store(method, *rhs_value)
                            || call_result_requires_arc_retain_on_store(
                                method,
                                *rhs_value,
                                current_class_name,
                                class_names,
                                &local_types,
                                field_types,
                            )
                            || target_is_raw_runtime_handle;
                        emit_value_to_eax_masm(
                            out,
                            method,
                            *rhs_value,
                            method.is_static,
                            current_package_name,
                            current_class_name,
                            method_symbols,
                            method_staticness,
                            method_symbols_by_sig,
                            method_staticness_by_sig,
                            stdlib_symbols,
                            class_names,
                            field_symbols,
                            field_is_static,
                            field_types,
                            class_object_counter_symbol,
                            &local_offsets,
                            &param_offsets,
                            print_literals,
                        )?;
                        if let Some(slot) = local_offsets.get(target_name) {
                            let offset = local_base + (slot * 8);
                            let wrapper_target_holds_boxed_object =
                                is_wrapper_type_name(&target_ty)
                                    && wrapper_value_is_boxed_object(
                                        method,
                                        *rhs_value,
                                        current_class_name,
                                        class_names,
                                        &local_types,
                                        field_types,
                                        method_symbols_by_sig,
                                    );
                            let is_wide_target = uses_qword_scalar_type_name(&target_ty)
                                || is_handle_type_name(&target_ty)
                                || wrapper_target_holds_boxed_object
                                || target_is_raw_runtime_handle;
                            if is_arc_managed_type_name(&target_ty)
                                || wrapper_target_holds_boxed_object
                                || target_is_raw_runtime_handle
                            {
                                let tmp = masm_arc_local_tmp_offset(method);
                                out.push_str(&format!("    mov qword ptr [rsp+{}], rax\n", tmp));
                                if retain_new {
                                    out.push_str(&format!(
                                        "    mov rax, qword ptr [rsp+{}]\n",
                                        tmp
                                    ));
                                    emit_arc_retain_from_eax(out);
                                }
                                if initialized_arc_locals.contains(target_name) {
                                    out.push_str(&format!(
                                        "    mov rax, qword ptr [rsp+{}]\n",
                                        offset
                                    ));
                                    emit_arc_release_from_eax(out);
                                }
                                out.push_str(&format!("    mov rax, qword ptr [rsp+{}]\n", tmp));
                                initialized_arc_locals.insert(target_name.clone());
                            }
                            if is_wide_target {
                                out.push_str(&format!("    mov qword ptr [rsp+{}], rax\n", offset));
                            } else {
                                out.push_str(&format!("    mov dword ptr [rsp+{}], eax\n", offset));
                            }
                            i += 2;
                            continue;
                        }
                        if let Some(offset) = param_offsets.get(target_name) {
                            let wrapper_target_holds_boxed_object =
                                is_wrapper_type_name(&target_ty)
                                    && wrapper_value_is_boxed_object(
                                        method,
                                        *rhs_value,
                                        current_class_name,
                                        class_names,
                                        &local_types,
                                        field_types,
                                        method_symbols_by_sig,
                                    );
                            let is_wide_target = uses_qword_scalar_type_name(&target_ty)
                                || is_handle_type_name(&target_ty)
                                || wrapper_target_holds_boxed_object
                                || target_is_raw_runtime_handle;
                            if is_arc_managed_type_name(&target_ty)
                                || wrapper_target_holds_boxed_object
                                || target_is_raw_runtime_handle
                            {
                                let tmp = masm_arc_local_tmp_offset(method);
                                out.push_str(&format!("    mov qword ptr [rsp+{}], rax\n", tmp));
                                if retain_new {
                                    out.push_str(&format!(
                                        "    mov rax, qword ptr [rsp+{}]\n",
                                        tmp
                                    ));
                                    emit_arc_retain_from_eax(out);
                                }
                                if initialized_arc_params.contains(target_name) {
                                    out.push_str(&format!(
                                        "    mov rax, qword ptr [rsp+{}]\n",
                                        offset
                                    ));
                                    emit_arc_release_from_eax(out);
                                }
                                out.push_str(&format!("    mov rax, qword ptr [rsp+{}]\n", tmp));
                                initialized_arc_params.insert(target_name.clone());
                            }
                            if is_wide_target {
                                out.push_str(&format!("    mov qword ptr [rsp+{}], rax\n", offset));
                            } else {
                                out.push_str(&format!("    mov dword ptr [rsp+{}], eax\n", offset));
                            }
                            i += 2;
                            continue;
                        }
                        if let Some(field_sym) = field_symbols.get(target_name) {
                            let is_static_field =
                                *field_is_static.get(target_name).unwrap_or(&false);
                            let target_ty = field_types
                                .get(target_name)
                                .cloned()
                                .unwrap_or_else(|| "unknown".to_string());
                            let same_class_static_setter_sym = if is_static_field {
                                let (owner_package, owner_class) =
                                    split_owner_package_and_class(current_class_name)
                                        .unwrap_or_else(|| {
                                            (
                                                current_package_name.to_string(),
                                                current_class_name.to_string(),
                                            )
                                        });
                                Some(mangle_static_field_setter_symbol(
                                    &owner_package,
                                    &owner_class,
                                    target_name,
                                ))
                            } else {
                                None
                            };
                            let wrapper_target_holds_boxed_object =
                                is_wrapper_type_name(&target_ty)
                                    && wrapper_value_is_boxed_object(
                                        method,
                                        *rhs_value,
                                        current_class_name,
                                        class_names,
                                        &local_types,
                                        field_types,
                                        method_symbols_by_sig,
                                    );
                            let target_is_raw_runtime_handle =
                                raw_runtime_handle_field(current_class_name, target_name)
                                    && value_is_raw_runtime_handle(
                                        method,
                                        *rhs_value,
                                        current_class_name,
                                        class_names,
                                        &local_types,
                                        field_types,
                                    );
                            let target_is_arc = is_arc_managed_type_name(&target_ty)
                                || wrapper_target_holds_boxed_object
                                || target_is_raw_runtime_handle;
                            let target_uses_qword = uses_qword_field_storage(&target_ty)
                                || wrapper_target_holds_boxed_object
                                || target_is_raw_runtime_handle;
                            if target_is_arc {
                                if is_static_field {
                                    let tmp = masm_arc_local_tmp_offset(method);
                                    out.push_str(&format!(
                                        "    mov qword ptr [rsp+{}], rax\n",
                                        tmp
                                    ));
                                    if let Some(setter_sym) = &same_class_static_setter_sym {
                                        if target_uses_qword {
                                            out.push_str("    mov rcx, rax\n");
                                        } else {
                                            out.push_str("    mov ecx, eax\n");
                                        }
                                        out.push_str(&format!("    call {}\n", setter_sym));
                                    } else if target_uses_qword {
                                        out.push_str(&format!(
                                            "    mov qword ptr [{}], rax\n",
                                            field_sym
                                        ));
                                    } else {
                                        out.push_str(&format!(
                                            "    mov dword ptr [{}], eax\n",
                                            field_sym
                                        ));
                                    }
                                    out.push_str(&format!(
                                        "    mov rax, qword ptr [rsp+{}]\n",
                                        tmp
                                    ));
                                    i += 2;
                                    continue;
                                } else {
                                    if let Some(this_offset) = param_offsets.get("__this") {
                                        out.push_str(&format!(
                                            "    mov edx, dword ptr [rsp+{}]\n",
                                            this_offset
                                        ));
                                    } else {
                                        out.push_str("    mov edx, ecx\n");
                                    }
                                    out.push_str(&format!(
                                        "    cmp edx, {}\n",
                                        OBJECT_SLOT_CAPACITY
                                    ));
                                    out.push_str("    jbe @F\n");
                                    out.push_str(&format!(
                                        "    mov edx, {}\n",
                                        OBJECT_SLOT_CAPACITY
                                    ));
                                    out.push_str("@@:\n");
                                    out.push_str(&format!(
                                        "    mov r10, qword ptr [{}]\n",
                                        field_sym
                                    ));
                                    if target_uses_qword {
                                        out.push_str("    mov rax, qword ptr [r10+rdx*8]\n");
                                    } else {
                                        out.push_str("    mov eax, dword ptr [r10+rdx*4]\n");
                                    }
                                    emit_arc_release_from_eax(out);
                                }
                            }
                            emit_value_to_eax_masm(
                                out,
                                method,
                                *rhs_value,
                                method.is_static,
                                current_package_name,
                                current_class_name,
                                method_symbols,
                                method_staticness,
                                method_symbols_by_sig,
                                method_staticness_by_sig,
                                stdlib_symbols,
                                class_names,
                                field_symbols,
                                field_is_static,
                                field_types,
                                class_object_counter_symbol,
                                &local_offsets,
                                &param_offsets,
                                print_literals,
                            )?;
                            if target_is_arc && retain_new {
                                emit_arc_retain_from_eax(out);
                            }
                            if is_static_field {
                                if let Some(setter_sym) = &same_class_static_setter_sym {
                                    if target_uses_qword {
                                        out.push_str("    mov rcx, rax\n");
                                    } else {
                                        out.push_str("    mov ecx, eax\n");
                                    }
                                    out.push_str(&format!("    call {}\n", setter_sym));
                                } else if target_uses_qword {
                                    out.push_str(&format!(
                                        "    mov qword ptr [{}], rax\n",
                                        field_sym
                                    ));
                                } else {
                                    out.push_str(&format!(
                                        "    mov dword ptr [{}], eax\n",
                                        field_sym
                                    ));
                                }
                            } else {
                                if let Some(this_offset) = param_offsets.get("__this") {
                                    out.push_str(&format!(
                                        "    mov edx, dword ptr [rsp+{}]\n",
                                        this_offset
                                    ));
                                } else {
                                    out.push_str("    mov edx, ecx\n");
                                }
                                out.push_str(&format!("    cmp edx, {}\n", OBJECT_SLOT_CAPACITY));
                                out.push_str("    jbe @F\n");
                                out.push_str(&format!("    mov edx, {}\n", OBJECT_SLOT_CAPACITY));
                                out.push_str("@@:\n");
                                out.push_str(&format!("    mov r10, qword ptr [{}]\n", field_sym));
                                if target_uses_qword {
                                    out.push_str("    mov qword ptr [r10+rdx*8], rax\n");
                                } else {
                                    out.push_str("    mov dword ptr [r10+rdx*4], eax\n");
                                }
                            }
                            i += 2;
                            continue;
                        }
                    }
                }
            }

            if !matches!(v.kind, IrValueKind::MemberAccess { .. }) {
                if let Some(IrInstr::Eval {
                    value: target_value,
                    source: target_source,
                }) = block.instructions.get(i + 1)
                {
                    if target_source.statement_index == source.statement_index {
                        if let Some(target_v) = method.values.get(*target_value as usize) {
                            if let IrValueKind::MemberAccess { object, member } = &target_v.kind {
                                if let Some(obj_val) = method.values.get(*object as usize) {
                                    let is_this = matches!(
                                        obj_val.kind,
                                        IrValueKind::ThisRef | IrValueKind::SuperRef
                                    );
                                    let is_local_same_class = match &obj_val.kind {
                                        IrValueKind::LocalRef(name) => local_types
                                            .get(name)
                                            .map(|ty| ty == current_class_name)
                                            .unwrap_or(false),
                                        _ => false,
                                    };
                                    let static_owner = resolve_static_field_owner(
                                        method,
                                        *object,
                                        current_package_name,
                                        current_class_name,
                                        &local_types,
                                        class_names,
                                    );
                                    let is_same_class_static_owner = static_owner
                                        .as_ref()
                                        .map(|(package, class_name)| {
                                            package == current_package_name
                                                && class_name == current_class_name
                                        })
                                        .unwrap_or(false);
                                    if is_this || is_local_same_class || is_same_class_static_owner
                                    {
                                        let field_sym =
                                            field_symbols.get(member).ok_or_else(|| {
                                                format!(
                                                    "Unknown field symbol '{}.{}'",
                                                    current_class_name, member
                                                )
                                            })?;
                                        let is_static_field =
                                            *field_is_static.get(member).unwrap_or(&false);
                                        let field_ty = field_types
                                            .get(member)
                                            .cloned()
                                            .unwrap_or_else(|| "unknown".to_string());
                                        let same_class_static_setter_sym = if is_static_field {
                                            let (owner_package, owner_class) =
                                                split_owner_package_and_class(current_class_name)
                                                    .unwrap_or_else(|| {
                                                        (
                                                            current_package_name.to_string(),
                                                            current_class_name.to_string(),
                                                        )
                                                    });
                                            Some(mangle_static_field_setter_symbol(
                                                &owner_package,
                                                &owner_class,
                                                member,
                                            ))
                                        } else {
                                            None
                                        };
                                        if lowered_assignment_target_matches_rhs(
                                            method,
                                            *value,
                                            &field_ty,
                                            current_class_name,
                                            class_names,
                                            &local_types,
                                            field_types,
                                            method_symbols_by_sig,
                                        ) {
                                            let field_uses_qword =
                                                uses_qword_field_storage(&field_ty);
                                            let field_is_arc = is_arc_managed_type_name(&field_ty)
                                                || raw_runtime_handle_field(
                                                    current_class_name,
                                                    member,
                                                );
                                            emit_value_to_eax_masm(
                                                out,
                                                method,
                                                *value,
                                                method.is_static,
                                                current_package_name,
                                                current_class_name,
                                                method_symbols,
                                                method_staticness,
                                                method_symbols_by_sig,
                                                method_staticness_by_sig,
                                                stdlib_symbols,
                                                class_names,
                                                field_symbols,
                                                field_is_static,
                                                field_types,
                                                class_object_counter_symbol,
                                                &local_offsets,
                                                &param_offsets,
                                                print_literals,
                                            )?;
                                            if field_is_arc {
                                                let tmp = masm_arc_local_tmp_offset(method);
                                                out.push_str(&format!(
                                                    "    mov qword ptr [rsp+{}], rax\n",
                                                    tmp
                                                ));
                                                if is_static_field {
                                                    out.push_str(&format!(
                                                        "    mov rax, qword ptr [rsp+{}]\n",
                                                        tmp
                                                    ));
                                                } else {
                                                    emit_arc_retain_from_eax(out);
                                                    if is_local_same_class {
                                                        let local_name = match &obj_val.kind {
                                                            IrValueKind::LocalRef(name) => name,
                                                            _ => unreachable!(),
                                                        };
                                                        if let Some(slot) =
                                                            local_offsets.get(local_name)
                                                        {
                                                            let offset =
                                                                masm_local_base_offset(method)
                                                                    + (slot * 8);
                                                            out.push_str(&format!(
                                                                "    mov edx, dword ptr [rsp+{}]\n",
                                                                offset
                                                            ));
                                                        } else if let Some(offset) =
                                                            param_offsets.get(local_name)
                                                        {
                                                            out.push_str(&format!(
                                                                "    mov edx, dword ptr [rsp+{}]\n",
                                                                offset
                                                            ));
                                                        } else {
                                                            return Err(format!(
                                                            "Unsupported local receiver '{}' in masm-full member write",
                                                            local_name
                                                        ));
                                                        }
                                                    } else if let Some(this_offset) =
                                                        param_offsets.get("__this")
                                                    {
                                                        out.push_str(&format!(
                                                            "    mov edx, dword ptr [rsp+{}]\n",
                                                            this_offset
                                                        ));
                                                    } else {
                                                        out.push_str("    mov edx, ecx\n");
                                                    }
                                                    out.push_str(&format!(
                                                        "    cmp edx, {}\n",
                                                        OBJECT_SLOT_CAPACITY
                                                    ));
                                                    out.push_str("    jbe @F\n");
                                                    out.push_str(&format!(
                                                        "    mov edx, {}\n",
                                                        OBJECT_SLOT_CAPACITY
                                                    ));
                                                    out.push_str("@@:\n");
                                                    out.push_str(&format!(
                                                        "    mov r10, qword ptr [{}]\n",
                                                        field_sym
                                                    ));
                                                    if field_uses_qword {
                                                        out.push_str(
                                                            "    mov rax, qword ptr [r10+rdx*8]\n",
                                                        );
                                                    } else {
                                                        out.push_str(
                                                            "    mov eax, dword ptr [r10+rdx*4]\n",
                                                        );
                                                    }
                                                    emit_arc_release_from_eax(out);
                                                }
                                                out.push_str(&format!(
                                                    "    mov rax, qword ptr [rsp+{}]\n",
                                                    tmp
                                                ));
                                            }
                                            if is_static_field {
                                                if let Some(setter_sym) =
                                                    &same_class_static_setter_sym
                                                {
                                                    if field_uses_qword {
                                                        out.push_str("    mov rcx, rax\n");
                                                    } else {
                                                        out.push_str("    mov ecx, eax\n");
                                                    }
                                                    out.push_str(&format!(
                                                        "    call {}\n",
                                                        setter_sym
                                                    ));
                                                } else if field_uses_qword {
                                                    out.push_str(&format!(
                                                        "    mov qword ptr [{}], rax\n",
                                                        field_sym
                                                    ));
                                                } else {
                                                    out.push_str(&format!(
                                                        "    mov dword ptr [{}], eax\n",
                                                        field_sym
                                                    ));
                                                }
                                            } else {
                                                if is_local_same_class {
                                                    let local_name = match &obj_val.kind {
                                                        IrValueKind::LocalRef(name) => name,
                                                        _ => unreachable!(),
                                                    };
                                                    if let Some(slot) =
                                                        local_offsets.get(local_name)
                                                    {
                                                        let offset = masm_local_base_offset(method)
                                                            + (slot * 8);
                                                        out.push_str(&format!(
                                                            "    mov edx, dword ptr [rsp+{}]\n",
                                                            offset
                                                        ));
                                                    } else if let Some(offset) =
                                                        param_offsets.get(local_name)
                                                    {
                                                        out.push_str(&format!(
                                                            "    mov edx, dword ptr [rsp+{}]\n",
                                                            offset
                                                        ));
                                                    } else {
                                                        return Err(format!(
                                                        "Unsupported local receiver '{}' in masm-full member write",
                                                        local_name
                                                    ));
                                                    }
                                                } else if let Some(this_offset) =
                                                    param_offsets.get("__this")
                                                {
                                                    out.push_str(&format!(
                                                        "    mov edx, dword ptr [rsp+{}]\n",
                                                        this_offset
                                                    ));
                                                } else {
                                                    out.push_str("    mov edx, ecx\n");
                                                }
                                                out.push_str(&format!(
                                                    "    cmp edx, {}\n",
                                                    OBJECT_SLOT_CAPACITY
                                                ));
                                                out.push_str("    jbe @F\n");
                                                out.push_str(&format!(
                                                    "    mov edx, {}\n",
                                                    OBJECT_SLOT_CAPACITY
                                                ));
                                                out.push_str("@@:\n");
                                                out.push_str(&format!(
                                                    "    mov r10, qword ptr [{}]\n",
                                                    field_sym
                                                ));
                                                if field_uses_qword {
                                                    out.push_str(
                                                        "    mov qword ptr [r10+rdx*8], rax\n",
                                                    );
                                                } else {
                                                    out.push_str(
                                                        "    mov dword ptr [r10+rdx*4], eax\n",
                                                    );
                                                }
                                            }
                                            i += 2;
                                            continue;
                                        }
                                        i += 1;
                                        continue;
                                    }
                                    if let Some((owner_package, owner_class)) = static_owner {
                                        let field_ty = target_v.ty.clone();
                                        if lowered_assignment_target_matches_rhs(
                                            method,
                                            *value,
                                            &field_ty,
                                            current_class_name,
                                            class_names,
                                            &local_types,
                                            field_types,
                                            method_symbols_by_sig,
                                        ) {
                                            let field_uses_qword =
                                                uses_qword_field_storage(&field_ty);
                                            let setter_sym = mangle_static_field_setter_symbol(
                                                &owner_package,
                                                &owner_class,
                                                member,
                                            );
                                            emit_value_to_eax_masm(
                                                out,
                                                method,
                                                *value,
                                                method.is_static,
                                                current_package_name,
                                                current_class_name,
                                                method_symbols,
                                                method_staticness,
                                                method_symbols_by_sig,
                                                method_staticness_by_sig,
                                                stdlib_symbols,
                                                class_names,
                                                field_symbols,
                                                field_is_static,
                                                field_types,
                                                class_object_counter_symbol,
                                                &local_offsets,
                                                &param_offsets,
                                                print_literals,
                                            )?;
                                            if field_uses_qword {
                                                out.push_str("    mov rcx, rax\n");
                                            } else {
                                                out.push_str("    mov ecx, eax\n");
                                            }
                                            out.push_str(&format!("    call {}\n", setter_sym));
                                            i += 2;
                                            continue;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }

            if let IrValueKind::MemberAccess { object, member } = &v.kind {
                if let Some(IrInstr::Eval {
                    value: rhs_value,
                    source: rhs_source,
                }) = block.instructions.get(i + 1)
                {
                    if rhs_source.statement_index == source.statement_index {
                        if let Some(obj_val) = method.values.get(*object as usize) {
                            let is_this = matches!(
                                obj_val.kind,
                                IrValueKind::ThisRef | IrValueKind::SuperRef
                            );
                            let is_local_same_class = match &obj_val.kind {
                                IrValueKind::LocalRef(name) => local_types
                                    .get(name)
                                    .map(|ty| ty == current_class_name)
                                    .unwrap_or(false),
                                _ => false,
                            };
                            let static_owner = resolve_static_field_owner(
                                method,
                                *object,
                                current_package_name,
                                current_class_name,
                                &local_types,
                                class_names,
                            );
                            let is_same_class_static_owner = static_owner
                                .as_ref()
                                .map(|(package, class_name)| {
                                    package == current_package_name
                                        && class_name == current_class_name
                                })
                                .unwrap_or(false);
                            if is_this || is_local_same_class || is_same_class_static_owner {
                                let field_sym = field_symbols.get(member).ok_or_else(|| {
                                    format!(
                                        "Unknown field symbol '{}.{}'",
                                        current_class_name, member
                                    )
                                })?;
                                let is_static_field =
                                    *field_is_static.get(member).unwrap_or(&false);
                                let field_ty = field_types
                                    .get(member)
                                    .cloned()
                                    .unwrap_or_else(|| "unknown".to_string());
                                let same_class_static_setter_sym = if is_static_field {
                                    let (owner_package, owner_class) =
                                        split_owner_package_and_class(current_class_name)
                                            .unwrap_or_else(|| {
                                                (
                                                    current_package_name.to_string(),
                                                    current_class_name.to_string(),
                                                )
                                            });
                                    Some(mangle_static_field_setter_symbol(
                                        &owner_package,
                                        &owner_class,
                                        member,
                                    ))
                                } else {
                                    None
                                };
                                if !lowered_assignment_target_matches_rhs(
                                    method,
                                    *rhs_value,
                                    &field_ty,
                                    current_class_name,
                                    class_names,
                                    &local_types,
                                    field_types,
                                    method_symbols_by_sig,
                                ) {
                                    i += 1;
                                    continue;
                                }
                                let field_uses_qword = uses_qword_field_storage(&field_ty);
                                let field_is_arc = is_arc_managed_type_name(&field_ty)
                                    || raw_runtime_handle_field(current_class_name, member);
                                emit_value_to_eax_masm(
                                    out,
                                    method,
                                    *rhs_value,
                                    method.is_static,
                                    current_package_name,
                                    current_class_name,
                                    method_symbols,
                                    method_staticness,
                                    method_symbols_by_sig,
                                    method_staticness_by_sig,
                                    stdlib_symbols,
                                    class_names,
                                    field_symbols,
                                    field_is_static,
                                    field_types,
                                    class_object_counter_symbol,
                                    &local_offsets,
                                    &param_offsets,
                                    print_literals,
                                )?;
                                if field_is_arc {
                                    let tmp = masm_arc_local_tmp_offset(method);
                                    out.push_str(&format!(
                                        "    mov qword ptr [rsp+{}], rax\n",
                                        tmp
                                    ));
                                    if is_static_field {
                                        out.push_str(&format!(
                                            "    mov rax, qword ptr [rsp+{}]\n",
                                            tmp
                                        ));
                                    } else {
                                        emit_arc_retain_from_eax(out);
                                        if is_local_same_class {
                                            let local_name = match &obj_val.kind {
                                                IrValueKind::LocalRef(name) => name,
                                                _ => unreachable!(),
                                            };
                                            if let Some(slot) = local_offsets.get(local_name) {
                                                let offset =
                                                    masm_local_base_offset(method) + (slot * 8);
                                                out.push_str(&format!(
                                                    "    mov edx, dword ptr [rsp+{}]\n",
                                                    offset
                                                ));
                                            } else if let Some(offset) =
                                                param_offsets.get(local_name)
                                            {
                                                out.push_str(&format!(
                                                    "    mov edx, dword ptr [rsp+{}]\n",
                                                    offset
                                                ));
                                            } else {
                                                return Err(format!(
                                                    "Unsupported local receiver '{}' in masm-full member write",
                                                    local_name
                                                ));
                                            }
                                        } else if let Some(this_offset) =
                                            param_offsets.get("__this")
                                        {
                                            out.push_str(&format!(
                                                "    mov edx, dword ptr [rsp+{}]\n",
                                                this_offset
                                            ));
                                        } else {
                                            out.push_str("    mov edx, ecx\n");
                                        }
                                        out.push_str(&format!(
                                            "    cmp edx, {}\n",
                                            OBJECT_SLOT_CAPACITY
                                        ));
                                        out.push_str("    jbe @F\n");
                                        out.push_str(&format!(
                                            "    mov edx, {}\n",
                                            OBJECT_SLOT_CAPACITY
                                        ));
                                        out.push_str("@@:\n");
                                        out.push_str(&format!(
                                            "    mov r10, qword ptr [{}]\n",
                                            field_sym
                                        ));
                                        if field_uses_qword {
                                            out.push_str("    mov rax, qword ptr [r10+rdx*8]\n");
                                        } else {
                                            out.push_str("    mov eax, dword ptr [r10+rdx*4]\n");
                                        }
                                        emit_arc_release_from_eax(out);
                                    }
                                    out.push_str(&format!(
                                        "    mov rax, qword ptr [rsp+{}]\n",
                                        tmp
                                    ));
                                }
                                if is_static_field {
                                    if let Some(setter_sym) = &same_class_static_setter_sym {
                                        if field_uses_qword {
                                            out.push_str("    mov rcx, rax\n");
                                        } else {
                                            out.push_str("    mov ecx, eax\n");
                                        }
                                        out.push_str(&format!("    call {}\n", setter_sym));
                                    } else if field_uses_qword {
                                        out.push_str(&format!(
                                            "    mov qword ptr [{}], rax\n",
                                            field_sym
                                        ));
                                    } else {
                                        out.push_str(&format!(
                                            "    mov dword ptr [{}], eax\n",
                                            field_sym
                                        ));
                                    }
                                } else {
                                    if is_local_same_class {
                                        let local_name = match &obj_val.kind {
                                            IrValueKind::LocalRef(name) => name,
                                            _ => unreachable!(),
                                        };
                                        if let Some(slot) = local_offsets.get(local_name) {
                                            let offset =
                                                masm_local_base_offset(method) + (slot * 8);
                                            out.push_str(&format!(
                                                "    mov edx, dword ptr [rsp+{}]\n",
                                                offset
                                            ));
                                        } else if let Some(offset) = param_offsets.get(local_name) {
                                            out.push_str(&format!(
                                                "    mov edx, dword ptr [rsp+{}]\n",
                                                offset
                                            ));
                                        } else {
                                            return Err(format!(
                                                "Unsupported local receiver '{}' in masm-full member write",
                                                local_name
                                            ));
                                        }
                                    } else if let Some(this_offset) = param_offsets.get("__this") {
                                        out.push_str(&format!(
                                            "    mov edx, dword ptr [rsp+{}]\n",
                                            this_offset
                                        ));
                                    } else {
                                        out.push_str("    mov edx, ecx\n");
                                    }
                                    out.push_str(&format!(
                                        "    cmp edx, {}\n",
                                        OBJECT_SLOT_CAPACITY
                                    ));
                                    out.push_str("    jbe @F\n");
                                    out.push_str(&format!(
                                        "    mov edx, {}\n",
                                        OBJECT_SLOT_CAPACITY
                                    ));
                                    out.push_str("@@:\n");
                                    out.push_str(&format!(
                                        "    mov r10, qword ptr [{}]\n",
                                        field_sym
                                    ));
                                    if field_uses_qword {
                                        out.push_str("    mov qword ptr [r10+rdx*8], rax\n");
                                    } else {
                                        out.push_str("    mov dword ptr [r10+rdx*4], eax\n");
                                    }
                                }
                                i += 2;
                                continue;
                            }
                            if let Some((owner_package, owner_class)) = static_owner {
                                let field_ty = v.ty.clone();
                                let field_uses_qword = uses_qword_field_storage(&field_ty);
                                let setter_sym = mangle_static_field_setter_symbol(
                                    &owner_package,
                                    &owner_class,
                                    member,
                                );
                                emit_value_to_eax_masm(
                                    out,
                                    method,
                                    *rhs_value,
                                    method.is_static,
                                    current_package_name,
                                    current_class_name,
                                    method_symbols,
                                    method_staticness,
                                    method_symbols_by_sig,
                                    method_staticness_by_sig,
                                    stdlib_symbols,
                                    class_names,
                                    field_symbols,
                                    field_is_static,
                                    field_types,
                                    class_object_counter_symbol,
                                    &local_offsets,
                                    &param_offsets,
                                    print_literals,
                                )?;
                                if field_uses_qword {
                                    out.push_str("    mov rcx, rax\n");
                                } else {
                                    out.push_str("    mov ecx, eax\n");
                                }
                                out.push_str(&format!("    call {}\n", setter_sym));
                                i += 2;
                                continue;
                            }
                        }
                    }
                }
            }
            let IrValueKind::Call { callee, args } = &v.kind else {
                emit_value_to_eax_masm(
                    out,
                    method,
                    *value,
                    method.is_static,
                    current_package_name,
                    current_class_name,
                    method_symbols,
                    method_staticness,
                    method_symbols_by_sig,
                    method_staticness_by_sig,
                    stdlib_symbols,
                    class_names,
                    field_symbols,
                    field_is_static,
                    field_types,
                    class_object_counter_symbol,
                    &local_offsets,
                    &param_offsets,
                    print_literals,
                )?;
                i += 1;
                continue;
            };
            let Some(callee_v) = method.values.get(*callee as usize) else {
                i += 1;
                continue;
            };
            if let IrValueKind::LocalRef(member_name) = &callee_v.kind {
                let owner = current_class_name.to_string();
                if let Some(is_target_static) = resolve_method_staticness_for_call(
                    &owner,
                    member_name,
                    args,
                    method,
                    method_staticness,
                    method_staticness_by_sig,
                ) {
                    let expected_sig = resolve_method_call_signature_for_call(
                        &owner,
                        member_name,
                        args,
                        method,
                        current_class_name,
                        class_names,
                        field_types,
                        method_symbols_by_sig,
                    );
                    let arc_arg_flags = emit_call_args_with_arc_boundary(
                        out,
                        method,
                        args,
                        if is_target_static { 0 } else { 1 },
                        method.is_static,
                        current_package_name,
                        current_class_name,
                        method_symbols,
                        method_staticness,
                        method_symbols_by_sig,
                        method_staticness_by_sig,
                        stdlib_symbols,
                        class_names,
                        field_symbols,
                        field_is_static,
                        field_types,
                        class_object_counter_symbol,
                        &local_types,
                        expected_sig.as_ref().map(|(types, _)| types.as_slice()),
                        expected_sig
                            .as_ref()
                            .map(|(_, is_varargs)| *is_varargs)
                            .unwrap_or(false),
                        &local_offsets,
                        &param_offsets,
                        print_literals,
                    )?;
                    if !is_target_static {
                        if let Some(this_offset) = param_offsets.get("__this") {
                            out.push_str(&format!(
                                "    mov rcx, qword ptr [rsp+{}]\n",
                                this_offset
                            ));
                        } else {
                            out.push_str("    mov rcx, 1\n");
                        }
                    }
                    if is_target_static {
                        let target = resolve_method_symbol_for_call(
                            &owner,
                            member_name,
                            args,
                            method,
                            current_class_name,
                            class_names,
                            field_types,
                            method_symbols,
                            method_symbols_by_sig,
                        )
                        .ok_or_else(|| {
                            format!("Unknown call target '{}.{}'", owner, member_name)
                        })?;
                        out.push_str(&format!("    call {}\n", target));
                    } else {
                        if is_devirtualizable_instance_call(&owner, member_name, args, method) {
                            let target = resolve_method_symbol_for_call(
                                &owner,
                                member_name,
                                args,
                                method,
                                current_class_name,
                                class_names,
                                field_types,
                                method_symbols,
                                method_symbols_by_sig,
                            )
                            .ok_or_else(|| {
                                format!("Unknown call target '{}.{}'", owner, member_name)
                            })?;
                            out.push_str(&format!("    call {}\n", target));
                        } else {
                            let (default_target, overrides) = collect_virtual_dispatch_overrides(
                                &owner,
                                member_name,
                                args,
                                method,
                                current_class_name,
                                class_names,
                                field_types,
                                method_symbols,
                                method_symbols_by_sig,
                            )?;
                            let assignable_class_ids = collect_instanceof_class_ids(&owner);
                            let label_seed = format!(
                                "{}_vd_stmt_{}_{}_{}",
                                method_symbol, block.id, source.statement_index, i
                            );
                            emit_virtual_dispatch_call(
                                out,
                                &label_seed,
                                &default_target,
                                &assignable_class_ids,
                                &overrides,
                            );
                        }
                    }
                    emit_call_arg_releases(out, method, &arc_arg_flags);
                    i += 1;
                    continue;
                }
            }
            let IrValueKind::MemberAccess { object, member } = &callee_v.kind else {
                i += 1;
                continue;
            };
            let Some(object_v) = method.values.get(*object as usize) else {
                i += 1;
                continue;
            };
            let mut is_super_receiver = false;
            let owner = match &object_v.kind {
                IrValueKind::StringLiteral(_) => "String".to_string(),
                IrValueKind::LocalRef(owner) => owner.clone(),
                IrValueKind::NewObject { class_name, .. } => class_name.clone(),
                IrValueKind::ThisRef => current_class_name.to_string(),
                IrValueKind::SuperRef => {
                    is_super_receiver = true;
                    class_super_of(current_class_name)
                        .unwrap_or_else(|| current_class_name.to_string())
                }
                IrValueKind::MemberAccess {
                    object: owner_object,
                    member: owner_member,
                } => {
                    if owner_member == "out" {
                        let Some(base_v) = method.values.get(*owner_object as usize) else {
                            i += 1;
                            continue;
                        };
                        if matches!(&base_v.kind, IrValueKind::LocalRef(name) if name == "System") {
                            "System.out".to_string()
                        } else {
                            i += 1;
                            continue;
                        }
                    } else if let Some(normalized) =
                        normalize_class_owner_name(&object_v.ty, class_names)
                    {
                        normalized
                    } else if let Some(ty) = field_types.get(owner_member) {
                        normalize_class_owner_name(ty, class_names).unwrap_or_else(|| ty.clone())
                    } else if let Some(path) = value_dotted_path(method, *object) {
                        path
                    } else {
                        i += 1;
                        continue;
                    }
                }
                IrValueKind::Call { callee, .. } => {
                    if let Some(normalized) = normalize_class_owner_name(&object_v.ty, class_names)
                    {
                        normalized
                    } else {
                        let Some(callee_value) = method.values.get(*callee as usize) else {
                            i += 1;
                            continue;
                        };
                        if let IrValueKind::LocalRef(name) = &callee_value.kind {
                            name.clone()
                        } else {
                            i += 1;
                            continue;
                        }
                    }
                }
                _ => {
                    i += 1;
                    continue;
                }
            };

            if let Some(newline) = console_intrinsic_newline(&owner, member) {
                if args.len() != 1 {
                    return Err(format!(
                        "{}.{} currently supports one argument",
                        owner, member
                    ));
                }
                emit_value_to_eax_masm(
                    out,
                    method,
                    args[0],
                    method.is_static,
                    current_package_name,
                    current_class_name,
                    method_symbols,
                    method_staticness,
                    method_symbols_by_sig,
                    method_staticness_by_sig,
                    stdlib_symbols,
                    class_names,
                    field_symbols,
                    field_is_static,
                    field_types,
                    class_object_counter_symbol,
                    &local_offsets,
                    &param_offsets,
                    print_literals,
                )?;
                let arg_ty = resolve_backend_runtime_value_type(
                    method,
                    args[0],
                    current_class_name,
                    class_names,
                    &local_types,
                    field_types,
                    method_symbols_by_sig,
                )
                .ok_or_else(|| format!("Invalid {}.{} arg", owner, member))?;
                if !(arg_ty == "String"
                    || arg_ty.ends_with(".String")
                    || arg_ty == "pulse.lang.String")
                {
                    return Err(format!(
                        "Unsupported {}.{} argument type '{}' in masm-full",
                        owner, member, arg_ty
                    ));
                }
                let target = if newline {
                    "pulsec_rt_consoleWriteLine"
                } else {
                    "pulsec_rt_consoleWrite"
                };
                out.push_str("    mov rcx, rax\n");
                out.push_str(&format!("    call {}\n", target));
                i += 1;
                continue;
            }

            let std_owner = normalize_stdlib_owner(&owner).to_string();
            if let Some(std_sym) = stdlib_symbols.get(&(std_owner, member.clone())) {
                let arc_arg_flags = emit_call_args_with_arc_boundary(
                    out,
                    method,
                    args,
                    0,
                    method.is_static,
                    current_package_name,
                    current_class_name,
                    method_symbols,
                    method_staticness,
                    method_symbols_by_sig,
                    method_staticness_by_sig,
                    stdlib_symbols,
                    class_names,
                    field_symbols,
                    field_is_static,
                    field_types,
                    class_object_counter_symbol,
                    &local_types,
                    None,
                    false,
                    &local_offsets,
                    &param_offsets,
                    print_literals,
                )?;
                out.push_str(&format!("    call {}\n", std_sym));
                emit_call_arg_releases(out, method, &arc_arg_flags);
                i += 1;
                continue;
            }

            let resolved_owner = if owner == "System.out" || owner == "System.err" {
                normalize_class_owner_name("PrintStream", class_names)
                    .unwrap_or_else(|| "PrintStream".to_string())
            } else if let Some(normalized) = normalize_class_owner_name(&owner, class_names) {
                normalized
            } else if let Some(normalized) = normalize_class_owner_name(&object_v.ty, class_names) {
                normalized
            } else if let Some(field_ty) = field_types.get(&owner) {
                normalize_class_owner_name(field_ty, class_names)
                    .unwrap_or_else(|| field_ty.clone())
            } else if let Some(local_ty) = local_types.get(&owner) {
                normalize_class_owner_name(local_ty, class_names)
                    .unwrap_or_else(|| local_ty.clone())
            } else {
                owner.clone()
            };
            if normalize_class_owner_name(&resolved_owner, class_names).is_none() {
                return Err(format!("Unknown static call owner '{}'", owner));
            }
            let is_target_static = resolve_method_staticness_for_call(
                &resolved_owner,
                member,
                args,
                method,
                method_staticness,
                method_staticness_by_sig,
            )
            .ok_or_else(|| {
                format!(
                    "Unknown staticness for target '{}.{}'",
                    resolved_owner, member
                )
            })?;
            let expected_sig = resolve_method_call_signature_for_call(
                &resolved_owner,
                member,
                args,
                method,
                current_class_name,
                class_names,
                field_types,
                method_symbols_by_sig,
            );
            let arc_arg_flags = emit_call_args_with_arc_boundary(
                out,
                method,
                args,
                if is_target_static { 0 } else { 1 },
                method.is_static,
                current_package_name,
                current_class_name,
                method_symbols,
                method_staticness,
                method_symbols_by_sig,
                method_staticness_by_sig,
                stdlib_symbols,
                class_names,
                field_symbols,
                field_is_static,
                field_types,
                class_object_counter_symbol,
                &local_types,
                expected_sig.as_ref().map(|(types, _)| types.as_slice()),
                expected_sig
                    .as_ref()
                    .map(|(_, is_varargs)| *is_varargs)
                    .unwrap_or(false),
                &local_offsets,
                &param_offsets,
                print_literals,
            )?;
            if !is_target_static {
                if is_super_receiver || owner == "this" || owner == current_class_name {
                    if method.is_static {
                        out.push_str("    mov ecx, 1\n");
                    } else if let Some(this_offset) = param_offsets.get("__this") {
                        out.push_str(&format!("    mov rcx, qword ptr [rsp+{}]\n", this_offset));
                    }
                } else {
                    emit_preserve_call_arg_registers(out, method);
                    emit_preserve_nested_arg_spills(out, method, arc_arg_flags.len());
                    with_nested_arg_preserve_depth(|| {
                        emit_value_to_eax_masm(
                            out,
                            method,
                            *object,
                            method.is_static,
                            current_package_name,
                            current_class_name,
                            method_symbols,
                            method_staticness,
                            method_symbols_by_sig,
                            method_staticness_by_sig,
                            stdlib_symbols,
                            class_names,
                            field_symbols,
                            field_is_static,
                            field_types,
                            class_object_counter_symbol,
                            &local_offsets,
                            &param_offsets,
                            print_literals,
                        )
                    })?;
                    emit_restore_nested_arg_spills_preserving_rax(out, method, arc_arg_flags.len());
                    out.push_str("    mov rcx, rax\n");
                    emit_restore_call_arg_registers(out, method);
                }
            }
            let devirt = !is_target_static
                && !is_super_receiver
                && is_devirtualizable_instance_call(&resolved_owner, member, args, method);
            if is_target_static || is_super_receiver || devirt {
                let target = resolve_method_symbol_for_call(
                    &resolved_owner,
                    member,
                    args,
                    method,
                    current_class_name,
                    class_names,
                    field_types,
                    method_symbols,
                    method_symbols_by_sig,
                )
                .ok_or_else(|| format!("Unknown static target '{}.{}'", resolved_owner, member))?;
                out.push_str(&format!("    call {}\n", target));
            } else {
                let (default_target, overrides) = collect_virtual_dispatch_overrides(
                    &resolved_owner,
                    member,
                    args,
                    method,
                    current_class_name,
                    class_names,
                    field_types,
                    method_symbols,
                    method_symbols_by_sig,
                )?;
                let assignable_class_ids = collect_instanceof_class_ids(&resolved_owner);
                let label_seed = format!(
                    "{}_vd_stmt_{}_{}_{}",
                    method_symbol, block.id, source.statement_index, i
                );
                emit_virtual_dispatch_call(
                    out,
                    &label_seed,
                    &default_target,
                    &assignable_class_ids,
                    &overrides,
                );
            }
            emit_call_arg_releases(out, method, &arc_arg_flags);
            i += 1;
        }

        if trace_enabled {
            match &block.terminator {
                IrTerminator::Goto { source, .. }
                | IrTerminator::Branch { source, .. }
                | IrTerminator::Return { source, .. }
                | IrTerminator::Throw { source, .. } => {
                    emit_trace_update_for_source(
                        out,
                        method_symbol,
                        source,
                        &mut last_trace_statement,
                    );
                }
                IrTerminator::Stop => {}
            }
        }

        match &block.terminator {
            IrTerminator::Goto { target, .. } => {
                out.push_str(&format!("    jmp {}_b{}\n", method_symbol, target));
            }
            IrTerminator::Branch {
                condition,
                then_target,
                else_target,
                ..
            } => {
                emit_value_to_eax_masm(
                    out,
                    method,
                    *condition,
                    method.is_static,
                    current_package_name,
                    current_class_name,
                    method_symbols,
                    method_staticness,
                    method_symbols_by_sig,
                    method_staticness_by_sig,
                    stdlib_symbols,
                    class_names,
                    field_symbols,
                    field_is_static,
                    field_types,
                    class_object_counter_symbol,
                    &local_offsets,
                    &param_offsets,
                    print_literals,
                )?;
                out.push_str("    test eax, eax\n");
                out.push_str(&format!("    jne {}_b{}\n", method_symbol, then_target));
                out.push_str(&format!("    jmp {}_b{}\n", method_symbol, else_target));
            }
            IrTerminator::Return { value, .. } => {
                if let Some(value_id) = value {
                    emit_value_to_eax_masm(
                        out,
                        method,
                        *value_id,
                        method.is_static,
                        current_package_name,
                        current_class_name,
                        method_symbols,
                        method_staticness,
                        method_symbols_by_sig,
                        method_staticness_by_sig,
                        stdlib_symbols,
                        class_names,
                        field_symbols,
                        field_is_static,
                        field_types,
                        class_object_counter_symbol,
                        &local_offsets,
                        &param_offsets,
                        print_literals,
                    )?;
                    if value_is_arc_managed(
                        method,
                        *value_id,
                        &local_types,
                        field_types,
                        current_class_name,
                    ) && value_requires_arc_retain_on_return(method, *value_id)
                    {
                        emit_arc_retain_from_eax(out);
                    }
                } else if method.is_constructor {
                    if let Some(this_offset) = param_offsets.get("__this") {
                        out.push_str(&format!("    mov rax, qword ptr [rsp+{}]\n", this_offset));
                    } else {
                        out.push_str("    mov rax, rcx\n");
                    }
                } else {
                    out.push_str("    xor eax, eax\n");
                }
                out.push_str(&format!("    jmp {}\n", epilogue_label));
            }
            IrTerminator::Throw { value, .. } => {
                emit_value_to_eax_masm(
                    out,
                    method,
                    *value,
                    method.is_static,
                    current_package_name,
                    current_class_name,
                    method_symbols,
                    method_staticness,
                    method_symbols_by_sig,
                    method_staticness_by_sig,
                    stdlib_symbols,
                    class_names,
                    field_symbols,
                    field_is_static,
                    field_types,
                    class_object_counter_symbol,
                    &local_offsets,
                    &param_offsets,
                    print_literals,
                )?;
                out.push_str("    mov rcx, rax\n");
                out.push_str(&format!("    call {}\n", EXC_THROW_SYMBOL));
                out.push_str("    mov rcx, rax\n");
                let panic_target = resolve_method_symbol_for_call(
                    "Throwable",
                    "panic",
                    &[],
                    method,
                    current_class_name,
                    class_names,
                    field_types,
                    method_symbols,
                    method_symbols_by_sig,
                )
                .or_else(|| {
                    resolve_method_symbol_for_call(
                        "pulse.lang.Throwable",
                        "panic",
                        &[],
                        method,
                        current_class_name,
                        class_names,
                        field_types,
                        method_symbols,
                        method_symbols_by_sig,
                    )
                })
                .ok_or_else(|| "Missing Throwable.panic runtime target".to_string())?;
                out.push_str(&format!("    call {}\n", panic_target));
                out.push_str("    xor eax, eax\n");
                out.push_str(&format!("    jmp {}\n", epilogue_label));
            }
            IrTerminator::Stop => {
                if method.is_constructor {
                    if let Some(this_offset) = param_offsets.get("__this") {
                        out.push_str(&format!("    mov rax, qword ptr [rsp+{}]\n", this_offset));
                    } else {
                        out.push_str("    mov rax, rcx\n");
                    }
                } else {
                    out.push_str("    xor eax, eax\n");
                }
                out.push_str(&format!("    jmp {}\n", epilogue_label));
            }
        }
    }

    out.push_str(&format!("{}:\n", epilogue_label));
    let epilogue_ret_spill = masm_call_retval_spill_offset(method);
    out.push_str(&format!(
        "    mov qword ptr [rsp+{}], rax\n",
        epilogue_ret_spill
    ));
    let mut releasable_locals = local_offsets
        .iter()
        .filter_map(|(name, slot)| {
            let ty = local_types.get(name)?;
            if initialized_arc_locals.contains(name)
                && (is_arc_managed_type_name(ty) || is_wrapper_type_name(ty))
            {
                Some((*slot, local_base + (slot * 8)))
            } else {
                None
            }
        })
        .collect::<Vec<_>>();
    releasable_locals.sort_unstable_by_key(|(slot, _)| *slot);
    for (_, offset) in releasable_locals {
        out.push_str(&format!("    mov rax, qword ptr [rsp+{}]\n", offset));
        emit_arc_release_from_eax(out);
    }
    for param in &method.params {
        if !initialized_arc_params.contains(&param.name) {
            continue;
        }
        if !(is_arc_managed_type_name(&param.ty) || is_wrapper_type_name(&param.ty)) {
            continue;
        }
        let Some(offset) = param_offsets.get(&param.name) else {
            continue;
        };
        out.push_str(&format!("    mov rax, qword ptr [rsp+{}]\n", offset));
        emit_arc_release_from_eax(out);
    }
    out.push_str(&format!(
        "    mov rax, qword ptr [rsp+{}]\n",
        epilogue_ret_spill
    ));
    Ok(())
}

pub(crate) fn arg_register32(idx: usize) -> &'static str {
    match idx {
        0 => "ecx",
        1 => "edx",
        2 => "r8d",
        3 => "r9d",
        _ => "ecx",
    }
}

pub(crate) fn arg_register64(idx: usize) -> &'static str {
    match idx {
        0 => "rcx",
        1 => "rdx",
        2 => "r8",
        3 => "r9",
        _ => "rcx",
    }
}

pub(crate) fn emit_value_to_eax_masm(
    out: &mut String,
    method: &IrMethod,
    value_id: IrValueId,
    current_method_is_static: bool,
    current_package_name: &str,
    current_class_name: &str,
    method_symbols: &HashMap<(String, String), String>,
    method_staticness: &HashMap<(String, String), bool>,
    method_symbols_by_sig: &HashMap<(String, String, Vec<String>), String>,
    method_staticness_by_sig: &HashMap<(String, String, Vec<String>), bool>,
    stdlib_symbols: &HashMap<(String, String), String>,
    class_names: &[String],
    field_symbols: &HashMap<String, String>,
    field_is_static: &HashMap<String, bool>,
    field_types: &HashMap<String, String>,
    class_object_counter_symbol: &str,
    local_offsets: &HashMap<String, usize>,
    param_offsets: &HashMap<String, usize>,
    string_literals: &mut Vec<String>,
) -> Result<(), String> {
    let value = method
        .values
        .get(value_id as usize)
        .ok_or_else(|| format!("Invalid value id {}", value_id))?;
    let mut local_types: HashMap<String, String> = method
        .params
        .iter()
        .map(|p| (p.name.clone(), p.ty.clone()))
        .collect();
    for block in &method.blocks {
        for instr in &block.instructions {
            if let IrInstr::DeclareLocal { name, ty, .. } = instr {
                local_types.insert(name.clone(), ty.clone());
            }
        }
    }
    match &value.kind {
        IrValueKind::IntLiteral(i) => {
            let normalized_ty = normalize_type_token(&value.ty);
            if normalized_ty == "float" {
                out.push_str(&format!("    mov eax, {}\n", *i as i32));
                out.push_str("    movd xmm0, eax\n");
                out.push_str("    cvtss2sd xmm0, xmm0\n");
                out.push_str("    movq rax, xmm0\n");
            } else if normalized_ty == "double" {
                out.push_str(&format!("    mov rax, {}\n", *i));
            } else if uses_qword_scalar_type_name(&value.ty) {
                out.push_str(&format!("    mov rax, {}\n", *i));
            } else {
                out.push_str(&format!("    mov eax, {}\n", *i as i32));
            }
            Ok(())
        }
        IrValueKind::BoolLiteral(b) => {
            out.push_str(&format!("    mov eax, {}\n", if *b { 1 } else { 0 }));
            Ok(())
        }
        IrValueKind::StringLiteral(s) => {
            let idx = string_literals.len();
            string_literals.push(s.clone());
            out.push_str(&format!("    lea rcx, msg{}\n", idx));
            out.push_str(&format!("    mov edx, msg{}_len\n", idx));
            out.push_str("    call pulsec_rt_stringFromBytes\n");
            Ok(())
        }
        IrValueKind::NullLiteral => {
            out.push_str("    xor eax, eax\n");
            Ok(())
        }
        IrValueKind::LocalRef(name) => {
            let local_ty = lookup_local_decl_type(method, name)
                .or_else(|| local_types.get(name).cloned())
                .unwrap_or_default();
            let wrapper_local_holds_boxed_object = is_wrapper_type_name(&local_ty)
                && wrapper_value_is_boxed_object(
                    method,
                    value.id,
                    current_class_name,
                    class_names,
                    &local_types,
                    field_types,
                    method_symbols_by_sig,
                );
            let is_wide_local = uses_qword_scalar_type_name(&local_ty)
                || is_handle_type_name(&local_ty)
                || wrapper_local_holds_boxed_object;
            if let Some(slot) = local_offsets.get(name) {
                let offset = masm_local_base_offset(method) + (slot * 8);
                if is_wide_local {
                    out.push_str(&format!("    mov rax, qword ptr [rsp+{}]\n", offset));
                } else {
                    out.push_str(&format!("    mov eax, dword ptr [rsp+{}]\n", offset));
                }
                return Ok(());
            }
            if let Some(offset) = param_offsets.get(name) {
                if is_wide_local {
                    out.push_str(&format!("    mov rax, qword ptr [rsp+{}]\n", offset));
                } else {
                    out.push_str(&format!("    mov eax, dword ptr [rsp+{}]\n", offset));
                }
                return Ok(());
            }
            if let Some(field_sym) = field_symbols.get(name) {
                let is_static_field = *field_is_static.get(name).unwrap_or(&false);
                let field_ty = field_types
                    .get(name)
                    .cloned()
                    .unwrap_or_else(|| "unknown".to_string());
                let field_uses_qword = uses_qword_field_storage(&field_ty);
                if is_static_field {
                    let getter_sym = mangle_static_field_getter_symbol(
                        current_package_name,
                        current_class_name,
                        name,
                    );
                    out.push_str(&format!("    call {}\n", getter_sym));
                } else if let Some(this_offset) = param_offsets.get("__this") {
                    out.push_str(&format!("    mov edx, dword ptr [rsp+{}]\n", this_offset));
                    out.push_str(&format!("    cmp edx, {}\n", OBJECT_SLOT_CAPACITY));
                    out.push_str("    jbe @F\n");
                    out.push_str(&format!("    mov edx, {}\n", OBJECT_SLOT_CAPACITY));
                    out.push_str("@@:\n");
                    out.push_str(&format!("    mov r10, qword ptr [{}]\n", field_sym));
                    if field_uses_qword {
                        out.push_str("    mov rax, qword ptr [r10+rdx*8]\n");
                    } else {
                        out.push_str("    mov eax, dword ptr [r10+rdx*4]\n");
                    }
                } else {
                    out.push_str("    mov rax, rcx\n");
                }
                return Ok(());
            }
            let idx = method
                .params
                .iter()
                .position(|p| p.name == *name)
                .ok_or_else(|| format!("Unsupported local ref '{}' in masm-full", name))?;
            let reg_idx = if current_method_is_static {
                idx
            } else {
                idx + 1
            };
            if is_wide_local {
                out.push_str(&format!("    mov rax, {}\n", arg_register64(reg_idx)));
            } else {
                out.push_str(&format!("    mov eax, {}\n", arg_register32(reg_idx)));
            }
            Ok(())
        }
        IrValueKind::ThisRef => {
            if let Some(this_offset) = param_offsets.get("__this") {
                out.push_str(&format!("    mov rax, qword ptr [rsp+{}]\n", this_offset));
            } else {
                out.push_str("    mov rax, rcx\n");
            }
            Ok(())
        }
        IrValueKind::SuperRef => {
            if let Some(this_offset) = param_offsets.get("__this") {
                out.push_str(&format!("    mov rax, qword ptr [rsp+{}]\n", this_offset));
            } else {
                out.push_str("    mov rax, rcx\n");
            }
            Ok(())
        }
        IrValueKind::MemberAccess { object, member } => {
            if value_is_call_callee(method, value.id) {
                return Ok(());
            }
            let Some(obj) = method.values.get(*object as usize) else {
                return Err(format!("Invalid member object value id {}", object));
            };
            let is_this = matches!(obj.kind, IrValueKind::ThisRef | IrValueKind::SuperRef);
            let is_local_same_class = match &obj.kind {
                IrValueKind::LocalRef(name) => local_types
                    .get(name)
                    .map(|ty| ty == current_class_name)
                    .unwrap_or(false),
                _ => false,
            };
            if is_this || is_local_same_class {
                let field_sym = field_symbols.get(member).ok_or_else(|| {
                    format!("Unknown field symbol '{}.{}'", current_class_name, member)
                })?;
                let is_static_field = *field_is_static.get(member).unwrap_or(&false);
                let field_ty = field_types
                    .get(member)
                    .cloned()
                    .unwrap_or_else(|| "unknown".to_string());
                let field_uses_qword = uses_qword_field_storage(&field_ty);
                if is_static_field {
                    if field_uses_qword {
                        out.push_str(&format!("    mov rax, qword ptr [{}]\n", field_sym));
                    } else {
                        out.push_str(&format!("    mov eax, dword ptr [{}]\n", field_sym));
                    }
                } else {
                    if is_local_same_class {
                        let local_name = match &obj.kind {
                            IrValueKind::LocalRef(name) => name,
                            _ => unreachable!(),
                        };
                        if let Some(slot) = local_offsets.get(local_name) {
                            let offset = masm_local_base_offset(method) + (slot * 8);
                            out.push_str(&format!("    mov edx, dword ptr [rsp+{}]\n", offset));
                        } else if let Some(offset) = param_offsets.get(local_name) {
                            out.push_str(&format!("    mov edx, dword ptr [rsp+{}]\n", offset));
                        } else {
                            return Err(format!(
                                "Unsupported local receiver '{}' in masm-full member access",
                                local_name
                            ));
                        }
                    } else if let Some(this_offset) = param_offsets.get("__this") {
                        out.push_str(&format!("    mov edx, dword ptr [rsp+{}]\n", this_offset));
                    } else {
                        out.push_str("    mov edx, ecx\n");
                    }
                    out.push_str(&format!("    cmp edx, {}\n", OBJECT_SLOT_CAPACITY));
                    out.push_str("    jbe @F\n");
                    out.push_str(&format!("    mov edx, {}\n", OBJECT_SLOT_CAPACITY));
                    out.push_str("@@:\n");
                    out.push_str(&format!("    mov r10, qword ptr [{}]\n", field_sym));
                    if field_uses_qword {
                        out.push_str("    mov rax, qword ptr [r10+rdx*8]\n");
                    } else {
                        out.push_str("    mov eax, dword ptr [r10+rdx*4]\n");
                    }
                }
                return Ok(());
            }
            if let Some(owner_name) = resolve_member_access_owner_name(
                method,
                *object,
                current_class_name,
                class_names,
                field_types,
                &local_types,
            ) {
                if resolve_method_symbol_for_call(
                    &owner_name,
                    member,
                    &[],
                    method,
                    current_class_name,
                    class_names,
                    field_types,
                    method_symbols,
                    method_symbols_by_sig,
                )
                .is_some()
                {
                    return Ok(());
                }
            }
            if let Some((owner_package, owner_class)) = resolve_static_field_owner(
                method,
                *object,
                current_package_name,
                current_class_name,
                &local_types,
                class_names,
            ) {
                let getter_sym =
                    mangle_static_field_getter_symbol(&owner_package, &owner_class, member);
                out.push_str(&format!("    call {}\n", getter_sym));
                return Ok(());
            }
            Err(format!(
                "Unsupported member access read in masm-full expression at id {}",
                value.id
            ))
        }
        IrValueKind::NewObject { class_name, args } => {
            let owner = normalize_class_owner_name(class_name, class_names)
                .unwrap_or_else(|| class_name.clone());
            if class_names.iter().any(|c| c == &owner) {
                if let Some(ctor) = resolve_method_symbol_for_call(
                    &owner,
                    &owner,
                    args,
                    method,
                    current_class_name,
                    class_names,
                    field_types,
                    method_symbols,
                    method_symbols_by_sig,
                ) {
                    let expected_sig = resolve_method_call_signature_for_call(
                        &owner,
                        &owner,
                        args,
                        method,
                        current_class_name,
                        class_names,
                        field_types,
                        method_symbols_by_sig,
                    );
                    let arc_arg_flags = emit_call_args_with_arc_boundary(
                        out,
                        method,
                        args,
                        1,
                        current_method_is_static,
                        current_package_name,
                        current_class_name,
                        method_symbols,
                        method_staticness,
                        method_symbols_by_sig,
                        method_staticness_by_sig,
                        stdlib_symbols,
                        class_names,
                        field_symbols,
                        field_is_static,
                        field_types,
                        class_object_counter_symbol,
                        &local_types,
                        expected_sig.as_ref().map(|(types, _)| types.as_slice()),
                        expected_sig
                            .as_ref()
                            .map(|(_, is_varargs)| *is_varargs)
                            .unwrap_or(false),
                        local_offsets,
                        param_offsets,
                        string_literals,
                    )?;
                    emit_constructor_receiver_setup(
                        out,
                        &owner,
                        false,
                        current_class_name,
                        param_offsets,
                    );
                    out.push_str(&format!("    call {}\n", ctor));
                    emit_call_arg_releases(out, method, &arc_arg_flags);
                } else {
                    let class_id = class_id_of(&owner).unwrap_or(0);
                    out.push_str(&format!("    mov ecx, {}\n", class_id));
                    out.push_str(&format!("    call {}\n", OBJECT_NEW_SYMBOL));
                }
                return Ok(());
            }
            Err(format!(
                "Unknown constructor owner '{}' in masm-full expression at id {}",
                class_name, value.id
            ))
        }
        IrValueKind::Call { callee, args } => {
            let Some(callee_v) = method.values.get(*callee as usize) else {
                return Err(format!("Invalid callee id {}", callee));
            };
            if let IrValueKind::LocalRef(class_name) = &callee_v.kind {
                let owner = normalize_class_owner_name(class_name, class_names)
                    .unwrap_or_else(|| class_name.clone());
                if class_names.iter().any(|c| c == &owner) {
                    if let Some(ctor) = resolve_method_symbol_for_call(
                        &owner,
                        &owner,
                        args,
                        method,
                        current_class_name,
                        class_names,
                        field_types,
                        method_symbols,
                        method_symbols_by_sig,
                    ) {
                        let expected_sig = resolve_method_call_signature_for_call(
                            &owner,
                            &owner,
                            args,
                            method,
                            current_class_name,
                            class_names,
                            field_types,
                            method_symbols_by_sig,
                        );
                        let arc_arg_flags = emit_call_args_with_arc_boundary(
                            out,
                            method,
                            args,
                            1,
                            current_method_is_static,
                            current_package_name,
                            current_class_name,
                            method_symbols,
                            method_staticness,
                            method_symbols_by_sig,
                            method_staticness_by_sig,
                            stdlib_symbols,
                            class_names,
                            field_symbols,
                            field_is_static,
                            field_types,
                            class_object_counter_symbol,
                            &local_types,
                            expected_sig.as_ref().map(|(types, _)| types.as_slice()),
                            expected_sig
                                .as_ref()
                                .map(|(_, is_varargs)| *is_varargs)
                                .unwrap_or(false),
                            local_offsets,
                            param_offsets,
                            string_literals,
                        )?;
                        emit_constructor_receiver_setup(
                            out,
                            &owner,
                            method.is_constructor,
                            current_class_name,
                            param_offsets,
                        );
                        out.push_str(&format!("    call {}\n", ctor));
                        emit_post_call_return_normalization(
                            out,
                            method,
                            value.id,
                            current_class_name,
                            class_names,
                            field_types,
                            method_symbols_by_sig,
                        );
                        emit_call_arg_releases(out, method, &arc_arg_flags);
                    } else {
                        let class_id = class_id_of(&owner).unwrap_or(0);
                        out.push_str(&format!("    mov ecx, {}\n", class_id));
                        out.push_str(&format!("    call {}\n", OBJECT_NEW_SYMBOL));
                    }
                    return Ok(());
                }

                // Unqualified in-class call (e.g. `valueOf(...)` inside same class).
                let owner = current_class_name.to_string();
                if let Some(is_target_static) = resolve_method_staticness_for_call(
                    &owner,
                    class_name,
                    args,
                    method,
                    method_staticness,
                    method_staticness_by_sig,
                ) {
                    let expected_sig = resolve_method_call_signature_for_call(
                        &owner,
                        class_name,
                        args,
                        method,
                        current_class_name,
                        class_names,
                        field_types,
                        method_symbols_by_sig,
                    );
                    let arc_arg_flags = emit_call_args_with_arc_boundary(
                        out,
                        method,
                        args,
                        if is_target_static { 0 } else { 1 },
                        current_method_is_static,
                        current_package_name,
                        current_class_name,
                        method_symbols,
                        method_staticness,
                        method_symbols_by_sig,
                        method_staticness_by_sig,
                        stdlib_symbols,
                        class_names,
                        field_symbols,
                        field_is_static,
                        field_types,
                        class_object_counter_symbol,
                        &local_types,
                        expected_sig.as_ref().map(|(types, _)| types.as_slice()),
                        expected_sig
                            .as_ref()
                            .map(|(_, is_varargs)| *is_varargs)
                            .unwrap_or(false),
                        local_offsets,
                        param_offsets,
                        string_literals,
                    )?;
                    if !is_target_static {
                        if let Some(this_offset) = param_offsets.get("__this") {
                            out.push_str(&format!(
                                "    mov rcx, qword ptr [rsp+{}]\n",
                                this_offset
                            ));
                        } else {
                            out.push_str("    mov rcx, 1\n");
                        }
                    }
                    if is_target_static {
                        let target = resolve_method_symbol_for_call(
                            &owner,
                            class_name,
                            args,
                            method,
                            current_class_name,
                            class_names,
                            field_types,
                            method_symbols,
                            method_symbols_by_sig,
                        )
                        .ok_or_else(|| format!("Unknown call target '{}.{}'", owner, class_name))?;
                        out.push_str(&format!("    call {}\n", target));
                    } else {
                        if is_devirtualizable_instance_call(&owner, class_name, args, method) {
                            let target = resolve_method_symbol_for_call(
                                &owner,
                                class_name,
                                args,
                                method,
                                current_class_name,
                                class_names,
                                field_types,
                                method_symbols,
                                method_symbols_by_sig,
                            )
                            .ok_or_else(|| {
                                format!("Unknown call target '{}.{}'", owner, class_name)
                            })?;
                            out.push_str(&format!("    call {}\n", target));
                        } else {
                            let (default_target, overrides) = collect_virtual_dispatch_overrides(
                                &owner,
                                class_name,
                                args,
                                method,
                                current_class_name,
                                class_names,
                                field_types,
                                method_symbols,
                                method_symbols_by_sig,
                            )?;
                            let assignable_class_ids = collect_instanceof_class_ids(&owner);
                            let label_seed = format!(
                                "{}_{}_vd{}_{}",
                                current_class_name,
                                method.name,
                                value.source.statement_index,
                                value.id
                            );
                            emit_virtual_dispatch_call(
                                out,
                                &label_seed,
                                &default_target,
                                &assignable_class_ids,
                                &overrides,
                            );
                        }
                    }
                    emit_post_call_return_normalization(
                        out,
                        method,
                        value.id,
                        current_class_name,
                        class_names,
                        field_types,
                        method_symbols_by_sig,
                    );
                    emit_call_arg_releases(out, method, &arc_arg_flags);
                    return Ok(());
                }
            }
            let IrValueKind::MemberAccess { object, member } = &callee_v.kind else {
                return Err(format!(
                    "Only member-call expressions are supported in masm value lowering (in {}.{})",
                    current_class_name, method.name
                ));
            };
            let Some(owner_v) = method.values.get(*object as usize) else {
                return Err(format!("Invalid owner id {}", object));
            };
            let mut is_super_receiver = false;
            let owner_name = match &owner_v.kind {
                IrValueKind::StringLiteral(_) => "String".to_string(),
                IrValueKind::ThisRef => current_class_name.to_string(),
                IrValueKind::SuperRef => {
                    is_super_receiver = true;
                    class_super_of(current_class_name)
                        .unwrap_or_else(|| current_class_name.to_string())
                }
                IrValueKind::LocalRef(name) => name.clone(),
                IrValueKind::NewObject { class_name, .. } => class_name.clone(),
                IrValueKind::MemberAccess {
                    object: owner_object,
                    member: owner_member,
                } => {
                    if owner_member == "out" {
                        let Some(base_v) = method.values.get(*owner_object as usize) else {
                            return Err(format!("Invalid owner base id {}", owner_object));
                        };
                        if matches!(&base_v.kind, IrValueKind::LocalRef(name) if name == "System") {
                            "System.out".to_string()
                        } else if let Some(normalized) =
                            normalize_class_owner_name(&owner_v.ty, class_names)
                        {
                            normalized
                        } else if let Some(ty) = field_types.get(owner_member) {
                            normalize_class_owner_name(ty, class_names)
                                .unwrap_or_else(|| ty.clone())
                        } else if let Some(path) = value_dotted_path(method, *object) {
                            path
                        } else {
                            return Err(format!(
                                "Unsupported member owner for expression value id {} in {}.{}",
                                value.id, current_class_name, method.name
                            ));
                        }
                    } else if let Some(normalized) =
                        normalize_class_owner_name(&owner_v.ty, class_names)
                    {
                        normalized
                    } else if let Some(ty) = field_types.get(owner_member) {
                        normalize_class_owner_name(ty, class_names).unwrap_or_else(|| ty.clone())
                    } else if let Some(resolved_ty) = backend_resolution_arg_type(
                        method,
                        *object,
                        current_class_name,
                        class_names,
                        field_types,
                        method_symbols_by_sig,
                    ) {
                        normalize_class_owner_name(&resolved_ty, class_names).unwrap_or(resolved_ty)
                    } else if let Some(path) = value_dotted_path(method, *object) {
                        path
                    } else {
                        return Err(format!(
                            "Unsupported member owner for expression value id {} in {}.{}",
                            value.id, current_class_name, method.name
                        ));
                    }
                }
                _ => {
                    if let Some(normalized) = normalize_class_owner_name(&owner_v.ty, class_names) {
                        normalized
                    } else if let Some(resolved_ty) = backend_resolution_arg_type(
                        method,
                        *object,
                        current_class_name,
                        class_names,
                        field_types,
                        method_symbols_by_sig,
                    ) {
                        normalize_class_owner_name(&resolved_ty, class_names).unwrap_or(resolved_ty)
                    } else {
                        return Err(format!(
                            "Unsupported call owner kind for expression value id {} in {}.{}",
                            value.id, current_class_name, method.name
                        ));
                    }
                }
            };
            let resolved_owner = if owner_name == "System.out" || owner_name == "System.err" {
                normalize_class_owner_name("PrintStream", class_names)
                    .unwrap_or_else(|| "PrintStream".to_string())
            } else if let Some(normalized) = normalize_class_owner_name(&owner_name, class_names) {
                normalized
            } else if owner_name == "this" {
                current_class_name.to_string()
            } else if let Some(local_ty) = lookup_local_decl_type(method, &owner_name) {
                normalize_class_owner_name(&local_ty, class_names).unwrap_or(local_ty)
            } else if let Some(normalized) = normalize_class_owner_name(&owner_v.ty, class_names) {
                normalized
            } else if let Some(field_ty) = field_types.get(&owner_name) {
                normalize_class_owner_name(field_ty, class_names)
                    .unwrap_or_else(|| field_ty.clone())
            } else {
                owner_name.clone()
            };

            let is_target_static = resolve_method_staticness_for_call(
                &resolved_owner,
                member,
                args,
                method,
                method_staticness,
                method_staticness_by_sig,
            )
            .ok_or_else(|| {
                format!(
                    "Unknown staticness for target '{}.{}'",
                    resolved_owner, member
                )
            })?;
            let std_owner = normalize_stdlib_owner(&resolved_owner).to_string();
            let needs_materialized_receiver = !is_target_static
                && !is_super_receiver
                && !matches!(owner_v.kind, IrValueKind::ThisRef);
            if needs_materialized_receiver {
                with_nested_arg_preserve_depth(|| {
                    emit_value_to_eax_masm(
                        out,
                        method,
                        *object,
                        current_method_is_static,
                        current_package_name,
                        current_class_name,
                        method_symbols,
                        method_staticness,
                        method_symbols_by_sig,
                        method_staticness_by_sig,
                        stdlib_symbols,
                        class_names,
                        field_symbols,
                        field_is_static,
                        field_types,
                        class_object_counter_symbol,
                        local_offsets,
                        param_offsets,
                        string_literals,
                    )
                })?;
                out.push_str(&format!(
                    "    mov qword ptr [rsp+{}], rax\n",
                    masm_call_receiver_spill_offset_at_depth(
                        method,
                        current_nested_arg_preserve_depth(),
                    )
                ));
            }
            if let Some(std_sym) = stdlib_symbols.get(&(std_owner, member.clone())) {
                let expected_sig = resolve_method_call_signature_for_call(
                    &resolved_owner,
                    member,
                    args,
                    method,
                    current_class_name,
                    class_names,
                    field_types,
                    method_symbols_by_sig,
                );
                let arc_arg_flags = emit_call_args_with_arc_boundary(
                    out,
                    method,
                    args,
                    if is_target_static { 0 } else { 1 },
                    current_method_is_static,
                    current_package_name,
                    current_class_name,
                    method_symbols,
                    method_staticness,
                    method_symbols_by_sig,
                    method_staticness_by_sig,
                    stdlib_symbols,
                    class_names,
                    field_symbols,
                    field_is_static,
                    field_types,
                    class_object_counter_symbol,
                    &local_types,
                    expected_sig.as_ref().map(|(types, _)| types.as_slice()),
                    expected_sig
                        .as_ref()
                        .map(|(_, is_varargs)| *is_varargs)
                        .unwrap_or(false),
                    local_offsets,
                    param_offsets,
                    string_literals,
                )?;
                if !is_target_static {
                    if is_super_receiver || matches!(owner_v.kind, IrValueKind::ThisRef) {
                        if let Some(this_offset) = param_offsets.get("__this") {
                            out.push_str(&format!(
                                "    mov rcx, qword ptr [rsp+{}]\n",
                                this_offset
                            ));
                        }
                    } else {
                        out.push_str(&format!(
                            "    mov rcx, qword ptr [rsp+{}]\n",
                            masm_call_receiver_spill_offset_at_depth(
                                method,
                                current_nested_arg_preserve_depth(),
                            )
                        ));
                    }
                }
                out.push_str(&format!("    call {}\n", std_sym));
                emit_post_call_return_normalization(
                    out,
                    method,
                    value.id,
                    current_class_name,
                    class_names,
                    field_types,
                    method_symbols_by_sig,
                );
                emit_call_arg_releases(out, method, &arc_arg_flags);
                return Ok(());
            }

            let expected_sig = resolve_method_call_signature_for_call(
                &resolved_owner,
                member,
                args,
                method,
                current_class_name,
                class_names,
                field_types,
                method_symbols_by_sig,
            );
            let arc_arg_flags = emit_call_args_with_arc_boundary(
                out,
                method,
                args,
                if is_target_static { 0 } else { 1 },
                current_method_is_static,
                current_package_name,
                current_class_name,
                method_symbols,
                method_staticness,
                method_symbols_by_sig,
                method_staticness_by_sig,
                stdlib_symbols,
                class_names,
                field_symbols,
                field_is_static,
                field_types,
                class_object_counter_symbol,
                &local_types,
                expected_sig.as_ref().map(|(types, _)| types.as_slice()),
                expected_sig
                    .as_ref()
                    .map(|(_, is_varargs)| *is_varargs)
                    .unwrap_or(false),
                local_offsets,
                param_offsets,
                string_literals,
            )?;
            if !is_target_static {
                if is_super_receiver || matches!(owner_v.kind, IrValueKind::ThisRef) {
                    if let Some(this_offset) = param_offsets.get("__this") {
                        out.push_str(&format!("    mov rcx, qword ptr [rsp+{}]\n", this_offset));
                    }
                } else {
                    out.push_str(&format!(
                        "    mov rcx, qword ptr [rsp+{}]\n",
                        masm_call_receiver_spill_offset_at_depth(
                            method,
                            current_nested_arg_preserve_depth(),
                        )
                    ));
                }
            }
            let devirt = !is_target_static
                && !is_super_receiver
                && is_devirtualizable_instance_call(&resolved_owner, member, args, method);
            if is_target_static || is_super_receiver || devirt {
                let target = resolve_method_symbol_for_call(
                    &resolved_owner,
                    member,
                    args,
                    method,
                    current_class_name,
                    class_names,
                    field_types,
                    method_symbols,
                    method_symbols_by_sig,
                )
                .ok_or_else(|| format!("Unknown call target '{}.{}'", resolved_owner, member))?;
                out.push_str(&format!("    call {}\n", target));
            } else {
                let (default_target, overrides) = collect_virtual_dispatch_overrides(
                    &resolved_owner,
                    member,
                    args,
                    method,
                    current_class_name,
                    class_names,
                    field_types,
                    method_symbols,
                    method_symbols_by_sig,
                )?;
                let assignable_class_ids = collect_instanceof_class_ids(&resolved_owner);
                let label_seed = format!(
                    "{}_{}_vd{}_{}",
                    current_class_name, method.name, value.source.statement_index, value.id
                );
                emit_virtual_dispatch_call(
                    out,
                    &label_seed,
                    &default_target,
                    &assignable_class_ids,
                    &overrides,
                );
            }
            emit_post_call_return_normalization(
                out,
                method,
                value.id,
                current_class_name,
                class_names,
                field_types,
                method_symbols_by_sig,
            );
            emit_call_arg_releases(out, method, &arc_arg_flags);
            Ok(())
        }
        IrValueKind::Cast { value: inner, ty } => {
            emit_value_to_eax_masm(
                out,
                method,
                *inner,
                current_method_is_static,
                current_package_name,
                current_class_name,
                method_symbols,
                method_staticness,
                method_symbols_by_sig,
                method_staticness_by_sig,
                stdlib_symbols,
                class_names,
                field_symbols,
                field_is_static,
                field_types,
                class_object_counter_symbol,
                local_offsets,
                param_offsets,
                string_literals,
            )?;

            let source_ty = primitive_cast_source_ty(method, *inner)
                .or_else(|| {
                    resolve_backend_call_value_type(
                        method,
                        *inner,
                        current_class_name,
                        class_names,
                        field_types,
                        method_symbols_by_sig,
                    )
                })
                .unwrap_or_default();

            if normalize_type_token(ty) == "Object" {
                if wrapper_value_is_boxed_object(
                    method,
                    *inner,
                    current_class_name,
                    class_names,
                    &local_types,
                    field_types,
                    method_symbols_by_sig,
                ) {
                    return Ok(());
                }
                if let Some(primitive_ty) = wrapper_primitive_type_name(&source_ty) {
                    emit_wrapper_box_call(
                        out,
                        &source_ty,
                        primitive_ty,
                        method,
                        current_class_name,
                        class_names,
                        field_types,
                        method_symbols,
                        method_symbols_by_sig,
                    )?;
                    return Ok(());
                }
            }

            if is_wrapper_type_name(ty) {
                if is_handle_type_name(&source_ty) || normalize_type_token(&source_ty) == "Object" {
                    let target_ty =
                        normalize_class_owner_name(ty, class_names).unwrap_or_else(|| ty.clone());
                    let targets = collect_instanceof_class_ids(&target_ty);
                    let panic_msg_idx = string_literals.len();
                    string_literals.push("Invalid cast".to_string());
                    let panic_msg_label = format!("msg{}", panic_msg_idx);
                    let label_seed = format!(
                        "{}_{}_cast_{}_{}",
                        current_class_name, method.name, value.source.statement_index, value.id
                    );
                    emit_checked_reference_cast(out, &label_seed, &targets, &panic_msg_label);
                    return Ok(());
                }
                if let Some(target_primitive) = wrapper_primitive_type_name(ty) {
                    if normalize_type_token(&source_ty) == target_primitive {
                        return Ok(());
                    }
                }
                if is_wrapper_type_name(&source_ty) {
                    emit_wrapper_unbox_call(
                        out,
                        &source_ty,
                        method,
                        current_class_name,
                        class_names,
                        field_types,
                        method_symbols,
                        method_symbols_by_sig,
                    )?;
                    emit_runtime_numeric_coercion(
                        out,
                        wrapper_primitive_type_name(&source_ty).expect("wrapper primitive type"),
                        wrapper_primitive_type_name(ty).expect("wrapper primitive type"),
                        method,
                        current_class_name,
                        class_names,
                        field_types,
                        method_symbols,
                        method_symbols_by_sig,
                    )?;
                    return Ok(());
                }
            }

            if is_primitive_type_name(ty) {
                let target_ty = normalize_type_token(ty);
                let mut numeric_source_ty = source_ty.clone();
                if is_wrapper_type_name(&numeric_source_ty) {
                    emit_wrapper_unbox_call(
                        out,
                        &numeric_source_ty,
                        method,
                        current_class_name,
                        class_names,
                        field_types,
                        method_symbols,
                        method_symbols_by_sig,
                    )?;
                    numeric_source_ty = wrapper_primitive_type_name(&numeric_source_ty)
                        .expect("wrapper primitive type")
                        .to_string();
                }
                if is_float_scalar_type_name(&numeric_source_ty) {
                    match target_ty.as_str() {
                        "float" => {
                            out.push_str("    movq xmm0, rax\n");
                            out.push_str("    cvtsd2ss xmm0, xmm0\n");
                            out.push_str("    cvtss2sd xmm0, xmm0\n");
                            out.push_str("    movq rax, xmm0\n");
                        }
                        "double" => {}
                        "long" | "ulong" => {
                            out.push_str("    mov rcx, rax\n");
                            out.push_str("    call pulsec_rt_fpToLong\n");
                        }
                        "byte" | "ubyte" | "short" | "ushort" | "int" | "uint" | "char" => {
                            out.push_str("    mov rcx, rax\n");
                            out.push_str("    call pulsec_rt_fpToInt\n");
                            emit_post_fp_to_int_cast(out, &target_ty);
                        }
                        _ => {}
                    }
                } else if is_float_scalar_type_name(&target_ty) {
                    emit_numeric_rax_as_fp_operand(out, &numeric_source_ty);
                    emit_round_fp_result_if_needed(out, target_ty == "float");
                    out.push_str("    movq rax, xmm0\n");
                } else {
                    emit_integral_cast(out, &numeric_source_ty, &target_ty);
                }
                return Ok(());
            }

            let target_ty =
                normalize_class_owner_name(ty, class_names).unwrap_or_else(|| ty.clone());
            let targets = collect_instanceof_class_ids(&target_ty);
            let panic_msg_idx = string_literals.len();
            string_literals.push("Invalid cast".to_string());
            let panic_msg_label = format!("msg{}", panic_msg_idx);
            let label_seed = format!(
                "{}_{}_cast_{}_{}",
                current_class_name, method.name, value.source.statement_index, value.id
            );
            emit_checked_reference_cast(out, &label_seed, &targets, &panic_msg_label);
            Ok(())
        }
        IrValueKind::InstanceOf { value: inner, ty } => {
            emit_value_to_eax_masm(
                out,
                method,
                *inner,
                current_method_is_static,
                current_package_name,
                current_class_name,
                method_symbols,
                method_staticness,
                method_symbols_by_sig,
                method_staticness_by_sig,
                stdlib_symbols,
                class_names,
                field_symbols,
                field_is_static,
                field_types,
                class_object_counter_symbol,
                local_offsets,
                param_offsets,
                string_literals,
            )?;
            let targets = collect_instanceof_class_ids(ty);
            let label_seed = format!(
                "{}_{}_instof_{}_{}",
                current_class_name, method.name, value.source.statement_index, value.id
            );
            emit_instanceof_check(out, &label_seed, &targets);
            Ok(())
        }
        IrValueKind::Unary { op, operand } => {
            emit_value_to_eax_masm(
                out,
                method,
                *operand,
                current_method_is_static,
                current_package_name,
                current_class_name,
                method_symbols,
                method_staticness,
                method_symbols_by_sig,
                method_staticness_by_sig,
                stdlib_symbols,
                class_names,
                field_symbols,
                field_is_static,
                field_types,
                class_object_counter_symbol,
                local_offsets,
                param_offsets,
                string_literals,
            )?;
            match op {
                IrUnaryOp::Not => {
                    out.push_str("    test eax, eax\n");
                    out.push_str("    sete al\n");
                    out.push_str("    movzx eax, al\n");
                }
                IrUnaryOp::Neg => {
                    let operand_ty = primitive_cast_source_ty(method, *operand).unwrap_or_default();
                    if is_float_scalar_type_name(&operand_ty) {
                        out.push_str("    movq xmm0, rax\n");
                        out.push_str("    xorpd xmm1, xmm1\n");
                        out.push_str("    subsd xmm1, xmm0\n");
                        if normalize_type_token(&operand_ty) == "float" {
                            out.push_str("    cvtsd2ss xmm1, xmm1\n");
                            out.push_str("    cvtss2sd xmm1, xmm1\n");
                        }
                        out.push_str("    movq rax, xmm1\n");
                    } else if uses_qword_integer_math(&value.ty) {
                        out.push_str("    neg rax\n");
                    } else {
                        out.push_str("    neg eax\n");
                    }
                }
                IrUnaryOp::BitNot => {
                    if uses_qword_integer_math(&value.ty) {
                        out.push_str("    not rax\n");
                    } else {
                        out.push_str("    not eax\n");
                    }
                }
            }
            Ok(())
        }
        IrValueKind::Binary { op, left, right } => {
            let tmp_offset = masm_binary_tmp_offset(method, value.id)
                .ok_or_else(|| format!("Missing binary temp slot for value id {}", value.id))?;
            emit_value_to_eax_masm(
                out,
                method,
                *left,
                current_method_is_static,
                current_package_name,
                current_class_name,
                method_symbols,
                method_staticness,
                method_symbols_by_sig,
                method_staticness_by_sig,
                stdlib_symbols,
                class_names,
                field_symbols,
                field_is_static,
                field_types,
                class_object_counter_symbol,
                local_offsets,
                param_offsets,
                string_literals,
            )?;
            if binary_uses_fp_math(method, *left, *right) {
                let left_ty = primitive_cast_source_ty(method, *left).unwrap_or_default();
                let right_ty = primitive_cast_source_ty(method, *right).unwrap_or_default();
                let result_is_float = binary_fp_result_is_float(method, *left, *right);
                emit_numeric_rax_as_fp_operand(out, &left_ty);
                out.push_str(&format!("    movq qword ptr [rsp+{}], xmm0\n", tmp_offset));
                emit_value_to_eax_masm(
                    out,
                    method,
                    *right,
                    current_method_is_static,
                    current_package_name,
                    current_class_name,
                    method_symbols,
                    method_staticness,
                    method_symbols_by_sig,
                    method_staticness_by_sig,
                    stdlib_symbols,
                    class_names,
                    field_symbols,
                    field_is_static,
                    field_types,
                    class_object_counter_symbol,
                    local_offsets,
                    param_offsets,
                    string_literals,
                )?;
                emit_numeric_rax_as_fp_operand(out, &right_ty);
                out.push_str("    movapd xmm1, xmm0\n");
                out.push_str(&format!("    movq xmm0, qword ptr [rsp+{}]\n", tmp_offset));
                match op {
                    IrBinaryOp::Add => {
                        out.push_str("    addsd xmm0, xmm1\n");
                        emit_round_fp_result_if_needed(out, result_is_float);
                        out.push_str("    movq rax, xmm0\n");
                    }
                    IrBinaryOp::Sub => {
                        out.push_str("    subsd xmm0, xmm1\n");
                        emit_round_fp_result_if_needed(out, result_is_float);
                        out.push_str("    movq rax, xmm0\n");
                    }
                    IrBinaryOp::Mul => {
                        out.push_str("    mulsd xmm0, xmm1\n");
                        emit_round_fp_result_if_needed(out, result_is_float);
                        out.push_str("    movq rax, xmm0\n");
                    }
                    IrBinaryOp::Div => {
                        out.push_str("    divsd xmm0, xmm1\n");
                        emit_round_fp_result_if_needed(out, result_is_float);
                        out.push_str("    movq rax, xmm0\n");
                    }
                    IrBinaryOp::Mod => {
                        out.push_str("    movapd xmm2, xmm0\n");
                        out.push_str("    divsd xmm2, xmm1\n");
                        out.push_str("    cvttsd2si rax, xmm2\n");
                        out.push_str("    cvtsi2sd xmm2, rax\n");
                        out.push_str("    mulsd xmm2, xmm1\n");
                        out.push_str("    subsd xmm0, xmm2\n");
                        emit_round_fp_result_if_needed(out, result_is_float);
                        out.push_str("    movq rax, xmm0\n");
                    }
                    IrBinaryOp::Eq
                    | IrBinaryOp::NotEq
                    | IrBinaryOp::Less
                    | IrBinaryOp::LessEq
                    | IrBinaryOp::Greater
                    | IrBinaryOp::GreaterEq => {
                        let label_seed = format!(
                            "{}_{}_fp_cmp_{}_{}",
                            current_class_name, method.name, value.source.statement_index, value.id
                        );
                        emit_fp_compare_to_bool(out, op, &label_seed);
                    }
                    IrBinaryOp::BitAnd
                    | IrBinaryOp::BitOr
                    | IrBinaryOp::BitXor
                    | IrBinaryOp::ShiftLeft
                    | IrBinaryOp::ShiftRight
                    | IrBinaryOp::UnsignedShiftRight => unreachable!(),
                }
                return Ok(());
            }
            let (binary_uses_qword, binary_uses_unsigned) = binary_exec_mode(method, *left, *right);
            if binary_uses_qword {
                out.push_str(&format!("    mov qword ptr [rsp+{}], rax\n", tmp_offset));
            } else {
                out.push_str(&format!("    mov dword ptr [rsp+{}], eax\n", tmp_offset));
            }
            emit_value_to_eax_masm(
                out,
                method,
                *right,
                current_method_is_static,
                current_package_name,
                current_class_name,
                method_symbols,
                method_staticness,
                method_symbols_by_sig,
                method_staticness_by_sig,
                stdlib_symbols,
                class_names,
                field_symbols,
                field_is_static,
                field_types,
                class_object_counter_symbol,
                local_offsets,
                param_offsets,
                string_literals,
            )?;
            if binary_uses_qword {
                out.push_str("    mov rdx, rax\n");
                out.push_str(&format!("    mov rax, qword ptr [rsp+{}]\n", tmp_offset));
            } else {
                out.push_str("    mov edx, eax\n");
                out.push_str(&format!("    mov eax, dword ptr [rsp+{}]\n", tmp_offset));
            }
            match op {
                IrBinaryOp::Add => {
                    if binary_uses_qword {
                        out.push_str("    add rax, rdx\n");
                    } else {
                        out.push_str("    add eax, edx\n");
                    }
                }
                IrBinaryOp::Sub => {
                    if binary_uses_qword {
                        out.push_str("    sub rax, rdx\n");
                    } else {
                        out.push_str("    sub eax, edx\n");
                    }
                }
                IrBinaryOp::Mul => {
                    if binary_uses_qword {
                        out.push_str("    imul rax, rdx\n");
                    } else {
                        out.push_str("    imul eax, edx\n");
                    }
                }
                IrBinaryOp::Div => {
                    if binary_uses_qword {
                        out.push_str("    mov rcx, rdx\n");
                        if binary_uses_unsigned {
                            out.push_str("    xor edx, edx\n");
                            out.push_str("    div rcx\n");
                        } else {
                            out.push_str("    cqo\n");
                            out.push_str("    idiv rcx\n");
                        }
                    } else {
                        out.push_str("    mov ecx, edx\n");
                        if binary_uses_unsigned {
                            out.push_str("    xor edx, edx\n");
                            out.push_str("    div ecx\n");
                        } else {
                            out.push_str("    cdq\n");
                            out.push_str("    idiv ecx\n");
                        }
                    }
                }
                IrBinaryOp::Mod => {
                    if binary_uses_qword {
                        out.push_str("    mov rcx, rdx\n");
                        if binary_uses_unsigned {
                            out.push_str("    xor edx, edx\n");
                            out.push_str("    div rcx\n");
                        } else {
                            out.push_str("    cqo\n");
                            out.push_str("    idiv rcx\n");
                        }
                        out.push_str("    mov rax, rdx\n");
                    } else {
                        out.push_str("    mov ecx, edx\n");
                        if binary_uses_unsigned {
                            out.push_str("    xor edx, edx\n");
                            out.push_str("    div ecx\n");
                        } else {
                            out.push_str("    cdq\n");
                            out.push_str("    idiv ecx\n");
                        }
                        out.push_str("    mov eax, edx\n");
                    }
                }
                IrBinaryOp::BitAnd => {
                    if value.ty == "boolean" {
                        out.push_str("    test eax, eax\n");
                        out.push_str("    setne al\n");
                        out.push_str("    movzx eax, al\n");
                        out.push_str("    test edx, edx\n");
                        out.push_str("    setne dl\n");
                        out.push_str("    and al, dl\n");
                        out.push_str("    movzx eax, al\n");
                    } else if binary_uses_qword {
                        out.push_str("    and rax, rdx\n");
                    } else {
                        out.push_str("    and eax, edx\n");
                    }
                }
                IrBinaryOp::BitOr => {
                    if value.ty == "boolean" {
                        out.push_str("    test eax, eax\n");
                        out.push_str("    setne al\n");
                        out.push_str("    test edx, edx\n");
                        out.push_str("    setne dl\n");
                        out.push_str("    or al, dl\n");
                        out.push_str("    movzx eax, al\n");
                    } else if binary_uses_qword {
                        out.push_str("    or rax, rdx\n");
                    } else {
                        out.push_str("    or eax, edx\n");
                    }
                }
                IrBinaryOp::BitXor => {
                    if value.ty == "boolean" {
                        out.push_str("    test eax, eax\n");
                        out.push_str("    setne al\n");
                        out.push_str("    test edx, edx\n");
                        out.push_str("    setne dl\n");
                        out.push_str("    xor al, dl\n");
                        out.push_str("    movzx eax, al\n");
                    } else if binary_uses_qword {
                        out.push_str("    xor rax, rdx\n");
                    } else {
                        out.push_str("    xor eax, edx\n");
                    }
                }
                IrBinaryOp::ShiftLeft => {
                    if binary_uses_qword {
                        out.push_str("    mov ecx, edx\n");
                        out.push_str("    shl rax, cl\n");
                    } else {
                        out.push_str("    mov ecx, edx\n");
                        out.push_str("    shl eax, cl\n");
                    }
                }
                IrBinaryOp::ShiftRight => {
                    if binary_uses_qword {
                        out.push_str("    mov ecx, edx\n");
                        if binary_uses_unsigned {
                            out.push_str("    shr rax, cl\n");
                        } else {
                            out.push_str("    sar rax, cl\n");
                        }
                    } else {
                        out.push_str("    mov ecx, edx\n");
                        if binary_uses_unsigned {
                            out.push_str("    shr eax, cl\n");
                        } else {
                            out.push_str("    sar eax, cl\n");
                        }
                    }
                }
                IrBinaryOp::UnsignedShiftRight => {
                    if binary_uses_qword {
                        out.push_str("    mov ecx, edx\n");
                        out.push_str("    shr rax, cl\n");
                    } else {
                        out.push_str("    mov ecx, edx\n");
                        out.push_str("    shr eax, cl\n");
                    }
                }
                IrBinaryOp::Eq
                | IrBinaryOp::NotEq
                | IrBinaryOp::Less
                | IrBinaryOp::LessEq
                | IrBinaryOp::Greater
                | IrBinaryOp::GreaterEq => {
                    if binary_uses_qword {
                        out.push_str("    cmp rax, rdx\n");
                    } else {
                        out.push_str("    cmp eax, edx\n");
                    }
                    let set = match op {
                        IrBinaryOp::Eq => "sete",
                        IrBinaryOp::NotEq => "setne",
                        IrBinaryOp::Less => {
                            if binary_uses_unsigned {
                                "setb"
                            } else {
                                "setl"
                            }
                        }
                        IrBinaryOp::LessEq => {
                            if binary_uses_unsigned {
                                "setbe"
                            } else {
                                "setle"
                            }
                        }
                        IrBinaryOp::Greater => {
                            if binary_uses_unsigned {
                                "seta"
                            } else {
                                "setg"
                            }
                        }
                        IrBinaryOp::GreaterEq => {
                            if binary_uses_unsigned {
                                "setae"
                            } else {
                                "setge"
                            }
                        }
                        _ => unreachable!(),
                    };
                    out.push_str(&format!("    {} al\n", set));
                    out.push_str("    movzx eax, al\n");
                }
            }
            Ok(())
        }
        IrValueKind::Conditional {
            condition,
            then_value,
            else_value,
        } => {
            let then_label = format!(
                "{}_{}_ternary_then_{}_{}",
                current_class_name, method.name, value.source.statement_index, value.id
            );
            let done_label = format!(
                "{}_{}_ternary_done_{}_{}",
                current_class_name, method.name, value.source.statement_index, value.id
            );
            emit_value_to_eax_masm(
                out,
                method,
                *condition,
                current_method_is_static,
                current_package_name,
                current_class_name,
                method_symbols,
                method_staticness,
                method_symbols_by_sig,
                method_staticness_by_sig,
                stdlib_symbols,
                class_names,
                field_symbols,
                field_is_static,
                field_types,
                class_object_counter_symbol,
                local_offsets,
                param_offsets,
                string_literals,
            )?;
            out.push_str("    test rax, rax\n");
            out.push_str(&format!("    jne {}\n", then_label));
            emit_value_to_eax_masm(
                out,
                method,
                *else_value,
                current_method_is_static,
                current_package_name,
                current_class_name,
                method_symbols,
                method_staticness,
                method_symbols_by_sig,
                method_staticness_by_sig,
                stdlib_symbols,
                class_names,
                field_symbols,
                field_is_static,
                field_types,
                class_object_counter_symbol,
                local_offsets,
                param_offsets,
                string_literals,
            )?;
            out.push_str(&format!("    jmp {}\n", done_label));
            out.push_str(&format!("{}:\n", then_label));
            emit_value_to_eax_masm(
                out,
                method,
                *then_value,
                current_method_is_static,
                current_package_name,
                current_class_name,
                method_symbols,
                method_staticness,
                method_symbols_by_sig,
                method_staticness_by_sig,
                stdlib_symbols,
                class_names,
                field_symbols,
                field_is_static,
                field_types,
                class_object_counter_symbol,
                local_offsets,
                param_offsets,
                string_literals,
            )?;
            out.push_str(&format!("{}:\n", done_label));
            Ok(())
        }
        IrValueKind::SwitchExpr {
            expr,
            cases,
            default,
        } => {
            let tmp_offset = masm_binary_tmp_offset(method, value.id)
                .ok_or_else(|| format!("Missing switch temp slot for value id {}", value.id))?;
            let done_label = format!(
                "{}_{}_switch_expr_done_{}_{}",
                current_class_name, method.name, value.source.statement_index, value.id
            );
            emit_value_to_eax_masm(
                out,
                method,
                *expr,
                current_method_is_static,
                current_package_name,
                current_class_name,
                method_symbols,
                method_staticness,
                method_symbols_by_sig,
                method_staticness_by_sig,
                stdlib_symbols,
                class_names,
                field_symbols,
                field_is_static,
                field_types,
                class_object_counter_symbol,
                local_offsets,
                param_offsets,
                string_literals,
            )?;
            out.push_str(&format!("    mov qword ptr [rsp+{}], rax\n", tmp_offset));
            for (idx, (label, case_value)) in cases.iter().enumerate() {
                let next_label = format!(
                    "{}_{}_switch_expr_next_{}_{}_{}",
                    current_class_name, method.name, value.source.statement_index, value.id, idx
                );
                emit_value_to_eax_masm(
                    out,
                    method,
                    *label,
                    current_method_is_static,
                    current_package_name,
                    current_class_name,
                    method_symbols,
                    method_staticness,
                    method_symbols_by_sig,
                    method_staticness_by_sig,
                    stdlib_symbols,
                    class_names,
                    field_symbols,
                    field_is_static,
                    field_types,
                    class_object_counter_symbol,
                    local_offsets,
                    param_offsets,
                    string_literals,
                )?;
                out.push_str("    mov rdx, rax\n");
                out.push_str(&format!("    mov rax, qword ptr [rsp+{}]\n", tmp_offset));
                if uses_qword_integer_math(&method.values[*label as usize].ty) {
                    out.push_str("    cmp rax, rdx\n");
                } else {
                    out.push_str("    cmp eax, edx\n");
                }
                out.push_str(&format!("    jne {}\n", next_label));
                emit_value_to_eax_masm(
                    out,
                    method,
                    *case_value,
                    current_method_is_static,
                    current_package_name,
                    current_class_name,
                    method_symbols,
                    method_staticness,
                    method_symbols_by_sig,
                    method_staticness_by_sig,
                    stdlib_symbols,
                    class_names,
                    field_symbols,
                    field_is_static,
                    field_types,
                    class_object_counter_symbol,
                    local_offsets,
                    param_offsets,
                    string_literals,
                )?;
                out.push_str(&format!("    jmp {}\n", done_label));
                out.push_str(&format!("{}:\n", next_label));
            }
            emit_value_to_eax_masm(
                out,
                method,
                *default,
                current_method_is_static,
                current_package_name,
                current_class_name,
                method_symbols,
                method_staticness,
                method_symbols_by_sig,
                method_staticness_by_sig,
                stdlib_symbols,
                class_names,
                field_symbols,
                field_is_static,
                field_types,
                class_object_counter_symbol,
                local_offsets,
                param_offsets,
                string_literals,
            )?;
            out.push_str(&format!("{}:\n", done_label));
            Ok(())
        }
        IrValueKind::TakePendingException => {
            out.push_str(&format!("    call {}\n", EXC_TAKE_PENDING_SYMBOL));
            Ok(())
        }
        IrValueKind::ArrayNew { lengths, .. } => {
            if lengths.len() == 1 {
                emit_value_to_eax_masm(
                    out,
                    method,
                    lengths[0],
                    current_method_is_static,
                    current_package_name,
                    current_class_name,
                    method_symbols,
                    method_staticness,
                    method_symbols_by_sig,
                    method_staticness_by_sig,
                    stdlib_symbols,
                    class_names,
                    field_symbols,
                    field_is_static,
                    field_types,
                    class_object_counter_symbol,
                    local_offsets,
                    param_offsets,
                    string_literals,
                )?;
                out.push_str("    mov ecx, eax\n");
                out.push_str("    call pulsec_rt_arrayNew\n");
            } else {
                let tmp_offset = masm_array_init_tmp_offset(method, value.id)
                    .ok_or_else(|| format!("Missing array temp slot for value id {}", value.id))?;
                for (index, length) in lengths.iter().enumerate() {
                    let length_offset = masm_array_init_tmp_offset_at(method, value.id, index)
                        .ok_or_else(|| {
                            format!(
                                "Missing multidimensional array temp slot {} for value id {}",
                                index, value.id
                            )
                        })?;
                    emit_value_to_eax_masm(
                        out,
                        method,
                        *length,
                        current_method_is_static,
                        current_package_name,
                        current_class_name,
                        method_symbols,
                        method_staticness,
                        method_symbols_by_sig,
                        method_staticness_by_sig,
                        stdlib_symbols,
                        class_names,
                        field_symbols,
                        field_is_static,
                        field_types,
                        class_object_counter_symbol,
                        local_offsets,
                        param_offsets,
                        string_literals,
                    )?;
                    out.push_str(&format!("    mov dword ptr [rsp+{}], eax\n", length_offset));
                }
                out.push_str(&format!("    mov ecx, {}\n", lengths.len()));
                out.push_str(&format!("    lea rdx, [rsp+{}]\n", tmp_offset));
                out.push_str("    call pulsec_rt_arrayNewMulti\n");
            }
            Ok(())
        }
        IrValueKind::ArrayNewInitialized {
            element_ty,
            dimensions,
            values,
        } => {
            emit_array_new_initialized_value(
                out,
                method,
                value,
                element_ty,
                *dimensions,
                values,
                current_method_is_static,
                current_package_name,
                current_class_name,
                method_symbols,
                method_staticness,
                method_symbols_by_sig,
                method_staticness_by_sig,
                stdlib_symbols,
                class_names,
                field_symbols,
                field_is_static,
                field_types,
                class_object_counter_symbol,
                local_offsets,
                param_offsets,
                string_literals,
            )?;
            Ok(())
        }
        IrValueKind::ArrayLength { array } => {
            emit_value_to_eax_masm(
                out,
                method,
                *array,
                current_method_is_static,
                current_package_name,
                current_class_name,
                method_symbols,
                method_staticness,
                method_symbols_by_sig,
                method_staticness_by_sig,
                stdlib_symbols,
                class_names,
                field_symbols,
                field_is_static,
                field_types,
                class_object_counter_symbol,
                local_offsets,
                param_offsets,
                string_literals,
            )?;
            out.push_str("    mov rcx, rax\n");
            out.push_str("    call pulsec_rt_arrayLength\n");
            Ok(())
        }
        IrValueKind::ArrayGet {
            array,
            index,
            element_ty,
        } => {
            let tmp_offset = masm_array_init_tmp_offset(method, value.id)
                .ok_or_else(|| format!("Missing MASM array temp for value {}", value.id))?;
            emit_value_to_eax_masm(
                out,
                method,
                *array,
                current_method_is_static,
                current_package_name,
                current_class_name,
                method_symbols,
                method_staticness,
                method_symbols_by_sig,
                method_staticness_by_sig,
                stdlib_symbols,
                class_names,
                field_symbols,
                field_is_static,
                field_types,
                class_object_counter_symbol,
                local_offsets,
                param_offsets,
                string_literals,
            )?;
            out.push_str(&format!("    mov qword ptr [rsp+{}], rax\n", tmp_offset));
            emit_value_to_eax_masm(
                out,
                method,
                *index,
                current_method_is_static,
                current_package_name,
                current_class_name,
                method_symbols,
                method_staticness,
                method_symbols_by_sig,
                method_staticness_by_sig,
                stdlib_symbols,
                class_names,
                field_symbols,
                field_is_static,
                field_types,
                class_object_counter_symbol,
                local_offsets,
                param_offsets,
                string_literals,
            )?;
            out.push_str("    mov edx, eax\n");
            out.push_str(&format!("    mov rcx, qword ptr [rsp+{}]\n", tmp_offset));
            if native_array_uses_qword_scalar_lane(element_ty) {
                out.push_str("    call pulsec_rt_arrayGetLong\n");
            } else if is_string_type_name(element_ty)
                || element_ty.ends_with("[]")
                || (!matches!(
                    element_ty.as_str(),
                    "byte" | "short" | "int" | "char" | "boolean" | "ubyte" | "ushort" | "uint"
                ) && !matches!(
                    element_ty.as_str(),
                    "long" | "float" | "double" | "ulong" | "void"
                ))
            {
                out.push_str("    call pulsec_rt_arrayGetString\n");
            } else {
                out.push_str("    call pulsec_rt_arrayGetInt\n");
            }
            Ok(())
        }
        IrValueKind::ArraySet {
            array,
            index,
            value: stored_value,
            element_ty,
        } => {
            let array_tmp_offset = masm_array_init_tmp_offset(method, value.id)
                .ok_or_else(|| format!("Missing MASM array temp for value {}", value.id))?;
            let index_tmp_offset = masm_array_init_tmp_offset_at(method, value.id, 1)
                .ok_or_else(|| format!("Missing MASM array index temp for value {}", value.id))?;
            emit_value_to_eax_masm(
                out,
                method,
                *array,
                current_method_is_static,
                current_package_name,
                current_class_name,
                method_symbols,
                method_staticness,
                method_symbols_by_sig,
                method_staticness_by_sig,
                stdlib_symbols,
                class_names,
                field_symbols,
                field_is_static,
                field_types,
                class_object_counter_symbol,
                local_offsets,
                param_offsets,
                string_literals,
            )?;
            out.push_str(&format!(
                "    mov qword ptr [rsp+{}], rax\n",
                array_tmp_offset
            ));
            emit_value_to_eax_masm(
                out,
                method,
                *index,
                current_method_is_static,
                current_package_name,
                current_class_name,
                method_symbols,
                method_staticness,
                method_symbols_by_sig,
                method_staticness_by_sig,
                stdlib_symbols,
                class_names,
                field_symbols,
                field_is_static,
                field_types,
                class_object_counter_symbol,
                local_offsets,
                param_offsets,
                string_literals,
            )?;
            out.push_str(&format!(
                "    mov dword ptr [rsp+{}], eax\n",
                index_tmp_offset
            ));
            emit_value_to_eax_masm(
                out,
                method,
                *stored_value,
                current_method_is_static,
                current_package_name,
                current_class_name,
                method_symbols,
                method_staticness,
                method_symbols_by_sig,
                method_staticness_by_sig,
                stdlib_symbols,
                class_names,
                field_symbols,
                field_is_static,
                field_types,
                class_object_counter_symbol,
                local_offsets,
                param_offsets,
                string_literals,
            )?;
            out.push_str("    mov r8, rax\n");
            out.push_str(&format!(
                "    mov rcx, qword ptr [rsp+{}]\n",
                array_tmp_offset
            ));
            out.push_str(&format!(
                "    mov edx, dword ptr [rsp+{}]\n",
                index_tmp_offset
            ));
            if native_array_uses_qword_scalar_lane(element_ty) {
                out.push_str("    call pulsec_rt_arraySetLong\n");
            } else if is_string_type_name(element_ty)
                || element_ty.ends_with("[]")
                || (!matches!(
                    element_ty.as_str(),
                    "byte" | "short" | "int" | "char" | "boolean" | "ubyte" | "ushort" | "uint"
                ) && !matches!(
                    element_ty.as_str(),
                    "long" | "float" | "double" | "ulong" | "void"
                ))
            {
                out.push_str("    call pulsec_rt_arraySetString\n");
            } else {
                out.push_str("    call pulsec_rt_arraySetInt\n");
            }
            out.push_str("    xor eax, eax\n");
            Ok(())
        }
    }
}

pub(crate) fn resolve_method_call_signature_for_call(
    owner: &str,
    member: &str,
    args: &[IrValueId],
    method: &IrMethod,
    current_class_name: &str,
    class_names: &[String],
    field_types: &HashMap<String, String>,
    method_symbols_by_sig: &HashMap<(String, String, Vec<String>), String>,
) -> Option<(Vec<String>, bool)> {
    resolve_method_owner_and_param_types_for_call(
        owner,
        member,
        args,
        method,
        current_class_name,
        class_names,
        field_types,
        method_symbols_by_sig,
    )
    .map(|(_, sig, is_varargs)| (sig, is_varargs))
}

pub(crate) fn collect_object_arc_field_dispatch(ir: &IrProgram) -> BTreeMap<u32, ArcFieldDispatch> {
    let mut by_class_id: BTreeMap<u32, ArcFieldDispatch> = BTreeMap::new();
    for class in &ir.classes {
        let Some(class_id) = class_id_of(&class.name) else {
            continue;
        };
        if class
            .fields
            .iter()
            .any(|field| !field.is_static && is_arc_managed_type_name(&field.ty))
        {
            by_class_id.insert(
                class_id,
                ArcFieldDispatch {
                    teardown_proc: mangle_class_arc_teardown_proc_symbol(
                        &class.package_name,
                        &class.name,
                    ),
                    scan_edges_proc: mangle_class_arc_scan_edges_proc_symbol(
                        &class.package_name,
                        &class.name,
                    ),
                    invalidate_edges_proc: mangle_class_arc_invalidate_edges_proc_symbol(
                        &class.package_name,
                        &class.name,
                    ),
                },
            );
        }
    }
    by_class_id
}

pub(crate) fn extract_println_literals(method: &IrMethod) -> Result<Vec<String>, String> {
    let mut lines = Vec::new();
    for block in &method.blocks {
        for instr in &block.instructions {
            let IrInstr::Eval { value, .. } = instr else {
                continue;
            };
            let Some(v) = method.values.get(*value as usize) else {
                continue;
            };
            let IrValueKind::Call { callee, args } = &v.kind else {
                continue;
            };
            if args.len() != 1 {
                continue;
            }
            let Some(callee_v) = method.values.get(*callee as usize) else {
                continue;
            };
            let is_println = match &callee_v.kind {
                IrValueKind::MemberAccess { member, .. } => member == "println",
                IrValueKind::LocalRef(name) => name == "println",
                _ => false,
            };
            if !is_println {
                continue;
            }
            let Some(arg_v) = method.values.get(args[0] as usize) else {
                continue;
            };
            let line = match &arg_v.kind {
                IrValueKind::StringLiteral(s) => s.clone(),
                IrValueKind::IntLiteral(i) => i.to_string(),
                IrValueKind::BoolLiteral(b) => b.to_string(),
                _ => {
                    return Err(format!(
                        "Unsupported println argument kind at value id {}",
                        arg_v.id
                    ));
                }
            };
            lines.push(line);
        }
    }
    Ok(lines)
}
