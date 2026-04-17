use std::process::Command;
use std::sync::OnceLock;
use std::time::Duration;

fn ensure_author_build_bridge_ready() {
    static READY: OnceLock<()> = OnceLock::new();
    READY.get_or_init(|| {
        let mut last_status = None;
        for _ in 0..20 {
            let status = Command::new(env!("CARGO_BIN_EXE_pulsec"))
                .arg("__prewarm-author-build-bridge")
                .status()
                .expect("run pulsec author build bridge prewarm");
            if status.success() {
                return;
            }
            last_status = Some(status);
            std::thread::sleep(Duration::from_millis(1000));
        }
        panic!("author build bridge prewarm failed: {last_status:?}");
    });
}

pub fn pulsec_command() -> Command {
    ensure_author_build_bridge_ready();
    Command::new(env!("CARGO_BIN_EXE_pulsec"))
}
