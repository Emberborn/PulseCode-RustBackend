use super::*;

pub(super) struct LoadedUnit {
    pub(super) path: PathBuf,
    pub(super) program: Program,
}

#[derive(Debug, Clone)]
pub(super) struct CheckResult {
    pub(super) root: Program,
    pub(super) merged: Program,
    pub(super) class_contexts: Vec<ClassContext>,
    pub(super) files_loaded: usize,
}

pub(super) fn check_project(
    entry_path: &str,
    source_root: Option<&str>,
    strict_package: bool,
) -> Result<CheckResult, String> {
    let mut units: HashMap<PathBuf, LoadedUnit> = HashMap::new();
    let mut stack: Vec<PathBuf> = Vec::new();

    let entry_abs = canonical_existing_path(Path::new(entry_path))
        .map_err(|e| format!("Failed to resolve entry file '{}': {}", entry_path, e))?;

    load_unit(
        &entry_abs,
        source_root,
        strict_package,
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

    let mut merged_classes = Vec::new();
    let mut class_contexts: Vec<ClassContext> = Vec::new();
    let mut unit_paths = units.keys().cloned().collect::<Vec<_>>();
    unit_paths.sort();
    for path in unit_paths {
        let unit = units
            .get(&path)
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

    analyze_with_class_contexts(&merged, &class_contexts).map_err(|e| e.to_string())?;

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

    Ok(CheckResult {
        root,
        merged,
        class_contexts,
        files_loaded: user_files_loaded,
    })
}

pub(super) fn load_unit(
    file_path: &Path,
    source_root: Option<&str>,
    strict_package: bool,
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
    let program = pulsec_core::parse_with_source_name(&source, source_name)
        .map_err(|e| e.to_string())?;

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
    for import in &program.imports {
        validate_pulse_import(import)?;
        if is_builtin_import(&import.path) {
            if let Some(stdlib_targets) = resolve_builtin_import_targets(import)? {
                let stdlib_root = stdlib_source_root();
                let stdlib_root_text = stdlib_root.to_string_lossy().to_string();
                for imported_path in stdlib_targets {
                    load_unit(
                        &imported_path,
                        Some(&stdlib_root_text),
                        strict_package,
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
            load_unit(&imported_path, source_root, strict_package, units, stack)?;
        }
    }

    for package_file in resolve_package_files(&canonical, &program.package.name, source_root)? {
        if same_path(&package_file, &canonical) {
            continue;
        }
        if path_in_stack(&package_file, stack) {
            continue;
        }
        load_unit(&package_file, source_root, strict_package, units, stack)?;
    }
    stack.pop();

    units.insert(
        canonical.clone(),
        LoadedUnit {
            path: canonical,
            program,
        },
    );
    Ok(())
}

pub(super) fn resolve_builtin_import_targets(import: &ImportDecl) -> Result<Option<Vec<PathBuf>>, String> {
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
        let path = resolve_import_path_from_root(&stdlib_root, &class_path);
        if path.exists() {
            return Ok(Some(vec![path]));
        }
        return Ok(None);
    }

    if import.is_wildcard {
        let dir = resolve_package_dir_from_root(&stdlib_root, &import.path);
        if !dir.exists() {
            return Ok(None);
        }
        let mut out = Vec::new();
        let entries = fs::read_dir(&dir)
            .map_err(|e| format!("Failed to read stdlib directory '{}': {}", dir.display(), e))?;
        for entry in entries {
            let entry = entry
                .map_err(|e| format!("Failed to read directory entry in '{}': {}", dir.display(), e))?;
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
        let key = format!("{}|{}|{}", import.is_static, import.is_wildcard, import.path);
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


pub(super) fn discover_entry_from_source_root(source_root: &Path) -> Result<Option<PathBuf>, String> {
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
        let entry = entry
            .map_err(|e| format!("Failed to read directory entry in '{}': {}", dir.display(), e))?;
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

pub(super) fn scaffold_project(project_name: &str, flags: &NewFlags) -> Result<ScaffoldResult, String> {
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
    fs::create_dir_all(&project_root)
        .map_err(|e| format!("Failed to create project directory '{}': {}", project_root.display(), e))?;
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
        project_root.join("build").join("staging"),
        project_root.join("build").join("distro"),
        project_root.join("build").join("distro").join("libraries"),
        project_root.join("build").join("distro").join("package"),
    ] {
        fs::create_dir_all(&path)
            .map_err(|e| format!("Failed to create directory '{}': {}", path.display(), e))?;
    }

    let (entry_rel, entry_content, extra_files): (PathBuf, String, Vec<(PathBuf, String)>) =
        match flags.template {
        NewTemplate::App => (
            PathBuf::from("app/main/Main.pulse"),
            format!(
                "package app.main;\nimport com.pulse.lang.IO;\n\nclass Main {{\n    public static void main() {{\n        IO.println(\"{} online\");\n    }}\n}}\n",
                escape_pulse_string(trimmed)
            ),
            Vec::new(),
        ),
        NewTemplate::Lib => (
            PathBuf::from("lib/core/Main.pulse"),
            "package lib.core;\nimport com.pulse.lang.IO;\n\nclass Main {\n    public static void main() {\n        IO.println(Library.versionCode());\n    }\n}\n".to_string(),
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
    fs::write(&entry_file, entry_content)
        .map_err(|e| format!("Failed to write entry source '{}': {}", entry_file.display(), e))?;
    for (rel_path, content) in extra_files {
        let file_path = source_root.join(rel_path);
        if let Some(parent) = file_path.parent() {
            fs::create_dir_all(parent)
                .map_err(|e| format!("Failed to create source tree '{}': {}", parent.display(), e))?;
        }
        fs::write(&file_path, content)
            .map_err(|e| format!("Failed to write source '{}': {}", file_path.display(), e))?;
    }

    let manifest = format!(
        "[package]\nname = \"{}\"\nversion = \"0.1.0\"\n\n[sources]\nmain_pulse = \"src/main/pulse\"\nmain_resources = \"src/main/resources\"\ntest_pulse = \"src/test/pulse\"\ntest_resources = \"src/test/resources\"\napi_pulse = \"src/api/pulse\"\napi_resources = \"src/api/resources\"\ndocs = \"docs\"\nlibraries = \"libraries\"\nentry = \"{}\"\n\n[build]\nprofile = \"release\"\ntarget = \"native-x64\"\npackaging_mode = \"staged\"\noutput_mode = \"fat\"\noutput_entry = \"main\"\nruntime_debug_allocator = \"off\"\nruntime_cycle_collector = \"on\"\nasm_dir = \"build/asm\"\ngenerated_dir = \"build/generated\"\nassets_dir = \"build/assets\"\nsanity_dir = \"build/sanity\"\ntmp_dir = \"build/tmp\"\ndistro_dir = \"build/distro\"\n\n[toolchain]\n\n[package.metadata]\npublisher = \"PulseCode\"\nidentifier = \"com.pulse.{}\"\ninstall_scope = \"per-user\"\nentrypoints = \"{}\"\nicons = \"src/main/resources/icon.ico\"\nassets = \"src/main/resources\"\nlicense = \"LICENSE\"\nreadme = \"README.md\"\nconfig = \"src/main/resources/config\"\ndata = \"src/main/resources/data\"\nlibraries = \"build/distro/libraries\"\nsigning_mode = \"unsigned\"\n",
        trimmed,
        entry_rel.to_string_lossy().replace('\\', "/"),
        trimmed,
        entry_rel
            .to_string_lossy()
            .replace('/', ".")
            .replace('\\', ".")
            .trim_end_matches(".pulse")
    );
    let manifest_path = project_root.join("pulsec.toml");
    fs::write(&manifest_path, manifest)
        .map_err(|e| format!("Failed to write manifest '{}': {}", manifest_path.display(), e))?;

    fs::create_dir_all(project_root.join("src").join("test").join("pulse")).map_err(|e| {
        format!(
            "Failed to create tests directory '{}': {}",
            project_root.join("src").join("test").join("pulse").display(),
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
    path == "com" || path == "com.pulse" || path.starts_with("com.pulse.")
}

pub(super) fn validate_pulse_import(import: &ImportDecl) -> Result<(), String> {
    if !(import.path == "com" || import.path == "com.pulse" || import.path.starts_with("com.pulse.")) {
        return Ok(());
    }

    const BUILTIN_PACKAGES: &[&str] = &[
        "com.pulse.io",
        "com.pulse.math",
        "com.pulse.memory",
        "com.pulse.collections",
        "com.pulse.lang",
        "com.pulse.rt",
        "com.pulse.time",
    ];

    const BUILTIN_CLASSES: &[&str] = &[
        "com.pulse.lang.System",
        "com.pulse.lang.IO",
        "com.pulse.io.Console",
        "com.pulse.io.File",
        "com.pulse.io.Path",
        "com.pulse.io.Files",
        "com.pulse.io.InputStream",
        "com.pulse.io.OutputStream",
        "com.pulse.math.Math",
        "com.pulse.math.Random",
        "com.pulse.time.Instant",
        "com.pulse.time.Duration",
        "com.pulse.collections.Array",
        "com.pulse.collections.Collection",
        "com.pulse.collections.List",
        "com.pulse.collections.Set",
        "com.pulse.collections.Queue",
        "com.pulse.collections.Deque",
        "com.pulse.collections.Map",
        "com.pulse.collections.ArrayList",
        "com.pulse.collections.LinkedList",
        "com.pulse.collections.HashSet",
        "com.pulse.collections.HashMap",
        "com.pulse.lang.ConsoleWriter",
        "com.pulse.lang.PrintStream",
        "com.pulse.lang.Object",
        "com.pulse.lang.Class",
        "com.pulse.lang.Comparable",
        "com.pulse.lang.Runnable",
        "com.pulse.lang.Appendable",
        "com.pulse.lang.CharSequence",
        "com.pulse.lang.Iterable",
        "com.pulse.lang.Iterator",
        "com.pulse.lang.AutoCloseable",
        "com.pulse.lang.StringBuilder",
        "com.pulse.lang.Enum",
        "com.pulse.lang.Throwable",
        "com.pulse.lang.Exception",
        "com.pulse.lang.RuntimeException",
        "com.pulse.lang.AssertionError",
        "com.pulse.lang.IllegalArgumentException",
        "com.pulse.lang.IllegalStateException",
        "com.pulse.lang.NullPointerException",
        "com.pulse.lang.IndexOutOfBoundsException",
        "com.pulse.lang.UnsupportedOperationException",
        "com.pulse.lang.NumberFormatException",
        "com.pulse.lang.String",
        "com.pulse.lang.Strings",
        "com.pulse.lang.Byte",
        "com.pulse.lang.Short",
        "com.pulse.lang.Integer",
        "com.pulse.lang.Long",
        "com.pulse.memory.Memory",
        "com.pulse.lang.Float",
        "com.pulse.lang.Double",
        "com.pulse.lang.Char",
        "com.pulse.lang.Boolean",
        "com.pulse.lang.UByte",
        "com.pulse.lang.UShort",
        "com.pulse.lang.UInteger",
        "com.pulse.lang.ULong",
        "com.pulse.lang.Void",
        "com.pulse.rt.Intrinsics",
    ];

    if import.path == "com" || import.path == "com.pulse" {
        return Err(format!(
            "Import '{}' is too broad. Import a package under 'com.pulse.*' or a specific class",
            import.path
        ));
    }

    if import.is_static {
        if import.is_wildcard {
            if !BUILTIN_CLASSES.contains(&import.path.as_str()) {
                return Err(format!(
                    "Unknown com.pulse static wildcard import '{}'. Supported owners: {}",
                    import.path,
                    BUILTIN_CLASSES.join(", ")
                ));
            }
            return Ok(());
        }

        if let Some((owner, _member)) = import.path.rsplit_once('.') {
            if !BUILTIN_CLASSES.contains(&owner) {
                return Err(format!(
                    "Unknown com.pulse static import '{}'. Supported owners: {}",
                    import.path,
                    BUILTIN_CLASSES.join(", ")
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
        if !BUILTIN_PACKAGES.contains(&import.path.as_str()) {
            return Err(format!(
                "Unknown com.pulse wildcard import '{}'. Supported packages: {}",
                import.path,
                BUILTIN_PACKAGES.join(", ")
            ));
        }
        return Ok(());
    }

    if !BUILTIN_CLASSES.contains(&import.path.as_str()) {
        return Err(format!(
            "Unknown com.pulse import '{}'. Supported classes: {}",
            import.path,
            BUILTIN_CLASSES.join(", ")
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
        return Ok(vec![resolve_import_path(current_file, &class_path, source_root)]);
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
            let entry = entry
                .map_err(|e| format!("Failed to read directory entry in '{}': {}", dir.display(), e))?;
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

pub(super) fn resolve_import_path(current_file: &Path, import_path: &str, source_root: Option<&str>) -> PathBuf {
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

pub(super) fn resolve_package_dir(current_file: &Path, package_path: &str, source_root: Option<&str>) -> PathBuf {
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

pub(super) fn resolve_package_files(
    current_file: &Path,
    package_path: &str,
    source_root: Option<&str>,
) -> Result<Vec<PathBuf>, String> {
    let dir = resolve_package_dir(current_file, package_path, source_root);
    if !dir.exists() {
        return Ok(Vec::new());
    }

    let mut out = Vec::new();
    let entries = fs::read_dir(&dir)
        .map_err(|e| format!("Failed to read package directory '{}': {}", dir.display(), e))?;
    for entry in entries {
        let entry = entry
            .map_err(|e| format!("Failed to read directory entry in '{}': {}", dir.display(), e))?;
        let path = entry.path();
        if path.extension().and_then(|e| e.to_str()) == Some("pulse") {
            out.push(path);
        }
    }
    Ok(out)
}

pub(super) fn static_owner_path(import_path: &str) -> Option<String> {
    import_path.rsplit_once('.').map(|(owner, _)| owner.to_string())
}

pub(super) fn package_layout_message(file_path: &str, package: &str, source_root: Option<&str>) -> Option<String> {
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
    let a_norm = canonical_existing_path(a).ok().unwrap_or_else(|| a.to_path_buf());
    let b_norm = canonical_existing_path(b).ok().unwrap_or_else(|| b.to_path_buf());
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
