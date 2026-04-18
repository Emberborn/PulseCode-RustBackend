use std::collections::{HashMap, HashSet};
use std::sync::{Mutex, OnceLock};

use adenc_core::{IrProgram, IrVisibility};

fn normalize_backend_owner_name(name: &str) -> String {
    let raw = name.split('<').next().unwrap_or(name);
    raw.rsplit('.').next().unwrap_or(raw).to_string()
}

static CLASS_SUPER_RESOLUTION: OnceLock<Mutex<HashMap<String, String>>> = OnceLock::new();
static CLASS_ID_RESOLUTION: OnceLock<Mutex<HashMap<String, u32>>> = OnceLock::new();
static CLASS_PACKAGE_RESOLUTION: OnceLock<Mutex<HashMap<String, (String, String)>>> =
    OnceLock::new();
static FIELD_TYPE_RESOLUTION: OnceLock<Mutex<HashMap<(String, String, String), String>>> =
    OnceLock::new();
static INTERFACE_TYPES_RESOLUTION: OnceLock<Mutex<HashSet<String>>> = OnceLock::new();
static CLASS_INTERFACES_RESOLUTION: OnceLock<Mutex<HashMap<String, Vec<String>>>> = OnceLock::new();
static CLASS_FINALITY_RESOLUTION: OnceLock<Mutex<HashMap<String, bool>>> = OnceLock::new();
static METHOD_FINALITY_RESOLUTION: OnceLock<Mutex<HashMap<(String, String, Vec<String>), bool>>> =
    OnceLock::new();
static METHOD_VISIBILITY_RESOLUTION: OnceLock<
    Mutex<HashMap<(String, String, Vec<String>), IrVisibility>>,
> = OnceLock::new();
static METHOD_RETURN_TYPE_RESOLUTION: OnceLock<
    Mutex<HashMap<(String, String, Vec<String>), String>>,
> = OnceLock::new();
static METHOD_VARARGS_RESOLUTION: OnceLock<Mutex<HashMap<(String, String, Vec<String>), bool>>> =
    OnceLock::new();

pub(crate) fn normalize_class_owner_name(
    candidate: &str,
    class_names: &[String],
) -> Option<String> {
    let normalized = normalize_backend_owner_name(candidate);
    if class_names.iter().any(|c| c == &normalized) {
        return Some(normalized);
    }
    let simple = normalized.rsplit('.').next().unwrap_or(&normalized);
    if class_names.iter().any(|c| c == simple) {
        return Some(simple.to_string());
    }
    None
}

pub(crate) fn build_class_super_map(
    ir: &IrProgram,
    class_names: &[String],
) -> HashMap<String, String> {
    let mut out = HashMap::new();
    for class in &ir.classes {
        let class_name = normalize_backend_owner_name(&class.name);
        let Some(parent) = class
            .super_class
            .as_ref()
            .and_then(|p| normalize_class_owner_name(p, class_names))
        else {
            continue;
        };
        out.insert(class_name, parent);
    }
    out
}

pub(crate) fn build_class_id_map(ir: &IrProgram) -> HashMap<String, u32> {
    let mut classes = ir
        .classes
        .iter()
        .map(|c| {
            let class_name = normalize_backend_owner_name(&c.name);
            (format!("{}.{}", c.package_name, class_name), class_name)
        })
        .collect::<Vec<_>>();
    classes.sort_by(|a, b| a.0.cmp(&b.0));
    let mut out = HashMap::new();
    for (idx, (_, simple_name)) in classes.into_iter().enumerate() {
        out.insert(simple_name, (idx as u32) + 1);
    }
    out
}

pub(crate) fn build_class_package_map(ir: &IrProgram) -> HashMap<String, (String, String)> {
    let mut grouped: HashMap<String, Vec<(String, String)>> = HashMap::new();
    for class in &ir.classes {
        let class_name = normalize_backend_owner_name(&class.name);
        grouped
            .entry(class_name.clone())
            .or_default()
            .push((class.package_name.clone(), class_name));
    }

    let mut out = HashMap::new();
    for (simple_name, mut owners) in grouped {
        owners.sort();
        owners.dedup();
        if owners.len() == 1 {
            out.insert(simple_name, owners.remove(0));
        }
    }
    out
}

pub(crate) fn build_field_type_map(ir: &IrProgram) -> HashMap<(String, String, String), String> {
    let mut out = HashMap::new();
    for class in &ir.classes {
        let class_name = normalize_backend_owner_name(&class.name);
        for field in &class.fields {
            out.insert(
                (
                    class.package_name.clone(),
                    class_name.clone(),
                    field.name.clone(),
                ),
                field.ty.clone(),
            );
        }
    }
    out
}

pub(crate) fn build_interface_type_set(ir: &IrProgram) -> HashSet<String> {
    ir.classes
        .iter()
        .filter(|c| c.is_interface)
        .map(|c| normalize_backend_owner_name(&c.name))
        .collect()
}

pub(crate) fn build_class_interfaces_map(
    ir: &IrProgram,
    class_names: &[String],
    class_super: &HashMap<String, String>,
) -> HashMap<String, Vec<String>> {
    let mut direct: HashMap<String, Vec<String>> = HashMap::new();
    for class in &ir.classes {
        let class_name = normalize_backend_owner_name(&class.name);
        let mut ifaces = class
            .interfaces
            .iter()
            .filter_map(|i| normalize_class_owner_name(i, class_names))
            .collect::<Vec<_>>();
        ifaces.sort();
        ifaces.dedup();
        direct.insert(class_name, ifaces);
    }

    fn collect_interface_closure(
        owner: &str,
        direct: &HashMap<String, Vec<String>>,
        class_super: &HashMap<String, String>,
        out: &mut Vec<String>,
        seen: &mut HashSet<String>,
    ) {
        if let Some(items) = direct.get(owner) {
            for iface in items {
                if seen.insert(iface.clone()) {
                    out.push(iface.clone());
                    collect_interface_closure(iface, direct, class_super, out, seen);
                }
            }
        }
        if let Some(parent) = class_super.get(owner) {
            collect_interface_closure(parent, direct, class_super, out, seen);
        }
    }

    let mut out: HashMap<String, Vec<String>> = HashMap::new();
    for class in &ir.classes {
        let class_name = normalize_backend_owner_name(&class.name);
        let mut seen: HashSet<String> = HashSet::new();
        let mut merged = Vec::new();
        collect_interface_closure(&class_name, &direct, class_super, &mut merged, &mut seen);
        merged.sort();
        out.insert(class_name, merged);
    }
    out
}

pub(crate) fn install_class_super_resolution(map: &HashMap<String, String>) {
    let mutex = CLASS_SUPER_RESOLUTION.get_or_init(|| Mutex::new(HashMap::new()));
    if let Ok(mut guard) = mutex.lock() {
        guard.clear();
        guard.extend(map.clone());
    }
}

pub(crate) fn class_super_of(owner: &str) -> Option<String> {
    let mutex = CLASS_SUPER_RESOLUTION.get_or_init(|| Mutex::new(HashMap::new()));
    let Ok(guard) = mutex.lock() else {
        return None;
    };
    guard.get(owner).cloned()
}

pub(crate) fn install_class_id_resolution(map: &HashMap<String, u32>) {
    let mutex = CLASS_ID_RESOLUTION.get_or_init(|| Mutex::new(HashMap::new()));
    if let Ok(mut guard) = mutex.lock() {
        guard.clear();
        guard.extend(map.clone());
    }
}

pub(crate) fn install_class_package_resolution(map: &HashMap<String, (String, String)>) {
    let mutex = CLASS_PACKAGE_RESOLUTION.get_or_init(|| Mutex::new(HashMap::new()));
    if let Ok(mut guard) = mutex.lock() {
        guard.clear();
        guard.extend(map.clone());
    }
}

pub(crate) fn install_field_type_resolution(map: &HashMap<(String, String, String), String>) {
    let mutex = FIELD_TYPE_RESOLUTION.get_or_init(|| Mutex::new(HashMap::new()));
    if let Ok(mut guard) = mutex.lock() {
        guard.clear();
        guard.extend(map.clone());
    }
}

pub(crate) fn class_package_owner_of(owner: &str) -> Option<(String, String)> {
    let mutex = CLASS_PACKAGE_RESOLUTION.get_or_init(|| Mutex::new(HashMap::new()));
    let Ok(guard) = mutex.lock() else {
        return None;
    };
    guard.get(&normalize_backend_owner_name(owner)).cloned()
}

pub(crate) fn field_type_of(
    package_name: &str,
    class_name: &str,
    field_name: &str,
) -> Option<String> {
    let mutex = FIELD_TYPE_RESOLUTION.get_or_init(|| Mutex::new(HashMap::new()));
    let Ok(guard) = mutex.lock() else {
        return None;
    };
    guard
        .get(&(
            package_name.to_string(),
            normalize_backend_owner_name(class_name),
            field_name.to_string(),
        ))
        .cloned()
}

pub(crate) fn class_id_of(owner: &str) -> Option<u32> {
    let mutex = CLASS_ID_RESOLUTION.get_or_init(|| Mutex::new(HashMap::new()));
    let Ok(guard) = mutex.lock() else {
        return None;
    };
    guard.get(owner).copied()
}

pub(crate) fn all_class_ids() -> Vec<(String, u32)> {
    let mutex = CLASS_ID_RESOLUTION.get_or_init(|| Mutex::new(HashMap::new()));
    let Ok(guard) = mutex.lock() else {
        return Vec::new();
    };
    let mut out = guard
        .iter()
        .map(|(k, v)| (k.clone(), *v))
        .collect::<Vec<_>>();
    out.sort_by(|a, b| a.1.cmp(&b.1));
    out
}

pub(crate) fn install_interface_type_resolution(set: &HashSet<String>) {
    let mutex = INTERFACE_TYPES_RESOLUTION.get_or_init(|| Mutex::new(HashSet::new()));
    if let Ok(mut guard) = mutex.lock() {
        guard.clear();
        guard.extend(set.iter().cloned());
    }
}

pub(crate) fn is_interface_type(owner: &str) -> bool {
    let mutex = INTERFACE_TYPES_RESOLUTION.get_or_init(|| Mutex::new(HashSet::new()));
    let Ok(guard) = mutex.lock() else {
        return false;
    };
    guard.contains(owner)
}

pub(crate) fn install_class_interfaces_resolution(map: &HashMap<String, Vec<String>>) {
    let mutex = CLASS_INTERFACES_RESOLUTION.get_or_init(|| Mutex::new(HashMap::new()));
    if let Ok(mut guard) = mutex.lock() {
        guard.clear();
        guard.extend(map.clone());
    }
}

pub(crate) fn class_implements_interface_runtime(class_name: &str, interface_name: &str) -> bool {
    let mutex = CLASS_INTERFACES_RESOLUTION.get_or_init(|| Mutex::new(HashMap::new()));
    let Ok(guard) = mutex.lock() else {
        return false;
    };
    guard
        .get(class_name)
        .map(|ifaces| ifaces.iter().any(|i| i == interface_name))
        .unwrap_or(false)
}

pub(crate) fn interfaces_of_type(owner: &str) -> Vec<String> {
    let mutex = CLASS_INTERFACES_RESOLUTION.get_or_init(|| Mutex::new(HashMap::new()));
    let Ok(guard) = mutex.lock() else {
        return Vec::new();
    };
    guard.get(owner).cloned().unwrap_or_default()
}

pub(crate) fn install_class_finality_resolution(map: &HashMap<String, bool>) {
    let mutex = CLASS_FINALITY_RESOLUTION.get_or_init(|| Mutex::new(HashMap::new()));
    if let Ok(mut guard) = mutex.lock() {
        guard.clear();
        guard.extend(map.clone());
    }
}

pub(crate) fn class_is_final(owner: &str) -> bool {
    let mutex = CLASS_FINALITY_RESOLUTION.get_or_init(|| Mutex::new(HashMap::new()));
    let Ok(guard) = mutex.lock() else {
        return false;
    };
    guard.get(owner).copied().unwrap_or(false)
}

pub(crate) fn install_method_finality_resolution(
    map: &HashMap<(String, String, Vec<String>), bool>,
) {
    let mutex = METHOD_FINALITY_RESOLUTION.get_or_init(|| Mutex::new(HashMap::new()));
    if let Ok(mut guard) = mutex.lock() {
        guard.clear();
        guard.extend(map.clone());
    }
}

pub(crate) fn all_method_finality() -> HashMap<(String, String, Vec<String>), bool> {
    let mutex = METHOD_FINALITY_RESOLUTION.get_or_init(|| Mutex::new(HashMap::new()));
    let Ok(guard) = mutex.lock() else {
        return HashMap::new();
    };
    guard.clone()
}

pub(crate) fn install_method_visibility_resolution(
    map: &HashMap<(String, String, Vec<String>), IrVisibility>,
) {
    let mutex = METHOD_VISIBILITY_RESOLUTION.get_or_init(|| Mutex::new(HashMap::new()));
    if let Ok(mut guard) = mutex.lock() {
        guard.clear();
        guard.extend(map.clone());
    }
}

pub(crate) fn all_method_visibility() -> HashMap<(String, String, Vec<String>), IrVisibility> {
    let mutex = METHOD_VISIBILITY_RESOLUTION.get_or_init(|| Mutex::new(HashMap::new()));
    let Ok(guard) = mutex.lock() else {
        return HashMap::new();
    };
    guard.clone()
}

pub(crate) fn install_method_return_type_resolution(
    map: &HashMap<(String, String, Vec<String>), String>,
) {
    let mutex = METHOD_RETURN_TYPE_RESOLUTION.get_or_init(|| Mutex::new(HashMap::new()));
    if let Ok(mut guard) = mutex.lock() {
        guard.clear();
        guard.extend(map.clone());
    }
}

pub(crate) fn method_return_type_of(owner: &str, member: &str, sig: &[String]) -> Option<String> {
    let mutex = METHOD_RETURN_TYPE_RESOLUTION.get_or_init(|| Mutex::new(HashMap::new()));
    let Ok(guard) = mutex.lock() else {
        return None;
    };
    guard
        .get(&(owner.to_string(), member.to_string(), sig.to_vec()))
        .cloned()
}

pub(crate) fn install_method_varargs_resolution(
    map: &HashMap<(String, String, Vec<String>), bool>,
) {
    let mutex = METHOD_VARARGS_RESOLUTION.get_or_init(|| Mutex::new(HashMap::new()));
    if let Ok(mut guard) = mutex.lock() {
        guard.clear();
        guard.extend(map.clone());
    }
}

pub(crate) fn method_is_varargs(owner: &str, member: &str, sig: &[String]) -> bool {
    let mutex = METHOD_VARARGS_RESOLUTION.get_or_init(|| Mutex::new(HashMap::new()));
    let Ok(guard) = mutex.lock() else {
        return false;
    };
    guard
        .get(&(owner.to_string(), member.to_string(), sig.to_vec()))
        .copied()
        .unwrap_or(false)
}
