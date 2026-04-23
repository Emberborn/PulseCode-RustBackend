use std::collections::hash_map::DefaultHasher;
use std::hash::{Hash, Hasher};
use std::ops::{Deref, DerefMut};
use std::path::{Path, PathBuf};
use std::process::Command;
use std::sync::OnceLock;
use std::time::{SystemTime, UNIX_EPOCH};
use std::time::Duration;

const TEST_COMMAND_LOCK_INFO_FILE: &str = "owner.txt";
const TEST_COMMAND_LOCK_POLL_INTERVAL: Duration = Duration::from_millis(20);
const TEST_COMMAND_LOCK_STALE_AFTER: Duration = Duration::from_secs(15 * 60);

fn current_unix_millis() -> u128 {
    SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .unwrap_or_default()
        .as_millis()
}

fn pulsec_test_command_lock_root() -> PathBuf {
    static ROOT: OnceLock<PathBuf> = OnceLock::new();
    ROOT.get_or_init(|| {
        let mut hasher = DefaultHasher::new();
        env!("CARGO_MANIFEST_DIR").hash(&mut hasher);
        std::env::temp_dir().join(format!("pulsec_test_cli_lock_{:016x}", hasher.finish()))
    })
    .clone()
}

fn test_command_lock_info_path(lock_path: &Path) -> PathBuf {
    lock_path.join(TEST_COMMAND_LOCK_INFO_FILE)
}

fn write_test_command_lock_info(lock_path: &Path) -> Result<(), String> {
    std::fs::write(
        test_command_lock_info_path(lock_path),
        format!(
            "pid={}\nstarted_ms={}\n",
            std::process::id(),
            current_unix_millis()
        ),
    )
    .map_err(|err| format!("Failed to write pulsec test lock info: {err}"))
}

fn test_command_lock_started_at(lock_path: &Path) -> Result<Option<u128>, String> {
    let info_path = test_command_lock_info_path(lock_path);
    let text = match std::fs::read_to_string(&info_path) {
        Ok(text) => text,
        Err(err) if err.kind() == std::io::ErrorKind::NotFound => return Ok(None),
        Err(err) if err.kind() == std::io::ErrorKind::PermissionDenied => return Ok(None),
        Err(err) => {
            return Err(format!(
                "Failed to read pulsec test lock info '{}': {err}",
                info_path.display()
            ))
        }
    };
    for line in text.lines() {
        if let Some(value) = line.strip_prefix("started_ms=") {
            let parsed = value.parse::<u128>().map_err(|err| {
                format!(
                    "Invalid pulsec test lock info '{}': {err}",
                    info_path.display()
                )
            })?;
            return Ok(Some(parsed));
        }
    }
    Ok(None)
}

fn remove_test_command_lock(lock_path: &Path) -> Result<(), String> {
    match std::fs::remove_dir_all(lock_path) {
        Ok(()) => Ok(()),
        Err(err) if err.kind() == std::io::ErrorKind::NotFound => Ok(()),
        Err(err) if err.kind() == std::io::ErrorKind::PermissionDenied => Ok(()),
        Err(err) => Err(format!(
            "Failed to remove pulsec test lock '{}': {err}",
            lock_path.display()
        )),
    }
}

fn reclaim_stale_test_command_lock(lock_path: &Path) -> Result<bool, String> {
    if !lock_path.exists() {
        return Ok(false);
    }
    let Some(started_ms) = test_command_lock_started_at(lock_path)? else {
        return Ok(false);
    };
    if current_unix_millis().saturating_sub(started_ms) < TEST_COMMAND_LOCK_STALE_AFTER.as_millis()
    {
        return Ok(false);
    }
    remove_test_command_lock(lock_path)?;
    Ok(true)
}

struct TestCommandLock {
    path: PathBuf,
}

impl Drop for TestCommandLock {
    fn drop(&mut self) {
        let _ = remove_test_command_lock(&self.path);
    }
}

fn acquire_test_command_lock() -> Result<TestCommandLock, String> {
    let root = pulsec_test_command_lock_root();
    std::fs::create_dir_all(&root)
        .map_err(|err| format!("Failed to create pulsec test lock root: {err}"))?;
    let lock_path = root.join("lock");
    for _ in 0..30_000 {
        match std::fs::create_dir(&lock_path) {
            Ok(()) => {
                if let Err(err) = write_test_command_lock_info(&lock_path) {
                    let _ = std::fs::remove_dir_all(&lock_path);
                    return Err(err);
                }
                return Ok(TestCommandLock { path: lock_path });
            }
            Err(err) if err.kind() == std::io::ErrorKind::AlreadyExists => {
                if reclaim_stale_test_command_lock(&lock_path)? {
                    continue;
                }
                std::thread::sleep(TEST_COMMAND_LOCK_POLL_INTERVAL);
            }
            Err(err) => {
                return Err(format!(
                    "Failed to acquire pulsec test command lock '{}': {err}",
                    lock_path.display()
                ))
            }
        }
    }
    Err("Timed out waiting for pulsec test command lock".to_string())
}

pub struct PulsecCommand {
    _lock: TestCommandLock,
    inner: Command,
}

impl Deref for PulsecCommand {
    type Target = Command;

    fn deref(&self) -> &Self::Target {
        &self.inner
    }
}

impl DerefMut for PulsecCommand {
    fn deref_mut(&mut self) -> &mut Self::Target {
        &mut self.inner
    }
}

fn ensure_author_build_bridge_ready() {
    static READY: OnceLock<()> = OnceLock::new();
    READY.get_or_init(|| {
        let mut last_failure = None;
        for _ in 0..20 {
            let output = Command::new(env!("CARGO_BIN_EXE_pulsec"))
                .arg("__prewarm-author-build-bridge")
                .output()
                .expect("run pulsec author build bridge prewarm");
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

pub fn pulsec_command() -> PulsecCommand {
    let lock = acquire_test_command_lock().expect("acquire pulsec test command lock");
    ensure_author_build_bridge_ready();
    PulsecCommand {
        _lock: lock,
        inner: Command::new(env!("CARGO_BIN_EXE_pulsec")),
    }
}
