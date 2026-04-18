use std::path::PathBuf;

const MASM_IDENTIFIER_LIMIT: usize = 96;

fn append_sanitized(out: &mut String, raw: &str) {
    for c in raw.chars() {
        if c.is_ascii_alphanumeric() {
            out.push(c);
        } else {
            out.push('_');
        }
    }
}

fn stable_identifier_hash(text: &str) -> u64 {
    let mut hash: u64 = 0xcbf29ce484222325;
    for byte in text.as_bytes() {
        hash ^= *byte as u64;
        hash = hash.wrapping_mul(0x100000001b3);
    }
    hash
}

fn shorten_identifier(text: String) -> String {
    if text.len() <= MASM_IDENTIFIER_LIMIT {
        return text;
    }
    let hash = stable_identifier_hash(&text);
    let hash_suffix = format!("_h{hash:016x}");
    let keep = MASM_IDENTIFIER_LIMIT.saturating_sub(hash_suffix.len());
    let mut shortened = text;
    shortened.truncate(keep);
    shortened.push_str(&hash_suffix);
    shortened
}

pub(crate) fn package_to_path(package: &str) -> PathBuf {
    package.split('.').collect()
}

pub(crate) fn mangle_method_symbol(
    package: &str,
    class_name: &str,
    method_name: &str,
    param_types: &[String],
) -> String {
    let mut out = String::from("pulsec_");
    append_sanitized(&mut out, package);
    out.push('_');
    append_sanitized(&mut out, class_name);
    out.push('_');
    append_sanitized(&mut out, method_name);
    if !param_types.is_empty() {
        out.push_str("__");
        for (idx, p) in param_types.iter().enumerate() {
            if idx > 0 {
                out.push('_');
            }
            append_sanitized(&mut out, p);
        }
    }
    shorten_identifier(out)
}

pub(crate) fn mangle_field_symbol(package: &str, class_name: &str, field_name: &str) -> String {
    let mut out = String::from("pulsec_fld_");
    append_sanitized(&mut out, package);
    out.push('_');
    append_sanitized(&mut out, class_name);
    out.push('_');
    append_sanitized(&mut out, field_name);
    shorten_identifier(out)
}

pub(crate) fn mangle_field_table_symbol(
    package: &str,
    class_name: &str,
    field_name: &str,
) -> String {
    shorten_identifier(format!(
        "{}_tbl",
        mangle_field_symbol(package, class_name, field_name)
    ))
}

pub(crate) fn mangle_field_heap_owned_symbol(
    package: &str,
    class_name: &str,
    field_name: &str,
) -> String {
    shorten_identifier(format!(
        "{}_heap_owned",
        mangle_field_symbol(package, class_name, field_name)
    ))
}

pub(crate) fn mangle_static_field_getter_symbol(
    package: &str,
    class_name: &str,
    field_name: &str,
) -> String {
    let mut out = String::from("pulsec_fget_");
    append_sanitized(&mut out, package);
    out.push('_');
    append_sanitized(&mut out, class_name);
    out.push('_');
    append_sanitized(&mut out, field_name);
    shorten_identifier(out)
}

pub(crate) fn mangle_static_field_setter_symbol(
    package: &str,
    class_name: &str,
    field_name: &str,
) -> String {
    let mut out = String::from("pulsec_fset_");
    append_sanitized(&mut out, package);
    out.push('_');
    append_sanitized(&mut out, class_name);
    out.push('_');
    append_sanitized(&mut out, field_name);
    shorten_identifier(out)
}

pub(crate) fn mangle_class_counter_symbol(package: &str, class_name: &str) -> String {
    let mut out = String::from("pulsec_objc_");
    append_sanitized(&mut out, package);
    out.push('_');
    append_sanitized(&mut out, class_name);
    shorten_identifier(out)
}

pub(crate) fn mangle_class_field_capacity_symbol(package: &str, class_name: &str) -> String {
    let mut out = String::from("pulsec_fcap_");
    append_sanitized(&mut out, package);
    out.push('_');
    append_sanitized(&mut out, class_name);
    shorten_identifier(out)
}

pub(crate) fn mangle_class_field_capacity_proc_symbol(package: &str, class_name: &str) -> String {
    shorten_identifier(format!(
        "{}_ensure",
        mangle_class_field_capacity_symbol(package, class_name)
    ))
}

pub(crate) fn mangle_class_arc_teardown_proc_symbol(package: &str, class_name: &str) -> String {
    shorten_identifier(format!(
        "{}_arc_teardown",
        mangle_class_field_capacity_symbol(package, class_name)
    ))
}

pub(crate) fn mangle_class_native_cleanup_proc_symbol(package: &str, class_name: &str) -> String {
    shorten_identifier(format!(
        "{}_native_cleanup",
        mangle_class_field_capacity_symbol(package, class_name)
    ))
}

pub(crate) fn mangle_class_arc_scan_edges_proc_symbol(package: &str, class_name: &str) -> String {
    shorten_identifier(format!(
        "{}_arc_scan_edges",
        mangle_class_field_capacity_symbol(package, class_name)
    ))
}

pub(crate) fn mangle_class_arc_invalidate_edges_proc_symbol(
    package: &str,
    class_name: &str,
) -> String {
    shorten_identifier(format!(
        "{}_arc_invalidate_edges",
        mangle_class_field_capacity_symbol(package, class_name)
    ))
}
