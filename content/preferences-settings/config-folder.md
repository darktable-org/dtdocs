---
title: configuration folder
id: config-folder
weight: 150
---

darktable stores its settings, presets, styles, library database, etc. in a default folder. This folder's location depends on your operating system and installation method. It can be changed by using the `--config-dir` option (see [darktable invocation](../special-topics/program-invocation/darktable.md)).

* Linux 
    + Installed via package manager or AppImage: `$HOME/.config/darktable`
    + Flatpak: `$HOME/.var/app/org.darktable.Darktable/config/darktable`
* Windows: `%LOCALAPPDATA%\darktable`
	+ E.g. `C:\Users\<username>\AppData\Local\darktable`
* macOS: `$HOME/.config/darktable`

## Notable files/folders:

* lua (folder): Contains all lua scripts
* styles (folder): User created styles
* darktablerc: Main configuration file
* data.db and library.db: Central libraries: Image File Locations, metadata, edits etc.
* luarc: Defines Lua scripts to be loaded upon startup
* shortcutsrc: Keyboard shortcut configuration
* user.css: User-defined [CSS-tweaks](../preferences-settings/general/#css-theme-modifications)
