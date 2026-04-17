use super::{
    normalize_output_mode,
    target_model::{cli_target_error_text, normalize_cli_target_selection},
    CliCommand, CliFlags, NewFlags, NewTemplate,
};

pub(crate) fn parse_command(raw: &str) -> Option<CliCommand> {
    match raw {
        "new" => Some(CliCommand::New),
        "check" => Some(CliCommand::Check),
        "build" => Some(CliCommand::Build),
        "test" => Some(CliCommand::Test),
        "__prewarm-author-build-bridge" => Some(CliCommand::PrewarmAuthorBuildBridge),
        "help" | "--help" | "-h" => Some(CliCommand::Help),
        "version" | "--version" | "-V" => Some(CliCommand::Version),
        _ => None,
    }
}

pub(crate) fn parse_flags(command: CliCommand, flags: &[String]) -> Result<CliFlags, String> {
    let mut strict_package = false;
    let mut friendly = false;
    let mut project_root: Option<String> = None;
    let mut source_root: Option<String> = None;
    let mut profile: Option<String> = None;
    let mut target: Option<String> = None;
    let mut output_mode: Option<String> = None;
    let mut runtime_debug_allocator: Option<String> = None;
    let mut runtime_cycle_collector: Option<String> = None;
    let mut out_dir: Option<String> = None;
    let mut assembler: Option<String> = None;
    let mut linker: Option<String> = None;
    let mut i = 0usize;

    while i < flags.len() {
        match flags[i].as_str() {
            "--strict-package" => {
                strict_package = true;
                i += 1;
            }
            "--friendly" => {
                if command != CliCommand::Check && command != CliCommand::Test {
                    return Err("--friendly is only valid for 'check' or 'test'".to_string());
                }
                friendly = true;
                i += 1;
            }
            "--project-root" => {
                if command != CliCommand::Check
                    && command != CliCommand::Build
                    && command != CliCommand::Test
                {
                    return Err(
                        "--project-root is only valid for 'check', 'build', or 'test'".to_string(),
                    );
                }
                let Some(value) = flags.get(i + 1) else {
                    return Err("--project-root requires a directory value".to_string());
                };
                if value.starts_with("--") {
                    return Err("--project-root requires a directory value".to_string());
                }
                project_root = Some(value.clone());
                i += 2;
            }
            "--source-root" => {
                let Some(value) = flags.get(i + 1) else {
                    return Err("--source-root requires a directory value".to_string());
                };
                if value.starts_with("--") {
                    return Err("--source-root requires a directory value".to_string());
                }
                source_root = Some(value.clone());
                i += 2;
            }
            "--profile" => {
                if command != CliCommand::Build {
                    return Err("--profile is only valid for 'build'".to_string());
                }
                let Some(value) = flags.get(i + 1) else {
                    return Err("--profile requires one of: debug, release".to_string());
                };
                if value != "debug" && value != "release" {
                    return Err("--profile requires one of: debug, release".to_string());
                }
                profile = Some(value.clone());
                i += 2;
            }
            "--target" => {
                if command != CliCommand::Build {
                    return Err("--target is only valid for 'build'".to_string());
                }
                let Some(value) = flags.get(i + 1) else {
                    return Err(format!(
                        "--target requires one of: {}",
                        cli_target_error_text()
                    ));
                };
                let Some(normalized) = normalize_cli_target_selection(value) else {
                    return Err(format!(
                        "--target requires one of: {}",
                        cli_target_error_text()
                    ));
                };
                target = Some(normalized.to_string());
                i += 2;
            }
            "--output-mode" => {
                if command != CliCommand::Build {
                    return Err("--output-mode is only valid for 'build'".to_string());
                }
                let Some(value) = flags.get(i + 1) else {
                    return Err("--output-mode requires one of: fat, shared".to_string());
                };
                let Some(normalized) = normalize_output_mode(value) else {
                    return Err("--output-mode requires one of: fat, shared".to_string());
                };
                output_mode = Some(normalized.to_string());
                i += 2;
            }
            "--runtime-debug-allocator" => {
                if command != CliCommand::Build {
                    return Err("--runtime-debug-allocator is only valid for 'build'".to_string());
                }
                let Some(value) = flags.get(i + 1) else {
                    return Err("--runtime-debug-allocator requires one of: on, off".to_string());
                };
                if value != "on" && value != "off" {
                    return Err("--runtime-debug-allocator requires one of: on, off".to_string());
                }
                runtime_debug_allocator = Some(value.clone());
                i += 2;
            }
            "--runtime-cycle-collector" => {
                if command != CliCommand::Build {
                    return Err("--runtime-cycle-collector is only valid for 'build'".to_string());
                }
                let Some(value) = flags.get(i + 1) else {
                    return Err("--runtime-cycle-collector requires one of: on, off".to_string());
                };
                if value != "on" && value != "off" {
                    return Err("--runtime-cycle-collector requires one of: on, off".to_string());
                }
                runtime_cycle_collector = Some(value.clone());
                i += 2;
            }
            "--out-dir" => {
                if command != CliCommand::Build {
                    return Err("--out-dir is only valid for 'build'".to_string());
                }
                let Some(value) = flags.get(i + 1) else {
                    return Err("--out-dir requires a directory value".to_string());
                };
                if value.starts_with("--") {
                    return Err("--out-dir requires a directory value".to_string());
                }
                out_dir = Some(value.clone());
                i += 2;
            }
            "--linker" => {
                if command != CliCommand::Build {
                    return Err("--linker is only valid for 'build'".to_string());
                }
                let Some(value) = flags.get(i + 1) else {
                    return Err("--linker requires a file path value".to_string());
                };
                if value.starts_with("--") {
                    return Err("--linker requires a file path value".to_string());
                }
                linker = Some(value.clone());
                i += 2;
            }
            "--assembler" => {
                if command != CliCommand::Build {
                    return Err("--assembler is only valid for 'build'".to_string());
                }
                let Some(value) = flags.get(i + 1) else {
                    return Err("--assembler requires a file path value".to_string());
                };
                if value.starts_with("--") {
                    return Err("--assembler requires a file path value".to_string());
                }
                assembler = Some(value.clone());
                i += 2;
            }
            unknown => return Err(format!("Unknown flag '{}'", unknown)),
        }
    }

    Ok(CliFlags {
        strict_package,
        friendly,
        project_root,
        source_root,
        profile,
        target,
        output_mode,
        runtime_debug_allocator,
        runtime_cycle_collector,
        out_dir,
        assembler,
        linker,
    })
}

pub(crate) fn parse_new_flags(flags: &[String]) -> Result<NewFlags, String> {
    let mut path: Option<String> = None;
    let mut template = NewTemplate::App;
    let mut i = 0usize;
    while i < flags.len() {
        match flags[i].as_str() {
            "--path" => {
                let Some(value) = flags.get(i + 1) else {
                    return Err("--path requires a directory value".to_string());
                };
                if value.starts_with("--") {
                    return Err("--path requires a directory value".to_string());
                }
                path = Some(value.clone());
                i += 2;
            }
            "--template" => {
                let Some(value) = flags.get(i + 1) else {
                    return Err("--template requires one of: app, lib".to_string());
                };
                template = parse_new_template(value)?;
                i += 2;
            }
            unknown => return Err(format!("Unknown flag '{}'", unknown)),
        }
    }
    Ok(NewFlags { path, template })
}

pub(crate) fn parse_new_template(raw: &str) -> Result<NewTemplate, String> {
    match raw {
        "app" => Ok(NewTemplate::App),
        "lib" => Ok(NewTemplate::Lib),
        _ => Err("--template requires one of: app, lib".to_string()),
    }
}

pub(crate) fn new_template_name(template: NewTemplate) -> &'static str {
    match template {
        NewTemplate::App => "app",
        NewTemplate::Lib => "lib",
    }
}
