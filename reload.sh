#!/usr/bin/env sh
set -eu

THEME_NAME="GlassShell"

if ! command -v gsettings >/dev/null 2>&1; then
  echo "Missing command: gsettings" >&2
  exit 1
fi

if ! gsettings writable org.gnome.shell.extensions.user-theme name >/dev/null 2>&1; then
  echo "User Themes extension settings are not available." >&2
  echo "Install and enable the GNOME Shell User Themes extension first." >&2
  exit 1
fi

gsettings reset org.gnome.shell.extensions.user-theme name
gsettings set org.gnome.shell.extensions.user-theme name "$THEME_NAME"
gsettings set org.gnome.desktop.interface gtk-theme "$THEME_NAME"

echo "$THEME_NAME reloaded."
echo "For GTK applications, close and reopen the app to pick up CSS changes."
