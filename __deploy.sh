#!/bin/bash

ADD_ALACRITTY_CONFIG=true
PROFILE=""

while [[ $# -gt 0 ]]; do
  case $1 in
  --no-alacritty-config)
    ADD_ALACRITTY_CONFIG=false
    shift
    ;;
  --profile)
    PROFILE="$2"
    shift 2
    ;;
  *)
    echo "Unknown option $1"
    exit 1
    ;;
  esac
done

case "$PROFILE" in
home | work | claude) ;;
*)
  echo "Error: --profile home|work|claude is required"
  exit 1
  ;;
esac

DIR=$(dirname "$(readlink -f "$0")")
OPENCODE_BIN="$HOME/.opencode/bin/opencode"
CONFIG_DIR="$HOME/.config/opencode"
COMMANDS_DIR="$CONFIG_DIR/commands"
AGENTS_DIR="$CONFIG_DIR/agents"
SKILLS_DIR="$CONFIG_DIR/skills"

[[ -d "$CONFIG_DIR" ]] || mkdir -p "$CONFIG_DIR"
[[ -d "$COMMANDS_DIR" ]] || mkdir -p "$COMMANDS_DIR"
[[ -d "$AGENTS_DIR" ]] || mkdir -p "$AGENTS_DIR"
[[ -d "$SKILLS_DIR" ]] || mkdir -p "$SKILLS_DIR"

for f in tui.json AGENTS.md README_copilot_models.md; do
  [[ -f "$CONFIG_DIR/$f" ]] && cp "$CONFIG_DIR/$f" "$CONFIG_DIR/$f.bak"
  cp "$DIR/$f" "$CONFIG_DIR/$f"
done
command -v jq >/dev/null 2>&1 || {
  echo "Error: jq is required"
  exit 1
}
jq -s --arg home "$HOME" '
  .[0] * .[1]
  | walk(if type == "string" then gsub("HOME/"; $home + "/") else . end)
' "$DIR/opencode_template.json" "$DIR/models.$PROFILE.json" > "$CONFIG_DIR/opencode.json"

cp -a "$DIR/commands/"*.md "$COMMANDS_DIR"
cp -a "$DIR/agents/"*.md "$AGENTS_DIR"

for skill_dir in "$DIR/skills/"*/; do
  [[ -d "$skill_dir" ]] || continue
  name=$(basename "$skill_dir")
  [[ -f "$skill_dir/SKILL.md" ]] || continue
  [[ -d "$SKILLS_DIR/$name" ]] || mkdir -p "$SKILLS_DIR/$name"
  cp -a "$skill_dir/SKILL.md" "$SKILLS_DIR/$name/SKILL.md"
done

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
DESKTOP_DIR="$HOME/.local/share/applications"
[[ -d "$DESKTOP_DIR" ]] || mkdir -p "$DESKTOP_DIR"
cat >"$DESKTOP_DIR/opencode.desktop" <<-EOF
	[Desktop Entry]
	Name=OpenCode
	Exec=$ALACRITTY_PATH --class opencode --command "$OPENCODE_BIN"
	Icon=opencode
	Type=Application
	Categories=Development;
	StartupWMClass=opencode
EOF

cat >"$DESKTOP_DIR/opencode-web.desktop" <<-EOF
	[Desktop Entry]
	Name=OpenCode Web
	Exec=zsh -c "$OPENCODE_BIN serve --port $WEB_PORT & sleep 1; $CHROME_PATH --app=http://127.0.0.1:$WEB_PORT --class=opencode-web --ozone-platform=x11; kill %%1"
	Icon=opencode
	Type=Application
	Categories=Development;
	StartupWMClass=opencode-web
EOF
