#![cfg_attr(not(test), allow(dead_code))]

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub(crate) enum TargetSupportLevel {
    Immediate,
    Later,
}

impl TargetSupportLevel {
    pub(crate) fn as_str(self) -> &'static str {
        match self {
            TargetSupportLevel::Immediate => "immediate",
            TargetSupportLevel::Later => "later",
        }
    }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub(crate) enum TargetLaneKind {
    HostBootstrap,
    FirstSliceContract,
    Planned,
}

impl TargetLaneKind {
    pub(crate) fn as_str(self) -> &'static str {
        match self {
            TargetLaneKind::HostBootstrap => "host-bootstrap",
            TargetLaneKind::FirstSliceContract => "first-slice-contract",
            TargetLaneKind::Planned => "planned",
        }
    }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub(crate) struct TargetDescriptor {
    pub(crate) target_id: &'static str,
    pub(crate) os_family: &'static str,
    pub(crate) arch: &'static str,
    pub(crate) support_level: TargetSupportLevel,
    pub(crate) lane_name: &'static str,
    pub(crate) lane_kind: TargetLaneKind,
}

impl TargetDescriptor {
    pub(crate) fn bootstrap_status(self) -> &'static str {
        match self.lane_kind {
            TargetLaneKind::HostBootstrap => "current-host-bootstrap",
            TargetLaneKind::FirstSliceContract | TargetLaneKind::Planned => "not-bootstrap",
        }
    }

    pub(crate) fn strategic_status(self) -> &'static str {
        match self.support_level {
            TargetSupportLevel::Immediate => "immediate-target",
            TargetSupportLevel::Later => "later-target",
        }
    }

    pub(crate) fn adapter_status(self) -> &'static str {
        match self.lane_kind {
            TargetLaneKind::HostBootstrap => "implemented",
            TargetLaneKind::FirstSliceContract => "contract-defined",
            TargetLaneKind::Planned => "planned",
        }
    }
}

pub(crate) const WINDOWS_X64_TARGET_ID: &str = "windows-x64";
pub(crate) const PULSEOS_X64_TARGET_ID: &str = "adenos-x64";
pub(crate) const LINUX_X64_TARGET_ID: &str = "linux-x64";
pub(crate) const MACOS_ARM64_TARGET_ID: &str = "macos-arm64";

const TARGET_TAXONOMY: &[TargetDescriptor] = &[
    TargetDescriptor {
        target_id: WINDOWS_X64_TARGET_ID,
        os_family: "windows",
        arch: "x64",
        support_level: TargetSupportLevel::Immediate,
        lane_name: "windows-x64-host-bootstrap",
        lane_kind: TargetLaneKind::HostBootstrap,
    },
    TargetDescriptor {
        target_id: PULSEOS_X64_TARGET_ID,
        os_family: "adenos",
        arch: "x64",
        support_level: TargetSupportLevel::Immediate,
        lane_name: "adenos-x64-first-slice",
        lane_kind: TargetLaneKind::FirstSliceContract,
    },
    TargetDescriptor {
        target_id: LINUX_X64_TARGET_ID,
        os_family: "linux",
        arch: "x64",
        support_level: TargetSupportLevel::Later,
        lane_name: "linux-x64-planned",
        lane_kind: TargetLaneKind::Planned,
    },
    TargetDescriptor {
        target_id: MACOS_ARM64_TARGET_ID,
        os_family: "macos",
        arch: "arm64",
        support_level: TargetSupportLevel::Later,
        lane_name: "macos-arm64-planned",
        lane_kind: TargetLaneKind::Planned,
    },
];

pub(crate) fn target_taxonomy() -> &'static [TargetDescriptor] {
    TARGET_TAXONOMY
}

pub(crate) fn canonical_target_ids() -> &'static [&'static str] {
    &[
        WINDOWS_X64_TARGET_ID,
        PULSEOS_X64_TARGET_ID,
        LINUX_X64_TARGET_ID,
        MACOS_ARM64_TARGET_ID,
    ]
}

pub(crate) fn default_target_id() -> &'static str {
    WINDOWS_X64_TARGET_ID
}

pub(crate) fn cli_target_usage_syntax() -> &'static str {
    "windows-x64|adenos-x64|linux-x64|macos-arm64"
}

pub(crate) fn supported_target_error_text() -> String {
    canonical_target_ids().join(", ")
}

pub(crate) fn cli_target_error_text() -> String {
    supported_target_error_text()
}

pub(crate) fn resolve_target_descriptor(target_id: &str) -> Option<&'static TargetDescriptor> {
    target_taxonomy()
        .iter()
        .find(|descriptor| descriptor.target_id == target_id)
}

pub(crate) fn normalize_cli_target_selection(raw: &str) -> Option<&'static str> {
    resolve_target_descriptor(raw).map(|descriptor| descriptor.target_id)
}
