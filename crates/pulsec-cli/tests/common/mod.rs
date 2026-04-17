use std::process::Command;
use std::sync::OnceLock;

fn ensure_author_build_bridge_ready() {
    static READY: OnceLock<()> = OnceLock::new();
    READY.get_or_init(|| {
        let status = Command::new(env!("CARGO_BIN_EXE_pulsec"))
            .arg("__prewarm-author-build-bridge")
            .status()
            .expect("run pulsec author build bridge prewarm");
        assert!(status.success(), "author build bridge prewarm failed");
    });
}

pub fn pulsec_command() -> Command {
    ensure_author_build_bridge_ready();
    Command::new(env!("CARGO_BIN_EXE_pulsec"))
}
