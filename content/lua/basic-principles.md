---
title: "basic principles"
id: basic-principles
weight: 20
---

Scripts can register callbacks to perform actions on various darktable events. This callback mechanism is the primary method of triggering lua actions. 

The central orchestrator for lua scripts is the _script manager_, which spawns the utility module __scripts__ in the lighttable and loads darktable's bundled scripts. 

Lua scripts can be disabled in [preferences/lua options](../preferences-settings/lua-options.md).

### how darktable loads scripts (and the script manager)

darktable treats two kinds of location differently: Files that are _executed_ as Lua code, and directories that are _scanned_ for scripts:

* Executed at startup:
    * `$DARKTABLE/share/darktable/luarc`: run by darktable itself. This is the entry point that launches the script manager. It serves internal purposes only and should not be edited. $DARKTABLE is the program's installation directory.
    * `[configuration-directory]/luarc`: run by the script manager, if present. This is one way of running your own scripts (see below).
* Scanned for `.lua` scripts (which then appear in the scripts-module):
    * `$DARKTABLE/share/darktable/lua-scripts/`: darktable's bundled scripts.
    * `[configuration-directory]/lua/[folder]`: your own scripts (see below).

The [configuration directory](../preferences-settings/config-directory.md) is specific to your OS. 

Thus you can __add your own scripts__ as follows:
* Have the scripts-module pick them up: (recommended)
    * Place your script e.g. in `[configuration-directory]/lua/user/myscript.lua`
    * Activate it in the scripts-module by selecting the appropriate folder (in this example "user") and clicking the on/off button next to the corresponding script. 
    * Note: For the scripts-module to pick up scripts they will need to be in a _subfolder_ of `configuration-directory/lua`.
* Use `luarc` (runs at startup automatically)
    * Either write the code directly into `[configuration-directory]/luarc`. This works, but is not tidy for anything beyond a few lines. 
    * Or keep the code in its own file and `require` through `luarc`: E.g. a script present in `[configuration-directory]/lua/userscript.lua` could be loaded by adding `require "userscript"` (note that .lua is omitted here).


### a note on lua-scripts installations from previous darktable versions

In previous versions of darktable this had to be installed manually (see [darktable's scripts](darktables-scripts.md)). 

To remain compatible with such an installation, `require` looks for a script manager in your configuration directory before loading the bundled one: if `[configuration-directory]/lua/tools/script_manager.lua` is present (for example from a manual pre-5.6 installation), _that_ script manager is run instead of the bundled one. In this case the luarc file in the configuration directory is not loaded. 
