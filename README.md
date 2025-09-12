# OpenCode Deploy Script

This script (`__deploy.sh`) automates the deployment and configuration of OpenCode,
an interactive CLI tool for software engineering tasks.
<br><br>

## Features

- **Automatic Updates**: Downloads and installs the latest version of OpenCode from GitHub releases
if a newer version is available.
- **Configuration Setup**: Creates default configuration files for OpenCode.
- **Alacritty Integration**: Checks for Alacritty installation and optionally adds keyboard bindings (Shift+Enter for newline).
- **Desktop Integration**: Creates a desktop entry for easy launching
via Alacritty.
- **Icon Setup**: Copies the OpenCode icon to the appropriate system directory.

<br>

## Usage

### Basic Usage

Run the script to deploy OpenCode with default settings:

```bash
./__deploy.sh
```

### Skip Alacritty Configuration

To prevent the script from modifying Alacritty configuration:

```bash
./__deploy.sh --no-alacritty-config
```

<br>

## Requirements

- Bash shell
- `curl` for downloading releases
- `unzip` for extracting archives
- Alacritty (optional, required for desktop entry and config modifications)

<br>

## What the Script Does

1. **Version Check**: Fetches the latest release information from the OpenCode GitHub repository.
2. **Download & Install**: If a newer version exists, downloads the Linux x64 ZIP and installs it to `~/bin/`.
3. **OpenCode Config**: Creates `~/.config/opencode/opencode.json` with default settings including theme and keybindings.
4. **Icon Installation**: Copies `opencode.svg` to `~/.local/share/icons/` for desktop integration.
5. **Alacritty Config** (if enabled): Creates `~/.config/alacritty/alacritty.toml` with a keyboard binding
for Shift+Enter to insert newlines.
6. **Desktop Entry**: Creates `~/.local/share/applications/opencode.desktop` for system menu integration.

<br>

## Configuration Details

### OpenCode Config (`opencode.json`)

- Schema reference to OpenCode config
- Theme set to "catppuccin"
- Keybindings for input newline (Shift+Enter, Alt+Enter)

<br>

### Alacritty Config (`alacritty.toml`)

- Adds keyboard binding: Shift+Enter inserts a newline character
- Uses TOML format as per Alacritty specifications

<br>

### Desktop Entry

- Launches OpenCode via Alacritty
- Includes proper icon and categorization

<br>

## Notes

- The script is designed for Linux systems.
- All paths use standard XDG Base Directory specifications.
- The script will create necessary directories if they don't exist.
- If Alacritty is not installed, the desktop entry will still be created but may not function properly.
- Some linters may incorrectly flag "alacritty" as a misspelling of "alacrity"; this is a false positive.

<br>

## Troubleshooting

- Ensure you have write permissions to `~/bin/`, `~/.config/`, and `~/.local/`.
- If the script fails to download, check your internet connection and GitHub access.
- For Alacritty configuration issues, verify Alacritty is properly installed and configured.
