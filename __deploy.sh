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

INSTALL_DIR="$HOME/bin"
FILENAME="opencode-linux-x64.zip"
URL=https://api.github.com/repos/sst/opencode/releases/latest
CONFIG_DIR="$HOME/.config/opencode"

[[ -d "$INSTALL_DIR" ]] || mkdir -p "$INSTALL_DIR"

LATEST=$(curl -s "$URL" | awk -F'"' '/"tag_name": "/ {gsub(/^v/, "", $4); print $4}')

if [[ $? -ne 0 || -z "$LATEST" ]]; then
  echo "Failed to fetch version information"
  exit 1
fi

if command -v opencode >/dev/null 2>&1; then
  INSTALLED=$(opencode --version)
  if [[ "$INSTALLED" != "$LATEST" ]]; then
    TEMP_DIR=$(mktemp -d)
    cd "$TEMP_DIR" || exit 1
    DOWNLOAD_URL="https://github.com/sst/opencode/releases/download/v$LATEST/$FILENAME"
    curl -# -L -o "$FILENAME" "$DOWNLOAD_URL" || {
      echo "Download failed"
      exit 1
    }
    unzip -q "$FILENAME" || {
      echo "Unzip failed"
      exit 1
    }
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
cat >"$CONFIG_DIR/opencode.json" <<-EOF
{
  "\$schema": "https://opencode.ai/config.json",
  "theme": "catppuccin",
  "keybinds": {
    "input_newline": "shift+enter,alt+enter"
  }
}
EOF

ICON_DIR="$HOME/.local/share/icons"
[[ -d "$ICON_DIR" ]] || mkdir -p "$ICON_DIR"
cp "$(dirname "$0")/opencode.svg" "$ICON_DIR/opencode.svg"

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


DESKTOP_DIR="$HOME/.local/share/applications"
[[ -d "$DESKTOP_DIR" ]] || mkdir -p "$DESKTOP_DIR"
cat >"$DESKTOP_DIR/opencode.desktop" <<-EOF
[Desktop Entry]
Name=OpenCode
Exec=/usr/bin/alacritty --command "$INSTALL_DIR/opencode"
Icon=$HOME/.local/share/icons/opencode.svg
Type=Application
Categories=Development;
EOF
