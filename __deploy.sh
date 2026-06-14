#!/bin/bash

ADD_ALACRITTY_CONFIG=true

while [[ $# -gt 0 ]]; do
  case $1 in
  --no-alacritty-config)
    ADD_ALACRITTY_CONFIG=false
    shift
    ;;
  *)
    echo "Unknown option $1"
    exit 1
    ;;
  esac
done

DIR=$(dirname "$(readlink -f "$0")")
INSTALL_DIR="$HOME/.local/bin"
CONFIG_DIR="$HOME/.config/opencode"
COMMANDS_DIR="$CONFIG_DIR/commands"

IS_ARCH=false
if [[ -f /etc/os-release ]]; then
  . /etc/os-release
  [[ "$ID" == "arch" ]] && IS_ARCH=true
fi

if ! "$IS_ARCH"; then
  FILENAME="opencode-linux-x64.tar.gz"

  if ! command -v jq >/dev/null 2>&1; then
    echo "jq is required but not installed."
    exit 1
  fi
  if ! command -v tar >/dev/null 2>&1; then
    echo "tar is required but not installed."
    exit 1
  fi

  [[ -d "$INSTALL_DIR" ]] || mkdir -p "$INSTALL_DIR"

  URL=https://api.github.com/repos/anomalyco/opencode/releases/latest
  LATEST=$(curl --fail --silent "$URL" | jq -r '.tag_name | sub("^v"; "")')
  DOWNLOAD_URL=$(curl --fail --silent "$URL" | jq -r ".assets[] | select(.name == \"$FILENAME\") | .browser_download_url")

  if [[ -z "$LATEST" || -z "$DOWNLOAD_URL" ]]; then
    echo "Failed to fetch version information"
    exit 1
  fi

  NEED_DOWNLOAD=true
  if command -v opencode >/dev/null 2>&1; then
    INSTALLED=$(opencode --version 2>/dev/null || echo "")
    [[ "$INSTALLED" == "$LATEST" ]] && NEED_DOWNLOAD=false
  fi

  if "$NEED_DOWNLOAD"; then
    TEMP_DIR=$(mktemp -d)
    trap '[[ -d "$TEMP_DIR" ]] && rm -rf "$TEMP_DIR"' EXIT
    cd "$TEMP_DIR" || exit 1
    echo "Downloading opencode $LATEST..."
    curl -# --location --output "$FILENAME" "$DOWNLOAD_URL" || {
      echo "Download failed"
      exit 1
    }
    tar xfz "$FILENAME" --extract "opencode" || {
      echo "Untar failed"
      exit 1
    }
    install -m 755 opencode "$INSTALL_DIR" || {
      echo "Install failed"
      exit 1
    }
    echo "Installed opencode $LATEST"
  else
    echo "Already at the latest version ($LATEST)"
  fi
else
  echo "Arch Linux detected: skipping binary download"
fi

[[ -d "$CONFIG_DIR" ]] || mkdir -p "$CONFIG_DIR"
[[ -d "$COMMANDS_DIR" ]] || mkdir -p "$COMMANDS_DIR"
if [[ -f "$CONFIG_DIR/opencode.json" ]]; then
  cp "$CONFIG_DIR/opencode.json" "$CONFIG_DIR/opencode.json.bak"
fi
cat >"$CONFIG_DIR/opencode.json" <<-EOF
	{
	  "\$schema": "https://opencode.ai/config.json",
	  "theme": "catppuccin",
	  "keybinds": {
	    "input_newline": "shift+enter,alt+enter",
	    "messages_half_page_up": "ctrl+u",
	    "messages_half_page_down": "ctrl+d"
	  },
	  "lsp": true,
	  "permission": {
	    "bash": {
	      "*": "ask",
	      "git *": "allow",
	      "grep *": "allow",
	      "npx *": "allow",
	      "ruff *": "allow",
	      "shfmt *": "allow",
	      "prettier *": "allow",
	      "shellcheck *": "allow",
	      "ansible-lint *": "allow",
	      "stylua *": "allow",
	      "rm *": "ask",
	      "chmod *": "ask",
	      "dd *": "deny",
	      "mkfs*": "deny"
	    }
	  },
	  "mcp": {
	    "context7": {
	      "type": "remote",
	      "url": "https://mcp.context7.com/mcp"
	    },
	    "sequential-thinking": {
	      "type": "local",
	      "command": ["npx", "-y", "@modelcontextprotocol/server-sequential-thinking"]
	    },
	    "memory": {
	      "type": "local",
	      "command": ["npx", "-y", "@modelcontextprotocol/server-memory"]
	    }
	  }
	}
EOF

cp -a "$DIR/commands/"*.md "$COMMANDS_DIR"

ICON_DIR="$HOME/.local/share/icons"
[[ -d "$ICON_DIR" ]] || mkdir -p "$ICON_DIR"
cp "$DIR/opencode.svg" "$ICON_DIR/opencode.svg"

if command -v alacritty >/dev/null 2>&1; then
  if "$ADD_ALACRITTY_CONFIG"; then
    ALACRITTY_CONFIG_DIR="$HOME/.config/alacritty"
    mkdir -p "$ALACRITTY_CONFIG_DIR"
    ALACRITTY_CONFIG_FILE="$ALACRITTY_CONFIG_DIR/alacritty.toml"
    cat >"$ALACRITTY_CONFIG_FILE" <<-EOF
			[keyboard]
			bindings = [
			  { key = "Enter", mods = "Shift", chars = "\n" },
			]
		EOF
  fi
fi

ALACRITTY_PATH=$(which alacritty 2>/dev/null || echo "/usr/bin/alacritty")

DESKTOP_DIR="$HOME/.local/share/applications"
[[ -d "$DESKTOP_DIR" ]] || mkdir -p "$DESKTOP_DIR"
cat >"$DESKTOP_DIR/opencode.desktop" <<-EOF
	[Desktop Entry]
	Name=OpenCode
	Exec=$ALACRITTY_PATH --command "$INSTALL_DIR/opencode"
	Icon=$HOME/.local/share/icons/opencode.svg
	Type=Application
	Categories=Development;
EOF
