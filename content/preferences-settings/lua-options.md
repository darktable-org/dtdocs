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
: do not run lua scripts (bundled and user defined). 

Note: If you have a previous lua scripts installation (e.g. Lua API 9.6.0 from darktable 5.4) in your [configuration directory](config-directory.md) the option _disable scripts_ will not be displayed. After (automatically) updating the scripts through the script manager the option will appear. 


per-script configuration options (dropdown)
: allows selecting lua scripts to adjust settings they might contain. The available settings will then appear below. The lua scripts have to be  _activated_ in the scripts-module to become available here.

### Pre 5.6 

These set up the behavior of the [Lua scripts installer](../module-reference/utility-modules/lighttable/lua-scripts-installer.md).

lua scripts installer log debug messages
: Write debugging messages to the log if the -d lua flag is specified

lua scripts installer don't show again
: Check this box to hide the Lua scripts installer in the lighttable if no lua scripts are installed.
