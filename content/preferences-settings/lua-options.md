---
title: lua options
id: lua-options
weight: 140
---

__Pre 5.6__ these set up the behavior of the [Lua scripts installer](../module-reference/utility-modules/lighttable/lua-scripts-installer.md).

lua scripts installer log debug messages
: Write debugging messages to the log if the -d lua flag is specified

lua scripts installer don't show again
: Check this box to hide the Lua scripts installer in the lighttable if no lua scripts are installed.

From __5.6 onward__ these settings control how lua scripts are handled. 

check for updated lua scripts on start up
: automatically update (bundled) scripts to current version

disable lua scripts
: do not run lua scripts (both bundled and user defined)
