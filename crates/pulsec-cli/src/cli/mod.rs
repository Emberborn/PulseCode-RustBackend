mod build;
mod config;
mod command_line;
mod manifest;
mod output;
mod package;
mod project;
mod testing;

use std::{
    collections::{BTreeMap, HashMap, HashSet},
    env, fs,
    path::{Path, PathBuf, MAIN_SEPARATOR},
    process,
};

use pulsec_core::{
    analyze_with_class_contexts, lower_to_ir_with_contexts, ClassContext, ImportDecl,
    IrProgram, Program,
};
use crate::backend::{BackendAdapter, BackendArtifact, NoopNativeBackend};
use self::build::*;
use self::config::*;
use self::command_line::{new_template_name, parse_command, parse_flags, parse_new_flags};
use self::manifest::*;
use self::output::{
    emit_error, emit_hint, print_build_usage, print_check_usage, print_help, print_new_usage,
    print_package_usage, print_test_usage, print_version,
};
use self::package::*;
use self::project::*;
use self::testing::*;

const EXIT_OK: i32 = 0;
const EXIT_COMMAND_FAILURE: i32 = 1;
const EXIT_USAGE_ERROR: i32 = 2;
#[allow(dead_code)]
const EXIT_NOT_IMPLEMENTED: i32 = 3;

const DIAG_USAGE: &str = "PULSEC:E_USAGE";
const DIAG_COMMAND: &str = "PULSEC:E_COMMAND";
const DIAG_CHECK: &str = "PULSEC:E_CHECK_FAILED";
const DIAG_BUILD: &str = "PULSEC:E_BUILD_FAILED";
const DIAG_TEST: &str = "PULSEC:E_TEST_FAILED";
const DIAG_PACKAGE: &str = "PULSEC:E_PACKAGE_FAILED";
#[allow(dead_code)]
const DIAG_NOT_IMPLEMENTED: &str = "PULSEC:E_NOT_IMPLEMENTED";

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
enum CliCommand {
    New,
    Check,
    Build,
    Test,
    Package,
    Help,
    Version,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
enum NewTemplate {
    App,
    Lib,
}

#[derive(Debug, Clone)]
struct NewFlags {
    path: Option<String>,
    template: NewTemplate,
}

pub(crate) fn run() {
    let args: Vec<String> = env::args().collect();
    let Some(command_arg) = args.get(1) else {
        emit_error(DIAG_USAGE, "missing command");
        emit_hint("run 'pulsec help' to see available commands");
        print_help(true);
        process::exit(EXIT_USAGE_ERROR);
    };

    let command = match parse_command(command_arg) {
        Some(cmd) => cmd,
        None => {
            emit_error(DIAG_USAGE, &format!("Unknown command '{}'", command_arg));
            emit_hint("run 'pulsec help' to see available commands");
            print_help(true);
            process::exit(EXIT_USAGE_ERROR);
        }
    };

    if command == CliCommand::Help {
        print_help(false);
        process::exit(EXIT_OK);
    }
    if command == CliCommand::Version {
        print_version();
        process::exit(EXIT_OK);
    }

    let command_args = &args[2..];
    match command {
        CliCommand::New => {
            if command_args.iter().any(|arg| arg == "--help" || arg == "-h") {
                print_new_usage(false);
                process::exit(EXIT_OK);
            }
            let Some(project_name) = command_args.first() else {
                eprintln!("Missing project name for 'new'");
                print_new_usage(true);
                process::exit(EXIT_USAGE_ERROR);
            };
            let flags = match parse_new_flags(&command_args[1..]) {
                Ok(flags) => flags,
                Err(msg) => {
                    emit_error(DIAG_USAGE, &msg);
                    emit_hint("run 'pulsec new --help' to see accepted flags");
                    print_new_usage(true);
                    process::exit(EXIT_USAGE_ERROR);
                }
            };
            match scaffold_project(project_name, &flags) {
                Ok(created) => {
                    println!(
                        "Created project '{}' at '{}'",
                        project_name,
                        created.project_root.display()
                    );
                    println!("Template: {}", new_template_name(flags.template));
                    println!("Source root: {}", created.source_root.display());
                    println!("Entry: {}", created.entry_file.display());
                }
                Err(err) => {
                    emit_error(DIAG_COMMAND, &format!("Scaffold error: {err}"));
                    emit_hint("choose a new project name or a different --path");
                    process::exit(EXIT_COMMAND_FAILURE);
                }
            }
        }
        CliCommand::Check => {
            if command_args.iter().any(|arg| arg == "--help" || arg == "-h") {
                print_check_usage(false);
                process::exit(EXIT_OK);
            }
            let (entry_arg, flag_args) = split_optional_entry_arg(command_args);
            let cli_flags = match parse_flags(CliCommand::Check, flag_args) {
                Ok(flags) => flags,
                Err(msg) => {
                    emit_error(DIAG_USAGE, &msg);
                    emit_hint("run 'pulsec check --help' to see accepted flags");
                    print_check_usage(true);
                    process::exit(EXIT_USAGE_ERROR);
                }
            };
            let workspace = match resolve_workspace_context(entry_arg, &cli_flags) {
                Ok(workspace) => workspace,
                Err(msg) => {
                    emit_error(DIAG_USAGE, &msg);
                    emit_hint("fix [workspace].members paths or run against a member project root");
                    print_check_usage(true);
                    process::exit(EXIT_USAGE_ERROR);
                }
            };
            if let Some(workspace) = workspace {
                let strict = cli_flags.strict_package && !cli_flags.friendly;
                let mode_label = if strict { "strict" } else { "friendly" };
                let mut passed = 0usize;
                let mut failed = 0usize;
                println!(
                    "Workspace check: root={} members={} mode={}",
                    workspace.root.display(),
                    workspace.member_roots.len(),
                    mode_label
                );
                for member_root in &workspace.member_roots {
                    let mut member_flags = cli_flags.clone();
                    member_flags.project_root = Some(member_root.display().to_string());
                    member_flags.source_root = None;
                    let resolved = match resolve_check_invocation(None, &member_flags) {
                        Ok(config) => config,
                        Err(err) => {
                            failed += 1;
                            eprintln!("[FAIL] {} :: {}", member_root.display(), err);
                            continue;
                        }
                    };
                    match check_project(&resolved.entry_path, resolved.source_root.as_deref(), strict) {
                        Ok(result) => {
                            passed += 1;
                            println!(
                                "[PASS] {} package={} files={}",
                                member_root.display(),
                                result.root.package.name,
                                result.files_loaded
                            );
                        }
                        Err(err) => {
                            failed += 1;
                            eprintln!("[FAIL] {} :: {}", member_root.display(), err);
                        }
                    }
                }
                println!(
                    "Workspace check summary: passed={} failed={} total={}",
                    passed,
                    failed,
                    workspace.member_roots.len()
                );
                if failed > 0 {
                    emit_error(DIAG_CHECK, "one or more workspace members failed check");
                    emit_hint("inspect [FAIL] lines and re-run on the failing member with --project-root");
                    process::exit(EXIT_COMMAND_FAILURE);
                }
                process::exit(EXIT_OK);
            }
            let resolved = match resolve_check_invocation(entry_arg, &cli_flags) {
                Ok(config) => config,
                Err(msg) => {
                    emit_error(DIAG_USAGE, &msg);
                    emit_hint("provide <entry.pulse> or set [sources].entry in pulsec.toml");
                    print_check_usage(true);
                    process::exit(EXIT_USAGE_ERROR);
                }
            };
            let strict = cli_flags.strict_package && !cli_flags.friendly;
            let mode_label = if strict { "strict" } else { "friendly" };
            match check_project(
                &resolved.entry_path,
                resolved.source_root.as_deref(),
                strict,
            ) {
                Ok(result) => {
                    println!(
                        "OK: package={} imports={} classes={} files={}",
                        result.root.package.name,
                        result.root.imports.len(),
                        result.merged.classes.len(),
                        result.files_loaded
                    );
                    println!(
                        "Check summary: mode={} project_mode={} entry={} source_root={}",
                        mode_label,
                        if resolved.used_manifest {
                            "manifest"
                        } else {
                            "direct"
                        },
                        resolved.entry_path,
                        resolved
                            .source_root
                            .as_deref()
                            .unwrap_or("<none>")
                    );
                }
                Err(err) => {
                    eprintln!(
                        "Check FAILED: mode={} entry={} source_root={}",
                        mode_label,
                        resolved.entry_path,
                        resolved
                            .source_root
                            .as_deref()
                            .unwrap_or("<none>")
                    );
                    emit_error(DIAG_CHECK, &format!("Compile error: {err}"));
                    emit_hint("re-run with '--friendly' for layout warnings or inspect imports/packages");
                    process::exit(EXIT_COMMAND_FAILURE);
                }
            }
        }
        CliCommand::Build => {
            if command_args.iter().any(|arg| arg == "--help" || arg == "-h") {
                print_build_usage(false);
                process::exit(EXIT_OK);
            }
            let (entry_arg, flag_args) = split_optional_entry_arg(command_args);
            let cli_flags = match parse_flags(CliCommand::Build, flag_args) {
                Ok(flags) => flags,
                Err(msg) => {
                    emit_error(DIAG_USAGE, &msg);
                    emit_hint("run 'pulsec build --help' to see accepted flags");
                    print_build_usage(true);
                    process::exit(EXIT_USAGE_ERROR);
                }
            };
            let workspace = match resolve_workspace_context(entry_arg, &cli_flags) {
                Ok(workspace) => workspace,
                Err(msg) => {
                    emit_error(DIAG_USAGE, &msg);
                    emit_hint("fix [workspace].members paths or run against a member project root");
                    print_build_usage(true);
                    process::exit(EXIT_USAGE_ERROR);
                }
            };
            if let Some(workspace) = workspace {
                let mut failed = 0usize;
                println!(
                    "Workspace build: root={} members={}",
                    workspace.root.display(),
                    workspace.member_roots.len()
                );
                for member_root in &workspace.member_roots {
                    let mut member_flags = cli_flags.clone();
                    member_flags.project_root = Some(member_root.display().to_string());
                    member_flags.source_root = None;
                    let resolved = match resolve_build_invocation(None, &member_flags) {
                        Ok(config) => config,
                        Err(err) => {
                            failed += 1;
                            eprintln!("[FAIL] {} :: {}", member_root.display(), err);
                            continue;
                        }
                    };
                    let build = match execute_build_pipeline(&resolved, &member_flags) {
                        Ok(build) => build,
                        Err(err) => {
                            failed += 1;
                            eprintln!("[FAIL] {} :: {}", member_root.display(), err);
                            continue;
                        }
                    };
                    println!("[PASS] {}", member_root.display());
                    print_build_summary(&build);
                    if cli_flags.msi {
                        match run_package_pipeline(&build, &member_flags, true) {
                            Ok(report) => {
                                print_package_summary(&report);
                            }
                            Err(PackageError::Failed(message)) => {
                                failed += 1;
                                eprintln!("[FAIL] {} :: {}", member_root.display(), message);
                            }
                        }
                    }
                }
                println!(
                    "Workspace build summary: failed={} total={}",
                    failed,
                    workspace.member_roots.len()
                );
                if failed > 0 {
                    emit_error(DIAG_BUILD, "one or more workspace members failed build");
                    emit_hint("inspect [FAIL] lines and re-run on the failing member with --project-root");
                    process::exit(EXIT_COMMAND_FAILURE);
                }
                process::exit(EXIT_OK);
            }
            let resolved = match resolve_build_invocation(entry_arg, &cli_flags) {
                Ok(config) => config,
                Err(msg) => {
                    emit_error(DIAG_USAGE, &msg);
                    emit_hint("provide <entry.pulse> or set [sources].entry in pulsec.toml");
                    print_build_usage(true);
                    process::exit(EXIT_USAGE_ERROR);
                }
            };
            let build = match execute_build_pipeline(&resolved, &cli_flags) {
                Ok(build) => build,
                Err(err) => {
                    emit_error(DIAG_BUILD, &format!("Compile error: {err}"));
                    emit_hint("run 'pulsec check' first to isolate compile-time issues");
                    process::exit(EXIT_COMMAND_FAILURE);
                }
            };
            print_build_summary(&build);
            if cli_flags.msi {
                match run_package_pipeline(&build, &cli_flags, true) {
                    Ok(report) => {
                        print_package_summary(&report);
                    }
                    Err(PackageError::Failed(message)) => {
                        emit_error(DIAG_PACKAGE, &format!("Package error: {message}"));
                        emit_hint("re-run package with '--staging-dir <dir>' to verify filesystem permissions");
                        process::exit(EXIT_COMMAND_FAILURE);
                    }
                }
            }
        }
        CliCommand::Test => {
            if command_args.iter().any(|arg| arg == "--help" || arg == "-h") {
                print_test_usage(false);
                process::exit(EXIT_OK);
            }
            let cli_flags = match parse_flags(CliCommand::Test, command_args) {
                Ok(flags) => flags,
                Err(msg) => {
                    emit_error(DIAG_USAGE, &msg);
                    emit_hint("run 'pulsec test --help' to see accepted flags");
                    print_test_usage(true);
                    process::exit(EXIT_USAGE_ERROR);
                }
            };
            let workspace = match resolve_workspace_context(None, &cli_flags) {
                Ok(workspace) => workspace,
                Err(msg) => {
                    emit_error(DIAG_USAGE, &msg);
                    emit_hint("fix [workspace].members paths or run against a member project root");
                    print_test_usage(true);
                    process::exit(EXIT_USAGE_ERROR);
                }
            };
            if let Some(workspace) = workspace {
                let strict = cli_flags.strict_package && !cli_flags.friendly;
                let mode_label = if strict { "strict" } else { "friendly" };
                let mut passed = 0usize;
                let mut failed = 0usize;
                let mut total = 0usize;
                println!(
                    "Workspace test: root={} members={} mode={}",
                    workspace.root.display(),
                    workspace.member_roots.len(),
                    mode_label
                );
                for member_root in &workspace.member_roots {
                    let mut member_flags = cli_flags.clone();
                    member_flags.project_root = Some(member_root.display().to_string());
                    member_flags.source_root = None;
                    let invocation = match resolve_test_invocation(&member_flags) {
                        Ok(invocation) => invocation,
                        Err(err) => {
                            failed += 1;
                            eprintln!("[FAIL] {} :: {}", member_root.display(), err);
                            continue;
                        }
                    };
                    let tests = match discover_test_files(&invocation.tests_root) {
                        Ok(tests) => tests,
                        Err(err) => {
                            failed += 1;
                            eprintln!("[FAIL] {} :: {}", member_root.display(), err);
                            continue;
                        }
                    };
                    if tests.is_empty() {
                        failed += 1;
                        eprintln!(
                            "[FAIL] {} :: no .pulse tests found under '{}'",
                            member_root.display(),
                            invocation.tests_root.display()
                        );
                        continue;
                    }
                    println!(
                        "Member test discovery: member={} tests_root={} source_root={} count={}",
                        member_root.display(),
                        invocation.tests_root.display(),
                        invocation.source_root.display(),
                        tests.len()
                    );
                    for test_file in &tests {
                        total += 1;
                        let display_name = display_test_name(&invocation.tests_root, test_file);
                        match check_project(
                            &test_file.display().to_string(),
                            Some(&invocation.source_root.display().to_string()),
                            strict,
                        ) {
                            Ok(_) => {
                                passed += 1;
                                println!("[PASS] {}::{}", member_root.display(), display_name);
                            }
                            Err(err) => {
                                failed += 1;
                                eprintln!("[FAIL] {}::{} :: {}", member_root.display(), display_name, err);
                            }
                        }
                    }
                }
                println!(
                    "Workspace test summary: mode={} passed={} failed={} total={}",
                    mode_label, passed, failed, total
                );
                if failed > 0 {
                    emit_error(DIAG_TEST, "one or more workspace tests failed");
                    emit_hint("review [FAIL] diagnostics above and re-run for the failing member");
                    process::exit(EXIT_COMMAND_FAILURE);
                }
                process::exit(EXIT_OK);
            }
            let invocation = match resolve_test_invocation(&cli_flags) {
                Ok(invocation) => invocation,
                Err(msg) => {
                    emit_error(DIAG_USAGE, &msg);
                    emit_hint("set '--project-root <dir>' to a project containing tests/");
                    print_test_usage(true);
                    process::exit(EXIT_USAGE_ERROR);
                }
            };
            let strict = cli_flags.strict_package && !cli_flags.friendly;
            let mode_label = if strict { "strict" } else { "friendly" };
            let tests = match discover_test_files(&invocation.tests_root) {
                Ok(tests) => tests,
                Err(err) => {
                    emit_error(DIAG_TEST, &format!("Test discovery failed: {err}"));
                    emit_hint("ensure the tests directory exists and is readable");
                    process::exit(EXIT_COMMAND_FAILURE);
                }
            };
            if tests.is_empty() {
                emit_error(
                    DIAG_TEST,
                    &format!(
                        "Test discovery failed: no .pulse tests found under '{}'",
                        invocation.tests_root.display()
                    ),
                );
                emit_hint("add .pulse files under tests/ with a main entrypoint");
                process::exit(EXIT_COMMAND_FAILURE);
            }
            println!(
                "Test discovery: project_mode={} project_root={} tests_root={} source_root={} count={}",
                if invocation.used_manifest {
                    "manifest"
                } else {
                    "direct"
                },
                invocation.project_root.display(),
                invocation.tests_root.display(),
                invocation.source_root.display(),
                tests.len()
            );
            let mut passed = 0usize;
            let mut failed = 0usize;
            for test_file in &tests {
                let display_name = display_test_name(&invocation.tests_root, test_file);
                match check_project(
                    &test_file.display().to_string(),
                    Some(&invocation.source_root.display().to_string()),
                    strict,
                ) {
                    Ok(_) => {
                        passed += 1;
                        println!("[PASS] {}", display_name);
                    }
                    Err(err) => {
                        failed += 1;
                        eprintln!("[FAIL] {} :: {}", display_name, err);
                    }
                }
            }
            println!(
                "Test summary: mode={} passed={} failed={} total={}",
                mode_label,
                passed,
                failed,
                tests.len()
            );
            if failed > 0 {
                emit_error(DIAG_TEST, "one or more tests failed");
                emit_hint("review [FAIL] diagnostics above and re-run the test command");
                process::exit(EXIT_COMMAND_FAILURE);
            }
        }
        CliCommand::Package => {
            if command_args.iter().any(|arg| arg == "--help" || arg == "-h") {
                print_package_usage(false);
                process::exit(EXIT_OK);
            }
            let (entry_arg, flag_args) = split_optional_entry_arg(command_args);
            let cli_flags = match parse_flags(CliCommand::Package, flag_args) {
                Ok(flags) => flags,
                Err(msg) => {
                    emit_error(DIAG_USAGE, &msg);
                    emit_hint("run 'pulsec package --help' to see accepted flags");
                    print_package_usage(true);
                    process::exit(EXIT_USAGE_ERROR);
                }
            };
            let workspace = match resolve_workspace_context(entry_arg, &cli_flags) {
                Ok(workspace) => workspace,
                Err(msg) => {
                    emit_error(DIAG_USAGE, &msg);
                    emit_hint("fix [workspace].members paths or run against a member project root");
                    print_package_usage(true);
                    process::exit(EXIT_USAGE_ERROR);
                }
            };
            if let Some(workspace) = workspace {
                let mut failed = 0usize;
                println!(
                    "Workspace package: root={} members={}",
                    workspace.root.display(),
                    workspace.member_roots.len()
                );
                for member_root in &workspace.member_roots {
                    let mut member_flags = cli_flags.clone();
                    member_flags.project_root = Some(member_root.display().to_string());
                    member_flags.source_root = None;
                    let resolved = match resolve_build_invocation(None, &member_flags) {
                        Ok(config) => config,
                        Err(err) => {
                            failed += 1;
                            eprintln!("[FAIL] {} :: {}", member_root.display(), err);
                            continue;
                        }
                    };
                    let build = match execute_build_pipeline(&resolved, &member_flags) {
                        Ok(build) => build,
                        Err(err) => {
                            failed += 1;
                            eprintln!("[FAIL] {} :: {}", member_root.display(), err);
                            continue;
                        }
                    };
                    match run_package_pipeline(&build, &member_flags, false) {
                        Ok(report) => {
                            println!("[PASS] {}", member_root.display());
                            print_package_summary(&report);
                        }
                        Err(PackageError::Failed(message)) => {
                            failed += 1;
                            eprintln!("[FAIL] {} :: {}", member_root.display(), message);
                        }
                    }
                }
                println!(
                    "Workspace package summary: failed={} total={}",
                    failed,
                    workspace.member_roots.len()
                );
                if failed > 0 {
                    emit_error(DIAG_PACKAGE, "one or more workspace members failed package");
                    emit_hint("inspect [FAIL] lines and re-run on the failing member with --project-root");
                    process::exit(EXIT_COMMAND_FAILURE);
                }
                process::exit(EXIT_OK);
            }
            let resolved = match resolve_build_invocation(entry_arg, &cli_flags) {
                Ok(config) => config,
                Err(msg) => {
                    emit_error(DIAG_USAGE, &msg);
                    emit_hint("provide <entry.pulse> or set [sources].entry in pulsec.toml");
                    print_package_usage(true);
                    process::exit(EXIT_USAGE_ERROR);
                }
            };
            let build = match execute_build_pipeline(&resolved, &cli_flags) {
                Ok(build) => build,
                Err(err) => {
                    emit_error(DIAG_PACKAGE, &format!("Compile error: {err}"));
                    emit_hint("run 'pulsec check' before packaging to resolve compile issues");
                    process::exit(EXIT_COMMAND_FAILURE);
                }
            };
            match run_package_pipeline(&build, &cli_flags, false) {
                Ok(report) => {
                    print_package_summary(&report);
                }
                Err(PackageError::Failed(message)) => {
                    emit_error(DIAG_PACKAGE, &format!("Package error: {message}"));
                    emit_hint("check output directory permissions and retry");
                    process::exit(EXIT_COMMAND_FAILURE);
                }
            }
        }
        CliCommand::Help | CliCommand::Version => unreachable!("handled before dispatch"),
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::time::{SystemTime, UNIX_EPOCH};

    fn unique_temp_root() -> PathBuf {
        let nanos = SystemTime::now()
            .duration_since(UNIX_EPOCH)
            .expect("time should move forward")
            .as_nanos();
        env::temp_dir().join(format!("pulsec_cli_tests_{nanos}"))
    }

    fn write_file(path: &Path, content: &str) {
        if let Some(parent) = path.parent() {
            fs::create_dir_all(parent).expect("create dirs");
        }
        fs::write(path, content).expect("write file");
    }

    #[test]
    fn parse_flags_accepts_linker_path() {
        let flags = vec![
            "--source-root".to_string(),
            "src".to_string(),
            "--linker".to_string(),
            r"C:\tools\link.exe".to_string(),
            "--strict-package".to_string(),
        ];
        let parsed = parse_flags(CliCommand::Build, &flags).expect("flags should parse");
        assert!(parsed.strict_package);
        assert!(!parsed.friendly);
        assert!(parsed.project_root.is_none());
        assert_eq!(parsed.source_root.as_deref(), Some("src"));
        assert!(parsed.profile.is_none());
        assert!(parsed.target.is_none());
        assert!(parsed.packaging_mode.is_none());
        assert!(parsed.runtime_debug_allocator.is_none());
        assert!(parsed.runtime_cycle_collector.is_none());
        assert!(parsed.out_dir.is_none());
        assert!(!parsed.msi);
        assert!(parsed.staging_dir.is_none());
        assert!(parsed.assembler.is_none());
        assert_eq!(parsed.linker.as_deref(), Some(r"C:\tools\link.exe"));
        assert!(parsed.wix.is_none());
        assert!(parsed.signtool.is_none());
    }

    #[test]
    fn parse_flags_requires_linker_value() {
        let flags = vec!["--linker".to_string()];
        let err =
            parse_flags(CliCommand::Build, &flags).expect_err("missing linker value should error");
        assert!(err.contains("--linker requires a file path value"));
    }

    #[test]
    fn parse_flags_rejects_linker_on_check() {
        let flags = vec!["--linker".to_string(), r"C:\tools\link.exe".to_string()];
        let err =
            parse_flags(CliCommand::Check, &flags).expect_err("check must reject linker override");
        assert!(err.contains("--linker is only valid for 'build' or 'package'"));
    }

    #[test]
    fn parse_flags_accepts_wix_path() {
        let flags = vec!["--wix".to_string(), r"C:\Program Files\WiX Toolset v6.0\bin\wix.exe".to_string()];
        let parsed = parse_flags(CliCommand::Package, &flags).expect("wix flag should parse");
        assert_eq!(
            parsed.wix.as_deref(),
            Some(r"C:\Program Files\WiX Toolset v6.0\bin\wix.exe")
        );
    }

    #[test]
    fn parse_flags_rejects_wix_on_check() {
        let flags = vec!["--wix".to_string(), r"C:\tools\wix.exe".to_string()];
        let err = parse_flags(CliCommand::Check, &flags).expect_err("check must reject wix override");
        assert!(err.contains("--wix is only valid for 'build' or 'package'"));
    }

    #[test]
    fn parse_flags_accepts_signtool_path() {
        let flags = vec!["--signtool".to_string(), r"C:\Program Files (x86)\Windows Kits\10\bin\signtool.exe".to_string()];
        let parsed = parse_flags(CliCommand::Package, &flags).expect("signtool flag should parse");
        assert_eq!(
            parsed.signtool.as_deref(),
            Some(r"C:\Program Files (x86)\Windows Kits\10\bin\signtool.exe")
        );
    }

    #[test]
    fn parse_flags_rejects_signtool_on_check() {
        let flags = vec!["--signtool".to_string(), r"C:\tools\signtool.exe".to_string()];
        let err =
            parse_flags(CliCommand::Check, &flags).expect_err("check must reject signtool override");
        assert!(err.contains("--signtool is only valid for 'build' or 'package'"));
    }

    #[test]
    fn parse_flags_check_accepts_friendly_and_project_root() {
        let flags = vec![
            "--friendly".to_string(),
            "--project-root".to_string(),
            "demo".to_string(),
        ];
        let parsed = parse_flags(CliCommand::Check, &flags).expect("check flags should parse");
        assert!(parsed.friendly);
        assert_eq!(parsed.project_root.as_deref(), Some("demo"));
    }

    #[test]
    fn parse_flags_test_accepts_friendly_and_project_root() {
        let flags = vec![
            "--friendly".to_string(),
            "--project-root".to_string(),
            "workspace/demo".to_string(),
        ];
        let parsed = parse_flags(CliCommand::Test, &flags).expect("test flags should parse");
        assert!(parsed.friendly);
        assert_eq!(parsed.project_root.as_deref(), Some("workspace/demo"));
    }

    #[test]
    fn parse_flags_build_accepts_profile_and_out_dir() {
        let flags = vec![
            "--profile".to_string(),
            "release".to_string(),
            "--target".to_string(),
            "native-x64".to_string(),
            "--packaging-mode".to_string(),
            "staged".to_string(),
            "--output-mode".to_string(),
            "shared".to_string(),
            "--runtime-debug-allocator".to_string(),
            "on".to_string(),
            "--runtime-cycle-collector".to_string(),
            "off".to_string(),
            "--assembler".to_string(),
            r"C:\tools\ml64.exe".to_string(),
            "--out-dir".to_string(),
            "out\\bin".to_string(),
        ];
        let parsed = parse_flags(CliCommand::Build, &flags).expect("build flags should parse");
        assert_eq!(parsed.profile.as_deref(), Some("release"));
        assert_eq!(parsed.target.as_deref(), Some("native-x64"));
        assert_eq!(parsed.packaging_mode.as_deref(), Some("staged"));
        assert_eq!(parsed.output_mode.as_deref(), Some("shared"));
        assert_eq!(parsed.runtime_debug_allocator.as_deref(), Some("on"));
        assert_eq!(parsed.runtime_cycle_collector.as_deref(), Some("off"));
        assert_eq!(parsed.assembler.as_deref(), Some(r"C:\tools\ml64.exe"));
        assert_eq!(parsed.out_dir.as_deref(), Some("out\\bin"));
    }

    #[test]
    fn parse_flags_build_accepts_output_mode_legacy_aliases() {
        let flags = vec!["--output-mode".to_string(), "single_exe".to_string()];
        let parsed = parse_flags(CliCommand::Build, &flags).expect("build flags should parse");
        assert_eq!(parsed.output_mode.as_deref(), Some("fat"));

        let flags = vec!["--output-mode".to_string(), "exe_with_dlls".to_string()];
        let parsed = parse_flags(CliCommand::Build, &flags).expect("build flags should parse");
        assert_eq!(parsed.output_mode.as_deref(), Some("shared"));
    }

    #[test]
    fn parse_flags_package_accepts_msi_and_staging_dir() {
        let flags = vec![
            "--msi".to_string(),
            "--staging-dir".to_string(),
            "pkg_out".to_string(),
        ];
        let parsed = parse_flags(CliCommand::Package, &flags).expect("package flags should parse");
        assert!(parsed.msi);
        assert_eq!(parsed.staging_dir.as_deref(), Some("pkg_out"));
    }

    #[test]
    fn parse_command_accepts_help_and_version_aliases() {
        assert_eq!(parse_command("--help"), Some(CliCommand::Help));
        assert_eq!(parse_command("-h"), Some(CliCommand::Help));
        assert_eq!(parse_command("--version"), Some(CliCommand::Version));
        assert_eq!(parse_command("-V"), Some(CliCommand::Version));
    }

    #[test]
    fn parse_new_flags_accepts_template_and_path() {
        let flags = vec![
            "--template".to_string(),
            "lib".to_string(),
            "--path".to_string(),
            "projects".to_string(),
        ];
        let parsed = parse_new_flags(&flags).expect("new flags should parse");
        assert_eq!(parsed.template, NewTemplate::Lib);
        assert_eq!(parsed.path.as_deref(), Some("projects"));
    }

    #[test]
    fn parse_new_flags_rejects_invalid_template() {
        let flags = vec!["--template".to_string(), "service".to_string()];
        let err = parse_new_flags(&flags).expect_err("invalid template must fail");
        assert!(err.contains("--template requires one of: app, lib"));
    }

    #[test]
    fn manifest_v1_accepts_full_schema_sections() {
        let root = unique_temp_root();
        let manifest = root.join("pulsec.toml");
        write_file(
            &manifest,
            r#"
            [package]
            name = "demo_app"
            version = "1.2.3"

            [sources]
            main_pulse = "src/main/pulse"
            test_pulse = "src/test/pulse"
            entry = "app/main/Main.pulse"

            [build]
            profile = "release"
            target = "native-x64"
            packaging_mode = "staged"
            output_mode = "fat"
            output_entry = "main"
            runtime_debug_allocator = "on"
            runtime_cycle_collector = "off"
            out_dir = "dist"

            [toolchain]
            linker = "C:/toolchain/link.exe"
            assembler = "C:/toolchain/ml64.exe"
            wix = "C:/toolchain/wix.exe"
            signtool = "C:/toolchain/signtool.exe"

            [package.metadata]
            publisher = "Pulse Labs"
            channel = "stable"
            signing_mode = "unsigned"
            "#,
        );
        let parsed = load_manifest_config(&manifest).expect("manifest should parse");
        let package = parsed.package.as_ref().expect("package");
        assert_eq!(package.name, "demo_app");
        assert_eq!(package.version, "1.2.3");
        assert_eq!(parsed.sources.root, "src/main/pulse");
        assert_eq!(parsed.sources.main_pulse.as_deref(), Some("src/main/pulse"));
        assert_eq!(parsed.sources.test_pulse.as_deref(), Some("src/test/pulse"));
        assert_eq!(parsed.sources.entry.as_deref(), Some("app/main/Main.pulse"));
        assert_eq!(parsed.build.profile.as_deref(), Some("release"));
        assert_eq!(parsed.build.target.as_deref(), Some("native-x64"));
        assert_eq!(parsed.build.packaging_mode.as_deref(), Some("staged"));
        assert_eq!(parsed.build.output_mode.as_deref(), Some("fat"));
        assert_eq!(parsed.build.output_entry.as_deref(), Some("main"));
        assert_eq!(
            parsed.build.runtime_debug_allocator.as_deref(),
            Some("on")
        );
        assert_eq!(
            parsed.build.runtime_cycle_collector.as_deref(),
            Some("off")
        );
        assert_eq!(parsed.build.out_dir.as_deref(), Some("dist"));
        assert_eq!(
            parsed.toolchain.linker.as_deref(),
            Some("C:/toolchain/link.exe")
        );
        assert_eq!(
            parsed.toolchain.assembler.as_deref(),
            Some("C:/toolchain/ml64.exe")
        );
        assert_eq!(parsed.toolchain.wix.as_deref(), Some("C:/toolchain/wix.exe"));
        assert_eq!(
            parsed.toolchain.signtool.as_deref(),
            Some("C:/toolchain/signtool.exe")
        );
        assert_eq!(
            package.metadata.get("publisher").map(|s| s.as_str()),
            Some("Pulse Labs")
        );
        assert_eq!(
            package.metadata.get("signing_mode").map(|s| s.as_str()),
            Some("unsigned")
        );
        let _ = fs::remove_dir_all(root);
    }

    #[test]
    fn manifest_v1_rejects_unknown_section_and_key() {
        let root = unique_temp_root();
        let unknown_section = root.join("unknown_section.toml");
        write_file(
            &unknown_section,
            r#"
            [package]
            name = "demo"
            version = "0.1.0"
            [workspace_bad]
            members = "app"
            "#,
        );
        let err = load_manifest_config(&unknown_section).expect_err("unknown section should fail");
        assert!(err.contains("unknown section '[workspace_bad]'"));

        let unknown_key = root.join("unknown_key.toml");
        write_file(
            &unknown_key,
            r#"
            [package]
            name = "demo"
            version = "0.1.0"
            edition = "2026"
            "#,
        );
        let err = load_manifest_config(&unknown_key).expect_err("unknown key should fail");
        assert!(err.contains("unknown key 'edition' in [package]"));
        let _ = fs::remove_dir_all(root);
    }

    #[test]
    fn manifest_v1_rejects_missing_required_package_fields() {
        let root = unique_temp_root();
        let manifest = root.join("pulsec.toml");
        write_file(
            &manifest,
            r#"
            [sources]
            root = "src"
            "#,
        );
        let err = load_manifest_config(&manifest).expect_err("missing package fields should fail");
        assert!(err.contains("[package].name is required"));
        let _ = fs::remove_dir_all(root);
    }

    #[test]
    fn manifest_v1_accepts_workspace_without_package() {
        let root = unique_temp_root();
        let manifest = root.join("workspace.toml");
        write_file(
            &manifest,
            r#"
            [workspace]
            members = "apps/core, libs/util"
            "#,
        );
        let parsed = load_manifest_config(&manifest).expect("workspace-only manifest should parse");
        assert!(parsed.package.is_none());
        let workspace = parsed.workspace.as_ref().expect("workspace");
        assert_eq!(workspace.members, vec!["apps/core", "libs/util"]);
        let _ = fs::remove_dir_all(root);
    }

    #[test]
    fn manifest_v1_rejects_invalid_version_and_profile() {
        let root = unique_temp_root();
        let bad_version = root.join("bad_version.toml");
        write_file(
            &bad_version,
            r#"
            [package]
            name = "demo"
            version = "1.0"
            "#,
        );
        let err = load_manifest_config(&bad_version).expect_err("invalid version should fail");
        assert!(err.contains("must be semantic 'x.y.z'"));

        let bad_profile = root.join("bad_profile.toml");
        write_file(
            &bad_profile,
            r#"
            [package]
            name = "demo"
            version = "1.0.0"

            [build]
            profile = "fast"
            "#,
        );
        let err = load_manifest_config(&bad_profile).expect_err("invalid profile should fail");
        assert!(err.contains("[build].profile must be 'debug' or 'release'"));

        let bad_output = root.join("bad_output.toml");
        write_file(
            &bad_output,
            r#"
            [package]
            name = "demo"
            version = "1.0.0"

            [build]
            output_mode = "shared"
            "#,
        );
        let err = load_manifest_config(&bad_output).expect_err("missing split output entry should fail");
        assert!(err.contains("[build].output_entry is required when [build].output_mode is 'shared'"));
        let _ = fs::remove_dir_all(root);
    }

    #[test]
    fn manifest_v1_rejects_invalid_signing_mode() {
        let root = unique_temp_root();
        let manifest = root.join("pulsec.toml");
        write_file(
            &manifest,
            r#"
            [package]
            name = "demo_app"
            version = "1.2.3"

            [sources]
            main_pulse = "src/main/pulse"
            entry = "app/main/Main.pulse"

            [package.metadata]
            signing_mode = "certmagic"
            "#,
        );
        let err = load_manifest_config(&manifest).expect_err("invalid signing mode should fail");
        assert!(err.contains("[package.metadata].signing_mode must be 'unsigned' or 'signtool'"));
        let _ = fs::remove_dir_all(root);
    }

    #[test]
    fn check_project_rejects_missing_import() {
        let root = unique_temp_root();
        let src_root = root.join("src");
        let entry = src_root.join("app/core/Main.pulse");

        write_file(
            &entry,
            r#"
            package app.core;
            import app.missing.Util;

            class Main {
                public static void main() {
                }
            }
            "#,
        );

        let result = check_project(
            entry.to_str().expect("entry utf8"),
            Some(src_root.to_str().expect("src utf8")),
            true,
        );
        assert!(result.is_err());
        assert!(result
            .expect_err("expected import failure")
            .contains("could not be resolved"));

        let _ = fs::remove_dir_all(root);
    }

    #[test]
    fn check_project_rejects_import_cycle() {
        let root = unique_temp_root();
        let src_root = root.join("src");
        let a = src_root.join("app/core/A.pulse");
        let b = src_root.join("app/core/B.pulse");

        write_file(
            &a,
            r#"
            package app.core;
            import app.core.B;

            class A {
                public static void main() {
                }
            }
            "#,
        );
        write_file(
            &b,
            r#"
            package app.core;
            import app.core.A;

            class B {
            }
            "#,
        );

        let result = check_project(
            a.to_str().expect("a utf8"),
            Some(src_root.to_str().expect("src utf8")),
            true,
        );
        assert!(result.is_err());
        assert!(result.expect_err("expected cycle").contains("Import cycle detected"));

        let _ = fs::remove_dir_all(root);
    }

    #[test]
    fn check_project_enforces_cross_file_visibility_and_package_rules() {
        let root = unique_temp_root();
        let src_root = root.join("src");
        let main = src_root.join("app/core/Main.pulse");
        let util_same_pkg = src_root.join("app/core/Util.pulse");
        let util_other_pkg = src_root.join("app/other/OtherUtil.pulse");

        write_file(
            &util_same_pkg,
            r#"
            package app.core;

            import com.pulse.lang.IO;


            class Util {
                int packageValue;
                protected int protectedValue() {
                    return 2;
                }
                private int secret() {
                    return 1;
                }
            }
            "#,
        );
        write_file(
            &util_other_pkg,
            r#"
            package app.other;

            import com.pulse.lang.IO;


            class OtherUtil {
                int packageValue;
                protected int protectedValue() {
                    return 3;
                }
            }
            "#,
        );

        write_file(
            &main,
            r#"
            package app.core;
            import app.core.Util;
            import app.other.OtherUtil;

            class Main {
                public static void main() {
                    Util u = new Util();
                    IO.println(u.packageValue);
                    IO.println(u.protectedValue());
                    IO.println(u.secret());

                    OtherUtil o = new OtherUtil();
                    IO.println(o.packageValue);
                    IO.println(o.protectedValue());
                }
            }
            "#,
        );

        let result = check_project(
            main.to_str().expect("main utf8"),
            Some(src_root.to_str().expect("src utf8")),
            true,
        );
        assert!(result.is_err());
        let message = result.expect_err("expected visibility failure");
        assert!(
            message.contains("Cannot access private method 'Util.secret' from class 'Main'")
                || message.contains("Cannot access package-private field 'OtherUtil.packageValue' from class 'Main'")
                || message.contains(
                    "Cannot access protected method 'OtherUtil.protectedValue' from class 'Main'"
                )
        );

        let _ = fs::remove_dir_all(root);
    }

    #[test]
    fn check_project_accepts_wildcard_package_import() {
        let root = unique_temp_root();
        let src_root = root.join("src");
        let main = src_root.join("app/core/Main.pulse");
        let util = src_root.join("app/shared/Util.pulse");

        write_file(
            &util,
            r#"
            package app.shared;

            import com.pulse.lang.IO;


            class Util {
                public static int two() {
                    return 2;
                }
            }
            "#,
        );
        write_file(
            &main,
            r#"
            package app.core;
            import app.shared.*;

            class Main {
                public static void main() {
                    IO.println(Util.two());
                }
            }
            "#,
        );

        let result = check_project(
            main.to_str().expect("main utf8"),
            Some(src_root.to_str().expect("src utf8")),
            true,
        );
        assert!(result.is_ok());

        let _ = fs::remove_dir_all(root);
    }

    #[test]
    fn check_project_accepts_static_import_member_and_wildcard() {
        let root = unique_temp_root();
        let src_root = root.join("src");
        let util = src_root.join("app/shared/Util.pulse");
        let main_member = src_root.join("app/core/MainMember.pulse");
        let main_wild = src_root.join("app/alt/MainWild.pulse");

        write_file(
            &util,
            r#"
            package app.shared;

            import com.pulse.lang.IO;


            class Util {
                public static int two() {
                    return 2;
                }
            }
            "#,
        );
        write_file(
            &main_member,
            r#"
            package app.core;
            import static app.shared.Util.two;

            class MainMember {
                public static void main() {
                    IO.println(two());
                }
            }
            "#,
        );
        write_file(
            &main_wild,
            r#"
            package app.alt;
            import static app.shared.Util.*;

            class MainWild {
                public static void main() {
                    IO.println(two());
                }
            }
            "#,
        );

        let member_result = check_project(
            main_member.to_str().expect("main member utf8"),
            Some(src_root.to_str().expect("src utf8")),
            true,
        );
        assert!(member_result.is_ok());

        let wild_result = check_project(
            main_wild.to_str().expect("main wild utf8"),
            Some(src_root.to_str().expect("src utf8")),
            true,
        );
        assert!(wild_result.is_ok());

        let _ = fs::remove_dir_all(root);
    }

    #[test]
    fn check_project_rejects_duplicate_imports() {
        let root = unique_temp_root();
        let src_root = root.join("src");
        let main = src_root.join("app/core/Main.pulse");
        let util = src_root.join("app/shared/Util.pulse");

        write_file(
            &util,
            r#"
            package app.shared;

            import com.pulse.lang.IO;


            class Util {
                public static int two() {
                    return 2;
                }
            }
            "#,
        );
        write_file(
            &main,
            r#"
            package app.core;
            import app.shared.Util;
            import app.shared.Util;

            class Main {
                public static void main() {
                    IO.println(Util.two());
                }
            }
            "#,
        );

        let result = check_project(
            main.to_str().expect("main utf8"),
            Some(src_root.to_str().expect("src utf8")),
            true,
        );
        assert!(result.is_err());
        assert!(result
            .expect_err("expected duplicate import error")
            .contains("Duplicate import"));

        let _ = fs::remove_dir_all(root);
    }

    #[test]
    fn check_project_rejects_ambiguous_class_imports() {
        let root = unique_temp_root();
        let src_root = root.join("src");
        let main = src_root.join("app/core/Main.pulse");
        let util_a = src_root.join("app/shared/Util.pulse");
        let util_b = src_root.join("app/tools/Util.pulse");

        write_file(
            &util_a,
            r#"
            package app.shared;
            import com.pulse.lang.IO;

            class Util {
            }
            "#,
        );
        write_file(
            &util_b,
            r#"
            package app.tools;
            import com.pulse.lang.IO;

            class Util {
            }
            "#,
        );
        write_file(
            &main,
            r#"
            package app.core;
            import app.shared.Util;
            import app.tools.Util;

            class Main {
                public static void main() {
                }
            }
            "#,
        );

        let result = check_project(
            main.to_str().expect("main utf8"),
            Some(src_root.to_str().expect("src utf8")),
            true,
        );
        assert!(result.is_err());
        assert!(result
            .expect_err("expected ambiguous import error")
            .contains("Ambiguous class import 'Util'"));

        let _ = fs::remove_dir_all(root);
    }

    #[test]
    fn check_project_allows_duplicate_class_simple_names_across_packages() {
        let root = unique_temp_root();
        let src_root = root.join("src");
        let main = src_root.join("app/core/Main.pulse");
        let util_a = src_root.join("app/shared/Util.pulse");
        let util_b = src_root.join("app/tools/Util.pulse");

        write_file(
            &util_a,
            r#"
            package app.shared;

            import com.pulse.lang.IO;


            class Util {
                public static int one() {
                    return 1;
                }
            }
            "#,
        );
        write_file(
            &util_b,
            r#"
            package app.tools;
            import com.pulse.lang.IO;

            class Util {
                public static int two() {
                    return 2;
                }
            }
            "#,
        );
        write_file(
            &main,
            r#"
            package app.core;
            import app.tools.Util;

            class Main {
                public static void main() {
                    IO.println(Util.two());
                }
            }
            "#,
        );

        let result = check_project(
            main.to_str().expect("entry utf8"),
            Some(src_root.to_str().expect("src utf8")),
            true,
        );
        assert!(result.is_ok());

        let _ = fs::remove_dir_all(root);
    }

    #[test]
    fn check_project_allows_same_package_class_without_import() {
        let root = unique_temp_root();
        let src_root = root.join("src");
        let main = src_root.join("app/core/Main.pulse");
        let util = src_root.join("app/core/Util.pulse");

        write_file(
            &util,
            r#"
            package app.core;
            import com.pulse.lang.IO;

            class Util {
                public static int two() {
                    return 2;
                }
            }
            "#,
        );
        write_file(
            &main,
            r#"
            package app.core;

            import com.pulse.lang.IO;


            class Main {
                public static void main() {
                    IO.println(Util.two());
                }
            }
            "#,
        );

        let result = check_project(
            main.to_str().expect("main utf8"),
            Some(src_root.to_str().expect("src utf8")),
            true,
        );
        assert!(result.is_ok());

        let _ = fs::remove_dir_all(root);
    }

    #[test]
    fn check_project_requires_import_for_cross_package_class() {
        let root = unique_temp_root();
        let src_root = root.join("src");
        let main = src_root.join("app/core/Main.pulse");
        let util = src_root.join("app/shared/Util.pulse");

        write_file(
            &util,
            r#"
            package app.shared;
            import com.pulse.lang.IO;

            class Util {
                public static int two() {
                    return 2;
                }
            }
            "#,
        );
        write_file(
            &main,
            r#"
            package app.core;

            import com.pulse.lang.IO;


            class Main {
                public static void main() {
                    IO.println(Util.two());
                }
            }
            "#,
        );

        let result = check_project(
            main.to_str().expect("main utf8"),
            Some(src_root.to_str().expect("src utf8")),
            true,
        );
        assert!(result.is_err());
        assert!(result
            .expect_err("expected unknown symbol without import")
            .contains("Unknown symbol 'Util'"));

        let _ = fs::remove_dir_all(root);
    }

    #[test]
    fn check_project_accepts_supported_pulse_imports() {
        let root = unique_temp_root();
        let src_root = root.join("src");
        let main = src_root.join("app/core/Main.pulse");

        write_file(
            &main,
            r#"
            package app.core;
            import com.pulse.lang.System;
            import com.pulse.lang.IO;
            import com.pulse.lang.ConsoleWriter;
            import com.pulse.lang.String;
            import com.pulse.math.Math;
            import com.pulse.math.Random;
            import com.pulse.collections.Collection;
            import com.pulse.collections.ArrayList;
            import com.pulse.collections.Set;
            import com.pulse.collections.HashSet;
            import com.pulse.collections.HashMap;
            import com.pulse.collections.Queue;
            import com.pulse.collections.Deque;
            import com.pulse.collections.LinkedList;
            import com.pulse.collections.List;
            import com.pulse.rt.Intrinsics;

            class Main {
                public static void main() {
                    Collection col = new ArrayList();
                    List list = new ArrayList();
                    col.clear();
                    list.add(3);
                    System.out.println("sys");
                    IO.println(9);
                    IO.println(Math.abs(-5));
                    IO.println(list.size());
                    IO.println(String.valueOf(true));
                    Random r = new Random(7);
                    IO.println(r.nextInt(10));
                    Set s = new HashSet();
                    s.add("x");
                    HashMap m = new HashMap();
                    m.put("k", "v");
                    Queue q = new LinkedList();
                    q.offer(1);
                    Deque d = new LinkedList();
                    d.addFirst(2);
                    Intrinsics.consoleWriteLine(7);
                }
            }
            "#,
        );

        let result = check_project(
            main.to_str().expect("main utf8"),
            Some(src_root.to_str().expect("src utf8")),
            true,
        );
        assert!(result.is_ok());

        let _ = fs::remove_dir_all(root);
    }

    #[test]
    fn check_project_loads_stdlib_sources_for_pulse_imports() {
        let root = unique_temp_root();
        let src_root = root.join("src");
        let main = src_root.join("app/core/Main.pulse");

        write_file(
            &main,
            r#"
            package app.core;
            import com.pulse.lang.System;

            class Main {
                public static void main() {
                    System.out.println("ok");
                }
            }
            "#,
        );

        let result = check_project(
            main.to_str().expect("main utf8"),
            Some(src_root.to_str().expect("src utf8")),
            true,
        )
        .expect("expected check success");

        assert!(
            result
                .merged
                .classes
                .iter()
                .any(|c| c.name == "ConsoleWriter"),
            "expected stdlib class 'ConsoleWriter' to be loaded into merged program"
        );

        let _ = fs::remove_dir_all(root);
    }

    #[test]
    fn check_project_rejects_unknown_pulse_import() {
        let root = unique_temp_root();
        let src_root = root.join("src");
        let main = src_root.join("app/core/Main.pulse");

        write_file(
            &main,
            r#"
            package app.core;
            import com.pulse.time.Clock;

            class Main {
                public static void main() {
                }
            }
            "#,
        );

        let result = check_project(
            main.to_str().expect("main utf8"),
            Some(src_root.to_str().expect("src utf8")),
            true,
        );
        assert!(result.is_err());
        assert!(result
            .expect_err("expected unknown com.pulse import error")
            .contains("Unknown com.pulse import 'com.pulse.time.Clock'"));

        let _ = fs::remove_dir_all(root);
    }

    #[test]
    fn check_project_rejects_too_broad_or_unknown_pulse_imports() {
        let root = unique_temp_root();
        let src_root = root.join("src");
        let main_broad = src_root.join("app/core/MainBroad.pulse");
        let main_wild = src_root.join("app/core/MainWild.pulse");

        write_file(
            &main_broad,
            r#"
            package app.core;
            import com;

            class MainBroad {
                public static void main() {
                }
            }
            "#,
        );
        write_file(
            &main_wild,
            r#"
            package app.core;
            import com.pulse.ghost.*;

            class MainWild {
                public static void main() {
                }
            }
            "#,
        );

        let broad_result = check_project(
            main_broad.to_str().expect("main broad utf8"),
            Some(src_root.to_str().expect("src utf8")),
            true,
        );
        assert!(broad_result.is_err());
        assert!(broad_result
            .expect_err("expected broad import error")
            .contains("too broad"));

        let wild_result = check_project(
            main_wild.to_str().expect("main wild utf8"),
            Some(src_root.to_str().expect("src utf8")),
            true,
        );
        assert!(wild_result.is_err());
        assert!(wild_result
            .expect_err("expected wildcard import error")
            .contains("Unknown com.pulse wildcard import 'com.pulse.ghost'"));

        let _ = fs::remove_dir_all(root);
    }

    #[test]
    fn check_project_prefers_same_package_class_over_imported_same_name() {
        let root = unique_temp_root();
        let src_root = root.join("src");
        let main = src_root.join("app/core/Main.pulse");
        let local_util = src_root.join("app/core/Util.pulse");
        let shared_util = src_root.join("app/shared/Util.pulse");

        write_file(
            &local_util,
            r#"
            package app.core;
            import com.pulse.lang.IO;

            class Util {
                public static int pick() {
                    return 1;
                }
            }
            "#,
        );
        write_file(
            &shared_util,
            r#"
            package app.shared;
            import com.pulse.lang.IO;

            class Util {
                public static String pick() {
                    return "two";
                }
            }
            "#,
        );
        write_file(
            &main,
            r#"
            package app.core;
            import app.shared.Util;

            class Main {
                public static void main() {
                    int x = Util.pick();
                    IO.println(x);
                }
            }
            "#,
        );

        let result = check_project(
            main.to_str().expect("main utf8"),
            Some(src_root.to_str().expect("src utf8")),
            true,
        );
        assert!(result.is_ok());

        let _ = fs::remove_dir_all(root);
    }

    #[test]
    fn check_project_prefers_explicit_import_over_wildcard_same_name() {
        let root = unique_temp_root();
        let src_root = root.join("src");
        let main = src_root.join("app/core/Main.pulse");
        let tools_util = src_root.join("app/tools/Util.pulse");
        let shared_util = src_root.join("app/shared/Util.pulse");

        write_file(
            &tools_util,
            r#"
            package app.tools;
            import com.pulse.lang.IO;

            class Util {
                public static String two() {
                    return "tools";
                }
            }
            "#,
        );
        write_file(
            &shared_util,
            r#"
            package app.shared;
            import com.pulse.lang.IO;

            class Util {
                public static int two() {
                    return 2;
                }
            }
            "#,
        );
        write_file(
            &main,
            r#"
            package app.core;
            import app.tools.Util;
            import app.shared.*;

            class Main {
                public static void main() {
                    String x = Util.two();
                    IO.println(x);
                }
            }
            "#,
        );

        let result = check_project(
            main.to_str().expect("main utf8"),
            Some(src_root.to_str().expect("src utf8")),
            true,
        );
        assert!(result.is_ok());

        let _ = fs::remove_dir_all(root);
    }
}











