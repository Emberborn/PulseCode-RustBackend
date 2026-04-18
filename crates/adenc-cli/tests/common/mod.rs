use std::process::Command;
use std::sync::OnceLock;
use std::time::Duration;

fn ensure_adk_build_bridge_ready() {
    static READY: OnceLock<()> = OnceLock::new();
    READY.get_or_init(|| {
        let mut last_failure = None;
        for _ in 0..20 {
            let output = Command::new(env!("CARGO_BIN_EXE_adenc"))
                .arg("__prewarm-author-build-bridge")
                .output()
                .expect("run adenc author build bridge prewarm");
            if output.status.success() {
                return;
            }
            last_failure = Some(output);
            std::thread::sleep(Duration::from_millis(1000));
        }
        let output = last_failure.expect("last prewarm failure should exist");
        panic!(
            "author build bridge prewarm failed: status={:?}\nstdout:\n{}\nstderr:\n{}",
            output.status.code(),
            String::from_utf8_lossy(&output.stdout),
            String::from_utf8_lossy(&output.stderr)
        );
    });
}

pub fn adenc_command() -> Command {
    ensure_adk_build_bridge_ready();
    Command::new(env!("CARGO_BIN_EXE_adenc"))
}
