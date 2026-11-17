---
title: using Lua scripts
id: using-lua-scripts
weight: 10
---

# overview

darktable can execute scripts written in [Lua](http://www.lua.org/) to perform an extensive array of actions. Some examples include calling external applications (e.g. after exporting an image), creating keyboard shortcuts that trigger multiple actions in one keystroke, or building entire utility modules.

darktable comes with a number of [scripts included](https://docs.darktable.org/lua/stable/lua.scripts.manual/scripts/overview/). The central orchestrator for scripts is the utility module [scripts](../module-reference/utility-modules/lighttable/scripts.md) available in the lighttable. Before darktable 5.6 scripts had to be [installed](#installing-and-updating-scripts) first.

The comprehensive documentation on Lua scripting in darktable can be found in the [darktable lua documentation](https://docs.darktable.org/lua/stable/). For a detailed introduction into the Lua language itself, see the [Lua reference manual](http://www.lua.org/manual/5.4/manual.html).


# enabling scripts

darktable (starting at version 5.6) comes with several built-in and contributed scripts for performing various actions. 

To use a supplied script, you first must enable it. In this example we will enable the script [_rename-images_](https://docs.darktable.org/lua/stable/lua.scripts.manual/scripts/contrib/rename_images/) which will spawn a utility module in the lighttable.

1. Make sure scripts are enabled in [preferences > lua](../preferences-settings/lua-options.md). 
1. Identify in which folder the script you want to enable lives. An overview of all scripts is available in [darktable's lua documentation](https://docs.darktable.org/lua/stable/lua.scripts.manual/scripts/). In our example _rename-images_ is contained in the folder _contributed_.
1. Find the [scripts](../module-reference/utility-modules/lighttable/scripts.md) module in the lower left corner of the lighttable view and expand it. 
1. Select the _action_: _start/stop scripts_ from the dropdown. 
1. Under _scripts_ select the appropriate folder from the dropdown (in our example _contributed_).
1. Find the script you want to enable by using the ![left](left-folder-arrow.png#icon) left and ![right](right-folder-arrow.png#icon) right arrows to flip through the pages. In our example, _rename-images_ is (as of this writing) on the last page.
1. Click the grayed-out start/stop icon to the left of the script's name to start it. The icon should turn white and the script's user interface (if it has one) will appear in a panel in the appropriate view. In this example, an additional utility module _rename images_ will appear in the lighttable's right panel. 

## using custom scripts

If you want to use [custom scripts](./writing-lua-scripts.md) it is recommended to place them inside the [configuration directory](../preferences-settings/config-directory.md) into `lua/<name>/`. Replace `<name>` with a string of your liking, e.g. `user`. The scripts module will pick up those folders and offer them to be enabled in their folder.

# installing and updating scripts

**Only relevant for darktable versions pre 5.6**, where the scripts were not bundled and had to be installed using the following instructions.

## download and install

The collection of scripts is available in the [lua-scripts repository](https://github.com/darktable-org/lua-scripts). This also includes the script manager, which makes it easier to enable or disable individual scripts from the GUI. 

darktable should be started at least once to set up its directories. The config directories for most installation types are listed on the [configuration directory](../preferences-settings/config-directory.md) page.

For most installation types (Linux package, AppImage, Flatpak, macOS and Windows) the Lua scripts can be installed from within darktable. First ensure git is installed on your system; if it isn't, use the package manager to install it. Then, in the lighttable view, expand the lua scripts installer module in the lower-left corner, ensure that _select action: install scripts_ is selected, and click execute. Restart darktable once for the scripts module to appear in the lower-left corner.

Some platforms need extra or alternative steps:

__Linux Snap Packages__

Installation through darktable's GUI is currently [broken](https://github.com/darktable-org/darktable/issues/20074), so you will have to take the following approach. Download the Lua scripts using git, then create the `luarc` to let darktable load the script-manager. Close darktable, open a terminal and: 

    cd ~/snap/darktable/current
    git clone https://github.com/darktable-org/lua-scripts.git lua
    echo 'require "tools/script_manager"' >> luarc

Restart darktable twice, and the scripts module should appear in the lower-left corner.

__macOS__

Alternatively you could use the console:

    cd ~/.config/darktable/
    git clone https://github.com/darktable-org/lua-scripts.git lua

__Windows__

Git can be obtained from [git for windows](https://gitforwindows.org/), or using Windows package manager winget inside a command prompt with `winget install git.git`. If you use the gitforwindows.org distribution, install the Git Bash Shell also as it will aid in debugging the scripts if necessary. 

## updating

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
