use super::target_model::default_target_id;
use super::*;
use pulsec_core::{ArrayInitExpr, ClassMember, Expr, Stmt};

pub(super) struct LoadedUnit {
    pub(super) path: PathBuf,
    pub(super) program: Program,
    pub(super) source_root: Option<String>,
}

#[derive(Debug, Clone)]
pub(super) struct CheckResult {
    pub(super) root: Program,
    pub(super) merged: Program,
    pub(super) class_contexts: Vec<ClassContext>,
    pub(super) files_loaded: usize,
}

#[allow(dead_code)]
pub(super) fn check_project(
    entry_path: &str,
    source_root: Option<&str>,
    strict_package: bool,
) -> Result<CheckResult, String> {
    check_project_with_authorlib(entry_path, source_root, strict_package, false)
}

pub(super) fn check_project_with_authorlib(
    entry_path: &str,
    source_root: Option<&str>,
    strict_package: bool,
    authorlib_enabled: bool,
) -> Result<CheckResult, String> {
    let mut units: HashMap<PathBuf, LoadedUnit> = HashMap::new();
    let mut stack: Vec<PathBuf> = Vec::new();

    let entry_abs = canonical_existing_path(Path::new(entry_path))
        .map_err(|e| format!("Failed to resolve entry file '{}': {}", entry_path, e))?;

    load_unit(
        &entry_abs,
        source_root,
        strict_package,
        authorlib_enabled,
        &mut units,
        &mut stack,
    )?;

    let root = units
        .get(&entry_abs)
        .map(|u| u.program.clone())
        .ok_or_else(|| "Internal error: missing root program".to_string())?;

    for unit in units.values() {
        validate_unit_imports(unit, &units)?;
    }

    loop {
        let mut merged_classes = Vec::new();
        let mut class_contexts: Vec<ClassContext> = Vec::new();
        let mut unit_paths = units.keys().cloned().collect::<Vec<_>>();
        unit_paths.sort();
        for path in &unit_paths {
            let unit = units
                .get(path)
                .expect("sorted unit path should still exist in map");
            for class_decl in &unit.program.classes {
                merged_classes.push(class_decl.clone());
                class_contexts.push(ClassContext {
                    package_name: unit.program.package.name.clone(),
                    imports: unit.program.imports.clone(),
                });
            }
        }
        let merged = Program {
            package: root.package.clone(),
            imports: root.imports.clone(),
            classes: merged_classes,
        };
        match analyze_with_class_contexts(&merged, &class_contexts) {
            Ok(()) => {
                let stdlib_root = canonical_existing_path(&stdlib_source_root()).ok();
                let user_files_loaded = units
                    .keys()
                    .filter(|path| {
                        if let Some(root) = &stdlib_root {
                            !path.starts_with(root)
                        } else {
                            true
                        }
                    })
                    .count();

                return Ok(CheckResult {
                    root,
                    merged,
                    class_contexts,
                    files_loaded: user_files_loaded,
                });
            }
            Err(err) => {
                let message = err.to_string();
                let unresolved = unresolved_same_package_candidate_name(&message);
                if let Some(simple_name) = unresolved {
                    let loaded = try_load_same_package_candidate(
                        &simple_name,
                        strict_package,
                        authorlib_enabled,
                        &mut units,
                        &mut stack,
                    )?;
                    if loaded {
                        continue;
                    }
                }
                return Err(message);
            }
        }
    }
}

pub(super) fn load_unit(
    file_path: &Path,
    source_root: Option<&str>,
    strict_package: bool,
    authorlib_enabled: bool,
    units: &mut HashMap<PathBuf, LoadedUnit>,
    stack: &mut Vec<PathBuf>,
) -> Result<(), String> {
    let canonical = canonical_existing_path(file_path)
        .map_err(|e| format!("Failed to resolve '{}': {}", file_path.display(), e))?;

    if units.contains_key(&canonical) {
        return Ok(());
    }

    if stack.contains(&canonical) {
        let mut cycle = stack
            .iter()
            .map(|p| p.display().to_string())
            .collect::<Vec<_>>();
        cycle.push(canonical.display().to_string());
        return Err(format!("Import cycle detected: {}", cycle.join(" -> ")));
    }

    let source = fs::read_to_string(&canonical)
        .map_err(|e| format!("Failed to read '{}': {}", canonical.display(), e))?;
    let source_name = canonical
        .file_name()
        .and_then(|name| name.to_str())
        .unwrap_or("<memory>");
    let program =
        pulsec_core::parse_with_source_name(&source, source_name).map_err(|e| e.to_string())?;

    if let Some(msg) = package_layout_message(
        &canonical.display().to_string(),
        &program.package.name,
        source_root,
    ) {
        if strict_package {
            return Err(format!("Package layout error: {msg}"));
        } else {
            eprintln!("Warning: {msg}");
        }
    }

    stack.push(canonical.clone());
    for candidate in collect_same_package_candidate_names(&program) {
        let sibling = canonical
            .parent()
            .unwrap_or_else(|| Path::new("."))
            .join(format!("{candidate}.pulse"));
        if same_path(&sibling, &canonical) || !sibling.exists() || units.contains_key(&sibling) {
            continue;
        }
        if path_in_stack(&sibling, stack) {
            continue;
        }
        load_unit(
            &sibling,
            source_root,
            strict_package,
            authorlib_enabled,
            units,
            stack,
        )?;
    }
    for import in &program.imports {
        validate_pulse_import(import, authorlib_enabled)?;
        if is_builtin_import(&import.path) {
            if let Some(stdlib_targets) =
                resolve_builtin_import_targets(import, authorlib_enabled)?
            {
                let stdlib_root = stdlib_source_root();
                let stdlib_root_text = stdlib_root.to_string_lossy().to_string();
                for imported_path in stdlib_targets {
                    load_unit(
                        &imported_path,
                        Some(&stdlib_root_text),
                        strict_package,
                        true,
                        units,
                        stack,
                    )?;
                }
            }
            continue;
        }

        for imported_path in resolve_import_targets(&canonical, import, source_root)? {
            if !imported_path.exists() {
                return Err(format!(
                    "Import '{}' from '{}' could not be resolved to '{}'",
                    import.path,
                    canonical.display(),
                    imported_path.display()
                ));
            }
            load_unit(
                &imported_path,
                source_root,
                strict_package,
                authorlib_enabled,
                units,
                stack,
            )?;
        }
    }

    stack.pop();

    units.insert(
        canonical.clone(),
        LoadedUnit {
            path: canonical,
            program,
            source_root: source_root.map(|value| value.to_string()),
        },
    );
    Ok(())
}

fn unresolved_same_package_candidate_name(message: &str) -> Option<String> {
    if let Some(name) = extract_quoted_name(message, "Unknown type '") {
        return Some(name);
    }
    let symbol = extract_quoted_name(message, "Unknown symbol '")?;
    let first = symbol.chars().next()?;
    if first.is_ascii_uppercase() {
        return Some(symbol);
    }
    None
}

fn collect_same_package_candidate_names(program: &Program) -> HashSet<String> {
    let mut out = HashSet::new();
    for class in &program.classes {
        if let Some(name) = same_package_type_candidate(class.extends.as_deref().unwrap_or("")) {
            out.insert(name);
        }
        for name in &class.implements {
            if let Some(candidate) = same_package_type_candidate(name) {
                out.insert(candidate);
            }
        }
        for member in &class.members {
            match member {
                ClassMember::Field(field) => {
                    if let Some(candidate) = same_package_type_candidate(&field.ty) {
                        out.insert(candidate);
                    }
                    if let Some(init) = &field.init {
                        collect_expr_candidate_names(init, &mut out);
                    }
                }
                ClassMember::Method(method) => {
                    if let Some(return_type) = &method.return_type {
                        if let Some(candidate) = same_package_type_candidate(return_type) {
                            out.insert(candidate);
                        }
                    }
                    for param in &method.params {
                        if let Some(candidate) = same_package_type_candidate(&param.ty) {
                            out.insert(candidate);
                        }
                    }
                    for thrown in &method.throws {
                        if let Some(candidate) = same_package_type_candidate(thrown) {
                            out.insert(candidate);
                        }
                    }
                    for stmt in &method.body {
                        collect_stmt_candidate_names(stmt, &mut out);
                    }
                }
            }
        }
    }
    out
}

fn collect_stmt_candidate_names(stmt: &Stmt, out: &mut HashSet<String>) {
    match stmt {
        Stmt::VarDecl { ty, init, .. } => {
            if let Some(candidate) = same_package_type_candidate(ty) {
                out.insert(candidate);
            }
            if let Some(expr) = init {
                collect_expr_candidate_names(expr, out);
            }
        }
        Stmt::Assign { target, value, .. } | Stmt::CompoundAssign { target, value, .. } => {
            collect_expr_candidate_names(target, out);
            collect_expr_candidate_names(value, out);
        }
        Stmt::If {
            condition,
            then_branch,
            else_branch,
            ..
        } => {
            collect_expr_candidate_names(condition, out);
            for stmt in then_branch {
                collect_stmt_candidate_names(stmt, out);
            }
            if let Some(branch) = else_branch {
                for stmt in branch {
                    collect_stmt_candidate_names(stmt, out);
                }
            }
        }
        Stmt::While { condition, body, .. } | Stmt::DoWhile { body, condition, .. } => {
            collect_expr_candidate_names(condition, out);
            for stmt in body {
                collect_stmt_candidate_names(stmt, out);
            }
        }
        Stmt::For {
            init,
            condition,
            update,
            body,
            ..
        } => {
            if let Some(init) = init {
                collect_stmt_candidate_names(init, out);
            }
            if let Some(condition) = condition {
                collect_expr_candidate_names(condition, out);
            }
            if let Some(update) = update {
                collect_stmt_candidate_names(update, out);
            }
            for stmt in body {
                collect_stmt_candidate_names(stmt, out);
            }
        }
        Stmt::ForEach {
            ty, iterable, body, ..
        } => {
            if let Some(candidate) = same_package_type_candidate(ty) {
                out.insert(candidate);
            }
            collect_expr_candidate_names(iterable, out);
            for stmt in body {
                collect_stmt_candidate_names(stmt, out);
            }
        }
        Stmt::Switch {
            expr,
            cases,
            default,
            ..
        } => {
            collect_expr_candidate_names(expr, out);
            for case in cases {
                collect_expr_candidate_names(&case.label, out);
                for stmt in &case.body {
                    collect_stmt_candidate_names(stmt, out);
                }
            }
            if let Some(default) = default {
                for stmt in default {
                    collect_stmt_candidate_names(stmt, out);
                }
            }
        }
        Stmt::Try {
            resources,
            body,
            catches,
            finally_block,
            ..
        } => {
            for resource in resources {
                if let Some(candidate) = same_package_type_candidate(&resource.ty) {
                    out.insert(candidate);
                }
                collect_expr_candidate_names(&resource.init, out);
            }
            for stmt in body {
                collect_stmt_candidate_names(stmt, out);
            }
            for catch in catches {
                if let Some(candidate) = same_package_type_candidate(&catch.ty) {
                    out.insert(candidate);
                }
                for stmt in &catch.body {
                    collect_stmt_candidate_names(stmt, out);
                }
            }
            if let Some(finally_block) = finally_block {
                for stmt in finally_block {
                    collect_stmt_candidate_names(stmt, out);
                }
            }
        }
        Stmt::Assert {
            condition, message, ..
        } => {
            collect_expr_candidate_names(condition, out);
            if let Some(message) = message {
                collect_expr_candidate_names(message, out);
            }
        }
        Stmt::Throw(expr, _)
        | Stmt::ExprStmt(expr, _) => collect_expr_candidate_names(expr, out),
        Stmt::Return(expr, _) => {
            if let Some(expr) = expr {
                collect_expr_candidate_names(expr, out);
            }
        }
        Stmt::Break { .. } | Stmt::Continue { .. } => {}
    }
}

fn collect_expr_candidate_names(expr: &Expr, out: &mut HashSet<String>) {
    match expr {
        Expr::Var(name) => {
            if is_simple_class_like_name(name) {
                out.insert(name.clone());
            }
        }
        Expr::MemberAccess { object, .. } => collect_expr_candidate_names(object, out),
        Expr::ArrayAccess { array, index } => {
            collect_expr_candidate_names(array, out);
            collect_expr_candidate_names(index, out);
        }
        Expr::Call { callee, args } => {
            collect_expr_candidate_names(callee, out);
            for arg in args {
                collect_expr_candidate_names(arg, out);
            }
        }
        Expr::IncDec { target, .. } | Expr::Unary { expr: target, .. } => {
            collect_expr_candidate_names(target, out);
        }
        Expr::Cast { ty, expr } => {
            if let Some(candidate) = same_package_type_candidate(ty) {
                out.insert(candidate);
            }
            collect_expr_candidate_names(expr, out);
        }
        Expr::InstanceOf { expr, ty } => {
            if let Some(candidate) = same_package_type_candidate(ty) {
                out.insert(candidate);
            }
            collect_expr_candidate_names(expr, out);
        }
        Expr::Binary { left, right, .. } => {
            collect_expr_candidate_names(left, out);
            collect_expr_candidate_names(right, out);
        }
        Expr::Conditional {
            condition,
            then_expr,
            else_expr,
        } => {
            collect_expr_candidate_names(condition, out);
            collect_expr_candidate_names(then_expr, out);
            collect_expr_candidate_names(else_expr, out);
        }
        Expr::SwitchExpr { expr, cases, default } => {
            collect_expr_candidate_names(expr, out);
            for case in cases {
                collect_expr_candidate_names(&case.label, out);
                collect_expr_candidate_names(&case.value, out);
            }
            collect_expr_candidate_names(default, out);
        }
        Expr::NewObject { class_name, args } => {
            if let Some(candidate) = same_package_type_candidate(class_name) {
                out.insert(candidate);
            }
            for arg in args {
                collect_expr_candidate_names(arg, out);
            }
        }
        Expr::NewArray {
            element_ty,
            lengths,
        } => {
            if let Some(candidate) = same_package_type_candidate(element_ty) {
                out.insert(candidate);
            }
            for length in lengths {
                collect_expr_candidate_names(length, out);
            }
        }
        Expr::NewArrayInitialized {
            element_ty, values, ..
        } => {
            if let Some(candidate) = same_package_type_candidate(element_ty) {
                out.insert(candidate);
            }
            for value in values {
                collect_array_init_candidate_names(value, out);
            }
        }
        Expr::IntLiteral(_)
        | Expr::LongLiteral(_)
        | Expr::FloatLiteral(_)
        | Expr::DoubleLiteral(_)
        | Expr::CharLiteral(_)
        | Expr::StringLiteral(_)
        | Expr::BoolLiteral(_)
        | Expr::NullLiteral
        | Expr::This
        | Expr::Super => {}
    }
}

fn collect_array_init_candidate_names(value: &ArrayInitExpr, out: &mut HashSet<String>) {
    match value {
        ArrayInitExpr::Expr(expr) => collect_expr_candidate_names(expr, out),
        ArrayInitExpr::Nested(values) => {
            for value in values {
                collect_array_init_candidate_names(value, out);
            }
        }
    }
}

fn same_package_type_candidate(ty: &str) -> Option<String> {
    let mut base = ty.trim();
    while base.ends_with("[]") {
        base = &base[..base.len() - 2];
    }
    if let Some((raw, _)) = base.split_once('<') {
        base = raw.trim();
    }
    if !is_simple_class_like_name(base) {
        return None;
    }
    Some(base.to_string())
}

fn is_simple_class_like_name(name: &str) -> bool {
    if name.is_empty() || name.contains('.') {
        return false;
    }
    name.chars()
        .next()
        .map(|ch| ch.is_ascii_uppercase())
        .unwrap_or(false)
}

fn extract_quoted_name(message: &str, prefix: &str) -> Option<String> {
    let start = message.find(prefix)? + prefix.len();
    let rest = &message[start..];
    let end = rest.find('\'')?;
    Some(rest[..end].to_string())
}

fn try_load_same_package_candidate(
    simple_name: &str,
    strict_package: bool,
    authorlib_enabled: bool,
    units: &mut HashMap<PathBuf, LoadedUnit>,
    stack: &mut Vec<PathBuf>,
) -> Result<bool, String> {
    let snapshot: Vec<(PathBuf, Option<String>)> = units
        .values()
        .map(|unit| (unit.path.clone(), unit.source_root.clone()))
        .collect();
    let file_name = format!("{simple_name}.pulse");
    let mut loaded_any = false;
    for (unit_path, source_root) in snapshot {
        let Some(parent) = unit_path.parent() else {
            continue;
        };
        let candidate = parent.join(&file_name);
        if !candidate.exists() || same_path(&candidate, &unit_path) || units.contains_key(&candidate) {
            continue;
        }
        if path_in_stack(&candidate, stack) {
            continue;
        }
        load_unit(
            &candidate,
            source_root.as_deref(),
            strict_package,
            authorlib_enabled,
            units,
            stack,
        )?;
        loaded_any = true;
    }
    Ok(loaded_any)
}

pub(super) fn resolve_builtin_import_targets(
    import: &ImportDecl,
    authorlib_enabled: bool,
) -> Result<Option<Vec<PathBuf>>, String> {
    let stdlib_root = stdlib_source_root();
    if !stdlib_root.exists() {
        return Ok(None);
    }

    if import.is_static {
        let class_path = if import.is_wildcard {
            import.path.clone()
        } else {
            static_owner_path(&import.path).ok_or_else(|| {
                format!(
                    "Static import '{}' must reference class member or class wildcard",
                    import.path
                )
            })?
        };
        if class_path.starts_with("author.") && !authorlib_enabled {
            return Err(
                "Import 'author.*' requires [authorlib].enabled = true in pulsec.toml"
                    .to_string(),
            );
        }
        let path = resolve_import_path_from_root(&stdlib_root, &class_path);
        if path.exists() {
            return Ok(Some(vec![path]));
        }
        return Ok(None);
    }

    if import.is_wildcard {
        let dir = resolve_package_dir_from_root(&stdlib_root, &import.path);
        if import.path.starts_with("author.") && !authorlib_enabled {
            return Err(
                "Import 'author.*' requires [authorlib].enabled = true in pulsec.toml"
                    .to_string(),
            );
        }
        if !dir.exists() {
            return Ok(None);
        }
        let mut out = Vec::new();
        let entries = fs::read_dir(&dir)
            .map_err(|e| format!("Failed to read stdlib directory '{}': {}", dir.display(), e))?;
        for entry in entries {
            let entry = entry.map_err(|e| {
                format!(
                    "Failed to read directory entry in '{}': {}",
                    dir.display(),
                    e
                )
            })?;
            let path = entry.path();
            if path.extension().and_then(|e| e.to_str()) == Some("pulse") {
                out.push(path);
            }
        }
        if out.is_empty() {
            return Ok(None);
        }
        return Ok(Some(out));
    }

    if import.path.starts_with("author.") && !authorlib_enabled {
        return Err("Import 'author.*' requires [authorlib].enabled = true in pulsec.toml".to_string());
    }
    let path = resolve_import_path_from_root(&stdlib_root, &import.path);
    if path.exists() {
        Ok(Some(vec![path]))
    } else {
        Ok(None)
    }
}

pub(super) fn validate_unit_imports(
    unit: &LoadedUnit,
    units: &HashMap<PathBuf, LoadedUnit>,
) -> Result<(), String> {
    let mut seen = HashSet::new();
    for import in &unit.program.imports {
        let key = format!(
            "{}|{}|{}",
            import.is_static, import.is_wildcard, import.path
        );
        if !seen.insert(key) {
            return Err(format!(
                "Duplicate import '{}' in '{}'",
                import_string(import),
                unit.path.display()
            ));
        }
    }

    let mut explicit_by_simple: HashMap<String, HashSet<String>> = HashMap::new();
    for import in &unit.program.imports {
        if import.is_static {
            continue;
        }

        if !import.is_wildcard {
            if let Some((pkg, simple)) = import.path.rsplit_once('.') {
                explicit_by_simple
                    .entry(simple.to_string())
                    .or_default()
                    .insert(format!("{}.{}", pkg, simple));
            }
        }
    }

    let mut imported_by_simple = explicit_by_simple.clone();
    for import in &unit.program.imports {
        if import.is_static || !import.is_wildcard {
            continue;
        }
        let pkg = import.path.clone();
        for loaded in units.values() {
            if loaded.program.package.name == pkg {
                for class_decl in &loaded.program.classes {
                    if explicit_by_simple.contains_key(&class_decl.name) {
                        continue;
                    }
                    imported_by_simple
                        .entry(class_decl.name.clone())
                        .or_default()
                        .insert(format!("{}.{}", pkg, class_decl.name));
                }
            }
        }
    }

    for (simple, fqcn_set) in imported_by_simple {
        if fqcn_set.len() > 1 {
            let mut fqcn_list = fqcn_set.into_iter().collect::<Vec<_>>();
            fqcn_list.sort();
            return Err(format!(
                "Ambiguous class import '{}' in '{}': {}",
                simple,
                unit.path.display(),
                fqcn_list.join("; ")
            ));
        }
    }

    Ok(())
}

pub(super) fn import_string(import: &ImportDecl) -> String {
    let mut out = String::new();
    out.push_str("import ");
    if import.is_static {
        out.push_str("static ");
    }
    out.push_str(&import.path);
    if import.is_wildcard {
        out.push_str(".*");
    }
    out
}

pub(super) fn discover_entry_from_source_root(
    source_root: &Path,
) -> Result<Option<PathBuf>, String> {
    if !source_root.exists() {
        return Ok(None);
    }
    let candidate = source_root.join("app").join("main").join("Main.pulse");
    if candidate.exists() {
        return Ok(Some(candidate));
    }
    let mut pulse_files = Vec::new();
    collect_pulse_files(source_root, &mut pulse_files)?;
    pulse_files.sort();
    if pulse_files.len() == 1 {
        Ok(pulse_files.into_iter().next())
    } else {
        Ok(None)
    }
}

pub(super) fn collect_pulse_files(dir: &Path, out: &mut Vec<PathBuf>) -> Result<(), String> {
    let entries = fs::read_dir(dir)
        .map_err(|e| format!("Failed to read source directory '{}': {}", dir.display(), e))?;
    for entry in entries {
        let entry = entry.map_err(|e| {
            format!(
                "Failed to read directory entry in '{}': {}",
                dir.display(),
                e
            )
        })?;
        let path = entry.path();
        if path.is_dir() {
            collect_pulse_files(&path, out)?;
        } else if path.extension().and_then(|e| e.to_str()) == Some("pulse") {
            out.push(path);
        }
    }
    Ok(())
}

#[derive(Debug, Clone)]
pub(super) struct ScaffoldResult {
    pub(super) project_root: PathBuf,
    pub(super) source_root: PathBuf,
    pub(super) entry_file: PathBuf,
}

pub(super) fn scaffold_project(
    project_name: &str,
    flags: &NewFlags,
) -> Result<ScaffoldResult, String> {
    let trimmed = project_name.trim();
    if trimmed.is_empty() {
        return Err("project name cannot be empty".to_string());
    }
    if trimmed.contains(MAIN_SEPARATOR) || trimmed.contains('/') || trimmed.contains('\\') {
        return Err("project name must not contain path separators".to_string());
    }
    let base_dir = if let Some(path) = &flags.path {
        PathBuf::from(path)
    } else {
        env::current_dir().map_err(|e| format!("Failed to resolve current directory: {e}"))?
    };
    let project_root = base_dir.join(trimmed);
    if project_root.exists() {
        return Err(format!(
            "target directory '{}' already exists",
            project_root.display()
        ));
    }
    fs::create_dir_all(&project_root).map_err(|e| {
        format!(
            "Failed to create project directory '{}': {}",
            project_root.display(),
            e
        )
    })?;
    let source_root = project_root.join("src").join("main").join("pulse");
    for path in [
        project_root.join("src").join("main").join("pulse"),
        project_root.join("src").join("main").join("resources"),
        project_root.join("src").join("test").join("pulse"),
        project_root.join("src").join("test").join("resources"),
        project_root.join("src").join("api").join("pulse"),
        project_root.join("src").join("api").join("resources"),
        project_root.join("docs"),
        project_root.join("libraries"),
        project_root.join("build").join("asm"),
        project_root.join("build").join("generated"),
        project_root.join("build").join("assets"),
        project_root.join("build").join("sanity"),
        project_root.join("build").join("tmp"),
        project_root.join("build").join("distro"),
        project_root.join("build").join("distro").join("libraries"),
    ] {
        fs::create_dir_all(&path)
            .map_err(|e| format!("Failed to create directory '{}': {}", path.display(), e))?;
    }

    let (entry_rel, entry_content, extra_files): (PathBuf, String, Vec<(PathBuf, String)>) =
        match flags.template {
        NewTemplate::App => (
            PathBuf::from("app/main/Main.pulse"),
            format!(
                "package app.main;\nimport pulse.lang.IO;\n\nclass Main {{\n    public static void main() {{\n        IO.println(\"{} online\");\n    }}\n}}\n",
                escape_pulse_string(trimmed)
            ),
            Vec::new(),
        ),
        NewTemplate::Lib => (
            PathBuf::from("lib/core/Main.pulse"),
            "package lib.core;\nimport pulse.lang.IO;\n\nclass Main {\n    public static void main() {\n        IO.println(Library.versionCode());\n    }\n}\n".to_string(),
            vec![(
                PathBuf::from("lib/core/Library.pulse"),
                "package lib.core;\n\nclass Library {\n    public static int versionCode() {\n        return 1;\n    }\n}\n".to_string(),
            )],
        ),
    };
    let entry_file = source_root.join(&entry_rel);
    if let Some(parent) = entry_file.parent() {
        fs::create_dir_all(parent)
            .map_err(|e| format!("Failed to create source tree '{}': {}", parent.display(), e))?;
    }
    fs::write(&entry_file, entry_content).map_err(|e| {
        format!(
            "Failed to write entry source '{}': {}",
            entry_file.display(),
            e
        )
    })?;
    for (rel_path, content) in extra_files {
        let file_path = source_root.join(rel_path);
        if let Some(parent) = file_path.parent() {
            fs::create_dir_all(parent).map_err(|e| {
                format!("Failed to create source tree '{}': {}", parent.display(), e)
            })?;
        }
        fs::write(&file_path, content)
            .map_err(|e| format!("Failed to write source '{}': {}", file_path.display(), e))?;
    }

    let manifest = format!(
        "[package]\nname = \"{}\"\nversion = \"0.1.0\"\n\n[sources]\nmain_pulse = \"src/main/pulse\"\nmain_resources = \"src/main/resources\"\ntest_pulse = \"src/test/pulse\"\ntest_resources = \"src/test/resources\"\napi_pulse = \"src/api/pulse\"\napi_resources = \"src/api/resources\"\ndocs = \"docs\"\nlibraries = \"libraries\"\nentry = \"{}\"\n\n[build]\nprofile = \"release\"\ntarget = \"{}\"\noutput_mode = \"fat\"\noutput_entry = \"main\"\nruntime_debug_allocator = \"off\"\nruntime_cycle_collector = \"on\"\nasm_dir = \"build/asm\"\ngenerated_dir = \"build/generated\"\nassets_dir = \"build/assets\"\nsanity_dir = \"build/sanity\"\ntmp_dir = \"build/tmp\"\ndistro_dir = \"build/distro\"\n\n[toolchain]\n",
        trimmed,
        entry_rel.to_string_lossy().replace('\\', "/"),
        default_target_id()
    );
    let manifest_path = project_root.join("pulsec.toml");
    fs::write(&manifest_path, manifest).map_err(|e| {
        format!(
            "Failed to write manifest '{}': {}",
            manifest_path.display(),
            e
        )
    })?;

    fs::create_dir_all(project_root.join("src").join("test").join("pulse")).map_err(|e| {
        format!(
            "Failed to create tests directory '{}': {}",
            project_root
                .join("src")
                .join("test")
                .join("pulse")
                .display(),
            e
        )
    })?;
    fs::write(
        project_root
            .join("src")
            .join("test")
            .join("pulse")
            .join(".gitkeep"),
        "# Reserved for pulsec test fixtures\n",
    )
    .map_err(|e| format!("Failed to write tests placeholder: {e}"))?;
    fs::write(project_root.join("README.md"), format!("# {}\n", trimmed))
        .map_err(|e| format!("Failed to write README.md: {e}"))?;
    fs::write(project_root.join("LICENSE"), "Copyright (c)\n")
        .map_err(|e| format!("Failed to write LICENSE: {e}"))?;

    Ok(ScaffoldResult {
        project_root,
        source_root,
        entry_file,
    })
}

pub(super) fn escape_pulse_string(value: &str) -> String {
    let mut out = String::with_capacity(value.len());
    for ch in value.chars() {
        match ch {
            '\\' => out.push_str("\\\\"),
            '"' => out.push_str("\\\""),
            _ => out.push(ch),
        }
    }
    out
}

pub(super) fn is_builtin_import(path: &str) -> bool {
    path == "pulse"
        || path.starts_with("pulse.")
        || path == "author"
        || path.starts_with("author.")
}

pub(super) fn validate_pulse_import(
    import: &ImportDecl,
    authorlib_enabled: bool,
) -> Result<(), String> {
    let is_pulse_import = import.path == "pulse" || import.path.starts_with("pulse.");
    let is_author_import = import.path == "author" || import.path.starts_with("author.");
    if !is_pulse_import && !is_author_import {
        return Ok(());
    }

    if import.path == "pulse" {
        return Err(format!(
            "Import '{}' is too broad. Import a package under 'pulse.*' or a specific class",
            import.path
        ));
    }
    if import.path == "author" {
        return Err("Import 'author' is too broad. Import a package under 'author.*' or a specific class".to_string());
    }
    if is_author_import && !authorlib_enabled {
        return Err("Import 'author.*' requires [authorlib].enabled = true in pulsec.toml".to_string());
    }

    let stdlib_root = stdlib_source_root();
    if !stdlib_root.exists() {
        return Err(format!(
            "Stdlib root '{}' does not exist",
            stdlib_root.display()
        ));
    }

    if import.is_static {
        if import.is_wildcard {
            let owner_path = resolve_import_path_from_root(&stdlib_root, &import.path);
            if !owner_path.exists() {
                return Err(format!(
                    "Unknown {} static wildcard import '{}'",
                    if is_author_import { "author" } else { "pulse" },
                    import.path,
                ));
            }
            return Ok(());
        }

        if let Some((owner, _member)) = import.path.rsplit_once('.') {
            let owner_path = resolve_import_path_from_root(&stdlib_root, owner);
            if !owner_path.exists() {
                return Err(format!(
                    "Unknown {} static import '{}'",
                    if is_author_import { "author" } else { "pulse" },
                    import.path,
                ));
            }
            return Ok(());
        }

        return Err(format!(
            "Invalid static import '{}'. Expected class member path",
            import.path
        ));
    }

    if import.is_wildcard {
        let package_dir = resolve_package_dir_from_root(&stdlib_root, &import.path);
        if !package_dir.exists() || !package_dir.is_dir() {
            return Err(format!(
                "Unknown {} wildcard import '{}'",
                if is_author_import { "author" } else { "pulse" },
                import.path,
            ));
        }
        return Ok(());
    }

    let import_path = resolve_import_path_from_root(&stdlib_root, &import.path);
    if !import_path.exists() {
        return Err(format!(
            "Unknown {} import '{}'",
            if is_author_import { "author" } else { "pulse" },
            import.path,
        ));
    }

    Ok(())
}

pub(super) fn resolve_import_targets(
    current_file: &Path,
    import: &ImportDecl,
    source_root: Option<&str>,
) -> Result<Vec<PathBuf>, String> {
    if import.is_static {
        let class_path = if import.is_wildcard {
            import.path.clone()
        } else {
            static_owner_path(&import.path).ok_or_else(|| {
                format!(
                    "Static import '{}' must reference class member or class wildcard",
                    import.path
                )
            })?
        };
        return Ok(vec![resolve_import_path(
            current_file,
            &class_path,
            source_root,
        )]);
    }

    if import.is_wildcard {
        let dir = resolve_package_dir(current_file, &import.path, source_root);
        if !dir.exists() {
            return Err(format!(
                "Wildcard import package '{}' from '{}' could not be resolved to directory '{}'",
                import.path,
                current_file.display(),
                dir.display()
            ));
        }

        let mut out = Vec::new();
        let entries = fs::read_dir(&dir)
            .map_err(|e| format!("Failed to read import directory '{}': {}", dir.display(), e))?;
        for entry in entries {
            let entry = entry.map_err(|e| {
                format!(
                    "Failed to read directory entry in '{}': {}",
                    dir.display(),
                    e
                )
            })?;
            let path = entry.path();
            if path.extension().and_then(|e| e.to_str()) == Some("pulse") {
                out.push(path);
            }
        }

        if out.is_empty() {
            return Err(format!(
                "Wildcard import '{}' from '{}' resolved to '{}' but found no .pulse files",
                import.path,
                current_file.display(),
                dir.display()
            ));
        }

        return Ok(out);
    }

    Ok(vec![resolve_import_path(
        current_file,
        &import.path,
        source_root,
    )])
}

pub(super) fn resolve_import_path_from_root(root: &Path, import_path: &str) -> PathBuf {
    let mut rel = PathBuf::new();
    for part in import_path.split('.') {
        rel.push(part);
    }
    rel.set_extension("pulse");
    root.join(rel)
}

pub(super) fn resolve_package_dir_from_root(root: &Path, package_path: &str) -> PathBuf {
    let mut rel = PathBuf::new();
    for part in package_path.split('.') {
        rel.push(part);
    }
    root.join(rel)
}

pub(super) fn resolve_import_path(
    current_file: &Path,
    import_path: &str,
    source_root: Option<&str>,
) -> PathBuf {
    let mut rel = PathBuf::new();
    for part in import_path.split('.') {
        rel.push(part);
    }
    rel.set_extension("pulse");

    if let Some(root) = source_root {
        let root_abs = absolutize(Path::new(root)).unwrap_or_else(|| PathBuf::from(root));
        return root_abs.join(rel);
    }

    let cwd = env::current_dir().unwrap_or_else(|_| PathBuf::from("."));
    if cwd.join(&rel).exists() {
        return cwd.join(rel);
    }

    current_file
        .parent()
        .unwrap_or_else(|| Path::new("."))
        .join(rel)
}

pub(super) fn resolve_package_dir(
    current_file: &Path,
    package_path: &str,
    source_root: Option<&str>,
) -> PathBuf {
    let mut rel = PathBuf::new();
    for part in package_path.split('.') {
        rel.push(part);
    }

    if let Some(root) = source_root {
        let root_abs = absolutize(Path::new(root)).unwrap_or_else(|| PathBuf::from(root));
        return root_abs.join(rel);
    }

    let cwd = env::current_dir().unwrap_or_else(|_| PathBuf::from("."));
    if cwd.join(&rel).exists() {
        return cwd.join(rel);
    }

    current_file
        .parent()
        .unwrap_or_else(|| Path::new("."))
        .join(rel)
}

pub(super) fn static_owner_path(import_path: &str) -> Option<String> {
    import_path
        .rsplit_once('.')
        .map(|(owner, _)| owner.to_string())
}

pub(super) fn package_layout_message(
    file_path: &str,
    package: &str,
    source_root: Option<&str>,
) -> Option<String> {
    let package_parts: Vec<&str> = package.split('.').filter(|p| !p.is_empty()).collect();
    if package_parts.is_empty() {
        return None;
    }

    if let Some(root) = source_root {
        return package_layout_message_with_root(file_path, package, &package_parts, root);
    }

    let parent = Path::new(file_path).parent()?;
    let dir_parts: Vec<String> = parent
        .components()
        .filter_map(|c| c.as_os_str().to_str())
        .map(|s| s.to_string())
        .collect();

    if dir_parts.len() < package_parts.len() {
        return Some(format!(
            "file '{}' must be located under '{}/' for package '{}'",
            file_path,
            package_parts.join(&MAIN_SEPARATOR.to_string()),
            package
        ));
    }

    let start = dir_parts.len() - package_parts.len();
    for (actual, expected) in dir_parts[start..].iter().zip(package_parts.iter()) {
        if !actual.eq_ignore_ascii_case(expected) {
            return Some(format!(
                "package '{}' expects path suffix '{}/', got '{}'",
                package,
                package_parts.join(&MAIN_SEPARATOR.to_string()),
                parent.display()
            ));
        }
    }

    None
}

pub(super) fn package_layout_message_with_root(
    file_path: &str,
    package: &str,
    package_parts: &[&str],
    source_root: &str,
) -> Option<String> {
    let file_abs = canonical_existing_path(Path::new(file_path))
        .ok()
        .or_else(|| absolutize(Path::new(file_path)))?;
    let root_abs = canonical_existing_path(Path::new(source_root))
        .ok()
        .or_else(|| absolutize(Path::new(source_root)))?;

    if !file_abs.starts_with(&root_abs) {
        return Some(format!(
            "file '{}' is not under source root '{}'",
            file_abs.display(),
            root_abs.display()
        ));
    }

    let parent = file_abs.parent()?;
    let rel_parent = parent.strip_prefix(&root_abs).ok()?;
    let rel_parts: Vec<String> = rel_parent
        .components()
        .filter_map(|c| c.as_os_str().to_str())
        .map(|s| s.to_string())
        .collect();

    if rel_parts.len() != package_parts.len() {
        return Some(format!(
            "package '{}' expects path '{}' relative to source root '{}', got '{}'",
            package,
            package_parts.join(&MAIN_SEPARATOR.to_string()),
            root_abs.display(),
            rel_parent.display()
        ));
    }

    for (actual, expected) in rel_parts.iter().zip(package_parts.iter()) {
        if !actual.eq_ignore_ascii_case(expected) {
            return Some(format!(
                "package '{}' expects path '{}' relative to source root '{}', got '{}'",
                package,
                package_parts.join(&MAIN_SEPARATOR.to_string()),
                root_abs.display(),
                rel_parent.display()
            ));
        }
    }

    None
}

pub(super) fn canonical_existing_path(path: &Path) -> Result<PathBuf, std::io::Error> {
    if path.is_absolute() {
        fs::canonicalize(path)
    } else {
        let cwd = env::current_dir()?;
        fs::canonicalize(cwd.join(path))
    }
}

pub(super) fn same_path(a: &Path, b: &Path) -> bool {
    let a_norm = canonical_existing_path(a)
        .ok()
        .unwrap_or_else(|| a.to_path_buf());
    let b_norm = canonical_existing_path(b)
        .ok()
        .unwrap_or_else(|| b.to_path_buf());
    a_norm == b_norm
}

pub(super) fn path_in_stack(path: &Path, stack: &[PathBuf]) -> bool {
    stack.iter().any(|p| same_path(path, p))
}

pub(super) fn absolutize(path: &Path) -> Option<PathBuf> {
    if path.is_absolute() {
        Some(path.to_path_buf())
    } else {
        env::current_dir().ok().map(|cwd| cwd.join(path))
    }
}

pub(super) fn stdlib_source_root() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("..")
        .join("..")
        .join("stdlib")
        .join("src")
}
