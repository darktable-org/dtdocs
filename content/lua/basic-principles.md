---
title: "basic principles"
id: basic-principles
weight: 20
---

The central orchestrator for lua scripts is the __script manager__, which spawns the utility module __scripts__ in the lighttable. 

In previous versions of darktable this had to be installed manually (see [darktables scripts](darktables-scripts.md)). If darktable detects `lua/tools/script-manager.lua` (e.g. from a previous version) within darktable's [configuration directory](../preferences-settings/config-directory.md) it will run the script manager in the config-directory instead of the bundled one. 

Scripts can register callbacks to perform actions on various darktable events. This callback mechanism is the primary method of triggering lua actions. 

The loading of the bundled lua scripts on startup can be disabled in [preferences/lua options](../preferences-settings/lua-options.md).

### Adding your own scripts

The script manager will automatically check for Lua scripts present in `lua/` within the [configuration directory](../preferences-settings/config-directory.md). If e.g. a custom script is present as `lua/user/userscript.lua` the script manager will pick it up and it will be available through the scripts module in the lighttable. 

If you are using the script-manager (which you likely are) you will then have to activate added scripts in the scripts utility module by selecting the appropriate folder and clicking the on/off button next to the corresponding script. 

At startup, darktable will also automatically run the Lua scripts `$DARKTABLE/share/darktable/luarc` (where `$DARKTABLE` represents the darktable installation directory) and `luarc` in the darktable [configuration directory](../preferences-settings/config-directory.md). 

If you want you could also write your scripts entirety into `luarc` (which is not very convenient). If you dont want to use or rely on the script manager you can also tell darktable to load a script by including it in one of the two `luarc` files (e.g. a script present in the config directory in `lua/user/user-script` could be loaded by adding `require "user/user-script"` to `luarc`. 

