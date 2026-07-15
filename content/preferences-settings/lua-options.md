---
title: lua options
id: lua-options
weight: 140
---

### From 5.6 onward 

These settings control how lua scripts are handled. 

check for updated lua scripts on start up
: automatically update (bundled) scripts to current version.

disable lua scripts
: do not run bundled lua scripts. 

Note: _disable lua scripts_ is not displayed if darktable detects `lua/tools/script_manager.lua` in the [configuration directory](config-directory.md) (e.g. when installed using a previous version of darktable).

### Pre 5.6 

These set up the behavior of the [Lua scripts installer](../module-reference/utility-modules/lighttable/lua-scripts-installer.md).

lua scripts installer log debug messages
: Write debugging messages to the log if the -d lua flag is specified

lua scripts installer don't show again
: Check this box to hide the Lua scripts installer in the lighttable if no lua scripts are installed.
