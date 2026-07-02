---
title: lua options
id: lua-options
weight: 140
---

Pre 5.6 these set up the behavior of the [Lua scripts installer](../module-reference/utility-modules/lighttable/lua-scripts-installer.md).

lua scripts installer log debug messages
: Write debugging messages to the log if the -d lua flag is specified

lua scripts installer don't show again
: Check this box to hide the Lua scripts installer in the lighttable if no lua scripts are installed.

From 5.6 onward these settings control how the bundled lua scripts are handled. 

check for updated lua scripts on start up
: automatically update scripts to current version

disable lua scripts
: do not run the lua scripts
