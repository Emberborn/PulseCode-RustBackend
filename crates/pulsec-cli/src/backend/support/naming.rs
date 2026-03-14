use std::path::PathBuf;

fn append_sanitized(out: &mut String, raw: &str) {
    for c in raw.chars() {
        if c.is_ascii_alphanumeric() {
            out.push(c);
        } else {
            out.push('_');
        }
    }
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
    out
}

pub(crate) fn mangle_field_symbol(package: &str, class_name: &str, field_name: &str) -> String {
    let mut out = String::from("pulsec_fld_");
    append_sanitized(&mut out, package);
    out.push('_');
    append_sanitized(&mut out, class_name);
    out.push('_');
    append_sanitized(&mut out, field_name);
    out
}

pub(crate) fn mangle_field_table_symbol(
    package: &str,
    class_name: &str,
    field_name: &str,
) -> String {
    format!("{}_tbl", mangle_field_symbol(package, class_name, field_name))
}

pub(crate) fn mangle_field_heap_owned_symbol(
    package: &str,
    class_name: &str,
    field_name: &str,
) -> String {
    format!(
        "{}_heap_owned",
        mangle_field_symbol(package, class_name, field_name)
    )
}

pub(crate) fn mangle_class_counter_symbol(package: &str, class_name: &str) -> String {
    let mut out = String::from("pulsec_objc_");
    append_sanitized(&mut out, package);
    out.push('_');
    append_sanitized(&mut out, class_name);
    out
}

pub(crate) fn mangle_class_field_capacity_symbol(package: &str, class_name: &str) -> String {
    let mut out = String::from("pulsec_fcap_");
    append_sanitized(&mut out, package);
    out.push('_');
    append_sanitized(&mut out, class_name);
    out
}

pub(crate) fn mangle_class_field_capacity_proc_symbol(
    package: &str,
    class_name: &str,
) -> String {
    format!(
        "{}_ensure",
        mangle_class_field_capacity_symbol(package, class_name)
    )
}

pub(crate) fn mangle_class_arc_teardown_proc_symbol(
    package: &str,
    class_name: &str,
) -> String {
    format!(
        "{}_arc_teardown",
        mangle_class_field_capacity_symbol(package, class_name)
    )
}

pub(crate) fn mangle_class_arc_scan_edges_proc_symbol(
    package: &str,
    class_name: &str,
) -> String {
    format!(
        "{}_arc_scan_edges",
        mangle_class_field_capacity_symbol(package, class_name)
    )
}

pub(crate) fn mangle_class_arc_invalidate_edges_proc_symbol(
    package: &str,
    class_name: &str,
) -> String {
    format!(
        "{}_arc_invalidate_edges",
        mangle_class_field_capacity_symbol(package, class_name)
    )
}
