param(
    [string]$RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
)

$ErrorActionPreference = "Stop"

function Get-DocText {
    param(
        [string[]]$Lines,
        [int]$StartIndex
    )

    $docLines = New-Object System.Collections.Generic.List[string]
    $index = $StartIndex
    while ($index -lt $Lines.Length) {
        $trimmed = $Lines[$index].Trim()
        if ($trimmed -eq "*/") {
            break
        }

        if ($trimmed.StartsWith("/**")) {
            $trimmed = $trimmed.Substring(3).Trim()
        } elseif ($trimmed.StartsWith("*")) {
            $trimmed = $trimmed.Substring(1).Trim()
        }

        if ($trimmed.Length -gt 0) {
            $docLines.Add($trimmed)
        }
        $index += 1
    }

    return ($docLines -join "`n")
}

function Find-NextCodeLine {
    param(
        [string[]]$Lines,
        [int]$StartIndex
    )

    $index = $StartIndex
    while ($index -lt $Lines.Length) {
        $trimmed = $Lines[$index].Trim()
        if ($trimmed.Length -eq 0) {
            $index += 1
            continue
        }
        if ($trimmed.StartsWith("*") -or $trimmed -eq "*/") {
            $index += 1
            continue
        }
        return $index
    }

    return -1
}

function Is-TypeDeclaration {
    param([string]$Trimmed)

    if ($Trimmed.StartsWith("/")) {
        return $false
    }

    return $Trimmed -match '(^| )class ' -or
        $Trimmed -match '(^| )@interface ' -or
        $Trimmed -match '(^| )interface ' -or
        $Trimmed -match '(^| )enum '
}

function Get-TypeKind {
    param([string]$Trimmed)

    if ($Trimmed -match '(^| )@interface ') {
        return "annotation"
    }
    if ($Trimmed -match '(^| )interface ') {
        return "interface"
    }
    if ($Trimmed -match '(^| )enum ') {
        return "enum"
    }
    return "class"
}

function Escape-MarkdownCode {
    param([string]$Text)

    return $Text.Replace('`', '``')
}

function Normalize-Declaration {
    param([string]$Text)

    $trimmed = $Text.Trim()
    if ($trimmed.EndsWith("{")) {
        $trimmed = $trimmed.Substring(0, $trimmed.Length - 1).TrimEnd()
    }
    return $trimmed
}

$stdlibRoot = Join-Path $RepoRoot "stdlib\src\com\pulse"
$docsRoot = Join-Path $RepoRoot "docs\language\stdlib"
$docsPulseRoot = Join-Path $docsRoot "com\pulse"

# This generator is intentionally destructive for the generated stdlib subtree.
# Each run rewrites the checked-in stdlib reference docs from current PulseDoc
# so the published language docs do not drift from the shipped source surface.
if (Test-Path $docsPulseRoot) {
    Remove-Item -Recurse -Force $docsPulseRoot
}
New-Item -ItemType Directory -Force -Path $docsPulseRoot | Out-Null

$pulseFiles = Get-ChildItem -Path $stdlibRoot -Recurse -File -Filter *.pulse | Sort-Object FullName

foreach ($file in $pulseFiles) {
    $relative = $file.FullName.Substring($stdlibRoot.Length).TrimStart('\')
    $relativeDoc = [System.IO.Path]::ChangeExtension($relative, ".md")
    $outPath = Join-Path $docsPulseRoot $relativeDoc
    $outDir = Split-Path -Parent $outPath
    New-Item -ItemType Directory -Force -Path $outDir | Out-Null

    $lines = Get-Content $file.FullName
    $packageLine = ($lines | Where-Object { $_.Trim().StartsWith("package ") } | Select-Object -First 1).Trim()
    $packageName = $packageLine.Substring("package ".Length).TrimEnd(';')

    $typeDoc = ""
    $typeDecl = ""
    $typeName = [System.IO.Path]::GetFileNameWithoutExtension($file.Name)
    $typeKind = "class"
    $members = New-Object System.Collections.Generic.List[object]

    for ($index = 0; $index -lt $lines.Length; $index += 1) {
        $trimmed = $lines[$index].Trim()
        if (-not $trimmed.StartsWith("/**")) {
            continue
        }

        $docText = Get-DocText -Lines $lines -StartIndex $index
        $nextIndex = Find-NextCodeLine -Lines $lines -StartIndex ($index + 1)
        if ($nextIndex -lt 0) {
            continue
        }

        $declaration = $lines[$nextIndex].Trim()
        if (Is-TypeDeclaration -Trimmed $declaration) {
            $typeDoc = $docText
            $typeDecl = Normalize-Declaration $declaration
            $typeKind = Get-TypeKind -Trimmed $declaration
        } else {
            $members.Add([PSCustomObject]@{
                Declaration = Normalize-Declaration $declaration
                Doc         = $docText
            }) | Out-Null
        }
    }

    if ([string]::IsNullOrWhiteSpace($typeDecl)) {
        throw "No documented type declaration found for $($file.FullName)"
    }

    $qualifiedName = "${packageName}.${typeName}"
    $sourceRelative = "stdlib/src/com/pulse/$($relative.Replace('\', '/'))"

    $content = New-Object System.Collections.Generic.List[string]
    $content.Add("# $qualifiedName") | Out-Null
    $content.Add("") | Out-Null
    $content.Add(('Kind: ``{0}``' -f $typeKind)) | Out-Null
    $content.Add("") | Out-Null
    $content.Add(('Source: ``{0}``' -f $sourceRelative)) | Out-Null
    $content.Add("") | Out-Null
    $content.Add("## Summary") | Out-Null
    $content.Add("") | Out-Null
    foreach ($line in ($typeDoc -split "`n")) {
        $content.Add($line) | Out-Null
    }
    $content.Add("") | Out-Null
    $content.Add("## Declaration") | Out-Null
    $content.Add("") | Out-Null
    $content.Add('```pulse') | Out-Null
    $content.Add($typeDecl) | Out-Null
    $content.Add('```') | Out-Null

    if ($members.Count -gt 0) {
        $content.Add("") | Out-Null
        $content.Add("## Members") | Out-Null
        foreach ($member in $members) {
            $content.Add("") | Out-Null
            $content.Add(('### ``{0}``' -f (Escape-MarkdownCode $member.Declaration))) | Out-Null
            $content.Add("") | Out-Null
            foreach ($line in ($member.Doc -split "`n")) {
                $content.Add($line) | Out-Null
            }
        }
    }

    Set-Content -Path $outPath -Value $content -Encoding UTF8
}
