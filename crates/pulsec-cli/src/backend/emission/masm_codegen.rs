use super::*;
use pulsec_core::intermediate::IrSourceLoc;

pub(crate) fn emit_arc_retain_from_eax(out: &mut String) {
    out.push_str("    mov qword ptr [rsp+32], rax\n");
    out.push_str("    mov rcx, rax\n");
    out.push_str("    call pulsec_rt_arcRetain\n");
}

pub(crate) fn emit_arc_release_from_eax(out: &mut String) {
    out.push_str("    mov rcx, rax\n");
    out.push_str("    call pulsec_rt_arcRelease\n");
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

fn resolve_method_owner_and_param_types_for_call(
    owner: &str,
    member: &str,
    args: &[IrValueId],
    method: &IrMethod,
    method_symbols_by_sig: &HashMap<(String, String, Vec<String>), String>,
) -> Option<(String, Vec<String>, bool)> {
    let mut current = owner.to_string();
    loop {
        if let Some((sig, is_varargs)) = resolve_method_param_types_for_call_exact(
            &current,
            member,
            args,
            method,
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
    method_symbols_by_sig: &HashMap<(String, String, Vec<String>), String>,
) -> Option<String> {
    let (resolved_owner, sig, _) = resolve_method_owner_and_param_types_for_call(
        owner,
        member,
        args,
        method,
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
                method_symbols_by_sig,
            )
        }
        IrValueKind::MemberAccess { object, member } => {
            let owner_v = method.values.get(*object as usize)?;
            let owner_name = match &owner_v.kind {
                IrValueKind::ThisRef => current_class_name.to_string(),
                IrValueKind::SuperRef => {
                    class_super_of(current_class_name).unwrap_or_else(|| current_class_name.to_string())
                }
                IrValueKind::LocalRef(name) => name.clone(),
                IrValueKind::NewObject { class_name, .. } => class_name.clone(),
                IrValueKind::MemberAccess { member: owner_member, .. } => {
                    if let Some(normalized) = normalize_class_owner_name(&owner_v.ty, class_names) {
                        normalized
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
            let resolved_owner = if let Some(normalized) =
                normalize_class_owner_name(&owner_name, class_names)
            {
                normalized
            } else if owner_name == "this" {
                current_class_name.to_string()
            } else if let Some(local_ty) = lookup_local_decl_type(method, &owner_name) {
                normalize_class_owner_name(&local_ty, class_names).unwrap_or(local_ty)
            } else if let Some(normalized) = normalize_class_owner_name(&owner_v.ty, class_names)
            {
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
                method_symbols_by_sig,
            )
        }
        _ => None,
    }
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
            out.push_str("    mov eax, eax\n");
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

fn emit_fp_compare_to_bool(
    out: &mut String,
    op: &IrBinaryOp,
    label_seed: &str,
) {
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
            _ => out.push_str("    mov eax, eax\n"),
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
            "uint" => out.push_str("    mov eax, eax\n"),
            _ => {}
        },
        "ulong" => match normalize_type_token(source_ty).as_str() {
            "byte" | "ubyte" => out.push_str("    movzx eax, al\n"),
            "short" | "ushort" | "char" => out.push_str("    movzx eax, ax\n"),
            "int" | "uint" => out.push_str("    mov eax, eax\n"),
            _ => {}
        },
        _ => {}
    }
}

fn emit_runtime_numeric_coercion(out: &mut String, source_ty: &str, target_ty: &str) {
    let source_ty = normalize_type_token(source_ty);
    let target_ty = normalize_type_token(target_ty);
    if source_ty == target_ty {
        return;
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
        return;
    }
    if is_float_scalar_type_name(&target_ty) {
        emit_numeric_rax_as_fp_operand(out, &source_ty);
        emit_round_fp_result_if_needed(out, target_ty == "float");
        out.push_str("    movq rax, xmm0\n");
        return;
    }
    emit_integral_cast(out, &source_ty, &target_ty);
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
    match (backend_unsigned_rank(&expected), backend_unsigned_rank(&actual)) {
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
    None
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
        let vararg_element_ty = vararg_array_ty.strip_suffix("[]").unwrap_or(vararg_array_ty);
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
                total = total.saturating_add(backend_conversion_score(vararg_element_ty, actual_ty)?);
            }
        }
    }
    Some(total)
}

fn uses_qword_integer_math(ty: &str) -> bool {
    matches!(normalize_type_token(ty).as_str(), "long" | "ulong")
}

fn uses_unsigned_integer_math(ty: &str) -> bool {
    matches!(normalize_type_token(ty).as_str(), "ubyte" | "ushort" | "uint" | "ulong")
}

fn binary_exec_mode(method: &IrMethod, left: IrValueId, right: IrValueId) -> (bool, bool) {
    let left_ty = primitive_cast_source_ty(method, left).unwrap_or_default();
    let right_ty = primitive_cast_source_ty(method, right).unwrap_or_default();
    let uses_qword =
        uses_qword_integer_math(&left_ty) || uses_qword_integer_math(&right_ty);
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
        expected_types.map(|types| types.len()).unwrap_or(args.len())
    } else {
        args.len()
    };

    for idx in 0..fixed_count.min(args.len()) {
        let arg_id = args[idx];
        let arg_ty = value_declared_type(
            method,
            arg_id,
            local_types,
            field_types,
            current_class_name,
        )
        .map(|ty| normalize_type_token(&ty));
        let expected_ty = expected_types.and_then(|types| types.get(idx)).cloned();
        let is_arc_arg = value_is_arc_managed(
            method,
            arg_id,
            local_types,
            field_types,
            current_class_name,
        );
        let use_64 = is_arc_arg
            || expected_ty
                .as_deref()
                .map(uses_qword_scalar_type_name)
                .or_else(|| arg_ty.as_deref().map(uses_qword_scalar_type_name))
                .unwrap_or(false);
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
        )?;
        if let (Some(source_ty), Some(expected_ty)) = (arg_ty.as_deref(), expected_ty.as_deref()) {
            emit_runtime_numeric_coercion(out, source_ty, expected_ty);
        }
        let spill_offset = arc_arg_spill_offset(method, idx);
        if use_64 {
            out.push_str(&format!("    mov qword ptr [rsp+{}], rax\n", spill_offset));
        } else {
            out.push_str(&format!("    mov dword ptr [rsp+{}], eax\n", spill_offset));
        }
        if is_arc_arg {
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
        let expected_types = expected_types.ok_or_else(|| "Missing expected varargs signature".to_string())?;
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
            )?;
            if let Some(source_ty) = arg_ty.as_deref() {
                emit_runtime_numeric_coercion(out, source_ty, &vararg_element_ty);
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
            let arg_ty = value_declared_type(
                method,
                arg_id,
                local_types,
                field_types,
                current_class_name,
            )
            .map(|ty| normalize_type_token(&ty));
            let expected_ty = expected_types.and_then(|types| types.get(idx)).cloned();
            let is_arc_arg = value_is_arc_managed(
                method,
                arg_id,
                local_types,
                field_types,
                current_class_name,
            );
            let use_64 = is_arc_arg
                || expected_ty
                    .as_deref()
                    .map(uses_qword_scalar_type_name)
                    .or_else(|| arg_ty.as_deref().map(uses_qword_scalar_type_name))
                    .unwrap_or(false);
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
            )?;
            if let (Some(source_ty), Some(expected_ty)) = (arg_ty.as_deref(), expected_ty.as_deref()) {
                emit_runtime_numeric_coercion(out, source_ty, expected_ty);
            }
            let spill_offset = arc_arg_spill_offset(method, idx);
            if use_64 {
                out.push_str(&format!("    mov qword ptr [rsp+{}], rax\n", spill_offset));
            } else {
                out.push_str(&format!("    mov dword ptr [rsp+{}], eax\n", spill_offset));
            }
            if is_arc_arg {
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
        out.push_str(&format!("    mov rcx, qword ptr [rsp+{}]\n", tmp_offset));
        out.push_str(&format!("    mov edx, {}\n", index));
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

pub(crate) fn resolve_method_symbol_for_call_exact(
    owner: &str,
    member: &str,
    args: &[IrValueId],
    method: &IrMethod,
    method_symbols: &HashMap<(String, String), String>,
    method_symbols_by_sig: &HashMap<(String, String, Vec<String>), String>,
) -> Option<String> {
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
    method_symbols
        .get(&(owner.to_string(), member.to_string()))
        .cloned()
}

pub(crate) fn resolve_method_param_types_for_call_exact(
    owner: &str,
    member: &str,
    args: &[IrValueId],
    method: &IrMethod,
    method_symbols_by_sig: &HashMap<(String, String, Vec<String>), String>,
) -> Option<(Vec<String>, bool)> {
    let mut arg_types = Vec::with_capacity(args.len());
    for arg in args {
        arg_types.push(value_type_token(method, *arg)?);
    }
    if method_symbols_by_sig.contains_key(&(owner.to_string(), member.to_string(), arg_types.clone()))
    {
        return Some((
            arg_types.clone(),
            method_is_varargs(owner, member, &arg_types),
        ));
    }
    compatible_backend_signature(owner, member, &arg_types, method_symbols_by_sig)
        .map(|(sig, _)| {
            let is_varargs = method_is_varargs(owner, member, &sig);
            (sig, is_varargs)
        })
}

pub(crate) fn resolve_method_symbol_for_call(
    owner: &str,
    member: &str,
    args: &[IrValueId],
    method: &IrMethod,
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
        if let Some(is_static) =
            method_staticness_by_sig.get(&(owner.to_string(), member.to_string(), arg_types.clone()))
        {
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
    let mut current = owner.to_string();
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
            return None;
        };
        current = parent;
    }
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
    if resolve_method_finality_for_call(
        owner,
        member,
        args,
        method,
        &method_finality_by_sig,
    )
    .unwrap_or(false)
    {
        return true;
    }
    matches!(
        resolve_method_visibility_for_call(
            owner,
            member,
            args,
            method,
            &method_visibility_by_sig
        ),
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
    method_symbols: &HashMap<(String, String), String>,
    method_symbols_by_sig: &HashMap<(String, String, Vec<String>), String>,
) -> Result<(String, Vec<(u32, String)>), String> {
    let default_target = resolve_method_symbol_for_call(
        owner,
        member,
        args,
        method,
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
        out.push_str("    cmp ecx, 0\n");
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
    out.push_str("    cmp ecx, 0\n");
    out.push_str(&format!("    je {}\n", label_null));
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
        out.push_str(&format!("    call {}\n", target));
        out.push_str(&format!("    jmp {}\n", label_done));
    }
    out.push_str(&format!("{}:\n", label_default));
    out.push_str(&format!("    call {}\n", default_target));
    out.push_str(&format!("    jmp {}\n", label_done));
    out.push_str(&format!("{}:\n", label_null));
    out.push_str(&format!("    call {}\n", DISPATCH_NULL_PANIC_SYMBOL));
    out.push_str(&format!("    jmp {}\n", label_done));
    out.push_str(&format!("{}:\n", label_type));
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

    out.push_str("    cmp eax, 0\n");
    out.push_str(&format!("    je {}\n", l_false));
    out.push_str("    mov ecx, eax\n");
    out.push_str(&format!("    call {}\n", OBJECT_CLASS_ID_SYMBOL));
    out.push_str("    mov edx, eax\n");
    out.push_str("    test edx, edx\n");
    out.push_str(&format!("    jz {}\n", l_false));
    for class_id in target_class_ids {
        out.push_str(&format!("    cmp edx, {}\n", class_id));
        out.push_str(&format!("    je {}\n", l_true));
    }
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

    out.push_str("    cmp eax, 0\n");
    out.push_str(&format!("    je {}\n", l_null));
    out.push_str("    mov r8, rax\n");
    out.push_str("    mov ecx, eax\n");
    out.push_str(&format!("    call {}\n", OBJECT_CLASS_ID_SYMBOL));
    out.push_str("    mov edx, eax\n");
    out.push_str("    test edx, edx\n");
    out.push_str(&format!("    jz {}\n", l_fail));
    for class_id in target_class_ids {
        out.push_str(&format!("    cmp edx, {}\n", class_id));
        out.push_str(&format!("    je {}\n", l_ok));
    }
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
    out.push_str("    mov rax, r8\n");
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
    for (idx, param) in method.params.iter().enumerate() {
        let slot = next_local_slot + idx;
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
    if !method.is_static {
        let slot = next_local_slot + method.params.len();
        let offset = local_base + (slot * 8);
        param_offsets.insert("__this".to_string(), offset);
        out.push_str(&format!("    mov qword ptr [rsp+{}], rcx\n", offset));
    }
    let mut initialized_arc_locals: HashSet<String> = HashSet::new();

    if method.is_constructor {
        let class_id = class_id_of(current_class_name).unwrap_or(0);
        out.push_str(&format!("    mov ecx, {}\n", class_id));
        out.push_str(&format!("    call {}\n", OBJECT_NEW_SYMBOL));
        if field_is_static.values().any(|is_static| !*is_static) {
            let helper_symbol =
                mangle_class_field_capacity_proc_symbol(current_package_name, current_class_name);
            let tmp = masm_arc_local_tmp_offset(method);
            out.push_str(&format!("    mov qword ptr [rsp+{}], rax\n", tmp));
            out.push_str("    mov ecx, eax\n");
            out.push_str(&format!("    call {}\n", helper_symbol));
            out.push_str(&format!("    mov rax, qword ptr [rsp+{}]\n", tmp));
        }
        out.push_str("    mov ecx, eax\n");
        if let Some(this_offset) = param_offsets.get("__this") {
            out.push_str(&format!(
                "    mov qword ptr [rsp+{}], rcx\n",
                this_offset
            ));
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
                out.push_str(&format!("    lea rcx, {}_b{}\n", method_symbol, handler_target));
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
                    let retain_new = value_requires_arc_retain_on_store(method, *value);
                    let target_ty = local_types
                        .get(name)
                        .cloned()
                        .or_else(|| method.params.iter().find(|p| p.name == *name).map(|p| p.ty.clone()))
                        .unwrap_or_else(|| "unknown".to_string());
                    let is_wide_target =
                        uses_qword_scalar_type_name(&target_ty) || is_handle_type_name(&target_ty);
                    let target_is_arc =
                        is_arc_managed_type_name(&target_ty) && !is_string_type_name(&target_ty);
                    if let Some(slot) = local_offsets.get(name) {
                        let offset = local_base + (slot * 8);
                        if target_is_arc {
                            let tmp = masm_arc_local_tmp_offset(method);
                            out.push_str(&format!("    mov qword ptr [rsp+{}], rax\n", tmp));
                            if initialized_arc_locals.contains(name) {
                                out.push_str(&format!("    mov rax, qword ptr [rsp+{}]\n", offset));
                                emit_arc_release_from_eax(out);
                            }
                            out.push_str(&format!("    mov rax, qword ptr [rsp+{}]\n", tmp));
                            if retain_new {
                                emit_arc_retain_from_eax(out);
                            }
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
                            out.push_str(&format!("    mov rax, qword ptr [rsp+{}]\n", offset));
                            emit_arc_release_from_eax(out);
                            out.push_str(&format!("    mov rax, qword ptr [rsp+{}]\n", tmp));
                            if retain_new {
                                emit_arc_retain_from_eax(out);
                            }
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

            // Detect lowered assignment shape: Eval(target), Eval(value) with same statement index.
            if let IrValueKind::LocalRef(target_name) = &v.kind {
                if let Some(IrInstr::Eval {
                    value: rhs_value,
                    source: rhs_source,
                }) = block.instructions.get(i + 1)
                {
                    if rhs_source.statement_index == source.statement_index {
                        let retain_new = value_requires_arc_retain_on_store(method, *rhs_value);
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
                            let target_ty = local_types
                                .get(target_name)
                                .cloned()
                                .unwrap_or_else(|| "unknown".to_string());
                            let is_wide_target = uses_qword_scalar_type_name(&target_ty)
                                || is_handle_type_name(&target_ty);
                            if is_arc_managed_type_name(&target_ty)
                                && !is_string_type_name(&target_ty)
                            {
                                let tmp = masm_arc_local_tmp_offset(method);
                                out.push_str(&format!("    mov qword ptr [rsp+{}], rax\n", tmp));
                                if initialized_arc_locals.contains(target_name) {
                                    out.push_str(&format!(
                                        "    mov rax, qword ptr [rsp+{}]\n",
                                        offset
                                    ));
                                    emit_arc_release_from_eax(out);
                                }
                                out.push_str(&format!("    mov rax, qword ptr [rsp+{}]\n", tmp));
                                if retain_new {
                                    emit_arc_retain_from_eax(out);
                                }
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
                            let target_ty = local_types
                                .get(target_name)
                                .cloned()
                                .unwrap_or_else(|| "unknown".to_string());
                            let is_wide_target = uses_qword_scalar_type_name(&target_ty)
                                || is_handle_type_name(&target_ty);
                            if is_arc_managed_type_name(&target_ty)
                                && !is_string_type_name(&target_ty)
                            {
                                let tmp = masm_arc_local_tmp_offset(method);
                                out.push_str(&format!("    mov qword ptr [rsp+{}], rax\n", tmp));
                                out.push_str(&format!("    mov rax, qword ptr [rsp+{}]\n", offset));
                                emit_arc_release_from_eax(out);
                                out.push_str(&format!("    mov rax, qword ptr [rsp+{}]\n", tmp));
                                if retain_new {
                                    emit_arc_retain_from_eax(out);
                                }
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
                            let target_is_arc = is_arc_managed_type_name(&target_ty);
                            let target_uses_qword = uses_qword_field_storage(&target_ty);
                            if target_is_arc {
                                if is_static_field {
                                    if target_uses_qword {
                                        out.push_str(&format!(
                                            "    mov rax, qword ptr [{}]\n",
                                            field_sym
                                        ));
                                    } else {
                                        out.push_str(&format!(
                                            "    mov eax, dword ptr [{}]\n",
                                            field_sym
                                        ));
                                    }
                                    emit_arc_release_from_eax(out);
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
                                    out.push_str(&format!("    mov r10, qword ptr [{}]\n", field_sym));
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
                                if target_uses_qword {
                                    out.push_str(&format!("    mov qword ptr [{}], rax\n", field_sym));
                                } else {
                                    out.push_str(&format!("    mov dword ptr [{}], eax\n", field_sym));
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

            if let IrValueKind::MemberAccess { object, member } = &v.kind {
                if let Some(IrInstr::Eval {
                    value: rhs_value,
                    source: rhs_source,
                }) = block.instructions.get(i + 1)
                {
                    if rhs_source.statement_index == source.statement_index {
                        if let Some(obj_val) = method.values.get(*object as usize) {
                            let is_this =
                                matches!(obj_val.kind, IrValueKind::ThisRef | IrValueKind::SuperRef);
                            let is_local_same_class = match &obj_val.kind {
                                IrValueKind::LocalRef(name) => local_types
                                    .get(name)
                                    .map(|ty| ty == current_class_name)
                                    .unwrap_or(false),
                                _ => false,
                            };
                            if is_this || is_local_same_class {
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
                                let field_uses_qword = uses_qword_field_storage(&field_ty);
                                let field_is_arc = is_arc_managed_type_name(&field_ty)
                                    && !is_string_type_name(&field_ty);
                                if field_is_arc {
                                    if is_static_field {
                                        if field_uses_qword {
                                            out.push_str(&format!(
                                                "    mov rax, qword ptr [{}]\n",
                                                field_sym
                                            ));
                                        } else {
                                            out.push_str(&format!(
                                                "    mov eax, dword ptr [{}]\n",
                                                field_sym
                                            ));
                                        }
                                        emit_arc_release_from_eax(out);
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
                                        out.push_str(&format!("    mov r10, qword ptr [{}]\n", field_sym));
                                        if field_uses_qword {
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
                                if field_is_arc {
                                    emit_arc_retain_from_eax(out);
                                }
                                if is_static_field {
                                    if field_uses_qword {
                                        out.push_str(&format!("    mov qword ptr [{}], rax\n", field_sym));
                                    } else {
                                        out.push_str(&format!("    mov dword ptr [{}], eax\n", field_sym));
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
                                    out.push_str(&format!("    mov r10, qword ptr [{}]\n", field_sym));
                                    if field_uses_qword {
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
            }
            let IrValueKind::Call { callee, args } = &v.kind else {
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
                        expected_sig.as_ref().map(|(_, is_varargs)| *is_varargs).unwrap_or(false),
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
                            method_symbols,
                            method_symbols_by_sig,
                        )
                        .ok_or_else(|| {
                            format!("Unknown call target '{}.{}'", owner, member_name)
                        })?;
                        out.push_str(&format!("    call {}\n", target));
                    } else {
                        if is_devirtualizable_instance_call(
                            &owner,
                            member_name,
                            args,
                            method,
                        ) {
                            let target = resolve_method_symbol_for_call(
                                &owner,
                                member_name,
                                args,
                                method,
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
                IrValueKind::LocalRef(owner) => owner.clone(),
                IrValueKind::NewObject { class_name, .. } => class_name.clone(),
                IrValueKind::ThisRef => current_class_name.to_string(),
                IrValueKind::SuperRef => {
                    is_super_receiver = true;
                    class_super_of(current_class_name).unwrap_or_else(|| current_class_name.to_string())
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
                let arg_ty = method
                    .values
                    .get(args[0] as usize)
                    .map(|v| {
                        if v.ty != "unknown" {
                            v.ty.clone()
                        } else if let IrValueKind::LocalRef(name) = &v.kind {
                            local_types
                                .get(name)
                                .cloned()
                                .unwrap_or_else(|| "unknown".to_string())
                        } else {
                            "unknown".to_string()
                        }
                    })
                    .ok_or_else(|| format!("Invalid {}.{} arg", owner, member))?;
                if !(arg_ty == "String"
                    || arg_ty.ends_with(".String")
                    || arg_ty == "com.pulse.lang.String")
                {
                    if arg_ty == "int" {
                        out.push_str("    mov ecx, eax\n");
                        out.push_str("    call pulsec_rt_intToString\n");
                    } else if arg_ty == "boolean" {
                        out.push_str("    mov ecx, eax\n");
                        out.push_str("    call pulsec_rt_booleanToString\n");
                    } else {
                        return Err(format!(
                            "Unsupported {}.{} argument type '{}' in masm-full",
                            owner, member, arg_ty
                        ));
                    }
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

            let resolved_owner = if let Some(normalized) =
                normalize_class_owner_name(&owner, class_names)
            {
                normalized
            } else if let Some(normalized) = normalize_class_owner_name(&object_v.ty, class_names)
            {
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
                expected_sig.as_ref().map(|(_, is_varargs)| *is_varargs).unwrap_or(false),
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
                    )?;
                    out.push_str("    mov rcx, rax\n");
                }
            }
            let devirt = !is_target_static
                && !is_super_receiver
                && is_devirtualizable_instance_call(
                    &resolved_owner,
                    member,
                    args,
                    method,
                );
            if is_target_static || is_super_receiver || devirt {
                let target = resolve_method_symbol_for_call(
                    &resolved_owner,
                    member,
                    args,
                    method,
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
                } else if method.is_constructor {
                    if let Some(this_offset) = param_offsets.get("__this") {
                        out.push_str(&format!(
                            "    mov eax, dword ptr [rsp+{}]\n",
                            this_offset
                        ));
                    } else {
                        out.push_str("    mov eax, ecx\n");
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
                    method_symbols,
                    method_symbols_by_sig,
                )
                .or_else(|| {
                    resolve_method_symbol_for_call(
                        "com.pulse.lang.Throwable",
                        "panic",
                        &[],
                        method,
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
                        out.push_str(&format!(
                            "    mov eax, dword ptr [rsp+{}]\n",
                            this_offset
                        ));
                    } else {
                        out.push_str("    mov eax, ecx\n");
                    }
                } else {
                    out.push_str("    xor eax, eax\n");
                }
                out.push_str(&format!("    jmp {}\n", epilogue_label));
            }
        }
    }

    out.push_str(&format!("{}:\n", epilogue_label));
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
            if uses_qword_scalar_type_name(&value.ty) {
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
            let is_wide_local = lookup_local_decl_type(method, name)
                .or_else(|| local_types.get(name).cloned())
                .map(|ty| uses_qword_scalar_type_name(&ty) || is_handle_type_name(&ty))
                .unwrap_or(false);
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
                    if field_uses_qword {
                        out.push_str(&format!("    mov rax, qword ptr [{}]\n", field_sym));
                    } else {
                        out.push_str(&format!("    mov eax, dword ptr [{}]\n", field_sym));
                    }
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
            let reg_idx = if current_method_is_static { idx } else { idx + 1 };
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
            let Some(obj) = method.values.get(*object as usize) else {
                return Err(format!("Invalid member object value id {}", object));
            };
            let is_this = matches!(obj.kind, IrValueKind::ThisRef | IrValueKind::SuperRef);
            if is_this {
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
                    if field_uses_qword {
                        out.push_str("    mov rax, qword ptr [r10+rdx*8]\n");
                    } else {
                        out.push_str("    mov eax, dword ptr [r10+rdx*4]\n");
                    }
                }
                return Ok(());
            }
            Err(format!(
                "Unsupported member access read in masm-full expression at id {}",
                value.id
            ))
        }
        IrValueKind::NewObject { class_name, args } => {
            if class_names.iter().any(|c| c == class_name) {
                if let Some(ctor) = resolve_method_symbol_for_call(
                    class_name,
                    class_name,
                    args,
                    method,
                    method_symbols,
                    method_symbols_by_sig,
                ) {
                    let expected_sig = resolve_method_call_signature_for_call(
                        class_name,
                        class_name,
                        args,
                        method,
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
                        expected_sig.as_ref().map(|(_, is_varargs)| *is_varargs).unwrap_or(false),
                        local_offsets,
                        param_offsets,
                        string_literals,
                    )?;
                    out.push_str(&format!("    call {}\n", ctor));
                    emit_call_arg_releases(out, method, &arc_arg_flags);
                } else {
                    let class_id = class_id_of(class_name).unwrap_or(0);
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
                if class_names.iter().any(|c| c == class_name) {
                    if let Some(ctor) = resolve_method_symbol_for_call(
                        class_name,
                        class_name,
                        args,
                        method,
                        method_symbols,
                        method_symbols_by_sig,
                    ) {
                        let expected_sig = resolve_method_call_signature_for_call(
                            class_name,
                            class_name,
                            args,
                            method,
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
                            expected_sig.as_ref().map(|(_, is_varargs)| *is_varargs).unwrap_or(false),
                            local_offsets,
                            param_offsets,
                            string_literals,
                        )?;
                        out.push_str(&format!("    call {}\n", ctor));
                        emit_call_arg_releases(out, method, &arc_arg_flags);
                    } else {
                        let class_id = class_id_of(class_name).unwrap_or(0);
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
                        expected_sig.as_ref().map(|(_, is_varargs)| *is_varargs).unwrap_or(false),
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
                            method_symbols,
                            method_symbols_by_sig,
                        )
                        .ok_or_else(|| {
                            format!("Unknown call target '{}.{}'", owner, class_name)
                        })?;
                        out.push_str(&format!("    call {}\n", target));
                    } else {
                        if is_devirtualizable_instance_call(
                            &owner,
                            class_name,
                            args,
                            method,
                        ) {
                            let target = resolve_method_symbol_for_call(
                                &owner,
                                class_name,
                                args,
                                method,
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
                IrValueKind::ThisRef => current_class_name.to_string(),
                IrValueKind::SuperRef => {
                    is_super_receiver = true;
                    class_super_of(current_class_name).unwrap_or_else(|| current_class_name.to_string())
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
                        if matches!(&base_v.kind, IrValueKind::LocalRef(name) if name == "System")
                        {
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
                    return Err(format!(
                        "Unsupported call owner kind for expression value id {} in {}.{}",
                        value.id,
                        current_class_name,
                        method.name
                    ))
                }
            };
            let resolved_owner = if let Some(normalized) =
                normalize_class_owner_name(&owner_name, class_names)
            {
                normalized
            } else if owner_name == "this" {
                current_class_name.to_string()
            } else if let Some(local_ty) = lookup_local_decl_type(method, &owner_name) {
                normalize_class_owner_name(&local_ty, class_names).unwrap_or(local_ty)
            } else if let Some(normalized) = normalize_class_owner_name(&owner_v.ty, class_names)
            {
                normalized
            } else if let Some(field_ty) = field_types.get(&owner_name) {
                normalize_class_owner_name(field_ty, class_names)
                    .unwrap_or_else(|| field_ty.clone())
            } else {
                owner_name.clone()
            };

            let std_owner = normalize_stdlib_owner(&resolved_owner).to_string();
            if let Some(std_sym) = stdlib_symbols.get(&(std_owner, member.clone())) {
                let arc_arg_flags = emit_call_args_with_arc_boundary(
                    out,
                    method,
                    args,
                    0,
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
                None,
                false,
                local_offsets,
                param_offsets,
                string_literals,
                )?;
                out.push_str(&format!("    call {}\n", std_sym));
                emit_call_arg_releases(out, method, &arc_arg_flags);
                return Ok(());
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
                expected_sig.as_ref().map(|(_, is_varargs)| *is_varargs).unwrap_or(false),
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
                    )?;
                    out.push_str("    mov rcx, rax\n");
                }
            }
            let devirt = !is_target_static
                && !is_super_receiver
                && is_devirtualizable_instance_call(
                    &resolved_owner,
                    member,
                    args,
                    method,
                );
            if is_target_static || is_super_receiver || devirt {
                let target = resolve_method_symbol_for_call(
                    &resolved_owner,
                    member,
                    args,
                    method,
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

            if is_primitive_type_name(ty) {
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
                let target_ty = normalize_type_token(ty);
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
                } else if is_float_scalar_type_name(&target_ty) {
                    emit_numeric_rax_as_fp_operand(out, &source_ty);
                    emit_round_fp_result_if_needed(out, target_ty == "float");
                    out.push_str("    movq rax, xmm0\n");
                } else {
                    emit_integral_cast(out, &source_ty, &target_ty);
                }
                return Ok(());
            }

            let target_ty = normalize_class_owner_name(ty, class_names).unwrap_or_else(|| ty.clone());
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
                    IrBinaryOp::Eq
                    | IrBinaryOp::NotEq
                    | IrBinaryOp::Less
                    | IrBinaryOp::LessEq
                    | IrBinaryOp::Greater
                    | IrBinaryOp::GreaterEq => {
                        let label_seed = format!(
                            "{}_{}_fp_cmp_{}_{}",
                            current_class_name,
                            method.name,
                            value.source.statement_index,
                            value.id
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
            let (binary_uses_qword, binary_uses_unsigned) =
                binary_exec_mode(method, *left, *right);
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
                            if binary_uses_unsigned { "setb" } else { "setl" }
                        }
                        IrBinaryOp::LessEq => {
                            if binary_uses_unsigned { "setbe" } else { "setle" }
                        }
                        IrBinaryOp::Greater => {
                            if binary_uses_unsigned { "seta" } else { "setg" }
                        }
                        IrBinaryOp::GreaterEq => {
                            if binary_uses_unsigned { "setae" } else { "setge" }
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
        IrValueKind::SwitchExpr { expr, cases, default } => {
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
        IrValueKind::ArrayGet { array, index, element_ty } => {
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
            if native_array_uses_qword_scalar_lane(element_ty) {
                out.push_str("    call pulsec_rt_arrayGetLong\n");
            } else if is_string_type_name(element_ty)
                || element_ty.ends_with("[]")
                || (!matches!(element_ty.as_str(), "byte" | "short" | "int" | "char" | "boolean" | "ubyte" | "ushort" | "uint")
                    && !matches!(element_ty.as_str(), "long" | "float" | "double" | "ulong" | "void"))
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
            if native_array_uses_qword_scalar_lane(element_ty) {
                out.push_str("    call pulsec_rt_arraySetLong\n");
            } else if is_string_type_name(element_ty)
                || element_ty.ends_with("[]")
                || (!matches!(element_ty.as_str(), "byte" | "short" | "int" | "char" | "boolean" | "ubyte" | "ushort" | "uint")
                    && !matches!(element_ty.as_str(), "long" | "float" | "double" | "ulong" | "void"))
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
    method_symbols_by_sig: &HashMap<(String, String, Vec<String>), String>,
) -> Option<(Vec<String>, bool)> {
    resolve_method_owner_and_param_types_for_call(owner, member, args, method, method_symbols_by_sig)
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


