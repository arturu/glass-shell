#!/usr/bin/env sh
set -eu

THEME_NAME="GlassShell"
REPO_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
SOURCE_DIR="$REPO_DIR/$THEME_NAME"
THEMES_DIR="${HOME}/.themes"
LOCAL_THEMES_DIR="${HOME}/.local/share/themes"
TARGET_DIR="${THEMES_DIR}/${THEME_NAME}"
LOCAL_LINK="${LOCAL_THEMES_DIR}/${THEME_NAME}"

missing=0
for dependency in \
  /usr/share/themes/Yaru-dark/gnome-shell/gnome-shell.css \
  /usr/share/themes/Yaru-dark/gtk-3.0/gtk.css \
  /usr/share/themes/Yaru-dark/gtk-3.0/gtk.gresource \
  /usr/share/themes/Yaru-dark/gtk-4.0/gtk.css \
  /usr/share/themes/Yaru-dark/gtk-4.0/gtk.gresource
do
  if [ ! -f "$dependency" ]; then
    echo "Missing dependency: $dependency" >&2
    missing=1
  fi
done

if [ "$missing" -ne 0 ]; then
  echo "Install Yaru first. On Ubuntu/Debian try:" >&2
  echo "  sudo apt install yaru-theme-gnome-shell yaru-theme-gtk" >&2
  exit 1
fi

if [ ! -d "$SOURCE_DIR" ]; then
  echo "Missing theme directory: $SOURCE_DIR" >&2
  exit 1
fi

mkdir -p "$THEMES_DIR" "$LOCAL_THEMES_DIR"

if [ -L "$TARGET_DIR" ]; then
  unlink "$TARGET_DIR"
elif [ -e "$TARGET_DIR" ]; then
  backup="${TARGET_DIR}.backup.$(date +%Y%m%d%H%M%S)"
  mv "$TARGET_DIR" "$backup"
  echo "Existing theme moved to: $backup"
fi

if [ -L "$LOCAL_LINK" ]; then
  unlink "$LOCAL_LINK"
elif [ -e "$LOCAL_LINK" ]; then
  backup="${LOCAL_LINK}.backup.$(date +%Y%m%d%H%M%S)"
  mv "$LOCAL_LINK" "$backup"
  echo "Existing local theme entry moved to: $backup"
fi

ln -s "$SOURCE_DIR" "$TARGET_DIR"
ln -s "$TARGET_DIR" "$LOCAL_LINK"

echo "$THEME_NAME installed as a development symlink."
echo "Enable it with:"
echo "  gsettings set org.gnome.shell.extensions.user-theme name $THEME_NAME"
echo "  gsettings set org.gnome.desktop.interface gtk-theme $THEME_NAME"
