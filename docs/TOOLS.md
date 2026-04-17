# Tool Inventory

This document records the command-line tools that are available in the working environment for this project.

Future agents should treat this as the current local-tool baseline for repo work unless the user says otherwise.

Last verified: `2026-04-13`

## Workstation Mesh

This environment is no longer a single-machine setup. Treat it as a multi-host workstation mesh.

### Windows Node

- role: primary Windows development and compatibility node
- hostname: `emberborn-pc`
- LAN IP: `10.0.0.127`
- current local shell environment for this inventory: `Windows PowerShell`
- inbound SSH: enabled through `sshd`
- inbound auth policy: public-key only
- Windows administrative SSH keys live in `%ProgramData%\ssh\administrators_authorized_keys`
- outbound SSH alias to the Mac: `ssh mac-mesh`
- outbound SSH alias to the Linux node: `ssh linux-mesh`
- exported SMB roots:
  - `\\10.0.0.127\C-root`
  - `\\10.0.0.127\G-root`
- mapped inbound SMB drives from peer nodes:
  - `L:` -> `\\10.0.0.253\linux-root`
  - `M:` -> `\\10.0.0.167\macintosh-ssd`
- startup/autostart state on Windows:
  - `sshd`: `Automatic`
  - `LanmanServer` (SMB server): `Automatic`
  - `LanmanWorkstation` (SMB client): `Automatic`
  - `L:` and `M:` are persistent mappings
  - scheduled task `WorkstationMesh-ReconnectShares` runs at user logon to revalidate/remap workstation shares
  - watchdog script `C:\Users\Emberborn\Documents\Scripts\Watch-WorkstationServices.ps1` exists, but the SYSTEM scheduled task registration is still pending

### macOS Node

- role: macOS development and compatibility node
- hostname: `Martins-Mac-mini.local`
- LAN IP: `10.0.0.167`
- OS: `macOS 26.4`
- current shell: `/bin/zsh`
- effective home directory: `/Volumes/Macintosh SSD/Users/Emberborn`
- inbound SSH: enabled
- inbound auth policy: public-key only
- exported SMB share currently confirmed:
  - `smb://10.0.0.167/macintosh-ssd`
- outbound SSH alias to the Windows node from the Mac side: `ssh windows-mesh`
- outbound SSH alias to the Linux node from the Mac side: `ssh linux-mesh`
- known reachable target from Windows: `ssh mac-mesh`
- mount persistence on macOS:
  - LaunchAgent `local.workstation.smb-mounts` runs at login
  - backing script: `/Volumes/Macintosh SSD/Users/Emberborn/bin/mount-workstation-smb.sh`
  - intended stable mounted volumes:
    - `/Volumes/C-root`
    - `/Volumes/G-root`
    - `/Volumes/linux-root`
- server/watchdog note:
  - macOS uses `launchd` to manage `smbd`
  - inbound SSH remains available through the macOS Remote Login / `sshd` path

### Linux Node

- role: Arch Linux ARM development and compatibility node
- hardware: Raspberry Pi 5, 8 GB model, custom-compiled Arch Linux
- hostname: `emberborn-linux`
- LAN IP: `10.0.0.253`
- OS: `Arch Linux ARM`
- current shell: `/usr/bin/bash`
- SSH username: `emberborn`
- inbound SSH: enabled
- inbound auth policy: public-key only
- exported SMB share currently confirmed:
  - `//10.0.0.253/linux-root`
- known reachable target from Windows: `ssh linux-mesh`
- outbound SSH alias to the Windows node from Linux: `ssh windows-mesh`
- outbound SSH alias to the macOS node from Linux: `ssh mac-mesh`
- SMB mount persistence on Linux:
  - `/etc/fstab` uses `x-systemd.automount` for:
    - `/mnt/windows-c` -> `//10.0.0.127/C-root`
    - `/mnt/windows-g` -> `//10.0.0.127/G-root`
    - `/mnt/macintosh-ssd` -> `//10.0.0.167/macintosh-ssd`
- server/watchdog note:
  - `sshd.service` is enabled with `Restart=always` and `RestartSec=5s`
  - `smb.service` is enabled with `Restart=always` and `RestartSec=5s`

### Mesh Guidance

- prefer the SSH aliases once they exist instead of memorizing raw IPs
- prefer the documented SMB share names instead of the hidden administrative shares when mounting from macOS or Linux
- current known aliases:
  - Windows -> macOS: `ssh mac-mesh`
  - Windows -> Linux: `ssh linux-mesh`
  - macOS -> Windows: `ssh windows-mesh`
- current known Windows workstation drive mappings:
  - `L:` -> Linux root SMB export
  - `M:` -> macOS `macintosh-ssd` SMB export
- Linux should eventually get stable aliases from macOS and Linux-side config for the full triangle
- if a tool is only documented under one host section, do not assume it exists on the other hosts yet

## Windows Node: PATH Refresh Note

The Windows user `PATH` is intentionally kept short so it stays well below the legacy editor and launcher limits that start causing dropped entries around the 2K range.

As of `2026-04-11`, the user `PATH` has been trimmed to a stable baseline and the long WinGet package directories are no longer embedded directly in `PATH`.

If a new Windows shell session does not initially see these tools, refresh `PATH` from the user and machine environment first.

PowerShell:

```powershell
$env:Path = [System.Environment]::GetEnvironmentVariable('Path','User') + ';' + [System.Environment]::GetEnvironmentVariable('Path','Machine')
```

Stable wrapper-backed tool entrypoints now live in `C:\Users\Emberborn\bin` for the commands that previously depended on very long WinGet package paths.

Wrapper-backed commands:

- `rg` -> [C:\Users\Emberborn\bin\rg.cmd](</C:/Users/Emberborn/bin/rg.cmd>)
- `fd` -> [C:\Users\Emberborn\bin\fd.cmd](</C:/Users/Emberborn/bin/fd.cmd>)
- `jq` -> [C:\Users\Emberborn\bin\jq.cmd](</C:/Users/Emberborn/bin/jq.cmd>)
- `bat` -> [C:\Users\Emberborn\bin\bat.cmd](</C:/Users/Emberborn/bin/bat.cmd>)
- `delta` -> [C:\Users\Emberborn\bin\delta.cmd](</C:/Users/Emberborn/bin/delta.cmd>)
- `zoxide` -> [C:\Users\Emberborn\bin\zoxide.cmd](</C:/Users/Emberborn/bin/zoxide.cmd>)
- `eza` -> [C:\Users\Emberborn\bin\eza.cmd](</C:/Users/Emberborn/bin/eza.cmd>)
- `fzf` -> [C:\Users\Emberborn\bin\fzf.cmd](</C:/Users/Emberborn/bin/fzf.cmd>)
- `just` -> [C:\Users\Emberborn\bin\just.cmd](</C:/Users/Emberborn/bin/just.cmd>)
- `hyperfine` -> [C:\Users\Emberborn\bin\hyperfine.cmd](</C:/Users/Emberborn/bin/hyperfine.cmd>)
- `sd` -> [C:\Users\Emberborn\bin\sd.cmd](</C:/Users/Emberborn/bin/sd.cmd>)
- `cargo-nextest` -> [C:\Users\Emberborn\bin\cargo-nextest.exe](</C:/Users/Emberborn/bin/cargo-nextest.exe>)
- `yq` -> [C:\Users\Emberborn\bin\yq.cmd](</C:/Users/Emberborn/bin/yq.cmd>)
- `uv` -> [C:\Users\Emberborn\bin\uv.cmd](</C:/Users/Emberborn/bin/uv.cmd>)
- `uvx` -> [C:\Users\Emberborn\bin\uvx.cmd](</C:/Users/Emberborn/bin/uvx.cmd>)
- `uvw` -> [C:\Users\Emberborn\bin\uvw.cmd](</C:/Users/Emberborn/bin/uvw.cmd>)
- `sqlite3` -> [C:\Users\Emberborn\bin\sqlite3.cmd](</C:/Users/Emberborn/bin/sqlite3.cmd>)
- `openocd` -> [C:\Users\Emberborn\bin\openocd.cmd](</C:/Users/Emberborn/bin/openocd.cmd>)
- `hexyl` -> [C:\Users\Emberborn\bin\hexyl.cmd](</C:/Users/Emberborn/bin/hexyl.cmd>)
- `rufus` -> [C:\Users\Emberborn\bin\rufus.cmd](</C:/Users/Emberborn/bin/rufus.cmd>)

Future agents should prefer the stable wrapper entrypoints over the volatile WinGet package directories when documenting or automating these commands.

## Windows Node: Available Core Repo Tools

- `git`
- `git-lfs`
- `gh`
- `curl.exe`
- `openssl`
- `ssh`
- `scp`
- `sftp`
- `sshd`
- `7z`
- `sha256sum`
- `b3sum`
- `cmp`
- `hexyl`
- `pwsh`
- `rg`
- `fd`
- `jq`
- `bat`
- `delta`
- `zoxide`
- `eza`
- `fzf`

## Windows Node: Available Rust / Build Tools

- `cargo`
- `rustc`
- `rustup`
- `cargo-nextest` (normally invoked as `cargo nextest`)
- `just`
- `watchexec`
- `hyperfine`

## Windows Node: Available Text / Data Utilities

- `sd`
- `yq`
- `sqlite3`

## Windows Node: Available Native / Binary Inspection Tools

- `dumpbin` (from Visual Studio Build Tools)
- `llvm-objdump`
- `llvm-readobj`
- `cmake`
- `dot` (Graphviz)
- `objdump`
- `objcopy`
- `readelf`
- `nm`
- `strings`
- `ninja`

## Windows Node: Available Systems / OS Development Tools

- `qemu-system-x86_64`
- `qemu-img`
- `bochs`
- `gdisk`
- `sgdisk`
- `fdisk`
- `cfdisk`
- `sfdisk`
- `xorriso`
- `mtools`
- `mcopy`
- `mdir`
- `mformat`
- `minfo`
- `gdb`
- `lldb`
- `nasm`
- `openocd`
- `iasl`
- `cargo-fuzz` (normally invoked as `cargo fuzz`)
- bundled QEMU EDK II firmware files are available, including:
  - `C:\Program Files\qemu\share\edk2-x86_64-code.fd`
  - `C:\Program Files\qemu\share\edk2-x86_64-secure-code.fd`
  - `C:\Program Files\qemu\share\firmware\60-edk2-x86_64.json`

## Windows Node: Available Real Hardware / Networking Tools

- `wireshark`
- `tshark`
- `npcap` (driver/service for Windows packet capture)
- `putty`
- `rufus`

## Windows Node: Available Python / Scripting Tools

- `python`
- `py`
- `pip`
- `pipx`
- `uv`
- `ruff`
- `pytest`
- `mypy`
- `pre-commit`
- `ipython`
- `nox`
- `tox`
- `pyproject-build`
- `twine`

## Windows Node: Available Java / JVM Tools

- BellSoft Liberica Full JDKs installed: `8`, `11`, `17`, `21`, `25`, `26`
- default `java` / `javac` resolve to BellSoft `26`
- versioned Java selection works through command modifiers:
  - `java --8 -version`
  - `javac --21 -version`
  - `jar --25 --help`
- generic versioned tool dispatch is also available:
  - `jdk 17 java -version`
  - `jdk 21 jpackage --help`
  - `jdk 26 jshell`
- common JDK tools are available through the same dispatch layer, including:
  - `jar`, `javadoc`, `jshell`, `jcmd`, `jfr`, `jdeps`, `jlink`, `jmod`, `jpackage`
  - `jarsigner`, `keytool`, `jconsole`, `jdb`, `jmap`, `jps`, `jrunscript`, `jstack`, `jstat`, `serialver`
- `mvn`
- `gradle`

## macOS Node: Known Mesh Access

- inbound SSH is already working with public-key auth only
- Windows reaches the Mac with:
  - `ssh mac-mesh`
  - `ssh emberborn@10.0.0.167`
- the Mac reaches Windows with:
  - `ssh windows-mesh`
  - `ssh Emberborn@10.0.0.127`
- the Mac reaches Linux with:
  - `ssh linux-mesh`
  - `ssh emberborn@10.0.0.253`
- current macOS SSH identity used for Windows access:
  - `~/.ssh/id_ed25519_mesh`
- current macOS SSH identity used for Linux access:
  - `~/.ssh/id_ed25519_mesh`
- Windows SMB shares should be mounted from macOS using:
  - `smb://10.0.0.127/C-root`
  - `smb://10.0.0.127/G-root`
- Linux SMB shares should be mounted from macOS using:
  - `smb://10.0.0.253/linux-root`
- currently mounted SMB volumes on macOS confirmed over SSH:
  - `/Volumes/C-root`
  - `/Volumes/G-root`
- login-time mount automation on macOS is handled by:
  - `~/Library/LaunchAgents/local.workstation.smb-mounts.plist`
  - `~/bin/mount-workstation-smb.sh`
- macOS PATH-visible tool audit:
  - shells: `zsh 5.9`, `bash 3.2.57`, `sh`
  - remote access: `ssh`, `scp`, `sftp`, `sshd`
  - package manager: `Homebrew 5.1.5`
  - core/dev: `git 2.50.1`, `git-lfs 3.7.1`, `gh 2.89.0`, `ripgrep 15.1.0`, `fd 10.4.2`, `jq 1.8.1`, `bat 0.26.1`, `delta 0.19.2`, `zoxide 0.9.9`, `eza 0.23.4`, `fzf 0.71.0`
  - structured/build helpers: `cmake 4.3.1`, `ninja 1.13.2`, `yq 4.52.5`, `just 1.49.0`, `watchexec 2.5.1`, `hyperfine 1.20.0`, `sd 1.0.0`
  - file/share: `smbutil`, `mount_smbfs`, `mount`, `rsync`, `tar`, `unzip`
  - native/build/debug: `Apple clang 21.0.0`, `clang++ 21.0.0`, `make 3.81`, `lldb 2100.0.16.4`, `objdump`, `nm`, `strings`, `fdisk`, `otool`
  - Rust/toolchain: `rustup`, `cargo 1.94.1`, `rustc 1.94.1`
  - Python/runtime: `python3` via Homebrew, `pipx 1.11.1`, `uv 0.11.6`, `ruff 0.15.10`, `mypy 1.20.0`, `pre-commit 4.5.1`, `ipython 9.12.0`, `nox 2026.2.9`, `tox 4.52.1`, `twine 6.2.0`
  - shell profile additions are in `~/.zprofile` under `/Volumes/Macintosh SSD/Users/Emberborn` for Homebrew, Rust, local bin, and pipx paths
  - Java note: `/usr/bin/java` and `/usr/bin/javac` are still Apple stubs; a full BellSoft-style Java pipeline is intentionally only provisioned on Windows right now

## Linux Node: Known Mesh Access

- inbound SSH is already working with public-key auth only
- Windows reaches the Linux node with:
  - `ssh linux-mesh`
  - `ssh emberborn@10.0.0.253`
- the Linux node reaches Windows with:
  - `ssh windows-mesh`
  - `ssh Emberborn@10.0.0.127`
- the Linux node reaches macOS with:
  - `ssh mac-mesh`
  - `ssh emberborn@10.0.0.167`
- the Linux node's public key is authorized on the Windows node
- Windows SMB shares should be mounted from Linux using:
  - `//10.0.0.127/C-root`
  - `//10.0.0.127/G-root`
- macOS SMB shares should be mounted from Linux using:
  - `//10.0.0.167/macintosh-ssd`
- current Linux automount targets from `/etc/fstab`:
  - `/mnt/windows-c`
  - `/mnt/windows-g`
  - `/mnt/macintosh-ssd`
- Linux PATH-visible tool audit:
  - remote access: `ssh`, `scp`, `sftp`, `sshd`
  - core/dev: `git 2.53.0`, `curl 8.19.0`, `OpenSSL 3.6.1`, `tar 1.35`, `rg 15.1.0`, `fd 10.4.2`, `jq 1.8.1`, `bat 0.26.1`, `delta 0.19.2`, `zoxide 0.9.9`, `eza 0.23.4`, `fzf 0.71.0`, `gh 2.89.0`
  - JavaScript/runtime: `nodejs 25.9.0`, `npm 11.12.1`
  - npm global install policy: user-owned globals should use `~/.local` via `~/.npmrc`, with CLI shims resolving from `~/.local/bin`
  - structured/build helpers: `yq 3.4.3` (jq-wrapper flavor, not the Mike Farah v4 CLI), `just 1.49.0`, `watchexec 2.5.1`, `hyperfine 1.20.0`, `sd 1.0.0`
  - build/compile: `cmake 4.3.1`, `clang 22.1.2`, `clang++ 22.1.2`, `gcc 15.2.1`, `g++ 15.2.1`, `make 4.4.1`
  - binary/debug: `gdb 17.1`, `llvm-objdump`, `llvm-readobj`, `objdump 2.46`, `objcopy 2.46`, `readelf 2.46`, `nm 2.46`, `strings 2.46`
  - disk/system: `fdisk 2.42`, `cfdisk 2.42`, `sfdisk 2.42`, `systemctl 260`, `pacman`
  - SMB/CIFS: `mount.cifs 7.5`, `smbclient 4.24.0`
  - Rust/toolchain: `rustup 1.29.0`, `cargo 1.94.1`, `rustc 1.94.1`, `cargo-nextest 0.9.132`
  - Python/runtime: `python3 3.14.3`, `pipx 1.11.1`, `uv 0.11.3`, `pytest 9.0.2`, `python-build 1.4.2`, `twine 6.2.0`, `pre-commit 4.5.1`, `ruff 0.15.9`, `mypy 1.20.0`, `tox 4.33.0`, `ipython 9.12.0`, `nox 2026.2.9`
  - service state confirmed over SSH:
    - `sshd`: enabled
    - `smb`: enabled
  - notable absence in current PATH audit:
    - Java toolchain not found in PATH; this is acceptable for now because the full Java pipeline is intentionally centered on Windows

## Windows Node: Usage Guidance

- prefer `rg` for text search
- prefer `fd` for file discovery
- use `bat` for readable file inspection when that helps
- use `jq` / `yq` for structured JSON/YAML inspection instead of ad hoc parsing
- use `sqlite3` for lightweight fixture, metadata, or inspection work when a local database is involved
- use `delta` for readable diff output when reviewing changes
- use `git-lfs` when a repository stores large binaries, VM images, datasets, or other assets that should not live as normal Git blobs
- use `gh` for GitHub repo, issue, PR, release, and workflow interaction from the terminal
- use `curl.exe` for HTTP/API/protocol sanity checks and artifact downloads
- use `openssl` for TLS, certificates, hashing, and protocol debugging
- use `ssh`, `scp`, and `sftp` for cross-machine command execution, file transfer, and remote coordination
- use `sshd` as the Windows OpenSSH server for inbound remote execution on this host
- inbound Windows SSH on this host is configured for public-key authentication only; administrative logins use `%ProgramData%\\ssh\\administrators_authorized_keys`
- use `ssh mac-mesh` from Windows when targeting the Mac node instead of the raw IP unless troubleshooting
- use `ssh linux-mesh` from Windows when targeting the Linux node instead of the raw IP unless troubleshooting
- use `\\10.0.0.127\C-root` and `\\10.0.0.127\G-root` as the explicit Windows SMB roots for cross-system mounting
- use `L:` for the Linux root SMB export on Windows
- use `M:` for the macOS `macintosh-ssd` SMB export on Windows
- if a remembered SMB mapping comes back stale after login, the `WorkstationMesh-ReconnectShares` task is the intended auto-repair path
- if you want automatic service recovery beyond normal Windows service startup, finish registering the Windows watchdog task for `Watch-WorkstationServices.ps1`
- use `7z` for archive extraction/creation and odd vendor package formats; the normal 7-Zip desktop app is also installed
- use `sha256sum` or `b3sum` for artifact verification, reproducibility checks, and release hashing
- use `cmp` for byte-for-byte comparison of binaries, images, and generated artifacts
- use `hexyl` for fast, readable hex inspection when a full disassembly is unnecessary
- use `pwsh` when you want PowerShell 7 features instead of legacy Windows PowerShell
- use `python` / `py` for small repo-local scripts only when shell tools or Rust code are not the better fit
- use `pip` only for interpreter-local package management when a project specifically expects it
- use `pipx` for isolated global-style Python CLI installs when `uv tool` is not the better fit
- use `uv` when Python environment or script execution needs lightweight package/runtime management
- use `ruff` for Python linting and formatting
- use `pytest` for Python test execution
- use `mypy` for Python static typing checks
- use `pre-commit` for hook-driven lint/test/format workflows
- use `ipython` for interactive Python exploration/debugging
- use `nox` or `tox` when a Python project already defines multi-environment automation through them
- use `pyproject-build` for standards-based Python package builds
- use `twine` only when Python package publishing or distribution validation is actually needed
- use `cargo-nextest` only when it materially improves test execution over the focused `cargo test` workflow already documented in the handoff
- use `dumpbin` when backend or artifact validation needs Windows binary/object inspection
- use `llvm-objdump` / `llvm-readobj` for cross-platform binary and object inspection
- use `cmake` only when native dependencies or cross-language build systems genuinely require it
- use `dot` when generating diagrams, dependency graphs, or architecture visuals from text
- use `qemu-system-x86_64` for emulator-driven OS bring-up, boot validation, and debugger-friendly VM loops
- use `qemu-img` for raw/qcow image creation and conversion
- use `bochs` as a redundancy/cross-check emulator against QEMU, not as the primary day-to-day development emulator
- use `gdisk` / `sgdisk` for GPT partition layout, scripting, and image inspection
- use `fdisk`, `cfdisk`, and `sfdisk` for MBR/basic partition inspection and lower-level disk-layout work
- use `xorriso` when building or inspecting ISO images or bootable optical-style media layouts
- use `mtools`, `mcopy`, `mdir`, `mformat`, and `minfo` for FAT image and EFI system partition work without mounting disk images
- use `gdb` or `lldb` for low-level debugging; both are installed
- use `nasm` for standalone assembly and early bootstrap experiments
- use `openocd` for later real-hardware and on-chip debug workflows
- use `iasl` for ACPI table compilation/disassembly work
- use `cargo fuzz` for Rust-side frontend/runtime/compiler fuzzing
- use GNU binutils commands such as `objdump`, `objcopy`, `readelf`, `nm`, and `strings` when ELF/COFF inspection or binary surgery is needed
- use `wireshark` / `tshark` for packet inspection, decode, and live capture; `Npcap` is installed for Windows capture support
- use `putty` for serial-console and device-console sessions
- use `rufus` when writing bootable USB media for real-hardware testing
- use default `java` / `javac` for the BellSoft 26 toolchain
- use `java --8`, `java --11`, `java --17`, `java --21`, `java --25`, or `java --26` when an explicit JDK version is required
- use `jdk <version> <tool> ...` for versioned access to other JDK tools such as `jpackage`, `jlink`, or `jshell`
- use `mvn` and `gradle` for standard Java build workflows

## Planning / Board Reminder

Task exit conditions that reference later tasks are mandatory revisit hooks, not informational notes.

Example:

- if a task says it must return through later tasks such as `F1-47` and `F1-69`, it is not fully closed until those later tasks are complete and the earlier task is revisited against that exit condition
