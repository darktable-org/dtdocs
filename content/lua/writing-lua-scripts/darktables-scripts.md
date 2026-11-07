---
title: darktable's scripts (before version 5.6)
id: darktables-scripts
weight: 15
---

Prior to darktable version 5.6 scripts were not bundled with darktable and must be installed using the following instructions. 

### Download and Install

A collection of scripts is available in the [lua-scripts repository](https://github.com/darktable-org/lua-scripts). This also includes the script manager, which makes it easier to enable or disable individual scripts from the GUI. Documentation for these lua scripts is included in the [lua docs](https://docs.darktable.org/lua/stable/lua.scripts.manual/scripts/).

To use these existing scripts in versions before 5.6, they must be installed in darktable. This can in most cases be done within darktable's GUI, but depends on your OS and chosen method of installation. 

In any case, darktable should be started at least once to set up its directories. The config directories for most installation types are listed on the [configuration directory](../preferences-settings/config-directory.md) page.

Documentation for darktable's scripts is available in the [lua docs](https://docs.darktable.org/lua/stable/lua.scripts.manual/scripts/).

__Linux Package, AppImage and Flatpak__

The Lua scripts can be installed using darktable's GUI. Ensure git is installed on your system. If it isn't, use the package manager to install it. In the lighttable view, expand the lua scripts installer module in the lower-left corner. Ensure that select action: install scripts is selected, then click execute. Restart darktable once for the scripts module to appear in the lower-left corner. 

__Linux Snap Packages__

Installation through darktable's GUI is currently [broken](https://github.com/darktable-org/darktable/issues/20074), so you will have to take the following approach:

Ensure git is installed on your system. If it isn't, use the package manager to install it. You will have to download the Lua scripts using git, then create the `luarc` to let darktable load the script-manager. Close darktable, open a terminal and: 

    cd ~/snap/darktable/current
    git clone https://github.com/darktable-org/lua-scripts.git lua
    echo 'require "tools/script_manager"' >> luarc

Restart darktable twice, and the scripts module should appear in the lower-left corner.

__macOS__

The Lua scripts can be installed by using darktable's GUI. In lighttable view, expand the lua scripts installer module in the lower-left corner. Ensure that select action: install scripts is selected, then click execute. Restart darktable once for the scripts module to appear in the lower-left corner.

Alternatively you could use the console. Ensure git is installed on your system. If it isn't, use the package manager to install it. Then open a terminal and:

    cd ~/.config/darktable/
    git clone https://github.com/darktable-org/lua-scripts.git lua

__Windows__

Ensure git is installed on your system. Git can be obtained from [git for windows](https://gitforwindows.org/), or using Windows package manager winget inside a command prompt with `winget install git.git`. If you use the gitforwindows.org distribution, install the Git Bash Shell also as it will aid in debugging the scripts if necessary. 

The Lua scripts can now be installed by using darktable's GUI. In lighttable view, expand the lua scripts installer module in the lower-left corner. Ensure that select action: install scripts is selected, then click execute. Restart darktable once for the scripts module to appear in the lower-left corner.

__Updating__

To update the script repository, either use the scripts module GUI or open a terminal or command prompt and run the following commands: 

__Snap__

    cd ~/snap/darktable/current/lua
    git pull

__Flatpak__

    cd ~/.var/app/org.darktable.Darktable/config/darktable/lua
    git pull

__Linux and MacOS__

    cd ~/.config/darktable/lua/
    git pull

__Windows__

    cd %LOCALAPPDATA%\darktable\lua
    git pull
