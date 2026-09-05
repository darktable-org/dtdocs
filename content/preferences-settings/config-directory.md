---
title: configuration directory
id: config-directory
weight: 150
---

darktable stores its settings, presets, styles, library database, etc. in a default directory. This directory's location depends on your operating system and installation method. It can be changed by using the `--configdir` option (see [darktable invocation](../special-topics/program-invocation/darktable.md)).

The location of the configuration directory (and of other darktable directories and files) can be found by running [darktable](../special-topics/program-invocation/darktable.md) (or [darktable-cli](../special-topics/program-invocation/darktable-cli.md)) with the `--print-paths` (or `--print-paths-as-flags`) option.

## Default configuration paths

* Linux
    + Installed via package manager or AppImage: `$HOME/.config/darktable`
    + Flatpak: `$HOME/.var/app/org.darktable.Darktable/config/darktable`
    + snap: `$HOME/snap/darktable/current/`
* Windows: `%LOCALAPPDATA%\darktable`
	+ I.e., `C:\Users\<username>\AppData\Local\darktable`
* macOS: `$HOME/.config/darktable`

### Notable contents:

* `lua` (folder): Lua scripts.  Note: from 5.6 onwards Lua scripts are also bundled and this folder is not required. But it will be respected if present. Custom scripts can be added into a subfolder. See [Lua: basic principles](../lua/basic-principles.md).
* `styles` (folder): User created styles
* `darktablerc`: Main configuration file
* `data.db` and `library.db`: Central libraries: Image File Locations, metadata, edits etc.
* `luarc`: Defines Lua scripts to be loaded upon startup. Optional from 5.6 onwards, see [Lua: basic principles](../lua/basic-principles.md). 
* `shortcutsrc`: Keyboard shortcut configuration
* `user.css`: User-defined [CSS-tweaks](../preferences-settings/general/#css-theme-modifications)

## Cache directory

* Linux
    + Installed via package manager or AppImage: `$HOME/.cache/darktable`
    + Flatpak: `$HOME/.var/app/org.darktable.Darktable/cache/darktable`
* Windows: `%LOCALAPPDATA%\Microsoft\Windows\INetCache\darktable`
	+ I.e., `C:\Users\<username>\AppData\Local\Microsoft\Windows\INetCache\darktable`
* macOS: `$HOME/.cache/darktable`

The cache directory path can be overridden using the `--cachedir` option (see [darktable invocation](../special-topics/program-invocation/darktable.md)).
