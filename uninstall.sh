#!/usr/bin/env sh
set -eu

THEME_NAME="GlassShell"
TARGET_DIR="${HOME}/.themes/${THEME_NAME}"
LOCAL_LINK="${HOME}/.local/share/themes/${THEME_NAME}"

if [ -L "$LOCAL_LINK" ]; then
  unlink "$LOCAL_LINK"
fi

if [ -L "$TARGET_DIR" ]; then
  unlink "$TARGET_DIR"
fi

echo "$THEME_NAME symlinks removed."
