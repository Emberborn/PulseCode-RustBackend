use super::*;

fn static_field_lazy_init(
    field: &IrField,
    method_symbols_by_sig: &HashMap<(String, String, Vec<String>), String>,
) -> Option<StaticFieldLazyInit> {
    let IrFieldInit::NewObject { class_name, args } = field.init.as_ref()? else {
        return None;
    };
    let owner = class_name.rsplit('.').next().unwrap_or(class_name).to_string();
    let sig = args
        .iter()
        .map(|arg| match arg {
            IrFieldInitArg::Int(_) => "int".to_string(),
            IrFieldInitArg::Long(_) => "long".to_string(),
            IrFieldInitArg::Bool(_) => "boolean".to_string(),
            IrFieldInitArg::Char(_) => "char".to_string(),
            IrFieldInitArg::String(_) => "String".to_string(),
        })
        .collect::<Vec<_>>();
    let ctor_symbol = method_symbols_by_sig
        .get(&(owner.clone(), owner.clone(), sig))
        .cloned()?;
    Some(StaticFieldLazyInit {
        ctor_symbol,
        args: args.clone(),
    })
}

fn format_trace_method_frame(
    package_name: &str,
    class_name: &str,
    method_name: &str,
    source_file: &str,
    source_line: usize,
) -> String {
    if source_line == 0 {
        format!("{}.{}.{}", package_name, class_name, method_name)
    } else {
        format!(
            "{}.{}.{}({}:{})",
            package_name, class_name, method_name, source_file, source_line
        )
    }
}

fn statement_trace_label(method_symbol: &str, statement_index: usize) -> String {
    format!("{}_trace_s{}", method_symbol, statement_index)
}

fn should_emit_trace_frame(package_name: &str, class_name: &str, method_name: &str) -> bool {
    !(package_name == "pulse.lang" && class_name == "Throwable" && method_name == "panic")
}

fn should_emit_statement_trace_metadata(
    package_name: &str,
    emit_statement_trace_metadata: bool,
) -> bool {
    if emit_statement_trace_metadata {
        return true;
    }
    !(package_name.starts_with("pulse.") || package_name.starts_with("author."))
}

fn collect_method_trace_frames(
    package_name: &str,
    class_name: &str,
    method: &IrMethod,
    method_symbol: &str,
) -> Vec<(String, String)> {
    let mut frames: Vec<(String, String)> = Vec::new();
    let mut seen: BTreeMap<usize, (String, usize)> = BTreeMap::new();

    for block in &method.blocks {
        for instr in &block.instructions {
            let source = match instr {
                IrInstr::DeclareLocal { source, .. }
                | IrInstr::StoreLocal { source, .. }
                | IrInstr::Eval { source, .. }
                | IrInstr::PushExceptionHandler { source, .. }
                | IrInstr::PopExceptionHandler { source, .. } => source,
            };
            if source.source_line > 0 {
                seen.entry(source.statement_index)
                    .or_insert_with(|| (source.source_file.clone(), source.source_line));
            }
        }

        let source = match &block.terminator {
            IrTerminator::Goto { source, .. }
            | IrTerminator::Branch { source, .. }
            | IrTerminator::Return { source, .. }
            | IrTerminator::Throw { source, .. } => Some(source),
            IrTerminator::Stop => None,
        };
        if let Some(source) = source {
            if source.source_line > 0 {
                seen.entry(source.statement_index)
                    .or_insert_with(|| (source.source_file.clone(), source.source_line));
            }
        }
    }

    for (statement_index, (source_file, source_line)) in seen {
        frames.push((
            statement_trace_label(method_symbol, statement_index),
            format_trace_method_frame(
                package_name,
                class_name,
                &method.name,
                &source_file,
                source_line,
            ),
        ));
    }

    frames
}

fn emit_class_id_set_table(out: &mut String, label: &str, class_ids: &[u32]) {
    if let Some((first, rest)) = class_ids.split_first() {
        out.push_str(&format!("{} dd {}\n", label, first));
        for class_id in rest {
            out.push_str(&format!("    dd {}\n", class_id));
        }
    } else {
        out.push_str(&format!("{} dd 0\n", label));
    }
}

fn collect_object_class_name_literals(ir: &IrProgram) -> Vec<(u32, String, String)> {
    let mut classes = ir
        .classes
        .iter()
        .map(|class| format!("{}.{}", class.package_name, class.name))
        .collect::<Vec<_>>();
    classes.sort();
    let mut names: Vec<(u32, String, String)> = classes
        .into_iter()
        .enumerate()
        .map(|(idx, full_name)| {
            let class_id = (idx as u32) + 1;
            let label = format!("rt_obj_class_name_{}", class_id);
            (class_id, label, full_name)
        })
        .collect();
    names.sort_by_key(|(class_id, _, _)| *class_id);
    names
}

fn emit_object_class_name_proc(
    out: &mut String,
    symbol: &str,
    class_name_literals: &[(u32, String, String)],
) {
    let invalid = format!("{}_invalid", symbol);
    let done = format!("{}_done", symbol);
    out.push_str(&format!("{} proc\n", symbol));
    out.push_str("    sub rsp, 56\n");
    out.push_str("    call pulsec_rt_objectClassId\n");
    for (class_id, _, _) in class_name_literals {
        let match_label = format!("{}_c{}", symbol, class_id);
        out.push_str(&format!("    cmp eax, {}\n", class_id));
        out.push_str(&format!("    je {}\n", match_label));
    }
    out.push_str(&format!("    jmp {}\n", invalid));
    for (class_id, label, _) in class_name_literals {
        let match_label = format!("{}_c{}", symbol, class_id);
        out.push_str(&format!("{}:\n", match_label));
        out.push_str(&format!("    lea rcx, {}\n", label));
        out.push_str(&format!("    mov edx, {}_len\n", label));
        out.push_str("    call pulsec_rt_stringFromBytes\n");
        out.push_str(&format!("    jmp {}\n", done));
    }
    out.push_str(&format!("{}:\n", invalid));
    out.push_str("    lea rcx, rt_empty\n");
    out.push_str("    xor edx, edx\n");
    out.push_str("    call pulsec_rt_stringFromBytes\n");
    out.push_str(&format!("{}:\n", done));
    out.push_str("    add rsp, 56\n");
    out.push_str("    ret\n");
    out.push_str(&format!("{} endp\n", symbol));
}

fn prune_unused_fixed_externs(source: &mut String, symbols: &[&str]) {
    let mut lines = source
        .lines()
        .map(|line| line.to_string())
        .collect::<Vec<_>>();
    for symbol in symbols {
        let occurrences = source.matches(symbol).count();
        if occurrences > 1 {
            continue;
        }
        let proc_line = format!("extrn {}:proc", symbol);
        let dword_line = format!("extrn {}:dword", symbol);
        lines.retain(|line| line != &proc_line && line != &dword_line);
    }
    *source = lines.join("\n");
    source.push('\n');
}

fn collect_called_proc_symbols(source: &str) -> Vec<String> {
    let mut out = Vec::new();
    for line in source.lines() {
        let trimmed = line.trim();
        let Some(target) = trimmed.strip_prefix("call ") else {
            continue;
        };
        let symbol = target.trim();
        if symbol.is_empty() || symbol.starts_with('@') || symbol.contains(' ') {
            continue;
        }
        out.push(symbol.to_string());
    }
    out.sort();
    out.dedup();
    out
}

fn max_local_rsp_offset_in_method(method_code: &str, stack_size: usize) -> Option<usize> {
    let bytes = method_code.as_bytes();
    let mut idx = 0usize;
    let mut max_offset: Option<usize> = None;
    let max_local_window = stack_size + 32;
    while idx + 6 < bytes.len() {
        if &bytes[idx..idx + 5] != b"[rsp+" {
            idx += 1;
            continue;
        }
        let mut end = idx + 5;
        while end < bytes.len() && bytes[end].is_ascii_digit() {
            end += 1;
        }
        if end == idx + 5 || end >= bytes.len() || bytes[end] != b']' {
            idx += 1;
            continue;
        }
        if let Ok(raw) = std::str::from_utf8(&bytes[idx + 5..end]) {
            if let Ok(offset) = raw.parse::<usize>() {
                if offset <= max_local_window {
                    max_offset = Some(max_offset.map(|cur| cur.max(offset)).unwrap_or(offset));
                }
            }
        }
        idx = end + 1;
    }
    max_offset
}

fn align_masm_method_stack_size(mut stack_size: usize) -> usize {
    while stack_size % 16 != 8 {
        stack_size += 1;
    }
    stack_size
}

fn rewrite_single_method_stack_frame(method_code: &mut String, old_size: usize, new_size: usize) {
    if old_size == new_size {
        return;
    }
    let mut lines = method_code.lines().map(|line| line.to_string()).collect::<Vec<_>>();
    if let Some(idx) = lines
        .iter()
        .position(|line| line.starts_with("    sub rsp, "))
    {
        lines[idx] = format!("    sub rsp, {}", new_size);
    }
    if let Some(idx) = lines
        .iter()
        .rposition(|line| line.starts_with("    add rsp, "))
    {
        lines[idx] = format!("    add rsp, {}", new_size);
    }
    *method_code = lines.join("\n");
    method_code.push('\n');
}

fn finalize_method_stack_frame(method_code: &mut String, stack_size: usize) -> usize {
    let required = max_local_rsp_offset_in_method(method_code, stack_size)
        .map(|offset| offset + 8)
        .unwrap_or(stack_size);
    let adjusted = align_masm_method_stack_size(stack_size.max(required));
    rewrite_single_method_stack_frame(method_code, stack_size, adjusted);
    adjusted
}

pub(crate) fn emit_masm_split_program_objects(
    ir: &IrProgram,
    out_dir: &Path,
    linker_override: Option<&Path>,
    emit_statement_trace_metadata: bool,
) -> Result<MasmSplitArtifacts, String> {
    let ml64 = discover_ml64(linker_override)
        .ok_or_else(|| "ml64.exe not found for split MASM path".to_string())?;
    let kernel32 = discover_kernel32_lib()
        .ok_or_else(|| "kernel32.lib not found for split MASM path".to_string())?;

    let obj_root = out_dir.join("obj");
    fs::create_dir_all(&obj_root).map_err(|e| {
        format!(
            "Failed to create object root '{}': {}",
            obj_root.display(),
            e
        )
    })?;

    let class_names = ir
        .classes
        .iter()
        .map(|c| normalize_type_token(&c.name))
        .collect::<Vec<_>>();
    let global_static_field_symbols = ir
        .classes
        .iter()
        .flat_map(|class| {
            class.fields.iter().filter_map(|field| {
                if !field.is_static {
                    return None;
                }
                Some((
                    mangle_field_symbol(&class.package_name, &class.name, &field.name),
                    mangle_static_field_getter_symbol(
                        &class.package_name,
                        &class.name,
                        &field.name,
                    ),
                    mangle_static_field_setter_symbol(
                        &class.package_name,
                        &class.name,
                        &field.name,
                    ),
                    uses_qword_field_storage(&field.ty),
                    field.ty.clone(),
                    class.package_name.clone(),
                    class.name.clone(),
                ))
            })
        })
        .collect::<Vec<_>>();
    let class_super = build_class_super_map(ir, &class_names);
    install_class_super_resolution(&class_super);
    let class_ids = build_class_id_map(ir);
    install_class_id_resolution(&class_ids);
    let class_packages = build_class_package_map(ir);
    install_class_package_resolution(&class_packages);
    let field_types_by_owner = build_field_type_map(ir);
    install_field_type_resolution(&field_types_by_owner);
    let object_arc_fields = collect_object_arc_field_dispatch(ir);
    let interface_types = build_interface_type_set(ir);
    install_interface_type_resolution(&interface_types);
    let class_interfaces = build_class_interfaces_map(ir, &class_names, &class_super);
    install_class_interfaces_resolution(&class_interfaces);
    let mut class_finality: HashMap<String, bool> = HashMap::new();
    let mut method_symbols: HashMap<(String, String), String> = HashMap::new();
    let mut method_staticness: HashMap<(String, String), bool> = HashMap::new();
    let mut method_symbols_by_sig: HashMap<(String, String, Vec<String>), String> = HashMap::new();
    let mut method_staticness_by_sig: HashMap<(String, String, Vec<String>), bool> = HashMap::new();
    let mut method_finality_by_sig: HashMap<(String, String, Vec<String>), bool> = HashMap::new();
    let mut method_visibility_by_sig: HashMap<(String, String, Vec<String>), IrVisibility> =
        HashMap::new();
    let mut method_return_types_by_sig: HashMap<(String, String, Vec<String>), String> =
        HashMap::new();
    let mut method_varargs_by_sig: HashMap<(String, String, Vec<String>), bool> = HashMap::new();
    let stdlib_symbols = default_stdlib_symbols();

    for class in &ir.classes {
        let class_owner = normalize_type_token(&class.name);
        class_finality.insert(class_owner.clone(), class.is_final);
        for method in &class.methods {
            let sig = method_param_type_tokens(method);
            let sig_key = sig.clone();
            let symbol = mangle_method_symbol(&class.package_name, &class.name, &method.name, &sig);
            method_symbols.insert((class_owner.clone(), method.name.clone()), symbol.clone());
            method_staticness.insert((class_owner.clone(), method.name.clone()), method.is_static);
            method_symbols_by_sig.insert(
                (class_owner.clone(), method.name.clone(), sig.clone()),
                symbol,
            );
            method_staticness_by_sig.insert(
                (class_owner.clone(), method.name.clone(), sig.clone()),
                method.is_static,
            );
            method_finality_by_sig.insert(
                (class_owner.clone(), method.name.clone(), sig.clone()),
                method.is_final,
            );
            method_visibility_by_sig.insert(
                (class_owner.clone(), method.name.clone(), sig_key),
                method.visibility,
            );
            method_return_types_by_sig.insert(
                (class_owner.clone(), method.name.clone(), sig.clone()),
                method
                    .return_type
                    .clone()
                    .unwrap_or_else(|| "void".to_string()),
            );
            method_varargs_by_sig.insert(
                (class_owner.clone(), method.name.clone(), sig.clone()),
                method.is_varargs,
            );
        }
    }
    install_class_finality_resolution(&class_finality);
    install_method_finality_resolution(&method_finality_by_sig);
    install_method_visibility_resolution(&method_visibility_by_sig);
    install_method_return_type_resolution(&method_return_types_by_sig);
    install_method_varargs_resolution(&method_varargs_by_sig);

    let entry_symbol = ir
        .classes
        .iter()
        .flat_map(|c| c.methods.iter().map(move |m| (&c.name, &c.package_name, m)))
        .find(|(_, _, m)| m.is_static && m.name == "main")
        .map(|(class_name, package, m)| {
            let sig = method_param_type_tokens(m);
            mangle_method_symbol(package, class_name, "main", &sig)
        })
        .ok_or_else(|| "No static main method found".to_string())?;

    let class_name_literals = collect_object_class_name_literals(ir);
    let mut link_inputs: Vec<PathBuf> = Vec::new();
    let mut app_owned_objects: Vec<PathBuf> = Vec::new();

    for class in &ir.classes {
        let pkg_rel = package_to_path(&class.package_name);
        let class_dir = obj_root.join(&pkg_rel);
        fs::create_dir_all(&class_dir).map_err(|e| {
            format!(
                "Failed to create class object dir '{}': {}",
                class_dir.display(),
                e
            )
        })?;
        let asm_path = class_dir.join(format!("{}.asm", class.name));
        let obj_path = class_dir.join(format!("{}.obj", class.name));

        let class_field_types: HashMap<String, String> = class
            .fields
            .iter()
            .map(|f| (f.name.clone(), f.ty.clone()))
            .collect();

        let mut source = String::new();
        let mut method_code = String::new();
        source.push_str("option casemap:none\n");
        source.push_str("extrn GetStdHandle:proc\n");
        source.push_str("extrn ReadFile:proc\n");
        source.push_str("extrn WriteFile:proc\n");
        source.push_str("extrn ExitProcess:proc\n");
        source.push_str("extrn GetSystemTimeAsFileTime:proc\n");
        source.push_str("extrn GetTickCount64:proc\n");
        source.push_str("extrn GetProcessHeap:proc\n");
        source.push_str("extrn HeapAlloc:proc\n");
        source.push_str("extrn HeapReAlloc:proc\n");
        source.push_str("extrn HeapFree:proc\n");
        source.push_str("extrn pulsec_rt_stringFromBytes:proc\n");
        source.push_str("extrn pulsec_rt_consoleWrite:proc\n");
        source.push_str("extrn pulsec_rt_consoleWriteLine:proc\n");
        source.push_str("extrn pulsec_rt_panic:proc\n");
        source.push_str("extrn pulsec_rt_fpToInt:proc\n");
        source.push_str("extrn pulsec_rt_fpToLong:proc\n");
        let object_to_string_symbol =
            mangle_method_symbol("pulse.lang", "Object", "toString", &[]);
        let throwable_to_string_symbol =
            mangle_method_symbol("pulse.lang", "Throwable", "toString", &[]);
        if !(class.package_name == "pulse.lang" && class.name == "Object") {
            source.push_str(&format!("extrn {}:proc\n", object_to_string_symbol));
        }
        if !(class.package_name == "pulse.lang" && class.name == "Throwable") {
            source.push_str(&format!("extrn {}:proc\n", throwable_to_string_symbol));
        }
        source.push_str(&format!("extrn {}:proc\n", DISPATCH_NULL_PANIC_SYMBOL));
        source.push_str(&format!("extrn {}:proc\n", DISPATCH_TYPE_PANIC_SYMBOL));
        source.push_str(&format!("extrn {}:proc\n", OBJECT_NEW_SYMBOL));
        source.push_str(&format!("extrn {}:proc\n", OBJECT_CLASS_ID_SYMBOL));
        source.push_str(&format!("extrn {}:proc\n", CLASS_ID_IN_SET_SYMBOL));
        source.push_str(&format!("extrn {}:proc\n", OBJECT_CLASS_NAME_SYMBOL));
        source.push_str(&format!("extrn {}:proc\n", OBJECT_HASH_CODE_SYMBOL));
        source.push_str("extrn pulsec_rt_arcRetain:proc\n");
        source.push_str("extrn pulsec_rt_arcRelease:proc\n");
        source.push_str(&format!("extrn {}:dword\n", RT_OBJECT_COUNTER_SYMBOL));
        source.push_str("extrn rt_slot_capacity:dword\n");
        source.push_str("extrn rt_arc_refcounts_tbl:dword\n");
        source.push_str("extrn rt_arc_kinds_tbl:dword\n");
        source.push_str("extrn rt_arc_flags_tbl:dword\n");
        source.push_str(&format!("extrn {}:proc\n", TRACE_PUSH_SYMBOL));
        source.push_str(&format!("extrn {}:proc\n", TRACE_UPDATE_SYMBOL));
        source.push_str(&format!("extrn {}:proc\n", TRACE_POP_SYMBOL));
        source.push_str(&format!("extrn {}:proc\n", EXC_PUSH_HANDLER_SYMBOL));
        source.push_str(&format!("extrn {}:proc\n", EXC_POP_HANDLER_SYMBOL));
        source.push_str(&format!("extrn {}:proc\n", EXC_TAKE_PENDING_SYMBOL));
        source.push_str(&format!("extrn {}:proc\n", EXC_THROW_SYMBOL));
        let mut externs: Vec<String> = Vec::new();
        let class_owner = normalize_type_token(&class.name);

        let mut class_method_symbols: HashSet<String> = HashSet::new();
        begin_class_id_set_table_collection();
        for method in &class.methods {
            let sig = method_param_type_tokens(method);
            if let Some(sym) =
                method_symbols_by_sig.get(&(class_owner.clone(), method.name.clone(), sig))
            {
                class_method_symbols.insert(sym.clone());
            }
        }

        for method in &class.methods {
            let mut local_types: HashMap<String, String> = HashMap::new();
            for field in &class.fields {
                local_types.insert(field.name.clone(), field.ty.clone());
            }
            for block in &method.blocks {
                for instr in &block.instructions {
                    if let IrInstr::DeclareLocal { name, ty, .. } = instr {
                        local_types.insert(name.clone(), ty.clone());
                    }
                }
            }
            let own_sig = method_param_type_tokens(method);
            let own = method_symbols_by_sig
                .get(&(class_owner.clone(), method.name.clone(), own_sig))
                .cloned()
                .unwrap_or_default();
            for value in &method.values {
                if let IrValueKind::NewObject {
                    class_name: owner_class,
                    args,
                } = &value.kind
                {
                    if owner_class == &class.name {
                        continue;
                    }
                    if let Some(sym) = resolve_method_symbol_for_call(
                        owner_class,
                        owner_class,
                        args,
                        method,
                        &class.name,
                        &class_names,
                        &class_field_types,
                        &method_symbols,
                        &method_symbols_by_sig,
                    ) {
                        if *sym != own {
                            externs.push(sym);
                        }
                    }
                    continue;
                }
                let IrValueKind::Call { callee, args } = &value.kind else {
                    continue;
                };
                let Some(callee_v) = method.values.get(*callee as usize) else {
                    continue;
                };
                if let IrValueKind::LocalRef(owner_class) = &callee_v.kind {
                    if owner_class == &class.name {
                        continue;
                    }
                    if let Some(sym) = resolve_method_symbol_for_call(
                        owner_class,
                        owner_class,
                        args,
                        method,
                        &class.name,
                        &class_names,
                        &class_field_types,
                        &method_symbols,
                        &method_symbols_by_sig,
                    ) {
                        if *sym != own {
                            externs.push(sym);
                        }
                    }
                    continue;
                }
                let IrValueKind::MemberAccess { object, member } = &callee_v.kind else {
                    continue;
                };
                let Some(object_v) = method.values.get(*object as usize) else {
                    continue;
                };
                let resolved_owner = match &object_v.kind {
                    IrValueKind::ThisRef => class_owner.clone(),
                    IrValueKind::SuperRef => {
                        class_super_of(&class_owner).unwrap_or_else(|| class_owner.clone())
                    }
                    IrValueKind::LocalRef(owner) => {
                        if owner == "this" {
                            class_owner.clone()
                        } else if let Some(normalized) =
                            normalize_class_owner_name(owner, &class_names)
                        {
                            normalized
                        } else if let Some(normalized) =
                            normalize_class_owner_name(&object_v.ty, &class_names)
                        {
                            normalized
                        } else if let Some(ty) = local_types.get(owner) {
                            normalize_class_owner_name(ty, &class_names)
                                .unwrap_or_else(|| ty.clone())
                        } else {
                            owner.clone()
                        }
                    }
                    IrValueKind::MemberAccess { object, member } => {
                        if member == "out" {
                            let Some(base_v) = method.values.get(*object as usize) else {
                                continue;
                            };
                            if matches!(&base_v.kind, IrValueKind::LocalRef(name) if name == "System")
                            {
                                "System.out".to_string()
                            } else {
                                continue;
                            }
                        } else if member == "in" {
                            let Some(base_v) = method.values.get(*object as usize) else {
                                continue;
                            };
                            if matches!(&base_v.kind, IrValueKind::LocalRef(name) if name == "System")
                            {
                                "ConsoleReader".to_string()
                            } else {
                                continue;
                            }
                        } else if let Some(normalized) =
                            normalize_class_owner_name(&object_v.ty, &class_names)
                        {
                            normalized
                        } else if let Some(ty) = class_field_types.get(member) {
                            normalize_class_owner_name(ty, &class_names)
                                .unwrap_or_else(|| ty.clone())
                        } else if let Some(path) = value_dotted_path(method, *object) {
                            path
                        } else {
                            continue;
                        }
                    }
                    _ => continue,
                };
                let symbol_owner = normalize_stdlib_owner(&resolved_owner).to_string();
                if let Some(sym) = stdlib_symbols.get(&(symbol_owner, member.clone())) {
                    externs.push(sym.clone());
                } else {
                    let is_super_receiver = matches!(&object_v.kind, IrValueKind::SuperRef);
                    let is_target_static = resolve_method_staticness_for_call(
                        &resolved_owner,
                        member,
                        args,
                        method,
                        &method_staticness,
                        &method_staticness_by_sig,
                    )
                    .unwrap_or(false);
                    let devirt = !is_target_static
                        && !is_super_receiver
                        && is_devirtualizable_instance_call(&resolved_owner, member, args, method);
                    if !is_target_static && !is_super_receiver && !devirt {
                        if let Ok((default_target, overrides)) = collect_virtual_dispatch_overrides(
                            &resolved_owner,
                            member,
                            args,
                            method,
                            &class.name,
                            &class_names,
                            &class_field_types,
                            &method_symbols,
                            &method_symbols_by_sig,
                        ) {
                            if !class_method_symbols.contains(&default_target) {
                                externs.push(default_target);
                            }
                            for (_, target) in overrides {
                                if !class_method_symbols.contains(&target) {
                                    externs.push(target);
                                }
                            }
                            continue;
                        }
                    }
                    if let Some(sym) = resolve_method_symbol_for_call(
                        &resolved_owner,
                        member,
                        args,
                        method,
                        &class.name,
                        &class_names,
                        &class_field_types,
                        &method_symbols,
                        &method_symbols_by_sig,
                    ) {
                        if !class_method_symbols.contains(&sym) {
                            externs.push(sym);
                        }
                    }
                }
            }

            for block in &method.blocks {
                if matches!(block.terminator, IrTerminator::Throw { .. }) {
                    externs.push(mangle_method_symbol(
                        "pulse.lang",
                        "Throwable",
                        "panic",
                        &[],
                    ));
                }
            }
        }
        externs.sort();
        externs.dedup();
        for ext in externs {
            source.push_str(&format!("extrn {}:proc\n", ext));
        }
        for (
            _sym,
            getter_sym,
            setter_sym,
            _uses_qword,
            _field_ty,
            owner_package,
            owner_class,
        ) in &global_static_field_symbols
        {
            if owner_package == &class.package_name && owner_class == &class.name {
                continue;
            }
            source.push_str(&format!("extrn {}:proc\n", getter_sym));
            source.push_str(&format!("extrn {}:proc\n", setter_sym));
        }
        source.push('\n');

        let mut class_literals: Vec<String> = Vec::new();
        let mut method_trace_literals: Vec<(String, String)> = Vec::new();
        let mut field_symbols: HashMap<String, String> = HashMap::new();
        let mut field_is_static: HashMap<String, bool> = HashMap::new();
        let mut field_types: HashMap<String, String> = HashMap::new();
        let class_object_counter_symbol =
            mangle_class_counter_symbol(&class.package_name, &class.name);
        for field in &class.fields {
            field_symbols.insert(
                field.name.clone(),
                mangle_field_symbol(&class.package_name, &class.name, &field.name),
            );
            field_is_static.insert(field.name.clone(), field.is_static);
            field_types.insert(field.name.clone(), field.ty.clone());
        }
        for field in &class.fields {
            if let Some(sym) = field_symbols.get(&field.name) {
                source.push_str(&format!("public {}\n", sym));
                if field.is_static {
                    source.push_str(&format!(
                        "public {}\n",
                        mangle_static_field_getter_symbol(
                            &class.package_name,
                            &class.name,
                            &field.name
                        )
                    ));
                    source.push_str(&format!(
                        "public {}\n",
                        mangle_static_field_setter_symbol(
                            &class.package_name,
                            &class.name,
                            &field.name
                        )
                    ));
                }
                if !field.is_static {
                    source.push_str(&format!(
                        "public {}\n",
                        mangle_field_heap_owned_symbol(
                            &class.package_name,
                            &class.name,
                            &field.name
                        )
                    ));
                }
            }
        }
        source.push('\n');

        for method in &class.methods {
            let sig = method_param_type_tokens(method);
            let symbol = method_symbols_by_sig
                .get(&(class_owner.clone(), method.name.clone(), sig))
                .ok_or_else(|| format!("Missing symbol for {}.{}", class.name, method.name))?;
            let method_trace_enabled =
                should_emit_trace_frame(&class.package_name, &class.name, &method.name);
            let statement_trace_enabled = should_emit_statement_trace_metadata(
                &class.package_name,
                emit_statement_trace_metadata,
            );
            let trace_label = if method_trace_enabled {
                let trace_label = format!("trace_m{}", method_trace_literals.len());
                let trace_name = format_trace_method_frame(
                    &class.package_name,
                    &class.name,
                    &method.name,
                    &method.name,
                    0,
                );
                method_trace_literals.push((trace_label.clone(), trace_name));
                if statement_trace_enabled {
                    method_trace_literals.extend(collect_method_trace_frames(
                        &class.package_name,
                        &class.name,
                        method,
                        symbol,
                    ));
                }
                Some(trace_label)
            } else {
                None
            };
            let stack_size = masm_method_stack_size(method);
            let incoming_rcx = stack_size - 32;
            let incoming_rdx = stack_size - 24;
            let incoming_r8 = stack_size - 16;
            let incoming_r9 = stack_size - 8;
            let mut single_method_code = String::new();
            single_method_code.push_str(&format!("{} proc\n", symbol));
            single_method_code.push_str(&format!("    sub rsp, {}\n", stack_size));
            single_method_code.push_str(&format!(
                "    mov qword ptr [rsp+{}], rcx\n",
                incoming_rcx
            ));
            single_method_code.push_str(&format!(
                "    mov qword ptr [rsp+{}], rdx\n",
                incoming_rdx
            ));
            single_method_code.push_str(&format!(
                "    mov qword ptr [rsp+{}], r8\n",
                incoming_r8
            ));
            single_method_code.push_str(&format!(
                "    mov qword ptr [rsp+{}], r9\n",
                incoming_r9
            ));
            if let Some(trace_label) = &trace_label {
                single_method_code.push_str(&format!("    lea rcx, {}\n", trace_label));
                single_method_code.push_str(&format!("    mov edx, {}_len\n", trace_label));
                single_method_code.push_str(&format!("    call {}\n", TRACE_PUSH_SYMBOL));
            }
            single_method_code.push_str(&format!(
                "    mov rcx, qword ptr [rsp+{}]\n",
                incoming_rcx
            ));
            single_method_code.push_str(&format!(
                "    mov rdx, qword ptr [rsp+{}]\n",
                incoming_rdx
            ));
            single_method_code.push_str(&format!(
                "    mov r8, qword ptr [rsp+{}]\n",
                incoming_r8
            ));
            single_method_code.push_str(&format!(
                "    mov r9, qword ptr [rsp+{}]\n",
                incoming_r9
            ));
            emit_masm_method_body(
                &mut single_method_code,
                &class.package_name,
                &class.name,
                symbol,
                method,
                &method_symbols,
                &method_staticness,
                &method_symbols_by_sig,
                &method_staticness_by_sig,
                &stdlib_symbols,
                &class_names,
                &field_symbols,
                &field_is_static,
                &field_types,
                &class_object_counter_symbol,
                &mut class_literals,
                statement_trace_enabled && method_trace_enabled,
            )?;
            single_method_code.push_str(&format!("{}_epilogue_post:\n", symbol));
            let epilogue_ret_spill = masm_call_retval_spill_offset(method);
            single_method_code.push_str(&format!(
                "    mov qword ptr [rsp+{}], rax\n",
                epilogue_ret_spill
            ));
            if method_trace_enabled {
                single_method_code.push_str(&format!("    call {}\n", TRACE_POP_SYMBOL));
            }
            single_method_code.push_str(&format!(
                "    mov rax, qword ptr [rsp+{}]\n",
                epilogue_ret_spill
            ));
            single_method_code.push_str(&format!("    add rsp, {}\n", stack_size));
            single_method_code.push_str("    ret\n");
            single_method_code.push_str(&format!("{} endp\n\n", symbol));
            let _ = finalize_method_stack_frame(&mut single_method_code, stack_size);
            method_code.push_str(&single_method_code);
        }
        let class_id_set_tables = take_class_id_set_tables();
        let mut local_helper_symbols = vec![
            mangle_class_field_capacity_proc_symbol(&class.package_name, &class.name),
            mangle_class_arc_teardown_proc_symbol(&class.package_name, &class.name),
            mangle_class_arc_scan_edges_proc_symbol(&class.package_name, &class.name),
            mangle_class_arc_invalidate_edges_proc_symbol(&class.package_name, &class.name),
        ];
        for field in &class.fields {
            if !field.is_static {
                continue;
            }
            local_helper_symbols.push(mangle_static_field_getter_symbol(
                &class.package_name,
                &class.name,
                &field.name,
            ));
            local_helper_symbols.push(mangle_static_field_setter_symbol(
                &class.package_name,
                &class.name,
                &field.name,
            ));
        }
        for called in collect_called_proc_symbols(&method_code) {
            if class_method_symbols.contains(&called) {
                continue;
            }
            if local_helper_symbols.iter().any(|sym| sym == &called) {
                continue;
            }
            let extrn = format!("extrn {}:proc", called);
            if !source.contains(&extrn) {
                source.push_str(&extrn);
                source.push('\n');
            }
        }
        for field in &class.fields {
            let Some(lazy_init) = static_field_lazy_init(field, &method_symbols_by_sig) else {
                continue;
            };
            if class_method_symbols.contains(&lazy_init.ctor_symbol) {
                continue;
            }
            let extrn = format!("extrn {}:proc", lazy_init.ctor_symbol);
            if !source.contains(&extrn) {
                source.push_str(&extrn);
                source.push('\n');
            }
        }
        source.push_str(".data\n");
        source.push_str("written dq 0\n");
        source.push_str(&format!("{} dd 0\n", class_object_counter_symbol));
        if class.fields.iter().any(|field| !field.is_static) {
            source.push_str(&format!(
                "{} dd {}\n",
                mangle_class_field_capacity_symbol(&class.package_name, &class.name),
                HANDLE_SLOT_INITIAL_CAPACITY
            ));
        }
        for field in &class.fields {
            if let Some(sym) = field_symbols.get(&field.name) {
                if field.is_static {
                    source.push_str(&format!("{} {}\n", sym, masm_field_data_directive(field)));
                } else {
                    let table_sym =
                        mangle_field_table_symbol(&class.package_name, &class.name, &field.name);
                    let heap_owned_sym = mangle_field_heap_owned_symbol(
                        &class.package_name,
                        &class.name,
                        &field.name,
                    );
                    if uses_qword_field_storage(&field.ty) {
                        source.push_str(&format!(
                            "{} dq {} dup(0)\n",
                            table_sym,
                            HANDLE_SLOT_INITIAL_CAPACITY + 1
                        ));
                    } else {
                        source.push_str(&format!(
                            "{} dd {} dup(0)\n",
                            table_sym,
                            HANDLE_SLOT_INITIAL_CAPACITY + 1
                        ));
                    }
                    source.push_str(&format!("{} dq {}\n", sym, table_sym));
                    source.push_str(&format!("{} dd 0\n", heap_owned_sym));
                }
            }
        }
        for (label, text) in &method_trace_literals {
            emit_masm_db(&mut source, label, text);
            source.push_str(&format!("{}_len equ {}\n", label, masm_db_len(text)));
        }
        for (label, class_ids) in &class_id_set_tables {
            emit_class_id_set_table(&mut source, label, class_ids);
        }
        for (i, line) in class_literals.iter().enumerate() {
            emit_masm_db(&mut source, &format!("msg{}", i), line);
            source.push_str(&format!("msg{}_len equ {}\n", i, masm_db_len(line)));
        }
        source.push_str("\n.code\n");
        emit_class_field_capacity_proc(
            &mut source,
            &class.package_name,
            &class.name,
            &class.fields,
        );
        emit_class_arc_field_helpers(&mut source, &class.package_name, &class.name, &class.fields);
        for field in &class.fields {
            if !field.is_static {
                continue;
            }
            emit_static_field_getter_proc(
                &mut method_code,
                &mangle_static_field_getter_symbol(
                    &class.package_name,
                    &class.name,
                    &field.name,
                ),
                &mangle_field_symbol(&class.package_name, &class.name, &field.name),
                &field.ty,
                static_field_lazy_init(field, &method_symbols_by_sig).as_ref(),
            );
            method_code.push('\n');
            emit_static_field_setter_proc(
                &mut method_code,
                &mangle_static_field_setter_symbol(
                    &class.package_name,
                    &class.name,
                    &field.name,
                ),
                &mangle_field_symbol(&class.package_name, &class.name, &field.name),
                &field.ty,
            );
            method_code.push_str("\n\n");
        }
        source.push_str(&method_code);
        source.push_str("end\n");
        prune_unused_fixed_externs(
            &mut source,
            &[
                "pulsec_rt_stringFromBytes",
                "pulsec_rt_consoleWrite",
                "pulsec_rt_consoleWriteLine",
                "pulsec_rt_panic",
                "pulsec_rt_fpToInt",
                "pulsec_rt_fpToLong",
                object_to_string_symbol.as_str(),
                throwable_to_string_symbol.as_str(),
                DISPATCH_NULL_PANIC_SYMBOL,
                DISPATCH_TYPE_PANIC_SYMBOL,
                OBJECT_NEW_SYMBOL,
                OBJECT_CLASS_ID_SYMBOL,
                CLASS_ID_IN_SET_SYMBOL,
                OBJECT_CLASS_NAME_SYMBOL,
                OBJECT_HASH_CODE_SYMBOL,
                "pulsec_rt_arcRetain",
                "pulsec_rt_arcRelease",
                RT_OBJECT_COUNTER_SYMBOL,
                "rt_slot_capacity",
                "rt_arc_refcounts_tbl",
                "rt_arc_kinds_tbl",
                "rt_arc_flags_tbl",
                TRACE_PUSH_SYMBOL,
                TRACE_UPDATE_SYMBOL,
                TRACE_POP_SYMBOL,
                EXC_PUSH_HANDLER_SYMBOL,
                EXC_POP_HANDLER_SYMBOL,
                EXC_TAKE_PENDING_SYMBOL,
                EXC_THROW_SYMBOL,
            ],
        );

        fs::write(&asm_path, source)
            .map_err(|e| format!("Failed to write class asm '{}': {}", asm_path.display(), e))?;
        run_ml64(&ml64, &asm_path, &obj_path)?;
        app_owned_objects.push(obj_path.clone());
        link_inputs.push(obj_path);
    }

    let std_dir = obj_root.join("runtime");
    fs::create_dir_all(&std_dir).map_err(|e| {
        format!(
            "Failed to create stdlib obj dir '{}': {}",
            std_dir.display(),
            e
        )
    })?;
    let std_asm_path = std_dir.join("StdlibRuntime.asm");
    let std_obj_path = std_dir.join("StdlibRuntime.obj");
    let mut std_src = String::new();
    std_src.push_str("option casemap:none\n");
    std_src.push_str("extrn GetStdHandle:proc\n");
    std_src.push_str("extrn ReadFile:proc\n");
    std_src.push_str("extrn WriteFile:proc\n\n");
    std_src.push_str("extrn ExitProcess:proc\n\n");
    std_src.push_str("extrn GetSystemTimeAsFileTime:proc\n");
    std_src.push_str("extrn GetTickCount64:proc\n\n");
    std_src.push_str("extrn GetProcessHeap:proc\n");
    std_src.push_str("extrn GetFileAttributesA:proc\n");
    std_src.push_str("extrn CreateDirectoryA:proc\n");
    std_src.push_str("extrn CopyFileA:proc\n");
    std_src.push_str("extrn CreateFileA:proc\n");
    std_src.push_str("extrn CreateProcessA:proc\n");
    std_src.push_str("extrn GetFileSize:proc\n");
    std_src.push_str("extrn GetExitCodeProcess:proc\n");
    std_src.push_str("extrn CloseHandle:proc\n");
    std_src.push_str("extrn FindFirstFileA:proc\n");
    std_src.push_str("extrn FindNextFileA:proc\n");
    std_src.push_str("extrn FindClose:proc\n");
    std_src.push_str("extrn HeapAlloc:proc\n");
    std_src.push_str("extrn HeapReAlloc:proc\n");
    std_src.push_str("extrn HeapFree:proc\n\n");
    std_src.push_str("extrn WaitForSingleObject:proc\n\n");
    for dispatch in object_arc_fields.values() {
        std_src.push_str(&format!("extrn {}:proc\n", dispatch.teardown_proc));
        std_src.push_str(&format!("extrn {}:proc\n", dispatch.scan_edges_proc));
        std_src.push_str(&format!("extrn {}:proc\n", dispatch.invalidate_edges_proc));
    }
    std_src.push('\n');
    std_src.push_str(".data\n");
    std_src.push_str("written dq 0\n\n");
    std_src.push_str(&format!("public {}\n", RT_OBJECT_COUNTER_SYMBOL));
    std_src.push_str(&format!("{} dd 0\n", RT_OBJECT_COUNTER_SYMBOL));
    std_src.push_str(&format!("public {}\n", RT_OBJECT_CLASS_IDS_SYMBOL));
    std_src.push_str(&format!(
        "{} dq {}\n",
        RT_OBJECT_CLASS_IDS_SYMBOL, RT_OBJECT_CLASS_IDS_INIT_SYMBOL
    ));
    std_src.push_str(&format!("{} dd 0\n", RT_OBJECT_CLASS_IDS_HEAP_OWNED_SYMBOL));
    std_src.push_str(&format!(
        "{} dd {} dup(0)\n\n",
        RT_OBJECT_CLASS_IDS_INIT_SYMBOL,
        HANDLE_SLOT_INITIAL_CAPACITY + 1
    ));
    emit_runtime_data_tables(&mut std_src);
    for (_, label, text) in &class_name_literals {
        emit_masm_db(&mut std_src, label, text);
        std_src.push_str(&format!("{}_len equ {}\n", label, masm_db_len(text)));
    }
    std_src.push('\n');
    std_src.push_str(".code\n");
    emit_runtime_init_proc(&mut std_src, "pulsec_rt_init", WRITE_RAW_SYMBOL);
    std_src.push('\n');
    emit_runtime_shutdown_proc(&mut std_src, "pulsec_rt_shutdown");
    std_src.push('\n');
    emit_object_new_proc(&mut std_src, OBJECT_NEW_SYMBOL);
    std_src.push('\n');
    emit_object_class_id_proc(&mut std_src, OBJECT_CLASS_ID_SYMBOL);
    std_src.push('\n');
    emit_class_id_in_set_proc(&mut std_src, CLASS_ID_IN_SET_SYMBOL);
    std_src.push('\n');
    emit_object_hash_code_proc(&mut std_src, OBJECT_HASH_CODE_SYMBOL);
    std_src.push('\n');
    emit_string_from_bytes_proc(&mut std_src, "pulsec_rt_stringFromBytes");
    std_src.push('\n');
    emit_string_equals_proc(&mut std_src, "pulsec_rt_stringEquals");
    std_src.push('\n');
    emit_write_raw_proc(&mut std_src, WRITE_RAW_SYMBOL);
    std_src.push('\n');
    emit_host_path_alloc_proc(&mut std_src, "pulsec_rt_hostPathAlloc");
    std_src.push('\n');
    emit_fp_to_int_proc(&mut std_src, "pulsec_rt_fpToInt");
    std_src.push('\n');
    emit_fp_to_long_proc(&mut std_src, "pulsec_rt_fpToLong");
    std_src.push('\n');
    emit_trace_push_proc(&mut std_src, TRACE_PUSH_SYMBOL);
    std_src.push('\n');
    emit_trace_update_top_proc(&mut std_src, TRACE_UPDATE_SYMBOL);
    std_src.push('\n');
    emit_trace_pop_proc(&mut std_src, TRACE_POP_SYMBOL);
    std_src.push('\n');
    emit_trace_dump_proc(&mut std_src, TRACE_DUMP_SYMBOL, WRITE_RAW_SYMBOL);
    std_src.push('\n');
    emit_push_exception_handler_proc(&mut std_src, EXC_PUSH_HANDLER_SYMBOL, WRITE_RAW_SYMBOL);
    std_src.push('\n');
    emit_pop_exception_handler_proc(&mut std_src, EXC_POP_HANDLER_SYMBOL);
    std_src.push('\n');
    emit_take_pending_exception_proc(&mut std_src, EXC_TAKE_PENDING_SYMBOL);
    std_src.push('\n');
    emit_throw_proc(&mut std_src, EXC_THROW_SYMBOL);
    std_src.push('\n');
    emit_object_class_name_proc(&mut std_src, OBJECT_CLASS_NAME_SYMBOL, &class_name_literals);
    std_src.push('\n');
    emit_ensure_slot_capacity_proc(&mut std_src, "pulsec_rt_ensureSlotCapacity");
    std_src.push('\n');
    emit_arc_teardown_proc(&mut std_src, "pulsec_rt_arcTeardown", &object_arc_fields);
    std_src.push('\n');
    let mut std_symbols = stdlib_symbols.values().cloned().collect::<Vec<_>>();
    std_symbols.sort();
    std_symbols.dedup();
    for sym in std_symbols {
        match sym.as_str() {
            "pulsec_rt_consoleWriteLine" => {
                emit_console_write_handle_proc(&mut std_src, &sym, true, -11);
            }
            "pulsec_rt_consoleReadLine" => emit_console_read_line_proc(&mut std_src, &sym),
            "pulsec_rt_consoleWrite" => {
                emit_console_write_handle_proc(&mut std_src, &sym, false, -11);
            }
            "pulsec_rt_consoleErrorWriteLine" => {
                emit_console_write_handle_proc(&mut std_src, &sym, true, -12);
            }
            "pulsec_rt_consoleErrorWrite" => {
                emit_console_write_handle_proc(&mut std_src, &sym, false, -12);
            }
            "pulsec_rt_panic" => emit_panic_proc(&mut std_src, &sym),
            DISPATCH_NULL_PANIC_SYMBOL => {
                emit_dispatch_panic_proc(&mut std_src, &sym, "rt_dispatch_null_receiver_err")
            }
            DISPATCH_TYPE_PANIC_SYMBOL => {
                emit_dispatch_panic_proc(&mut std_src, &sym, "rt_dispatch_invalid_type_err")
            }
            "pulsec_rt_stringConcat" => emit_string_concat_proc(&mut std_src, &sym),
            "pulsec_rt_stringLength" => emit_string_length_proc(&mut std_src, &sym),
            "pulsec_rt_parseInt" => emit_parse_int_proc(&mut std_src, &sym),
            "pulsec_rt_parseBoolean" => emit_parse_boolean_proc(&mut std_src, &sym),
            OBJECT_CLASS_NAME_SYMBOL => {}
            OBJECT_HASH_CODE_SYMBOL => {}
            SYSTEM_CURRENT_TIME_MILLIS_SYMBOL => emit_current_time_millis_proc(&mut std_src, &sym),
            SYSTEM_NANO_TIME_SYMBOL => emit_nano_time_proc(&mut std_src, &sym),
            SYSTEM_EXIT_SYMBOL => emit_system_exit_proc(&mut std_src, &sym),
            STRING_CHAR_AT_SYMBOL => emit_string_char_at_proc(&mut std_src, &sym),
            CHAR_TO_STRING_SYMBOL => emit_char_to_string_proc(&mut std_src, &sym),
            "pulsec_rt_arrayNew" => emit_array_new_proc(&mut std_src, &sym),
            "pulsec_rt_arrayNewMulti" => emit_array_new_multi_proc(&mut std_src, &sym),
            "pulsec_rt_arrayLength" => emit_array_length_proc(&mut std_src, &sym),
            "pulsec_rt_arrayGetInt" => emit_array_get_proc(&mut std_src, &sym, "rt_arr_i_ptr"),
            "pulsec_rt_arraySetInt" => emit_array_set_proc(&mut std_src, &sym, "rt_arr_i_ptr"),
            "pulsec_rt_arrayGetLong" => {
                emit_array_get_qword_proc(&mut std_src, &sym, "rt_arr_i_ptr")
            }
            "pulsec_rt_arraySetLong" => {
                emit_array_set_qword_proc(&mut std_src, &sym, "rt_arr_i_ptr")
            }
            "pulsec_rt_arrayGetString" => emit_array_get_proc(&mut std_src, &sym, "rt_arr_s_ptr"),
            "pulsec_rt_arraySetString" => emit_array_set_proc(&mut std_src, &sym, "rt_arr_s_ptr"),
            "pulsec_rt_listNew" => emit_list_new_proc(&mut std_src, &sym),
            "pulsec_rt_listSize" => emit_list_size_proc(&mut std_src, &sym),
            "pulsec_rt_listKind" => emit_list_kind_proc(&mut std_src, &sym),
            "pulsec_rt_listClear" => emit_list_clear_proc(&mut std_src, &sym),
            "pulsec_rt_listAddInt" => emit_list_add_proc(&mut std_src, &sym, "rt_list_i_ptr"),
            "pulsec_rt_listAddString" => emit_list_add_proc(&mut std_src, &sym, "rt_list_s_ptr"),
            "pulsec_rt_listGetInt" => emit_list_get_proc(&mut std_src, &sym, "rt_list_i_ptr"),
            "pulsec_rt_listGetString" => emit_list_get_proc(&mut std_src, &sym, "rt_list_s_ptr"),
            "pulsec_rt_mapNew" => emit_map_new_proc(&mut std_src, &sym),
            "pulsec_rt_mapSize" => emit_map_size_proc(&mut std_src, &sym),
            "pulsec_rt_mapClear" => emit_map_clear_proc(&mut std_src, &sym),
            "pulsec_rt_mapContainsKey" => emit_map_contains_proc(&mut std_src, &sym),
            "pulsec_rt_mapPut" => emit_map_put_proc(&mut std_src, &sym, false),
            "pulsec_rt_mapPutInt" => emit_map_put_proc(&mut std_src, &sym, true),
            "pulsec_rt_mapGet" => emit_map_get_proc(&mut std_src, &sym, false),
            "pulsec_rt_mapGetInt" => emit_map_get_proc(&mut std_src, &sym, true),
            "pulsec_rt_hostExists" => emit_host_exists_proc(&mut std_src, &sym),
            "pulsec_rt_hostIsFile" => emit_host_is_file_proc(&mut std_src, &sym),
            "pulsec_rt_hostIsDirectory" => emit_host_is_directory_proc(&mut std_src, &sym),
            "pulsec_rt_hostReadAllText" => emit_host_read_all_text_proc(&mut std_src, &sym),
            "pulsec_rt_hostListChildren" => emit_host_list_children_proc(&mut std_src, &sym),
            "pulsec_rt_hostCreateDirectory" => emit_host_create_directory_proc(&mut std_src, &sym),
            "pulsec_rt_hostWriteAllText" => emit_host_write_all_text_proc(&mut std_src, &sym),
            "pulsec_rt_hostCopyFile" => emit_host_copy_file_proc(&mut std_src, &sym),
            "pulsec_rt_hostRunShellProcess" => emit_host_run_shell_process_proc(&mut std_src, &sym),
            "pulsec_rt_arcRetain" => emit_arc_retain_proc(&mut std_src, &sym),
            "pulsec_rt_arcRelease" => emit_arc_release_proc(&mut std_src, &sym),
            "pulsec_rt_arcCycleYoungPass" => emit_arc_cycle_young_pass_proc(&mut std_src, &sym),
            "pulsec_rt_arcCycleFullPass" => {
                emit_arc_cycle_full_pass_proc(&mut std_src, &sym, &object_arc_fields)
            }
            "pulsec_rt_arcCycleTick" => emit_arc_cycle_tick_proc(&mut std_src, &sym),
            "pulsec_rt_weakNew" => emit_weak_new_proc(&mut std_src, &sym),
            "pulsec_rt_weakGet" => emit_weak_get_proc(&mut std_src, &sym),
            "pulsec_rt_weakClear" => emit_weak_clear_proc(&mut std_src, &sym),
            "pulsec_std_com_pulse_math_Math_abs" => emit_math_abs_proc(&mut std_src, &sym),
            "pulsec_std_com_pulse_math_Math_max" => emit_math_max_proc(&mut std_src, &sym),
            _ => emit_stub_return_zero_proc(&mut std_src, &sym),
        }
        std_src.push('\n');
    }
    std_src.push_str("end\n");
    fs::write(&std_asm_path, std_src).map_err(|e| {
        format!(
            "Failed to write stdlib asm '{}': {}",
            std_asm_path.display(),
            e
        )
    })?;
    run_ml64(&ml64, &std_asm_path, &std_obj_path)?;
    let runtime_owned_objects = vec![std_obj_path.clone()];
    link_inputs.push(std_obj_path);

    let startup_dir = obj_root.join("runtime");
    fs::create_dir_all(&startup_dir).map_err(|e| {
        format!(
            "Failed to create startup object dir '{}': {}",
            startup_dir.display(),
            e
        )
    })?;
    let startup_asm_path = startup_dir.join("Startup.asm");
    let startup_obj_path = startup_dir.join("Startup.obj");
    let mut startup = String::new();
    startup.push_str("option casemap:none\n");
    startup.push_str("extrn ExitProcess:proc\n");
    startup.push_str("extrn pulsec_rt_init:proc\n");
    startup.push_str("extrn pulsec_rt_shutdown:proc\n");
    startup.push_str(&format!("extrn {}:proc\n\n", entry_symbol));
    startup.push_str(".code\n");
    emit_startup_entry_proc(
        &mut startup,
        "mainCRTStartup",
        "pulsec_rt_init",
        "pulsec_rt_shutdown",
        &entry_symbol,
    );
    startup.push('\n');
    startup.push_str("end\n");
    fs::write(&startup_asm_path, startup).map_err(|e| {
        format!(
            "Failed to write startup asm '{}': {}",
            startup_asm_path.display(),
            e
        )
    })?;
    run_ml64(&ml64, &startup_asm_path, &startup_obj_path)?;

    link_inputs.push(kernel32.clone());
    Ok(MasmSplitArtifacts {
        startup_obj: startup_obj_path.clone(),
        link_inputs,
        codegen: "masm-split-stdlib".to_string(),
        link_plan: NativeLinkPlan {
            startup_objects: vec![startup_obj_path.clone()],
            app_owned_objects,
            runtime_owned_objects,
            system_inputs: vec![kernel32],
            shared_runtime_exports: shared_runtime_export_symbols_for_ir(ir),
        },
    })
}

fn run_ml64(ml64: &Path, asm_path: &Path, obj_path: &Path) -> Result<(), String> {
    let process = plan_windows_masm_assemble_process(
        ml64,
        asm_path.parent(),
        asm_path,
        obj_path,
        default_toolchain_environment_plan(),
    );
    let output = execute_toolchain_process(&process)?;
    if output.status.success() {
        return Ok(());
    }
    let stderr = String::from_utf8_lossy(&output.stderr);
    let stdout = String::from_utf8_lossy(&output.stdout);
    let detail = if !stderr.trim().is_empty() {
        stderr.trim().to_string()
    } else {
        stdout.trim().to_string()
    };
    Err(format!(
        "ml64 failed for '{}': {}",
        asm_path.display(),
        detail
    ))
}

pub(crate) fn emit_masm_full_program_object(
    ir: &IrProgram,
    object_path: &Path,
    linker_override: Option<&Path>,
    emit_statement_trace_metadata: bool,
) -> Result<(String, Vec<PathBuf>), String> {
    let ml64 = discover_ml64(linker_override)
        .ok_or_else(|| "ml64.exe not found for full MASM program path".to_string())?;
    let kernel32 = discover_kernel32_lib()
        .ok_or_else(|| "kernel32.lib not found for full MASM program path".to_string())?;

    let class_names = ir
        .classes
        .iter()
        .map(|c| normalize_type_token(&c.name))
        .collect::<Vec<_>>();
    let class_super = build_class_super_map(ir, &class_names);
    install_class_super_resolution(&class_super);
    let class_ids = build_class_id_map(ir);
    install_class_id_resolution(&class_ids);
    let class_packages = build_class_package_map(ir);
    install_class_package_resolution(&class_packages);
    let field_types_by_owner = build_field_type_map(ir);
    install_field_type_resolution(&field_types_by_owner);
    let class_name_literals = collect_object_class_name_literals(ir);
    let object_arc_fields = collect_object_arc_field_dispatch(ir);
    let interface_types = build_interface_type_set(ir);
    install_interface_type_resolution(&interface_types);
    let class_interfaces = build_class_interfaces_map(ir, &class_names, &class_super);
    install_class_interfaces_resolution(&class_interfaces);
    let mut class_finality: HashMap<String, bool> = HashMap::new();
    let mut method_symbols: HashMap<(String, String), String> = HashMap::new();
    let mut method_staticness: HashMap<(String, String), bool> = HashMap::new();
    let mut method_symbols_by_sig: HashMap<(String, String, Vec<String>), String> = HashMap::new();
    let mut method_staticness_by_sig: HashMap<(String, String, Vec<String>), bool> = HashMap::new();
    let mut method_finality_by_sig: HashMap<(String, String, Vec<String>), bool> = HashMap::new();
    let mut method_visibility_by_sig: HashMap<(String, String, Vec<String>), IrVisibility> =
        HashMap::new();
    let mut method_return_types_by_sig: HashMap<(String, String, Vec<String>), String> =
        HashMap::new();
    let mut method_varargs_by_sig: HashMap<(String, String, Vec<String>), bool> = HashMap::new();
    let mut method_trace_labels: HashMap<String, String> = HashMap::new();
    let mut method_trace_literals: Vec<(String, String)> = Vec::new();
    let stdlib_symbols = default_stdlib_symbols();
    let mut entry_symbol: Option<String> = None;

    for class in &ir.classes {
        let class_owner = normalize_type_token(&class.name);
        class_finality.insert(class_owner.clone(), class.is_final);
        for method in &class.methods {
            let sig = method_param_type_tokens(method);
            let sig_key = sig.clone();
            let symbol = mangle_method_symbol(&class.package_name, &class.name, &method.name, &sig);
            method_symbols.insert((class_owner.clone(), method.name.clone()), symbol.clone());
            method_staticness.insert((class_owner.clone(), method.name.clone()), method.is_static);
            method_symbols_by_sig.insert(
                (class_owner.clone(), method.name.clone(), sig.clone()),
                symbol.clone(),
            );
            method_staticness_by_sig.insert(
                (class_owner.clone(), method.name.clone(), sig.clone()),
                method.is_static,
            );
            method_finality_by_sig.insert(
                (class_owner.clone(), method.name.clone(), sig.clone()),
                method.is_final,
            );
            method_visibility_by_sig.insert(
                (class_owner.clone(), method.name.clone(), sig_key),
                method.visibility,
            );
            method_return_types_by_sig.insert(
                (class_owner.clone(), method.name.clone(), sig.clone()),
                method
                    .return_type
                    .clone()
                    .unwrap_or_else(|| "void".to_string()),
            );
            method_varargs_by_sig.insert(
                (class_owner.clone(), method.name.clone(), sig.clone()),
                method.is_varargs,
            );
            let method_trace_enabled =
                should_emit_trace_frame(&class.package_name, &class.name, &method.name);
            let statement_trace_enabled = should_emit_statement_trace_metadata(
                &class.package_name,
                emit_statement_trace_metadata,
            );
            if method_trace_enabled {
                let trace_label = format!("trace_m{}", method_trace_literals.len());
                method_trace_labels.insert(symbol.clone(), trace_label.clone());
                method_trace_literals.push((
                    trace_label,
                    format_trace_method_frame(
                        &class.package_name,
                        &class.name,
                        &method.name,
                        &method.name,
                        0,
                    ),
                ));
                if statement_trace_enabled {
                    method_trace_literals.extend(collect_method_trace_frames(
                        &class.package_name,
                        &class.name,
                        method,
                        &symbol,
                    ));
                }
            }
            if method.name == "main" && entry_symbol.is_none() {
                entry_symbol = Some(symbol);
            }
        }
    }
    install_class_finality_resolution(&class_finality);
    install_method_finality_resolution(&method_finality_by_sig);
    install_method_visibility_resolution(&method_visibility_by_sig);
    install_method_return_type_resolution(&method_return_types_by_sig);
    install_method_varargs_resolution(&method_varargs_by_sig);

    let entry_symbol = entry_symbol.ok_or_else(|| "No static main method found".to_string())?;
    let mut print_literals: Vec<String> = Vec::new();
    let mut source = String::new();
    source.push_str("option casemap:none\n");
    source.push_str("extrn GetStdHandle:proc\n");
    source.push_str("extrn ReadFile:proc\n");
    source.push_str("extrn WriteFile:proc\n");
    source.push_str("extrn ExitProcess:proc\n\n");
    source.push_str("extrn GetSystemTimeAsFileTime:proc\n");
    source.push_str("extrn GetTickCount64:proc\n\n");
    source.push_str("extrn GetProcessHeap:proc\n");
    source.push_str("extrn GetFileAttributesA:proc\n");
    source.push_str("extrn CreateDirectoryA:proc\n");
    source.push_str("extrn CopyFileA:proc\n");
    source.push_str("extrn CreateFileA:proc\n");
    source.push_str("extrn CreateProcessA:proc\n");
    source.push_str("extrn GetFileSize:proc\n");
    source.push_str("extrn GetExitCodeProcess:proc\n");
    source.push_str("extrn CloseHandle:proc\n");
    source.push_str("extrn FindFirstFileA:proc\n");
    source.push_str("extrn FindNextFileA:proc\n");
    source.push_str("extrn FindClose:proc\n");
    source.push_str("extrn HeapAlloc:proc\n");
    source.push_str("extrn HeapReAlloc:proc\n");
    source.push_str("extrn HeapFree:proc\n\n");
    source.push_str("extrn WaitForSingleObject:proc\n\n");
    source.push_str(".data\n");
    source.push_str("written dq 0\n\n");
    source.push_str(&format!("{} dd 0\n", RT_OBJECT_COUNTER_SYMBOL));
    source.push_str(&format!(
        "{} dq {}\n",
        RT_OBJECT_CLASS_IDS_SYMBOL, RT_OBJECT_CLASS_IDS_INIT_SYMBOL
    ));
    source.push_str(&format!("{} dd 0\n", RT_OBJECT_CLASS_IDS_HEAP_OWNED_SYMBOL));
    source.push_str(&format!(
        "{} dd {} dup(0)\n\n",
        RT_OBJECT_CLASS_IDS_INIT_SYMBOL,
        HANDLE_SLOT_INITIAL_CAPACITY + 1
    ));
    emit_runtime_data_tables(&mut source);
    for class in &ir.classes {
        source.push_str(&format!(
            "{} dd 0\n",
            mangle_class_counter_symbol(&class.package_name, &class.name)
        ));
        if class.fields.iter().any(|field| !field.is_static) {
            source.push_str(&format!(
                "{} dd {}\n",
                mangle_class_field_capacity_symbol(&class.package_name, &class.name),
                HANDLE_SLOT_INITIAL_CAPACITY
            ));
        }
        for field in &class.fields {
            let sym = mangle_field_symbol(&class.package_name, &class.name, &field.name);
            if field.is_static {
                source.push_str(&format!("{} {}\n", sym, masm_field_data_directive(field)));
            } else {
                let table_sym =
                    mangle_field_table_symbol(&class.package_name, &class.name, &field.name);
                let heap_owned_sym =
                    mangle_field_heap_owned_symbol(&class.package_name, &class.name, &field.name);
                if uses_qword_field_storage(&field.ty) {
                    source.push_str(&format!(
                        "{} dq {} dup(0)\n",
                        table_sym,
                        HANDLE_SLOT_INITIAL_CAPACITY + 1
                    ));
                } else {
                    source.push_str(&format!(
                        "{} dd {} dup(0)\n",
                        table_sym,
                        HANDLE_SLOT_INITIAL_CAPACITY + 1
                    ));
                }
                source.push_str(&format!("{} dq {}\n", sym, table_sym));
                source.push_str(&format!("{} dd 0\n", heap_owned_sym));
            }
        }
    }
    for (label, text) in &method_trace_literals {
        emit_masm_db(&mut source, label, text);
        source.push_str(&format!("{}_len equ {}\n", label, masm_db_len(text)));
    }
    for (_, label, text) in &class_name_literals {
        emit_masm_db(&mut source, label, text);
        source.push_str(&format!("{}_len equ {}\n", label, masm_db_len(text)));
    }
    source.push('\n');
    source.push_str(".code\n");
    emit_runtime_init_proc(&mut source, "pulsec_rt_init", WRITE_RAW_SYMBOL);
    source.push('\n');
    emit_runtime_shutdown_proc(&mut source, "pulsec_rt_shutdown");
    source.push('\n');
    emit_object_new_proc(&mut source, OBJECT_NEW_SYMBOL);
    source.push('\n');
    emit_object_class_id_proc(&mut source, OBJECT_CLASS_ID_SYMBOL);
    source.push('\n');
    emit_class_id_in_set_proc(&mut source, CLASS_ID_IN_SET_SYMBOL);
    source.push('\n');
    emit_object_hash_code_proc(&mut source, OBJECT_HASH_CODE_SYMBOL);
    source.push('\n');
    emit_string_from_bytes_proc(&mut source, "pulsec_rt_stringFromBytes");
    source.push('\n');
    emit_string_equals_proc(&mut source, "pulsec_rt_stringEquals");
    source.push('\n');
    emit_write_raw_proc(&mut source, WRITE_RAW_SYMBOL);
    source.push('\n');
    emit_host_path_alloc_proc(&mut source, "pulsec_rt_hostPathAlloc");
    source.push('\n');
    emit_fp_to_int_proc(&mut source, "pulsec_rt_fpToInt");
    source.push('\n');
    emit_fp_to_long_proc(&mut source, "pulsec_rt_fpToLong");
    source.push('\n');
    emit_trace_push_proc(&mut source, TRACE_PUSH_SYMBOL);
    source.push('\n');
    emit_trace_update_top_proc(&mut source, TRACE_UPDATE_SYMBOL);
    source.push('\n');
    emit_trace_pop_proc(&mut source, TRACE_POP_SYMBOL);
    source.push('\n');
    emit_trace_dump_proc(&mut source, TRACE_DUMP_SYMBOL, WRITE_RAW_SYMBOL);
    source.push('\n');
    emit_push_exception_handler_proc(&mut source, EXC_PUSH_HANDLER_SYMBOL, WRITE_RAW_SYMBOL);
    source.push('\n');
    emit_pop_exception_handler_proc(&mut source, EXC_POP_HANDLER_SYMBOL);
    source.push('\n');
    emit_take_pending_exception_proc(&mut source, EXC_TAKE_PENDING_SYMBOL);
    source.push('\n');
    emit_throw_proc(&mut source, EXC_THROW_SYMBOL);
    source.push('\n');
    emit_object_class_name_proc(&mut source, OBJECT_CLASS_NAME_SYMBOL, &class_name_literals);
    source.push('\n');
    emit_ensure_slot_capacity_proc(&mut source, "pulsec_rt_ensureSlotCapacity");
    source.push('\n');
    emit_arc_teardown_proc(&mut source, "pulsec_rt_arcTeardown", &object_arc_fields);
    source.push('\n');
    emit_startup_entry_proc(
        &mut source,
        "mainCRTStartup",
        "pulsec_rt_init",
        "pulsec_rt_shutdown",
        &entry_symbol,
    );
    source.push_str("\n\n");

    for class in &ir.classes {
        emit_class_field_capacity_proc(
            &mut source,
            &class.package_name,
            &class.name,
            &class.fields,
        );
        emit_class_arc_field_helpers(&mut source, &class.package_name, &class.name, &class.fields);
        begin_class_id_set_table_collection();
        let mut field_symbols: HashMap<String, String> = HashMap::new();
        let mut field_is_static: HashMap<String, bool> = HashMap::new();
        let mut field_types: HashMap<String, String> = HashMap::new();
        let class_object_counter_symbol =
            mangle_class_counter_symbol(&class.package_name, &class.name);
        for field in &class.fields {
            field_symbols.insert(
                field.name.clone(),
                mangle_field_symbol(&class.package_name, &class.name, &field.name),
            );
            field_is_static.insert(field.name.clone(), field.is_static);
            field_types.insert(field.name.clone(), field.ty.clone());
        }
        for method in &class.methods {
            let class_owner = normalize_type_token(&class.name);
            let sig = method_param_type_tokens(method);
            let symbol = method_symbols_by_sig
                .get(&(class_owner, method.name.clone(), sig))
                .ok_or_else(|| format!("Missing symbol for {}.{}", class.name, method.name))?;
            let method_trace_enabled =
                should_emit_trace_frame(&class.package_name, &class.name, &method.name);
            let statement_trace_enabled = should_emit_statement_trace_metadata(
                &class.package_name,
                emit_statement_trace_metadata,
            );
            let trace_label = method_trace_labels.get(symbol);
            let stack_size = masm_method_stack_size(method);
            let incoming_rcx = stack_size - 32;
            let incoming_rdx = stack_size - 24;
            let incoming_r8 = stack_size - 16;
            let incoming_r9 = stack_size - 8;
            let mut method_code = String::new();
            method_code.push_str(&format!("{} proc\n", symbol));
            method_code.push_str(&format!("    sub rsp, {}\n", stack_size));
            method_code.push_str(&format!(
                "    mov qword ptr [rsp+{}], rcx\n",
                incoming_rcx
            ));
            method_code.push_str(&format!(
                "    mov qword ptr [rsp+{}], rdx\n",
                incoming_rdx
            ));
            method_code.push_str(&format!(
                "    mov qword ptr [rsp+{}], r8\n",
                incoming_r8
            ));
            method_code.push_str(&format!(
                "    mov qword ptr [rsp+{}], r9\n",
                incoming_r9
            ));
            if let Some(trace_label) = trace_label {
                method_code.push_str(&format!("    lea rcx, {}\n", trace_label));
                method_code.push_str(&format!("    mov edx, {}_len\n", trace_label));
                method_code.push_str(&format!("    call {}\n", TRACE_PUSH_SYMBOL));
            }
            method_code.push_str(&format!(
                "    mov rcx, qword ptr [rsp+{}]\n",
                incoming_rcx
            ));
            method_code.push_str(&format!(
                "    mov rdx, qword ptr [rsp+{}]\n",
                incoming_rdx
            ));
            method_code.push_str(&format!(
                "    mov r8, qword ptr [rsp+{}]\n",
                incoming_r8
            ));
            method_code.push_str(&format!(
                "    mov r9, qword ptr [rsp+{}]\n",
                incoming_r9
            ));
            emit_masm_method_body(
                &mut method_code,
                &class.package_name,
                &class.name,
                symbol,
                method,
                &method_symbols,
                &method_staticness,
                &method_symbols_by_sig,
                &method_staticness_by_sig,
                &stdlib_symbols,
                &class_names,
                &field_symbols,
                &field_is_static,
                &field_types,
                &class_object_counter_symbol,
                &mut print_literals,
                statement_trace_enabled && method_trace_enabled,
            )?;
            method_code.push_str(&format!("{}_epilogue_post:\n", symbol));
            let epilogue_ret_spill = masm_call_retval_spill_offset(method);
            method_code.push_str(&format!(
                "    mov qword ptr [rsp+{}], rax\n",
                epilogue_ret_spill
            ));
            if method_trace_enabled {
                method_code.push_str(&format!("    call {}\n", TRACE_POP_SYMBOL));
            }
            method_code.push_str(&format!(
                "    mov rax, qword ptr [rsp+{}]\n",
                epilogue_ret_spill
            ));
            method_code.push_str(&format!("    add rsp, {}\n", stack_size));
            method_code.push_str("    ret\n");
            method_code.push_str(&format!("{} endp\n\n", symbol));
            let _ = finalize_method_stack_frame(&mut method_code, stack_size);
            source.push_str(&method_code);
        }
        for (label, class_ids) in take_class_id_set_tables() {
            emit_class_id_set_table(&mut source, &label, &class_ids);
        }
        for field in &class.fields {
            if !field.is_static {
                continue;
            }
            emit_static_field_getter_proc(
                &mut source,
                &mangle_static_field_getter_symbol(
                    &class.package_name,
                    &class.name,
                    &field.name,
                ),
                &mangle_field_symbol(&class.package_name, &class.name, &field.name),
                &field.ty,
                static_field_lazy_init(field, &method_symbols_by_sig).as_ref(),
            );
            source.push('\n');
            emit_static_field_setter_proc(
                &mut source,
                &mangle_static_field_setter_symbol(
                    &class.package_name,
                    &class.name,
                    &field.name,
                ),
                &mangle_field_symbol(&class.package_name, &class.name, &field.name),
                &field.ty,
            );
            source.push_str("\n\n");
        }
    }

    let mut std_symbols = stdlib_symbols.values().cloned().collect::<Vec<_>>();
    std_symbols.sort();
    std_symbols.dedup();
    for sym in std_symbols {
        match sym.as_str() {
            "pulsec_rt_consoleWriteLine" => {
                emit_console_write_handle_proc(&mut source, &sym, true, -11);
            }
            "pulsec_rt_consoleReadLine" => emit_console_read_line_proc(&mut source, &sym),
            "pulsec_rt_consoleWrite" => {
                emit_console_write_handle_proc(&mut source, &sym, false, -11);
            }
            "pulsec_rt_consoleErrorWriteLine" => {
                emit_console_write_handle_proc(&mut source, &sym, true, -12);
            }
            "pulsec_rt_consoleErrorWrite" => {
                emit_console_write_handle_proc(&mut source, &sym, false, -12);
            }
            "pulsec_rt_panic" => emit_panic_proc(&mut source, &sym),
            DISPATCH_NULL_PANIC_SYMBOL => {
                emit_dispatch_panic_proc(&mut source, &sym, "rt_dispatch_null_receiver_err")
            }
            DISPATCH_TYPE_PANIC_SYMBOL => {
                emit_dispatch_panic_proc(&mut source, &sym, "rt_dispatch_invalid_type_err")
            }
            "pulsec_rt_stringConcat" => emit_string_concat_proc(&mut source, &sym),
            "pulsec_rt_stringLength" => emit_string_length_proc(&mut source, &sym),
            "pulsec_rt_parseInt" => emit_parse_int_proc(&mut source, &sym),
            "pulsec_rt_parseBoolean" => emit_parse_boolean_proc(&mut source, &sym),
            OBJECT_CLASS_NAME_SYMBOL => {}
            OBJECT_HASH_CODE_SYMBOL => {}
            SYSTEM_CURRENT_TIME_MILLIS_SYMBOL => emit_current_time_millis_proc(&mut source, &sym),
            SYSTEM_NANO_TIME_SYMBOL => emit_nano_time_proc(&mut source, &sym),
            SYSTEM_EXIT_SYMBOL => emit_system_exit_proc(&mut source, &sym),
            STRING_CHAR_AT_SYMBOL => emit_string_char_at_proc(&mut source, &sym),
            CHAR_TO_STRING_SYMBOL => emit_char_to_string_proc(&mut source, &sym),
            "pulsec_rt_arrayNew" => emit_array_new_proc(&mut source, &sym),
            "pulsec_rt_arrayNewMulti" => emit_array_new_multi_proc(&mut source, &sym),
            "pulsec_rt_arrayLength" => emit_array_length_proc(&mut source, &sym),
            "pulsec_rt_arrayGetInt" => emit_array_get_proc(&mut source, &sym, "rt_arr_i_ptr"),
            "pulsec_rt_arraySetInt" => emit_array_set_proc(&mut source, &sym, "rt_arr_i_ptr"),
            "pulsec_rt_arrayGetLong" => {
                emit_array_get_qword_proc(&mut source, &sym, "rt_arr_i_ptr")
            }
            "pulsec_rt_arraySetLong" => {
                emit_array_set_qword_proc(&mut source, &sym, "rt_arr_i_ptr")
            }
            "pulsec_rt_arrayGetString" => emit_array_get_proc(&mut source, &sym, "rt_arr_s_ptr"),
            "pulsec_rt_arraySetString" => emit_array_set_proc(&mut source, &sym, "rt_arr_s_ptr"),
            "pulsec_rt_listNew" => emit_list_new_proc(&mut source, &sym),
            "pulsec_rt_listSize" => emit_list_size_proc(&mut source, &sym),
            "pulsec_rt_listKind" => emit_list_kind_proc(&mut source, &sym),
            "pulsec_rt_listClear" => emit_list_clear_proc(&mut source, &sym),
            "pulsec_rt_listAddInt" => emit_list_add_proc(&mut source, &sym, "rt_list_i_ptr"),
            "pulsec_rt_listAddString" => emit_list_add_proc(&mut source, &sym, "rt_list_s_ptr"),
            "pulsec_rt_listGetInt" => emit_list_get_proc(&mut source, &sym, "rt_list_i_ptr"),
            "pulsec_rt_listGetString" => emit_list_get_proc(&mut source, &sym, "rt_list_s_ptr"),
            "pulsec_rt_mapNew" => emit_map_new_proc(&mut source, &sym),
            "pulsec_rt_mapSize" => emit_map_size_proc(&mut source, &sym),
            "pulsec_rt_mapClear" => emit_map_clear_proc(&mut source, &sym),
            "pulsec_rt_mapContainsKey" => emit_map_contains_proc(&mut source, &sym),
            "pulsec_rt_mapPut" => emit_map_put_proc(&mut source, &sym, false),
            "pulsec_rt_mapPutInt" => emit_map_put_proc(&mut source, &sym, true),
            "pulsec_rt_mapGet" => emit_map_get_proc(&mut source, &sym, false),
            "pulsec_rt_mapGetInt" => emit_map_get_proc(&mut source, &sym, true),
            "pulsec_rt_hostExists" => emit_host_exists_proc(&mut source, &sym),
            "pulsec_rt_hostIsFile" => emit_host_is_file_proc(&mut source, &sym),
            "pulsec_rt_hostIsDirectory" => emit_host_is_directory_proc(&mut source, &sym),
            "pulsec_rt_hostReadAllText" => emit_host_read_all_text_proc(&mut source, &sym),
            "pulsec_rt_hostListChildren" => emit_host_list_children_proc(&mut source, &sym),
            "pulsec_rt_hostCreateDirectory" => emit_host_create_directory_proc(&mut source, &sym),
            "pulsec_rt_hostWriteAllText" => emit_host_write_all_text_proc(&mut source, &sym),
            "pulsec_rt_hostCopyFile" => emit_host_copy_file_proc(&mut source, &sym),
            "pulsec_rt_hostRunShellProcess" => emit_host_run_shell_process_proc(&mut source, &sym),
            "pulsec_rt_arcRetain" => emit_arc_retain_proc(&mut source, &sym),
            "pulsec_rt_arcRelease" => emit_arc_release_proc(&mut source, &sym),
            "pulsec_rt_arcCycleYoungPass" => emit_arc_cycle_young_pass_proc(&mut source, &sym),
            "pulsec_rt_arcCycleFullPass" => {
                emit_arc_cycle_full_pass_proc(&mut source, &sym, &object_arc_fields)
            }
            "pulsec_rt_arcCycleTick" => emit_arc_cycle_tick_proc(&mut source, &sym),
            "pulsec_rt_weakNew" => emit_weak_new_proc(&mut source, &sym),
            "pulsec_rt_weakGet" => emit_weak_get_proc(&mut source, &sym),
            "pulsec_rt_weakClear" => emit_weak_clear_proc(&mut source, &sym),
            "pulsec_std_com_pulse_math_Math_abs" => emit_math_abs_proc(&mut source, &sym),
            "pulsec_std_com_pulse_math_Math_max" => emit_math_max_proc(&mut source, &sym),
            _ => emit_stub_return_zero_proc(&mut source, &sym),
        }
        source.push('\n');
    }

    if !print_literals.is_empty() {
        source.push_str(".data\n");
        for (i, line) in print_literals.iter().enumerate() {
            emit_masm_db(&mut source, &format!("msg{}", i), line);
            source.push_str(&format!("msg{}_len equ {}\n", i, masm_db_len(line)));
        }
        source.push('\n');
    }

    if !source.trim_end().ends_with("end") {
        source.push_str("end\n");
    }

    let asm_path = object_path.with_extension("asm");
    fs::write(&asm_path, source).map_err(|e| {
        format!(
            "Failed to write full MASM source '{}': {}",
            asm_path.display(),
            e
        )
    })?;

    let process = plan_windows_masm_assemble_process(
        &ml64,
        asm_path.parent(),
        &asm_path,
        object_path,
        default_toolchain_environment_plan(),
    );
    let output = execute_toolchain_process(&process)?;
    if !output.status.success() {
        let stderr = String::from_utf8_lossy(&output.stderr);
        let stdout = String::from_utf8_lossy(&output.stdout);
        let detail = if !stderr.trim().is_empty() {
            stderr.trim().to_string()
        } else {
            stdout.trim().to_string()
        };
        return Err(format!("Full MASM assembly failed: {}", detail));
    }

    Ok(("masm-full-stdlib".to_string(), vec![kernel32]))
}

pub(crate) fn masm_method_stack_size(method: &IrMethod) -> usize {
    let local_slots = masm_local_slot_count(method);
    let local_base = masm_local_base_offset(method);
    let nested_preserve_depth = masm_nested_call_preserve_depth_budget(method);
    let local_end = if local_slots == 0 {
        local_base
    } else {
        local_base + (local_slots * 8)
    };
    let binary_end = masm_binary_tmp_base(method) + (masm_binary_temp_count(method) * 8);
    let spill_end = masm_arc_spill_base(method)
        + ((masm_arc_arg_spill_count(method)
            + ARC_SCRATCH_EXTRA_SLOTS
            + (nested_preserve_depth * (masm_arc_arg_spill_count(method) + 1)))
            * ARC_ARG_SPILL_STRIDE);
    let array_init_end =
        masm_array_init_tmp_base(method) + (masm_array_init_temp_count(method) * 8);
    let needed = std::cmp::max(
        64usize,
        std::cmp::max(
            local_end,
            std::cmp::max(binary_end, std::cmp::max(spill_end, array_init_end)),
        ),
    );
    let mut stack_size = needed + 32;
    if masm_outgoing_stack_arg_slots(method) > 1 {
        stack_size += 8;
    }
    while stack_size % 16 != 8 {
        stack_size += 1;
    }
    stack_size
}

pub(crate) fn build_masm_print_entry_source(lines: &[String]) -> String {
    let mut src = String::new();
    src.push_str("option casemap:none\n");
    src.push_str("extrn GetStdHandle:proc\n");
    src.push_str("extrn ReadFile:proc\n");
    src.push_str("extrn WriteFile:proc\n");
    src.push_str("extrn ExitProcess:proc\n\n");
    src.push_str("extrn GetSystemTimeAsFileTime:proc\n");
    src.push_str("extrn GetTickCount64:proc\n\n");
    src.push_str(".data\n");
    src.push_str("written dq 0\n");
    for (i, line) in lines.iter().enumerate() {
        let line_with_newline = format!("{}\r\n", line);
        emit_masm_db(&mut src, &format!("msg{}", i), &line_with_newline);
        src.push_str(&format!(
            "msg{}_len equ {}\n",
            i,
            masm_db_len(&line_with_newline)
        ));
    }
    src.push_str("\n.code\n");
    src.push_str("mainCRTStartup proc\n");
    src.push_str("    sub rsp, 40\n");
    src.push_str("    mov rcx, -11\n");
    src.push_str("    call GetStdHandle\n");
    src.push_str("    mov rbx, rax\n");
    for (i, _) in lines.iter().enumerate() {
        src.push_str("    mov rcx, rbx\n");
        src.push_str(&format!("    lea rdx, msg{}\n", i));
        src.push_str(&format!("    mov r8d, msg{}_len\n", i));
        src.push_str("    lea r9, written\n");
        src.push_str("    mov qword ptr [rsp+32], 0\n");
        src.push_str("    call WriteFile\n");
    }
    src.push_str("    xor ecx, ecx\n");
    src.push_str("    call ExitProcess\n");
    src.push_str("mainCRTStartup endp\n");
    src.push_str("end\n");
    src
}

pub(crate) fn shared_runtime_export_symbols() -> Vec<String> {
    shared_runtime_exported_procedures()
}

pub(crate) fn shared_runtime_export_symbols_for_ir(ir: &IrProgram) -> Vec<String> {
    let mut exports = shared_runtime_exported_procedures();
    for class in &ir.classes {
        if !class.package_name.starts_with("pulse.") {
            continue;
        }
        for method in &class.methods {
            let sig = method
                .params
                .iter()
                .map(|param| normalize_type_token(&param.ty))
                .collect::<Vec<_>>();
            exports.push(mangle_method_symbol(
                &class.package_name,
                &class.name,
                &method.name,
                &sig,
            ));
        }
        for field in &class.fields {
            if !field.is_static {
                continue;
            }
            exports.push(mangle_static_field_getter_symbol(
                &class.package_name,
                &class.name,
                &field.name,
            ));
            exports.push(mangle_static_field_setter_symbol(
                &class.package_name,
                &class.name,
                &field.name,
            ));
        }
    }
    exports.sort();
    exports.dedup();
    exports
}
