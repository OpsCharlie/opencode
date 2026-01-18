#!/bin/bash

ADD_ALACRITTY_CONFIG=true
VERBOSE=false

while [[ $# -gt 0 ]]; do
  case $1 in
    --no-alacritty-config)
      ADD_ALACRITTY_CONFIG=false
      shift
      ;;
    --verbose)
      VERBOSE=true
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
FILENAME="opencode-linux-x64.tar.gz"
URL=https://api.github.com/repos/sst/opencode/releases/latest
CONFIG_DIR="$HOME/.config/opencode"

if ! command -v jq >/dev/null 2>&1; then
  echo "jq is required but not installed."
  exit 1
fi
if ! command -v tar >/dev/null 2>&1; then
  echo "tar is required but not installed."
  exit 1
fi

[[ -d "$INSTALL_DIR" ]] || mkdir -p "$INSTALL_DIR"

LATEST=$(curl --fail --silent "$URL" | jq -r '.tag_name | sub("^v"; "")')
if [[ $? -ne 0 || -z "$LATEST" ]]; then
  echo "Failed to fetch version information"
  exit 1
fi

if command -v opencode >/dev/null 2>&1; then
  INSTALLED=$(opencode --version)
  if [[ $? -ne 0 ]]; then
    INSTALLED=""
    $VERBOSE && echo "Failed to get installed version, will reinstall"
  else
    $VERBOSE && echo "Installed version: $INSTALLED"
  fi
  if [[ "$INSTALLED" != "${LATEST}" ]]; then
    TEMP_DIR=$(mktemp -d)
    trap '[[ -d "$TEMP_DIR" ]] && rm -rf "$TEMP_DIR"' EXIT
    cd "$TEMP_DIR" || exit 1
    DOWNLOAD_URL="https://github.com/sst/opencode/releases/latest/download/$FILENAME"
    $VERBOSE && echo "Downloading from $DOWNLOAD_URL"
    curl --head --fail "$DOWNLOAD_URL" > /dev/null 2>&1 || {
      echo "Download URL not accessible"
      exit 1
    }
    curl -# --location --output "$FILENAME" "$DOWNLOAD_URL" || {
      echo "Download failed"
      exit 1
    }
    $VERBOSE && echo "Untar $FILENAME"
    tar xfz "$FILENAME" --extract "opencode" || {
      echo "Untar failed"
      exit 1
    }
    $VERBOSE && echo "Installing to $INSTALL_DIR"
    mv opencode "$INSTALL_DIR" || {
      echo "Move failed"
      exit 1
    }
    cd .. && rm -rf "$TEMP_DIR"

  else
    echo "Already at the latest version ($LATEST)"
  fi
fi

[[ -d "$CONFIG_DIR" ]] || mkdir -p "$CONFIG_DIR"
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
    "messages_half_page_down": "ctrl+d",
  }
}
EOF

ICON_DIR="$HOME/.local/share/icons"
[[ -d "$ICON_DIR" ]] || mkdir -p "$ICON_DIR"
cp "$DIR/opencode.svg" "$ICON_DIR/opencode.svg"

if command -v alacritty >/dev/null 2>&1; then
  if $ADD_ALACRITTY_CONFIG; then
    ALACRITTY_CONFIG_DIR="$HOME/.config/alacritty"
    mkdir -p "$ALACRITTY_CONFIG_DIR"
    ALACRITTY_CONFIG_FILE="$ALACRITTY_CONFIG_DIR/alacritty.toml"
    cat > "$ALACRITTY_CONFIG_FILE" <<-EOF
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
