---
title: configuration directory
id: config-directory
weight: 150
---

darktable stores its settings, presets, styles, library database, etc. in a default directory. This directory's location depends on your operating system and installation method. It can be changed by using the `--config-dir` option (see [darktable invocation](../special-topics/program-invocation/darktable.md)).

* Linux 
    + Installed via package manager or AppImage: `$HOME/.config/darktable`
    + Flatpak: `$HOME/.var/app/org.darktable.Darktable/config/darktable`
    + snap: `$HOME/snap/darktable/current/`
* Windows: `%LOCALAPPDATA%\darktable`
	+ E.g. `C:\Users\<username>\AppData\Local\darktable`
* macOS: `$HOME/.config/darktable`

## Notable files/folders:

* `lua` (folder): Lua scripts.  Note: from 5.6 onwards Lua scripts are also bundled and this folder is not required. But it will be respected if present. Custom scripts can be added into a subfolder. See [Lu: basic principles](../lua/basic-principles.md).
* `styles` (folder): User created styles
* `darktablerc`: Main configuration file
* `data.db` and `library.db`: Central libraries: Image File Locations, metadata, edits etc.
* `luarc`: Defines Lua scripts to be loaded upon startup. Optional from 5.6 onwards, see [Lua: basic principles](../lua/basic-principles.md). 
* `shortcutsrc`: Keyboard shortcut configuration
* `user.css`: User-defined [CSS-tweaks](../preferences-settings/general/#css-theme-modifications)
