---
title: "basic principles: luarc files"
id: basic-principles
weight: 20
---

At startup, darktable will automatically run the Lua scripts `$DARKTABLE/share/darktable/luarc` and `$HOME/.config/darktable/luarc` (where `$DARKTABLE` represents the darktable installation directory and `$HOME` represents your home directory).

The specific path of luarc depends on your OS and chosen method of installation. See [config-dirs](../content/preferences-settings/config-folder.md) for detailed information.

This is the only time darktable will run Lua scripts by itself and can be used to load other scripts (like the script manager). These scripts can register callbacks to perform actions on various darktable events. This callback mechanism is the primary method of triggering lua actions. 

### Keeping things tidy

If you want to add your own scripts to darktable you could simply write their entirety into luarc. To keep things tidy you could consider saving your script inside of darktable's configuration directory to e.g. `lua/user/user-script.lua` and tell darktable to load it by adding `require "user/user-script.lua"` to luarc. If you are using the script-manager (which you likely are if you follow the guide to install the pre-existing scripts) you will then have to activate the script in the scripts utility module by changing the folder to "user" and clicking the on/off button next to the corresponding script. 
