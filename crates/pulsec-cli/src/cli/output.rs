pub(crate) fn emit_error(code: &str, message: &str) {
    eprintln!("error[{code}]: {message}");
    eprintln!("diag.code={code}");
}

pub(crate) fn emit_hint(message: &str) {
    eprintln!("hint: {message}");
}

pub(crate) fn print_help(stderr: bool) {
    let lines = [
        "PulseCode CLI",
        "",
        "Usage:",
        "  pulsec <command> [arguments] [flags]",
        "",
        "Commands:",
        "  new       Scaffold a project",
        "  check     Parse/analyze a Pulse source entry",
        "  build     Build a Pulse source entry to native artifacts",
        "  test      Run project tests",
        "  package   Build package artifacts",
        "  help      Show this help",
        "  version   Show CLI version",
        "",
        "Exit codes:",
        "  0 success",
        "  1 command failed",
        "  2 command/argument usage error",
        "  3 command not implemented",
        "",
        "Use 'pulsec <command> --help' for command-specific usage.",
    ];
    for line in lines {
        if stderr {
            eprintln!("{line}");
        } else {
            println!("{line}");
        }
    }
}

pub(crate) fn print_check_usage(stderr: bool) {
    let line = "Usage: pulsec check [<entry.pulse>] [--project-root <dir>] [--source-root <dir>] [--strict-package|--friendly]";
    if stderr {
        eprintln!("{line}");
    } else {
        println!("{line}");
    }
}

pub(crate) fn print_new_usage(stderr: bool) {
    let line = "Usage: pulsec new <project-name> [--template <app|lib>] [--path <dir>]";
    if stderr {
        eprintln!("{line}");
    } else {
        println!("{line}");
    }
}

pub(crate) fn print_build_usage(stderr: bool) {
    let line = "Usage: pulsec build [<entry.pulse>] [--project-root <dir>] [--source-root <dir>] [--profile <debug|release>] [--target <native-x64>] [--packaging-mode <staged|msi>] [--output-mode <fat|shared>] [--runtime-debug-allocator <on|off>] [--runtime-cycle-collector <on|off>] [--out-dir <dir>] [--linker <path>] [--assembler <path>] [--wix <path>] [--signtool <path>] [--msi]";
    if stderr {
        eprintln!("{line}");
    } else {
        println!("{line}");
    }
}

pub(crate) fn print_test_usage(stderr: bool) {
    let line =
        "Usage: pulsec test [--project-root <dir>] [--source-root <dir>] [--strict-package|--friendly]";
    if stderr {
        eprintln!("{line}");
    } else {
        println!("{line}");
    }
}

pub(crate) fn print_package_usage(stderr: bool) {
    let line = "Usage: pulsec package [<entry.pulse>] [--project-root <dir>] [--source-root <dir>] [--profile <debug|release>] [--target <native-x64>] [--packaging-mode <staged|msi>] [--output-mode <fat|shared>] [--runtime-debug-allocator <on|off>] [--runtime-cycle-collector <on|off>] [--out-dir <dir>] [--staging-dir <dir>] [--linker <path>] [--assembler <path>] [--wix <path>] [--signtool <path>] [--msi]";
    if stderr {
        eprintln!("{line}");
    } else {
        println!("{line}");
    }
}

pub(crate) fn print_version() {
    println!("pulsec {}", env!("CARGO_PKG_VERSION"));
}
