mod common;
use std::fs;
use std::path::Path;

use tempfile::tempdir;

fn write_file(path: &Path, content: &str) {
    if let Some(parent) = path.parent() {
        fs::create_dir_all(parent).expect("create dirs");
    }
    fs::write(path, content).expect("write file");
}

#[test]
fn cli_check_accepts_real_multifile_project() {
    let root = tempdir().expect("tempdir");
    let src_root = root.path().join("src");
    let player = src_root.join("app/game/Player.pulse");
    let main = src_root.join("app/game/Main.pulse");

    write_file(
        &player,
        r#"
        package app.game;

        import pulse.lang.IO;


        class Player {
            public int hp;

            public Player(int hp) {
                this.hp = hp;
            }
        }
        "#,
    );

    write_file(
        &main,
        r#"
        package app.game;
        import app.game.Player;

        class Main {
            public static void main() {
                Player p = new Player(42);
                IO.println(p.hp);
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("check")
        .arg(main.to_str().expect("main utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec check");

    assert!(
        output.status.success(),
        "expected success\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );

    let stdout = String::from_utf8_lossy(&output.stdout);
    assert!(stdout.contains("OK:"));
    assert!(stdout.contains("files=2"));
}

#[test]
fn cli_check_rejects_cross_package_usage_without_import() {
    let root = tempdir().expect("tempdir");
    let src_root = root.path().join("src");
    let player = src_root.join("app/game/Player.pulse");
    let main = src_root.join("app/core/Main.pulse");

    write_file(
        &player,
        r#"
        package app.game;

        import pulse.lang.IO;


        class Player {
            public static int createHp() {
                return 5;
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
                IO.println(Player.createHp());
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("check")
        .arg(main.to_str().expect("main utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec check");

    assert!(!output.status.success(), "expected command failure");

    let stderr = String::from_utf8_lossy(&output.stderr);
    assert!(
        stderr.contains("Unknown symbol 'Player'"),
        "unexpected stderr:\n{}",
        stderr
    );
}

#[test]
fn cli_check_importing_one_class_does_not_eager_load_broken_sibling_files() {
    let root = tempdir().expect("tempdir");
    let src_root = root.path().join("src");
    let good = src_root.join("app/lib/Good.pulse");
    let broken = src_root.join("app/lib/Broken.pulse");
    let main = src_root.join("app/core/Main.pulse");

    write_file(
        &good,
        r#"
        package app.lib;

        class Good {
            public static int value() {
                return 7;
            }
        }
        "#,
    );

    write_file(
        &broken,
        r#"
        package app.lib;

        class Broken {
            public static int value() {
                return missingSymbol;
            }
        }
        "#,
    );

    write_file(
        &main,
        r#"
        package app.core;

        import app.lib.Good;

        class Main {
            public static void main() {
                pulse.lang.IO.println(Good.value());
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("check")
        .arg(main.to_str().expect("main utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec check");

    assert!(
        output.status.success(),
        "expected success without loading broken sibling\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );

    let stdout = String::from_utf8_lossy(&output.stdout);
    assert!(stdout.contains("files=2"));
}

#[test]
fn cli_check_same_package_resolution_is_demand_driven_not_whole_package() {
    let root = tempdir().expect("tempdir");
    let src_root = root.path().join("src");
    let player = src_root.join("app/game/Player.pulse");
    let broken = src_root.join("app/game/Broken.pulse");
    let main = src_root.join("app/game/Main.pulse");

    write_file(
        &player,
        r#"
        package app.game;

        class Player {
            public int hp;

            public Player(int hp) {
                this.hp = hp;
            }
        }
        "#,
    );

    write_file(
        &broken,
        r#"
        package app.game;

        class Broken {
            public static int value() {
                return missingSymbol;
            }
        }
        "#,
    );

    write_file(
        &main,
        r#"
        package app.game;

        class Main {
            public static void main() {
                Player p = new Player(42);
                pulse.lang.IO.println(p.hp);
            }
        }
        "#,
    );

    let output = common::pulsec_command()
        .arg("check")
        .arg(main.to_str().expect("main utf8"))
        .arg("--source-root")
        .arg(src_root.to_str().expect("src utf8"))
        .arg("--strict-package")
        .output()
        .expect("run pulsec check");

    assert!(
        output.status.success(),
        "expected success with demand-driven same-package loading\nstdout:\n{}\nstderr:\n{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );

    let stdout = String::from_utf8_lossy(&output.stdout);
    assert!(stdout.contains("files=2"));
}

