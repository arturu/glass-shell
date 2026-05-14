# GlassShell

Dark glass GNOME Shell and GTK theme based on Yaru-dark.

## Dependencies

- GNOME Shell 48
- Yaru dark theme files:
  - `yaru-theme-gnome-shell`
  - `yaru-theme-gtk`

On Ubuntu/Debian:

```sh
sudo apt install yaru-theme-gnome-shell yaru-theme-gtk
```

## Install For Development

```sh
./install.sh
gsettings set org.gnome.shell.extensions.user-theme name GlassShell
gsettings set org.gnome.desktop.interface gtk-theme GlassShell
```

`install.sh` creates symlinks from the working tree to:

```text
~/.themes/GlassShell
~/.local/share/themes/GlassShell
```

That means CSS changes in this repository are immediately reflected in the installed theme path.

## Test Changes

For GNOME Shell changes, reload the shell theme after editing:

```sh
gsettings reset org.gnome.shell.extensions.user-theme name
gsettings set org.gnome.shell.extensions.user-theme name GlassShell
```

On X11 you can also press `Alt+F2`, type `r`, and press Enter to restart GNOME Shell. On Wayland, log out and back in if the shell does not reload cleanly.

For GTK changes, close and reopen the application being tested.

## Uninstall

```sh
./uninstall.sh
```

## Layout

```text
GlassShell/
  index.theme
  gnome-shell/
    gnome-shell.css
  gtk-3.0/
    gtk.css
    gtk-dark.css
  gtk-4.0/
    gtk.css
    gtk-dark.css
  gtk-shared.css
```
