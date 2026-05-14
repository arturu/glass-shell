# GlassShell

Small GNOME Shell 48 and GTK user theme based on Yaru-dark, with dark glass surfaces, translucent panels, and cyan/violet/magenta gradients.

## Layout

```text
~/.themes/GlassShell/
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

## Enable Shell

Install and enable the official User Themes extension, then select `GlassShell` in GNOME Tweaks or Extension Manager.

CLI option:

```sh
gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com
gsettings set org.gnome.shell.extensions.user-theme name GlassShell
```

## Enable Applications

Select `GlassShell` as the Applications/Legacy Applications theme in GNOME Tweaks.

CLI option:

```sh
gsettings set org.gnome.desktop.interface gtk-theme GlassShell
```

## Disable Shell

```sh
gsettings reset org.gnome.shell.extensions.user-theme name
```

## Disable Applications

```sh
gsettings reset org.gnome.desktop.interface gtk-theme
```

## Maintenance

This theme imports Yaru-dark/default GNOME Shell CSS and Yaru-dark GTK CSS, then keeps overrides narrow. After GNOME upgrades, check panel, quick settings, calendar, notifications, overview, modal dialogs, GTK headerbars, dialogs, lists, inputs, popovers, and buttons.
