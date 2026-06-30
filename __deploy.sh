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
AGENTS_DIR="$CONFIG_DIR/agents"

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
[[ -d "$AGENTS_DIR" ]] || mkdir -p "$AGENTS_DIR"

for f in opencode.json tui.json AGENTS.md; do
  [[ -f "$CONFIG_DIR/$f" ]] && cp "$CONFIG_DIR/$f" "$CONFIG_DIR/$f.bak"
  cp "$DIR/$f" "$CONFIG_DIR/$f"
done

cp -a "$DIR/commands/"*.md "$COMMANDS_DIR"
cp -a "$DIR/agents/"*.md "$AGENTS_DIR"

ICON_DIR="$HOME/.local/share/icons"
ICON_THEME_DIR="$ICON_DIR/hicolor/scalable/apps"
[[ -d "$ICON_DIR" ]] || mkdir -p "$ICON_DIR"
[[ -d "$ICON_THEME_DIR" ]] || mkdir -p "$ICON_THEME_DIR"
cp "$DIR/opencode.svg" "$ICON_DIR/opencode.svg"
cp "$DIR/opencode.svg" "$ICON_THEME_DIR/opencode.svg"
gtk-update-icon-cache -f -t "$ICON_DIR/hicolor" >/dev/null 2>&1 || true
# Drop GNOME Shell's stale icon cache so updated launcher icons are picked up
rm -f "$HOME/.cache/icon-cache.kcache"

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
CHROME_PATH=$(which google-chrome 2>/dev/null || echo "/usr/bin/google-chrome")
WEB_PORT=4096
OPENCODE="$(which opencode)"
DESKTOP_DIR="$HOME/.local/share/applications"
[[ -d "$DESKTOP_DIR" ]] || mkdir -p "$DESKTOP_DIR"
cat >"$DESKTOP_DIR/opencode.desktop" <<-EOF
	[Desktop Entry]
	Name=OpenCode
	Exec=$ALACRITTY_PATH --class opencode --command "$OPENCODE"
	Icon=opencode
	Type=Application
	Categories=Development;
	StartupWMClass=opencode
EOF

cat >"$DESKTOP_DIR/opencode-web.desktop" <<-EOF
	[Desktop Entry]
	Name=OpenCode Web
	Exec=sh -c "$OPENCODE serve --port $WEB_PORT & sleep 1; $CHROME_PATH --app=http://127.0.0.1:$WEB_PORT --class=opencode-web --ozone-platform=x11; kill %%1"
	Icon=opencode
	Type=Application
	Categories=Development;
	StartupWMClass=opencode-web
EOF
