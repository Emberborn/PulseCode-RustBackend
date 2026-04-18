mod build;
mod command_line;
pub(crate) mod config;
mod manifest;
mod output;
mod project;
pub(crate) mod target_model;
mod testing;

use std::{
    collections::{HashMap, HashSet},
    env, fs,
    path::{Path, PathBuf, MAIN_SEPARATOR},
    process,
};

use self::build::*;
use self::command_line::{new_template_name, parse_command, parse_flags, parse_new_flags};
use self::config::*;
use self::manifest::*;
use self::output::{
    emit_error, emit_hint, print_build_usage, print_check_usage, print_help, print_new_usage,
    print_test_usage, print_version,
};
use self::project::*;
use self::testing::*;
use crate::backend::{
    resolve_plan_target_adapter_metadata, BackendAdapter, BackendArtifact, RustHostBootstrapBackend,
};
use pulsec_core::{
    analyze_with_class_contexts, lower_to_ir_with_contexts, ClassContext, ImportDecl, IrProgram,
    Program,
};

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
#[allow(dead_code)]
const DIAG_NOT_IMPLEMENTED: &str = "PULSEC:E_NOT_IMPLEMENTED";

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
enum CliCommand {
    New,
    Check,
    Build,
    Test,
    ProviderCheck,
    ProviderTestFile,
    ProviderBuildCore,
    PrewarmAuthorBuildBridge,
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
        CliCommand::PrewarmAuthorBuildBridge => match prewarm_author_build_bridge_runner() {
            Ok(path) => {
                println!("Author build bridge ready: {}", path.display());
                process::exit(EXIT_OK);
            }
            Err(err) => {
                emit_error(
                    DIAG_COMMAND,
                    &format!("Author build bridge prewarm failed: {err}"),
                );
                process::exit(EXIT_COMMAND_FAILURE);
            }
        },
        CliCommand::ProviderCheck => {
            let entry_path = command_args.first().map(|value| value.as_str()).unwrap_or("");
            let source_root = command_args
                .get(1)
                .map(|value| value.as_str())
                .filter(|value| !value.is_empty());
            let strict = matches!(command_args.get(2).map(|value| value.as_str()), Some("true"));
            let authorlib_enabled =
                matches!(command_args.get(3).map(|value| value.as_str()), Some("true"));
            match check_project_with_authorlib(entry_path, source_root, strict, authorlib_enabled) {
                Ok(result) => {
                    print!(
                        "{}",
                        emit_provider_check_result_bridge_text(
                            true,
                            Some(&result.root.package.name),
                            Some(result.root.imports.len()),
                            Some(result.merged.classes.len()),
                            Some(result.files_loaded),
                            None,
                        )
                    );
                    process::exit(EXIT_OK);
                }
                Err(err) => {
                    print!(
                        "{}",
                        emit_provider_check_result_bridge_text(
                            false,
                            None,
                            None,
                            None,
                            None,
                            Some(&err),
                        )
                    );
                    process::exit(EXIT_COMMAND_FAILURE);
                }
            }
        }
        CliCommand::ProviderTestFile => {
            let entry_path = command_args.first().map(|value| value.as_str()).unwrap_or("");
            let source_root = command_args
                .get(1)
                .map(|value| value.as_str())
                .filter(|value| !value.is_empty());
            let strict = matches!(command_args.get(2).map(|value| value.as_str()), Some("true"));
            let authorlib_enabled =
                matches!(command_args.get(3).map(|value| value.as_str()), Some("true"));
            match check_project_with_authorlib(entry_path, source_root, strict, authorlib_enabled) {
                Ok(result) => {
                    print!(
                        "{}",
                        emit_provider_test_file_result_bridge_text(
                            true,
                            Some(result.files_loaded),
                            None,
                        )
                    );
                    process::exit(EXIT_OK);
                }
                Err(err) => {
                    print!(
                        "{}",
                        emit_provider_test_file_result_bridge_text(false, None, Some(&err))
                    );
                    process::exit(EXIT_COMMAND_FAILURE);
                }
            }
        }
        CliCommand::ProviderBuildCore => {
            let entry_path = command_args.first().map(|value| value.as_str()).unwrap_or("");
            let source_root = command_args
                .get(1)
                .map(|value| value.as_str())
                .filter(|value| !value.is_empty());
            let authorlib_enabled =
                matches!(command_args.get(2).map(|value| value.as_str()), Some("true"));
            let target_id = command_args.get(3).map(|value| value.as_str()).unwrap_or("");
            let output_mode = command_args.get(4).map(|value| value.as_str()).unwrap_or("");
            let output_entry = command_args.get(5).map(|value| value.as_str()).unwrap_or("");
            let linker_path = command_args
                .get(6)
                .map(|value| value.as_str())
                .filter(|value| !value.is_empty());
            let emit_statement_trace_metadata =
                matches!(command_args.get(7).map(|value| value.as_str()), Some("true"));
            let backend_out_dir = command_args.get(8).map(|value| value.as_str()).unwrap_or("");
            match execute_build_compiler_core_inline(
                entry_path,
                source_root,
                authorlib_enabled,
                target_id,
                output_mode,
                output_entry,
                linker_path,
                emit_statement_trace_metadata,
                backend_out_dir,
            ) {
                Ok(result) => {
                    print!(
                        "{}",
                        emit_provider_build_core_result_bridge_text(
                            true,
                            Some(result.files_loaded),
                            Some(result.artifact.classes),
                            Some(result.artifact.methods),
                            Some(result.artifact.fields),
                            result.artifact.ir_artifact_path.to_str(),
                            result.artifact.native_plan_path.to_str(),
                            result.artifact.object_path.to_str(),
                            result.artifact.exe_path.as_deref().and_then(Path::to_str),
                            result.artifact.runtime_library_path.as_deref().and_then(Path::to_str),
                            result
                                .artifact
                                .runtime_import_library_path
                                .as_deref()
                                .and_then(Path::to_str),
                            result.artifact.link_report_path.to_str(),
                            Some(&result.artifact.entry_codegen),
                            None,
                        )
                    );
                    process::exit(EXIT_OK);
                }
                Err(err) => {
                    print!(
                        "{}",
                        emit_provider_build_core_result_bridge_text(
                            false,
                            None,
                            None,
                            None,
                            None,
                            None,
                            None,
                            None,
                            None,
                            None,
                            None,
                            None,
                            None,
                            Some(&err),
                        )
                    );
                    process::exit(EXIT_COMMAND_FAILURE);
                }
            }
        }
        CliCommand::New => {
            if command_args
                .iter()
                .any(|arg| arg == "--help" || arg == "-h")
            {
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
            if command_args
                .iter()
                .any(|arg| arg == "--help" || arg == "-h")
            {
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
                    "{}",
                    render_workspace_check_start(
                        &workspace.root,
                        workspace.member_roots.len(),
                        mode_label
                    )
                );
                for member_root in &workspace.member_roots {
                    let mut member_flags = cli_flags.clone();
                    member_flags.project_root = Some(member_root.display().to_string());
                    member_flags.source_root = None;
                    let resolved = match resolve_check_invocation(None, &member_flags) {
                        Ok(config) => config,
                        Err(err) => {
                            failed += 1;
                            eprintln!(
                                "{}",
                                render_workspace_check_member_result(
                                    member_root,
                                    None,
                                    0,
                                    Some(&err),
                                )
                            );
                            continue;
                        }
                    };
                    match check_project_with_authorlib(
                        &resolved.entry_path,
                        resolved.source_root.as_deref(),
                        strict,
                        resolved.authorlib_enabled,
                    ) {
                        Ok(result) => {
                            passed += 1;
                            println!(
                                "{}",
                                render_workspace_check_pass(
                                    member_root,
                                    &result.root.package.name,
                                    result.files_loaded
                                )
                            );
                        }
                        Err(err) => {
                            failed += 1;
                            eprintln!(
                                "{}",
                                render_workspace_check_member_result(
                                    member_root,
                                    None,
                                    0,
                                    Some(&err),
                                )
                            );
                        }
                    }
                }
                println!(
                    "{}",
                    render_workspace_check_summary(passed, failed, workspace.member_roots.len())
                );
                if failed > 0 {
                    emit_error(
                        DIAG_CHECK,
                        &render_workspace_check_failed(
                            &workspace.root,
                            workspace.member_roots.len(),
                            mode_label,
                            passed,
                            failed,
                        ),
                    );
                    emit_hint(
                        "inspect [FAIL] lines and re-run on the failing member with --project-root",
                    );
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
            match execute_compiler_check(
                &resolved.entry_path,
                resolved.source_root.as_deref(),
                strict,
                resolved.authorlib_enabled,
            ) {
                Ok(result) if result.success => {
                    println!(
                        "{}",
                        render_check_success(
                            result.package_name.as_deref().unwrap_or("<unknown>"),
                            result.import_count,
                            result.class_count,
                            result.files_loaded,
                            mode_label,
                            if resolved.used_manifest {
                                "manifest"
                            } else {
                                "direct"
                            },
                            &resolved.entry_path,
                            resolved.source_root.as_deref().unwrap_or("<none>")
                        )
                    );
                }
                Ok(result) => {
                    eprintln!(
                        "{}",
                        render_check_failure(
                            mode_label,
                            &resolved.entry_path,
                            resolved.source_root.as_deref().unwrap_or("<none>")
                        )
                    );
                    emit_error(
                        DIAG_CHECK,
                        &format!(
                            "Compile error: {}",
                            result.detail.as_deref().unwrap_or("unknown compiler provider failure")
                        ),
                    );
                    emit_hint(
                        "re-run with '--friendly' for layout warnings or inspect imports/packages",
                    );
                    process::exit(EXIT_COMMAND_FAILURE);
                }
                Err(err) => {
                    eprintln!(
                        "{}",
                        render_check_failure(
                            mode_label,
                            &resolved.entry_path,
                            resolved.source_root.as_deref().unwrap_or("<none>")
                        )
                    );
                    emit_error(DIAG_CHECK, &format!("Compile error: {err}"));
                    emit_hint(
                        "re-run with '--friendly' for layout warnings or inspect imports/packages",
                    );
                    process::exit(EXIT_COMMAND_FAILURE);
                }
            }
        }
        CliCommand::Build => {
            if command_args
                .iter()
                .any(|arg| arg == "--help" || arg == "-h")
            {
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
                    "{}",
                    render_workspace_build_start(&workspace.root, workspace.member_roots.len())
                );
                for member_root in &workspace.member_roots {
                    let mut member_flags = cli_flags.clone();
                    member_flags.project_root = Some(member_root.display().to_string());
                    member_flags.source_root = None;
                    let resolved = match resolve_build_invocation(None, &member_flags) {
                        Ok(config) => config,
                        Err(err) => {
                            failed += 1;
                            eprintln!(
                                "{}",
                                render_workspace_build_member_result(member_root, Some(&err))
                            );
                            continue;
                        }
                    };
                    let build = match execute_build_pipeline(&resolved, &member_flags) {
                        Ok(build) => build,
                        Err(err) => {
                            failed += 1;
                            eprintln!(
                                "{}",
                                render_workspace_build_member_result(member_root, Some(&err))
                            );
                            continue;
                        }
                    };
                    println!(
                        "{}",
                        render_workspace_build_member_result(member_root, None)
                    );
                    print_build_summary(&build);
                }
                println!(
                    "{}",
                    render_workspace_build_summary(failed, workspace.member_roots.len())
                );
                if failed > 0 {
                    emit_error(
                        DIAG_BUILD,
                        &render_workspace_build_failed(
                            &workspace.root,
                            workspace.member_roots.len(),
                            failed,
                        ),
                    );
                    emit_hint(
                        "inspect [FAIL] lines and re-run on the failing member with --project-root",
                    );
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
        }
        CliCommand::Test => {
            if command_args
                .iter()
                .any(|arg| arg == "--help" || arg == "-h")
            {
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
                    "{}",
                    render_workspace_test_start(
                        &workspace.root,
                        workspace.member_roots.len(),
                        mode_label
                    )
                );
                for member_root in &workspace.member_roots {
                    let mut member_flags = cli_flags.clone();
                    member_flags.project_root = Some(member_root.display().to_string());
                    member_flags.source_root = None;
                    let invocation = match resolve_test_invocation(&member_flags) {
                        Ok(invocation) => invocation,
                        Err(err) => {
                            failed += 1;
                            eprintln!(
                                "{}",
                                render_test_execution_result(
                                    Some(member_root),
                                    "<discovery>",
                                    Some(&err),
                                )
                            );
                            continue;
                        }
                    };
                    let tests = match discover_test_files(&invocation.tests_root) {
                        Ok(tests) => tests,
                        Err(err) => {
                            failed += 1;
                            eprintln!(
                                "{}",
                                render_test_execution_result(
                                    Some(member_root),
                                    "<discovery>",
                                    Some(&err),
                                )
                            );
                            continue;
                        }
                    };
                    if tests.is_empty() {
                        failed += 1;
                        eprintln!(
                            "{}",
                            render_workspace_member_no_tests(member_root, &invocation.tests_root)
                        );
                        continue;
                    }
                    println!(
                        "{}",
                        render_workspace_member_test_discovery(
                            member_root,
                            &invocation.tests_root,
                            &invocation.source_root,
                            tests.len()
                        )
                    );
                    for test_file in &tests {
                        total += 1;
                        let display_name = display_test_name(&invocation.tests_root, test_file);
                        match check_project_with_authorlib(
                            &test_file.display().to_string(),
                            Some(&invocation.source_root.display().to_string()),
                            strict,
                            invocation.authorlib_enabled,
                        ) {
                            Ok(_) => {
                                passed += 1;
                                println!(
                                    "{}",
                                    render_test_execution_result(
                                        Some(member_root),
                                        &display_name,
                                        None
                                    )
                                );
                            }
                            Err(err) => {
                                failed += 1;
                                eprintln!(
                                    "{}",
                                    render_test_execution_result(
                                        Some(member_root),
                                        &display_name,
                                        Some(&err)
                                    )
                                );
                            }
                        }
                    }
                }
                println!(
                    "{}",
                    render_workspace_test_summary(mode_label, passed, failed, total)
                );
                if failed > 0 {
                    emit_error(
                        DIAG_TEST,
                        &render_workspace_tests_failed(
                            &workspace.root,
                            workspace.member_roots.len(),
                            mode_label,
                            passed,
                            failed,
                            total,
                        ),
                    );
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
                    emit_error(DIAG_TEST, &render_test_discovery_failure(&err));
                    emit_hint("ensure the tests directory exists and is readable");
                    process::exit(EXIT_COMMAND_FAILURE);
                }
            };
            if tests.is_empty() {
                emit_error(DIAG_TEST, &render_test_no_files(&invocation.tests_root));
                emit_hint("add .pulse files under tests/ with a main entrypoint");
                process::exit(EXIT_COMMAND_FAILURE);
            }
            println!(
                "{}",
                render_test_discovery(
                    if invocation.used_manifest {
                        "manifest"
                    } else {
                        "direct"
                    },
                    &invocation.project_root,
                    &invocation.tests_root,
                    &invocation.source_root,
                    tests.len()
                )
            );
            let mut passed = 0usize;
            let mut failed = 0usize;
            for test_file in &tests {
                let display_name = display_test_name(&invocation.tests_root, test_file);
                match execute_test_file(
                    &test_file.display().to_string(),
                    Some(&invocation.source_root.display().to_string()),
                    strict,
                    invocation.authorlib_enabled,
                ) {
                    Ok(execution) => {
                        let _ = execution.files_loaded;
                        passed += 1;
                        println!(
                            "{}",
                            render_test_execution_result(None, &display_name, None)
                        );
                    }
                    Err(err) => {
                        failed += 1;
                        eprintln!(
                            "{}",
                            render_test_execution_result(None, &display_name, Some(&err))
                        );
                    }
                }
            }
            println!(
                "{}",
                render_test_summary(mode_label, passed, failed, tests.len())
            );
            if failed > 0 {
                emit_error(DIAG_TEST, &render_tests_failed());
                emit_hint("review [FAIL] diagnostics above and re-run the test command");
                process::exit(EXIT_COMMAND_FAILURE);
            }
        }
        CliCommand::Help | CliCommand::Version => unreachable!("handled before dispatch"),
    }
}

fn emit_compiler_bridge_summary_request(mode: &str, values: &[Option<&str>]) -> String {
    let mut out = String::new();
    out.push_str(mode);
    out.push('\n');
    for value in values {
        append_bridge_request_raw_value(&mut out, *value);
    }
    out
}

fn render_workspace_check_start(root: &Path, member_count: usize, mode: &str) -> String {
    let count = member_count.to_string();
    let request = emit_compiler_bridge_summary_request(
        "compiler-render-workspace-check-start",
        &[root.to_str(), Some(count.as_str()), Some(mode)],
    );
    run_author_build_bridge_request(&request).unwrap_or_else(|_| {
        format!(
            "Workspace check: root={} members={} mode={}",
            root.display(),
            member_count,
            mode
        )
    })
}

fn render_workspace_build_start(root: &Path, member_count: usize) -> String {
    let count = member_count.to_string();
    let request = emit_compiler_bridge_summary_request(
        "build-render-workspace-start",
        &[root.to_str(), Some(count.as_str())],
    );
    run_author_build_bridge_request(&request).unwrap_or_else(|_| {
        format!(
            "Workspace build: root={} members={}",
            root.display(),
            member_count
        )
    })
}

fn render_workspace_build_member_result(member_root: &Path, detail: Option<&str>) -> String {
    let request = emit_compiler_bridge_summary_request(
        "build-render-workspace-member",
        &[
            Some(if detail.is_none() { "true" } else { "false" }),
            member_root.to_str(),
            detail,
        ],
    );
    run_author_build_bridge_request(&request).unwrap_or_else(|_| {
        if let Some(detail) = detail {
            format!("[FAIL] {} :: {}", member_root.display(), detail)
        } else {
            format!("[PASS] {}", member_root.display())
        }
    })
}

fn render_workspace_build_summary(failed: usize, total: usize) -> String {
    let failed_value = failed.to_string();
    let total_value = total.to_string();
    let request = emit_compiler_bridge_summary_request(
        "build-render-workspace-summary",
        &[Some(failed_value.as_str()), Some(total_value.as_str())],
    );
    run_author_build_bridge_request(&request)
        .unwrap_or_else(|_| format!("Workspace build summary: failed={} total={}", failed, total))
}

fn render_workspace_build_failed(root: &Path, member_count: usize, failed: usize) -> String {
    let member_value = member_count.to_string();
    let failed_value = failed.to_string();
    let request = emit_compiler_bridge_summary_request(
        "build-render-workspace-failed",
        &[
            root.to_str(),
            Some(member_value.as_str()),
            Some(failed_value.as_str()),
        ],
    );
    run_author_build_bridge_request(&request)
        .unwrap_or_else(|_| "one or more workspace members failed build".to_string())
}

fn render_workspace_check_pass(
    member_root: &Path,
    package_name: &str,
    files_loaded: usize,
) -> String {
    render_workspace_check_member_result(member_root, Some(package_name), files_loaded, None)
}

fn render_workspace_check_member_result(
    member_root: &Path,
    package_name: Option<&str>,
    files_loaded: usize,
    detail: Option<&str>,
) -> String {
    let files = files_loaded.to_string();
    let request = emit_compiler_bridge_summary_request(
        "compiler-render-workspace-check-member",
        &[
            Some(if detail.is_none() { "true" } else { "false" }),
            member_root.to_str(),
            package_name,
            Some(if detail.is_none() {
                files.as_str()
            } else {
                detail.unwrap_or("")
            }),
        ],
    );
    run_author_build_bridge_request(&request).unwrap_or_else(|_| {
        if let Some(detail) = detail {
            format!("[FAIL] {} :: {}", member_root.display(), detail)
        } else {
            format!(
                "[PASS] {} package={} files={}",
                member_root.display(),
                package_name.unwrap_or("<unknown>"),
                files_loaded
            )
        }
    })
}

fn render_workspace_check_summary(passed: usize, failed: usize, total: usize) -> String {
    let passed_value = passed.to_string();
    let failed_value = failed.to_string();
    let total_value = total.to_string();
    let request = emit_compiler_bridge_summary_request(
        "compiler-render-workspace-check-summary",
        &[
            Some(passed_value.as_str()),
            Some(failed_value.as_str()),
            Some(total_value.as_str()),
        ],
    );
    run_author_build_bridge_request(&request).unwrap_or_else(|_| {
        format!(
            "Workspace check summary: passed={} failed={} total={}",
            passed, failed, total
        )
    })
}

fn render_workspace_check_failed(
    root: &Path,
    member_count: usize,
    mode: &str,
    passed: usize,
    failed: usize,
) -> String {
    let member_value = member_count.to_string();
    let passed_value = passed.to_string();
    let failed_value = failed.to_string();
    let request = emit_compiler_bridge_summary_request(
        "compiler-render-workspace-check-failed",
        &[
            root.to_str(),
            Some(member_value.as_str()),
            Some(mode),
            Some(passed_value.as_str()),
            Some(failed_value.as_str()),
        ],
    );
    run_author_build_bridge_request(&request)
        .unwrap_or_else(|_| "one or more workspace members failed check".to_string())
}

fn render_check_success(
    package_name: &str,
    import_count: usize,
    class_count: usize,
    files_loaded: usize,
    mode: &str,
    project_mode: &str,
    entry_path: &str,
    source_root: &str,
) -> String {
    let import_value = import_count.to_string();
    let class_value = class_count.to_string();
    let files_value = files_loaded.to_string();
    let request = emit_compiler_bridge_summary_request(
        "compiler-render-check-result",
        &[
            Some("true"),
            Some(package_name),
            Some(import_value.as_str()),
            Some(class_value.as_str()),
            Some(files_value.as_str()),
            Some(mode),
            Some(project_mode),
            Some(entry_path),
            Some(source_root),
        ],
    );
    run_author_build_bridge_request(&request).unwrap_or_else(|_| {
        format!(
            "OK: package={} imports={} classes={} files={}\nCheck summary: mode={} project_mode={} entry={} source_root={}",
            package_name,
            import_count,
            class_count,
            files_loaded,
            mode,
            project_mode,
            entry_path,
            source_root
        )
    })
}

fn render_check_failure(mode: &str, entry_path: &str, source_root: &str) -> String {
    let request = emit_compiler_bridge_summary_request(
        "compiler-render-check-result",
        &[
            Some("false"),
            None,
            None,
            None,
            None,
            Some(mode),
            None,
            Some(entry_path),
            Some(source_root),
        ],
    );
    run_author_build_bridge_request(&request).unwrap_or_else(|_| {
        format!(
            "Check FAILED: mode={} entry={} source_root={}",
            mode, entry_path, source_root
        )
    })
}

#[derive(Debug, Clone)]
struct CompilerCheckExecution {
    success: bool,
    package_name: Option<String>,
    import_count: usize,
    class_count: usize,
    files_loaded: usize,
    detail: Option<String>,
}

#[derive(Debug, Clone)]
struct CompilerBuildCoreExecution {
    files_loaded: usize,
    artifact: BackendArtifact,
}

fn execute_compiler_check(
    entry_path: &str,
    source_root: Option<&str>,
    strict_package: bool,
    authorlib_enabled: bool,
) -> Result<CompilerCheckExecution, String> {
    if let Ok(result) = execute_compiler_check_via_authorlib_bridge(
        entry_path,
        source_root,
        strict_package,
        authorlib_enabled,
    ) {
        return Ok(result);
    }
    match check_project_with_authorlib(entry_path, source_root, strict_package, authorlib_enabled) {
        Ok(result) => Ok(CompilerCheckExecution {
            success: true,
            package_name: Some(result.root.package.name),
            import_count: result.root.imports.len(),
            class_count: result.merged.classes.len(),
            files_loaded: result.files_loaded,
            detail: None,
        }),
        Err(err) => Ok(CompilerCheckExecution {
            success: false,
            package_name: None,
            import_count: 0,
            class_count: 0,
            files_loaded: 0,
            detail: Some(err),
        }),
    }
}

fn execute_compiler_check_via_authorlib_bridge(
    entry_path: &str,
    source_root: Option<&str>,
    strict_package: bool,
    authorlib_enabled: bool,
) -> Result<CompilerCheckExecution, String> {
    let current_exe = env::current_exe()
        .map_err(|e| format!("Failed to resolve pulsec provider path: {e}"))?;
    let strict_value = if strict_package { "true" } else { "false" };
    let authorlib_value = if authorlib_enabled { "true" } else { "false" };
    let request = emit_compiler_bridge_summary_request(
        "compiler-execute-check",
        &[
            current_exe.to_str(),
            Some(entry_path),
            source_root,
            Some(strict_value),
            Some(authorlib_value),
        ],
    );
    let stdout = run_author_build_bridge_request(&request)?;
    parse_compiler_check_execution_output(&stdout)
}

fn parse_compiler_check_execution_output(text: &str) -> Result<CompilerCheckExecution, String> {
    let values = parse_bridge_raw_values(text)?;
    if values.len() < 6 {
        return Err(format!(
            "author compiler bridge returned {} values, expected at least 6",
            values.len()
        ));
    }
    let success = match values[0].as_deref() {
        Some("true") => true,
        Some("false") => false,
        other => {
            return Err(format!(
                "author compiler bridge returned invalid success flag {:?}",
                other
            ));
        }
    };
    Ok(CompilerCheckExecution {
        success,
        package_name: values[1].clone(),
        import_count: parse_bridge_usize(values[2].as_deref(), "importCount")?,
        class_count: parse_bridge_usize(values[3].as_deref(), "classCount")?,
        files_loaded: parse_bridge_usize(values[4].as_deref(), "filesLoaded")?,
        detail: values[5].clone(),
    })
}

fn parse_bridge_raw_values(text: &str) -> Result<Vec<Option<String>>, String> {
    let mut out = Vec::new();
    for line in text.lines() {
        let separator = line
            .find(':')
            .ok_or_else(|| format!("author compiler bridge line missing ':' separator: {line}"))?;
        let present = &line[..separator];
        let encoded = &line[(separator + 1)..];
        let value = match present {
            "0" => None,
            "1" => Some(unescape_bridge_raw_value(encoded)?),
            other => {
                return Err(format!(
                    "author compiler bridge line has invalid presence flag '{other}'"
                ));
            }
        };
        out.push(value);
    }
    Ok(out)
}

fn parse_bridge_usize(value: Option<&str>, key: &str) -> Result<usize, String> {
    match value {
        Some(raw) if !raw.is_empty() => raw
            .parse::<usize>()
            .map_err(|e| format!("author compiler bridge key '{key}' parse failed: {e}")),
        _ => Ok(0),
    }
}

fn unescape_bridge_raw_value(value: &str) -> Result<String, String> {
    let mut out = String::new();
    let mut chars = value.chars();
    while let Some(ch) = chars.next() {
        if ch != '\\' {
            out.push(ch);
            continue;
        }
        let escaped = chars
            .next()
            .ok_or_else(|| "author compiler bridge value ended in dangling escape".to_string())?;
        match escaped {
            'n' => out.push('\n'),
            'r' => out.push('\r'),
            '\\' => out.push('\\'),
            other => {
                out.push('\\');
                out.push(other);
            }
        }
    }
    Ok(out)
}

fn emit_provider_check_result_bridge_text(
    success: bool,
    package_name: Option<&str>,
    import_count: Option<usize>,
    class_count: Option<usize>,
    files_loaded: Option<usize>,
    detail: Option<&str>,
) -> String {
    let import_count_owned = import_count.map(|value| value.to_string());
    let class_count_owned = class_count.map(|value| value.to_string());
    let files_loaded_owned = files_loaded.map(|value| value.to_string());
    let mut out = String::new();
    append_bridge_request_raw_value(&mut out, Some(if success { "true" } else { "false" }));
    append_bridge_request_raw_value(&mut out, package_name);
    append_bridge_request_raw_value(&mut out, import_count_owned.as_deref());
    append_bridge_request_raw_value(&mut out, class_count_owned.as_deref());
    append_bridge_request_raw_value(&mut out, files_loaded_owned.as_deref());
    append_bridge_request_raw_value(&mut out, detail);
    out
}

fn emit_provider_test_file_result_bridge_text(
    success: bool,
    files_loaded: Option<usize>,
    detail: Option<&str>,
) -> String {
    let files_loaded_owned = files_loaded.map(|value| value.to_string());
    let mut out = String::new();
    append_bridge_request_raw_value(&mut out, Some(if success { "true" } else { "false" }));
    append_bridge_request_raw_value(&mut out, files_loaded_owned.as_deref());
    append_bridge_request_raw_value(&mut out, detail);
    out
}

fn execute_build_compiler_core_inline(
    entry_path: &str,
    source_root: Option<&str>,
    authorlib_enabled: bool,
    target_id: &str,
    output_mode: &str,
    output_entry: &str,
    linker_path: Option<&str>,
    emit_statement_trace_metadata: bool,
    backend_out_dir: &str,
) -> Result<CompilerBuildCoreExecution, String> {
    let result = check_project_with_authorlib(entry_path, source_root, true, authorlib_enabled)?;
    let ir =
        lower_checked_project_to_ir(&result).map_err(|e| format!("IR lowering failed: {e}"))?;
    let backend = RustHostBootstrapBackend {
        linker_override: linker_path.map(PathBuf::from),
        target_id: target_id.to_string(),
        output_mode: output_mode.to_string(),
        output_entry: output_entry.to_string(),
        emit_statement_trace_metadata,
    };
    let artifact = backend
        .emit(&ir, Path::new(backend_out_dir))
        .map_err(|e| format!("backend emit failed: {e}"))?;
    Ok(CompilerBuildCoreExecution {
        files_loaded: result.files_loaded,
        artifact,
    })
}

fn emit_provider_build_core_result_bridge_text(
    success: bool,
    files_loaded: Option<usize>,
    classes: Option<usize>,
    methods: Option<usize>,
    fields: Option<usize>,
    ir_artifact_path: Option<&str>,
    native_plan_path: Option<&str>,
    object_path: Option<&str>,
    executable_path: Option<&str>,
    runtime_library_path: Option<&str>,
    runtime_import_library_path: Option<&str>,
    link_report_path: Option<&str>,
    entry_codegen: Option<&str>,
    detail: Option<&str>,
) -> String {
    let files_loaded_owned = files_loaded.map(|value| value.to_string());
    let classes_owned = classes.map(|value| value.to_string());
    let methods_owned = methods.map(|value| value.to_string());
    let fields_owned = fields.map(|value| value.to_string());
    let mut out = String::new();
    append_bridge_request_raw_value(&mut out, Some(if success { "true" } else { "false" }));
    append_bridge_request_raw_value(&mut out, files_loaded_owned.as_deref());
    append_bridge_request_raw_value(&mut out, classes_owned.as_deref());
    append_bridge_request_raw_value(&mut out, methods_owned.as_deref());
    append_bridge_request_raw_value(&mut out, fields_owned.as_deref());
    append_bridge_request_raw_value(&mut out, ir_artifact_path);
    append_bridge_request_raw_value(&mut out, native_plan_path);
    append_bridge_request_raw_value(&mut out, object_path);
    append_bridge_request_raw_value(&mut out, executable_path);
    append_bridge_request_raw_value(&mut out, runtime_library_path);
    append_bridge_request_raw_value(&mut out, runtime_import_library_path);
    append_bridge_request_raw_value(&mut out, link_report_path);
    append_bridge_request_raw_value(&mut out, entry_codegen);
    append_bridge_request_raw_value(&mut out, detail);
    out
}

fn render_test_discovery(
    project_mode: &str,
    project_root: &Path,
    tests_root: &Path,
    source_root: &Path,
    count: usize,
) -> String {
    let count_value = count.to_string();
    let request = emit_compiler_bridge_summary_request(
        "compiler-render-test-discovery",
        &[
            Some("true"),
            Some("false"),
            Some(project_mode),
            project_root.to_str(),
            None,
            tests_root.to_str(),
            source_root.to_str(),
            Some(count_value.as_str()),
            Some("false"),
            None,
        ],
    );
    run_author_build_bridge_request(&request).unwrap_or_else(|_| {
        format!(
            "Test discovery: project_mode={} project_root={} tests_root={} source_root={} count={}",
            project_mode,
            project_root.display(),
            tests_root.display(),
            source_root.display(),
            count
        )
    })
}

fn render_test_summary(mode: &str, passed: usize, failed: usize, total: usize) -> String {
    let passed_value = passed.to_string();
    let failed_value = failed.to_string();
    let total_value = total.to_string();
    let request = emit_compiler_bridge_summary_request(
        "compiler-render-test-summary",
        &[
            Some("false"),
            Some(mode),
            Some(passed_value.as_str()),
            Some(failed_value.as_str()),
            Some(total_value.as_str()),
        ],
    );
    run_author_build_bridge_request(&request).unwrap_or_else(|_| {
        format!(
            "Test summary: mode={} passed={} failed={} total={}",
            mode, passed, failed, total
        )
    })
}

fn render_test_execution_result(
    member_root: Option<&Path>,
    test_name: &str,
    detail: Option<&str>,
) -> String {
    let workspace = if member_root.is_some() {
        "true"
    } else {
        "false"
    };
    let success = if detail.is_none() { "true" } else { "false" };
    let request = emit_compiler_bridge_summary_request(
        "compiler-render-test-execution",
        &[
            Some(workspace),
            Some(success),
            member_root.and_then(|path| path.to_str()),
            Some(test_name),
            detail,
        ],
    );
    run_author_build_bridge_request(&request).unwrap_or_else(|_| {
        if let Some(member_root) = member_root {
            if let Some(detail) = detail {
                format!(
                    "[FAIL] {}::{} :: {}",
                    member_root.display(),
                    test_name,
                    detail
                )
            } else {
                format!("[PASS] {}::{}", member_root.display(), test_name)
            }
        } else if let Some(detail) = detail {
            format!("[FAIL] {} :: {}", test_name, detail)
        } else {
            format!("[PASS] {}", test_name)
        }
    })
}

fn render_workspace_test_start(root: &Path, member_count: usize, mode: &str) -> String {
    let count = member_count.to_string();
    let request = emit_compiler_bridge_summary_request(
        "compiler-render-workspace-test-start",
        &[root.to_str(), Some(count.as_str()), Some(mode)],
    );
    run_author_build_bridge_request(&request).unwrap_or_else(|_| {
        format!(
            "Workspace test: root={} members={} mode={}",
            root.display(),
            member_count,
            mode
        )
    })
}

fn render_workspace_member_test_discovery(
    member_root: &Path,
    tests_root: &Path,
    source_root: &Path,
    count: usize,
) -> String {
    let count_value = count.to_string();
    let request = emit_compiler_bridge_summary_request(
        "compiler-render-workspace-member-discovery",
        &[
            Some("true"),
            Some("true"),
            None,
            None,
            member_root.to_str(),
            tests_root.to_str(),
            source_root.to_str(),
            Some(count_value.as_str()),
            Some("false"),
            None,
        ],
    );
    run_author_build_bridge_request(&request).unwrap_or_else(|_| {
        format!(
            "Member test discovery: member={} tests_root={} source_root={} count={}",
            member_root.display(),
            tests_root.display(),
            source_root.display(),
            count
        )
    })
}

fn render_workspace_test_summary(mode: &str, passed: usize, failed: usize, total: usize) -> String {
    let passed_value = passed.to_string();
    let failed_value = failed.to_string();
    let total_value = total.to_string();
    let request = emit_compiler_bridge_summary_request(
        "compiler-render-workspace-test-summary",
        &[
            Some(mode),
            Some(passed_value.as_str()),
            Some(failed_value.as_str()),
            Some(total_value.as_str()),
        ],
    );
    run_author_build_bridge_request(&request).unwrap_or_else(|_| {
        format!(
            "Workspace test summary: mode={} passed={} failed={} total={}",
            mode, passed, failed, total
        )
    })
}

fn render_test_discovery_failure(detail: &str) -> String {
    let request = emit_compiler_bridge_summary_request(
        "compiler-render-test-discovery",
        &[
            Some("false"),
            Some("false"),
            None,
            None,
            None,
            None,
            None,
            None,
            Some("false"),
            Some(detail),
        ],
    );
    run_author_build_bridge_request(&request)
        .unwrap_or_else(|_| format!("Test discovery failed: {detail}"))
}

fn render_test_no_files(tests_root: &Path) -> String {
    let request = emit_compiler_bridge_summary_request(
        "compiler-render-test-discovery",
        &[
            Some("false"),
            Some("false"),
            None,
            None,
            None,
            tests_root.to_str(),
            None,
            None,
            Some("true"),
            None,
        ],
    );
    run_author_build_bridge_request(&request).unwrap_or_else(|_| {
        format!(
            "Test discovery failed: no .pulse tests found under '{}'",
            tests_root.display()
        )
    })
}

fn render_workspace_member_no_tests(member_root: &Path, tests_root: &Path) -> String {
    let request = emit_compiler_bridge_summary_request(
        "compiler-render-test-discovery",
        &[
            Some("false"),
            Some("true"),
            None,
            None,
            member_root.to_str(),
            tests_root.to_str(),
            None,
            None,
            Some("true"),
            None,
        ],
    );
    run_author_build_bridge_request(&request).unwrap_or_else(|_| {
        format!(
            "[FAIL] {} :: no .pulse tests found under '{}'",
            member_root.display(),
            tests_root.display()
        )
    })
}

fn render_workspace_tests_failed(
    root: &Path,
    member_count: usize,
    mode: &str,
    passed: usize,
    failed: usize,
    total: usize,
) -> String {
    let member_value = member_count.to_string();
    let passed_value = passed.to_string();
    let failed_value = failed.to_string();
    let total_value = total.to_string();
    let request = emit_compiler_bridge_summary_request(
        "compiler-render-workspace-tests-failed",
        &[
            root.to_str(),
            Some(member_value.as_str()),
            Some(mode),
            Some(passed_value.as_str()),
            Some(failed_value.as_str()),
            Some(total_value.as_str()),
        ],
    );
    run_author_build_bridge_request(&request)
        .unwrap_or_else(|_| "one or more workspace tests failed".to_string())
}

fn render_tests_failed() -> String {
    let request = emit_compiler_bridge_summary_request(
        "compiler-render-tests-failed",
        &[
            Some("false"),
            Some("friendly"),
            Some("0"),
            Some("1"),
            Some("1"),
        ],
    );
    run_author_build_bridge_request(&request)
        .unwrap_or_else(|_| "one or more tests failed".to_string())
}

#[cfg(test)]
mod tests {
    use super::target_model::{
        canonical_target_ids, cli_target_error_text, resolve_target_descriptor, TargetLaneKind,
        TargetSupportLevel, LINUX_X64_TARGET_ID, MACOS_ARM64_TARGET_ID, PULSEOS_X64_TARGET_ID,
        WINDOWS_X64_TARGET_ID,
    };
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
        assert!(parsed.runtime_debug_allocator.is_none());
        assert!(parsed.runtime_cycle_collector.is_none());
        assert!(parsed.out_dir.is_none());
        assert!(parsed.assembler.is_none());
        assert_eq!(parsed.linker.as_deref(), Some(r"C:\tools\link.exe"));
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
        assert!(err.contains("--linker is only valid for 'build'"));
    }

    #[test]
    fn parse_flags_build_rejects_removed_packaging_flags() {
        for flag in [
            "--packaging-mode",
            "--msi",
            "--staging-dir",
            "--wix",
            "--signtool",
        ] {
            let flags = if flag == "--msi" {
                vec![flag.to_string()]
            } else {
                vec![flag.to_string(), "value".to_string()]
            };
            let err = parse_flags(CliCommand::Build, &flags)
                .expect_err("removed packaging flag should fail");
            assert!(err.contains(&format!("Unknown flag '{}'", flag)));
        }
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
            "windows-x64".to_string(),
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
        assert_eq!(parsed.target.as_deref(), Some("windows-x64"));
        assert_eq!(parsed.output_mode.as_deref(), Some("shared"));
        assert_eq!(parsed.runtime_debug_allocator.as_deref(), Some("on"));
        assert_eq!(parsed.runtime_cycle_collector.as_deref(), Some("off"));
        assert_eq!(parsed.assembler.as_deref(), Some(r"C:\tools\ml64.exe"));
        assert_eq!(parsed.out_dir.as_deref(), Some("out\\bin"));
    }

    #[test]
    fn parse_flags_build_accepts_other_canonical_targets() {
        let pulseos = parse_flags(
            CliCommand::Build,
            &["--target".to_string(), "pulseos-x64".to_string()],
        )
        .expect("pulseos target should parse");
        assert_eq!(pulseos.target.as_deref(), Some("pulseos-x64"));

        let linux = parse_flags(
            CliCommand::Build,
            &["--target".to_string(), "linux-x64".to_string()],
        )
        .expect("linux target should parse");
        assert_eq!(linux.target.as_deref(), Some("linux-x64"));

        let macos = parse_flags(
            CliCommand::Build,
            &["--target".to_string(), "macos-arm64".to_string()],
        )
        .expect("macos target should parse");
        assert_eq!(macos.target.as_deref(), Some("macos-arm64"));
    }

    #[test]
    fn parse_flags_build_rejects_removed_native_x64_alias() {
        let err = parse_flags(
            CliCommand::Build,
            &["--target".to_string(), "native-x64".to_string()],
        )
        .expect_err("removed target alias should fail");
        assert_eq!(
            err,
            format!("--target requires one of: {}", cli_target_error_text())
        );
    }

    #[test]
    fn parse_flags_build_rejects_unknown_target_with_taxonomy_message() {
        let err = parse_flags(
            CliCommand::Build,
            &["--target".to_string(), "native-arm64".to_string()],
        )
        .expect_err("unknown target should fail");
        assert_eq!(
            err,
            format!("--target requires one of: {}", cli_target_error_text())
        );
    }

    #[test]
    fn target_taxonomy_defines_immediate_and_later_target_ids() {
        assert_eq!(
            canonical_target_ids(),
            &[
                WINDOWS_X64_TARGET_ID,
                PULSEOS_X64_TARGET_ID,
                LINUX_X64_TARGET_ID,
                MACOS_ARM64_TARGET_ID,
            ]
        );

        let windows = resolve_target_descriptor(WINDOWS_X64_TARGET_ID).expect("windows target");
        assert_eq!(windows.os_family, "windows");
        assert_eq!(windows.arch, "x64");
        assert_eq!(windows.support_level, TargetSupportLevel::Immediate);
        assert_eq!(windows.lane_name, "windows-x64-host-bootstrap");
        assert_eq!(windows.lane_kind, TargetLaneKind::HostBootstrap);

        let pulseos = resolve_target_descriptor(PULSEOS_X64_TARGET_ID).expect("pulseos target");
        assert_eq!(pulseos.os_family, "pulseos");
        assert_eq!(pulseos.arch, "x64");
        assert_eq!(pulseos.support_level, TargetSupportLevel::Immediate);
        assert_eq!(pulseos.lane_name, "pulseos-x64-first-slice");
        assert_eq!(pulseos.lane_kind, TargetLaneKind::FirstSliceContract);

        let linux = resolve_target_descriptor(LINUX_X64_TARGET_ID).expect("linux target");
        assert_eq!(linux.os_family, "linux");
        assert_eq!(linux.arch, "x64");
        assert_eq!(linux.support_level, TargetSupportLevel::Later);
        assert_eq!(linux.lane_name, "linux-x64-planned");
        assert_eq!(linux.lane_kind, TargetLaneKind::Planned);

        let macos = resolve_target_descriptor(MACOS_ARM64_TARGET_ID).expect("macos target");
        assert_eq!(macos.os_family, "macos");
        assert_eq!(macos.arch, "arm64");
        assert_eq!(macos.support_level, TargetSupportLevel::Later);
        assert_eq!(macos.lane_name, "macos-arm64-planned");
        assert_eq!(macos.lane_kind, TargetLaneKind::Planned);
    }

    #[test]
    fn target_taxonomy_exposes_only_canonical_public_target_ids() {
        assert!(resolve_target_descriptor("native-x64").is_none());
        assert_eq!(canonical_target_ids().len(), 4);
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
    fn parse_command_rejects_removed_package_command() {
        assert_eq!(parse_command("package"), None);
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
            target = "pulseos-x64"
            output_mode = "fat"
            output_entry = "main"
            runtime_debug_allocator = "on"
            runtime_cycle_collector = "off"
            out_dir = "dist"

            [toolchain]
            linker = "C:/toolchain/link.exe"
            assembler = "C:/toolchain/ml64.exe"
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
        assert_eq!(parsed.build.target.as_deref(), Some("pulseos-x64"));
        assert_eq!(parsed.build.output_mode.as_deref(), Some("fat"));
        assert_eq!(parsed.build.output_entry.as_deref(), Some("main"));
        assert_eq!(parsed.build.runtime_debug_allocator.as_deref(), Some("on"));
        assert_eq!(parsed.build.runtime_cycle_collector.as_deref(), Some("off"));
        assert_eq!(parsed.build.out_dir.as_deref(), Some("dist"));
        assert_eq!(
            parsed.toolchain.linker.as_deref(),
            Some("C:/toolchain/link.exe")
        );
        assert_eq!(
            parsed.toolchain.assembler.as_deref(),
            Some("C:/toolchain/ml64.exe")
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
        let err =
            load_manifest_config(&bad_output).expect_err("missing split output entry should fail");
        assert!(
            err.contains("[build].output_entry is required when [build].output_mode is 'shared'")
        );

        let removed_alias = root.join("removed_alias.toml");
        write_file(
            &removed_alias,
            r#"
            [package]
            name = "demo"
            version = "1.0.0"

            [build]
            target = "native-x64"
            "#,
        );
        let err = load_manifest_config(&removed_alias).expect_err("removed alias should fail");
        assert!(err.contains(
            "[build].target must be one of: windows-x64, pulseos-x64, linux-x64, macos-arm64"
        ));
        let _ = fs::remove_dir_all(root);
    }

    #[test]
    fn manifest_v1_rejects_removed_package_metadata_section() {
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
            publisher = "Pulse Labs"
            "#,
        );
        let err =
            load_manifest_config(&manifest).expect_err("package metadata section should fail");
        assert!(err.contains("unknown section '[package.metadata]'"));
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
        assert!(result
            .expect_err("expected cycle")
            .contains("Import cycle detected"));

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

            import pulse.lang.IO;


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

            import pulse.lang.IO;


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

            import pulse.lang.IO;


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
        assert!(
            result.is_ok(),
            "supported import sample failed: {:?}",
            result
        );

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

            import pulse.lang.IO;


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

            import pulse.lang.IO;


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
            import pulse.lang.IO;

            class Util {
            }
            "#,
        );
        write_file(
            &util_b,
            r#"
            package app.tools;
            import pulse.lang.IO;

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

            import pulse.lang.IO;


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
            import pulse.lang.IO;

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
            import pulse.lang.IO;

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

            import pulse.lang.IO;


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
        assert!(
            result.is_ok(),
            "supported import sample failed: {:?}",
            result
        );

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
            import pulse.lang.IO;

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

            import pulse.lang.IO;


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
            import pulse.lang.System;
            import pulse.lang.IO;
            import pulse.lang.ConsoleReader;
            import pulse.lang.ConsoleWriter;
            import pulse.lang.String;
            import pulse.math.Math;
            import pulse.math.Random;
            import pulse.time.Clock;
            import pulse.time.TimeSource;
            import pulse.collections.Collection;
            import pulse.collections.Array;
            import pulse.collections.ArrayList;
            import pulse.collections.Set;
            import pulse.collections.HashSet;
            import pulse.collections.HashMap;
            import pulse.collections.MapEntry;
            import pulse.collections.Collections;
            import pulse.collections.Queue;
            import pulse.collections.Deque;
            import pulse.collections.LinkedList;
            import pulse.collections.List;
            import pulse.util.Arrays;
            import pulse.util.Objects;
            import pulse.util.Optional;
            import pulse.util.Properties;
            import pulse.util.Scanner;
            import pulse.util.StringJoiner;
            import pulse.util.StringTokenizer;
            import pulse.util.TextCursor;
            import pulse.util.UUID;
            import pulse.rt.Intrinsics;
            import pulse.io.ResourceScope;

            class Main {
                public static void main() {
                    Collection col = new ArrayList();
                    List list = new ArrayList();
                    col.clear();
                    list.add(3);
                    System.out.println("sys");
                    ConsoleReader input = System.in;
                    IO.println(input.readLineOrDefault("fallback"));
                    IO.println(9);
                    IO.println(Math.abs(-5));
                    IO.println(Objects.toString(null, "none"));
                    Optional maybe = Optional.ofNullable("ok");
                    IO.println(Boolean.toString(maybe.isPresent()));
                    Properties props = new Properties();
                    props.setProperty("mode", "dev");
                    IO.println(props.getProperty("mode", "none"));
                    TextCursor cursor = new TextCursor("x=1");
                    IO.println(cursor.readIdentifier());
                    Scanner scanner = new Scanner("1 true");
                    IO.println(scanner.nextInt());
                    StringJoiner joiner = new StringJoiner(", ", "[", "]");
                    joiner.add("a").add("b");
                    IO.println(joiner.toString());
                    StringTokenizer tokenizer = new StringTokenizer("a,b", ",");
                    IO.println(tokenizer.nextToken());
                    UUID uuid = UUID.fromString("123e4567-e89b-42d3-a456-426614174000");
                    IO.println(uuid.version());
                    IO.println(list.size());
                    IO.println(String.valueOf(true));
                    Random r = new Random(7);
                    IO.println(r.nextInt(10));
                    Clock clock = Clock.systemUTC();
                    IO.println(clock.isFixed());
                    TimeSource source = TimeSource.processMonotonic();
                    IO.println(source.isFixed());
                    Set s = new HashSet();
                    s.add("x");
                    HashMap m = new HashMap();
                    m.put("k", "v");
                    Set entries = m.entrySet();
                    IO.println(Arrays.contains(new Array(0), "x"));
                    IO.println(Collections.singleton("x").contains("x"));
                    IO.println(entries.size());
                    Queue q = new LinkedList();
                    q.offer(1);
                    Deque d = new LinkedList();
                    d.addFirst(2);
                    System.out.flush();
                    ResourceScope scope = new ResourceScope();
                    IO.println(scope.isOpen());
                    Intrinsics.consoleWriteLine("7");
                }
            }
            "#,
        );

        let result = check_project(
            main.to_str().expect("main utf8"),
            Some(src_root.to_str().expect("src utf8")),
            true,
        );
        assert!(
            result.is_ok(),
            "supported import sample failed: {:?}",
            result
        );

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
            import pulse.lang.System;

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
            result.merged.classes.iter().any(|c| c.name == "System"),
            "expected imported stdlib class 'System' to be loaded into merged program"
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
            import pulse.time.TimeMachine;

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
            .expect_err("expected unknown pulse import error")
            .contains("Unknown pulse import 'pulse.time.TimeMachine'"));

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
            import pulse;

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
            import pulse.ghost.*;

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
            .contains("Unknown pulse wildcard import 'pulse.ghost'"));

        let _ = fs::remove_dir_all(root);
    }

    #[test]
    fn check_project_accepts_prelude_usage_without_explicit_imports() {
        let root = unique_temp_root();
        let src_root = root.join("src");
        let main = src_root.join("app/core/Main.pulse");

        write_file(
            &main,
            r#"
            package app.core;

            class Main {
                public static void main() {
                    List values = new ArrayList();
                    Collection base = values;
                    IO.println(base.size());
                }
            }
            "#,
        );

        let result = check_project(
            main.to_str().expect("main utf8"),
            Some(src_root.to_str().expect("src utf8")),
            true,
        );
        assert!(
            result.is_ok(),
            "prelude/default import sample failed: {:?}",
            result
        );

        let _ = fs::remove_dir_all(root);
    }

    #[test]
    fn check_project_rejects_authorlib_import_without_manifest_opt_in() {
        let root = unique_temp_root();
        let src_root = root.join("src");
        let main = src_root.join("app/core/Main.pulse");

        write_file(
            &main,
            r#"
            package app.core;
            import author.project.ProjectLayout;

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
            .expect_err("expected authorlib gate error")
            .contains("requires [authorlib].enabled = true"));
        let _ = fs::remove_dir_all(root);
    }

    #[test]
    fn check_project_accepts_authorlib_import_with_manifest_opt_in() {
        let root = unique_temp_root();
        let src_root = root.join("src/main/pulse");
        let main = src_root.join("app/core/Main.pulse");
        let manifest = root.join("pulsec.toml");

        write_file(
            &main,
            r#"
            package app.core;
            import author.project.ProjectLayout;

            class Main {
                public static void main() {
                    ProjectLayout layout = ProjectLayout.defaults(".");
                }
            }
            "#,
        );
        write_file(
            &manifest,
            r#"
            [package]
            name = "author_ok"
            version = "1.0.0"

            [authorlib]
            enabled = true

            [sources]
            main_pulse = "src/main/pulse"
            entry = "app/core/Main.pulse"
            "#,
        );

        let resolved = resolve_check_invocation(
            None,
            &CliFlags {
                strict_package: true,
                friendly: false,
                project_root: Some(root.display().to_string()),
                source_root: None,
                profile: None,
                target: None,
                output_mode: None,
                runtime_debug_allocator: None,
                runtime_cycle_collector: None,
                out_dir: None,
                assembler: None,
                linker: None,
            },
        )
        .expect("resolve manifest invocation");

        let result = check_project_with_authorlib(
            &resolved.entry_path,
            resolved.source_root.as_deref(),
            true,
            resolved.authorlib_enabled,
        );
        assert!(
            result.is_ok(),
            "expected authorlib import success: {result:?}"
        );

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
            import pulse.lang.IO;

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
            import pulse.lang.IO;

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
            import pulse.lang.IO;

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
            import pulse.lang.IO;

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
