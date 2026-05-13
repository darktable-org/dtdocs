---
title: installing pre-existing scripts
id: installation
weight: 15
---

## Download and Install

A collection of scripts is available in the [lua-scripts repository](https://github.com/darktable-org/lua-scripts). This also includes the script manager, which makes it easier to enable or disable individual scripts from the GUI. To use these existing scripts, they must be installed in darktable. This can in most cases be done within darktable's GUI, but depends on your OS and chosen method of installation. 

In any case, darktable should be started at least once to set up its directories.

### Linux Package, AppImage and Flatpak

The Lua scripts can be installed using darktable's GUI. Ensure git is installed on your system. If it isn't, use the package manager to install it. In the lighttable view, expand the lua scripts installer module in the lower-left corner. Ensure that select action: install scripts is selected, then click execute. Restart darktable once for the scripts module to appear in the lower-left corner. 

### Linux Snap Packages

Installation through darktable's GUI is currently [broken](https://github.com/darktable-org/darktable/issues/20074), so you will have to take the following approach:

Ensure git is installed on your system. If it isn't, use the package manager to install it. You will have to download the Lua scripts using git, then create the `luarc` to let darktable load the script-manager. Close darktable, open a terminal and: 

    cd ~/snap/darktable/current
    git clone https://github.com/darktable-org/lua-scripts.git lua
    echo 'require "tools/script_manager"' >> luarc

Restart darktable twice, and the scripts module should appear in the lower-left corner.

### macOS

The Lua scripts can be installed by using darktable's GUI. In lighttable view, expand the lua scripts installer module in the lower-left corner. Ensure that select action: install scripts is selected, then click execute. Restart darktable once for the scripts module to appear in the lower-left corner.

Alternatively you could use the console. Ensure git is installed on your system. If it isn't, use the package manager to install it. Then open a terminal and:

    cd ~/.config/darktable/
    git clone https://github.com/darktable-org/lua-scripts.git lua

### Windows

Ensure git is installed on your system. Git can be obtained from [git for windows](https://gitforwindows.org/), or using Windows package manager winget inside a command prompt with `winget install git.git`. If you use the gitforwindows.org distribution, install the Git Bash Shell also as it will aid in debugging the scripts if necessary. 

The Lua scripts can now be installed by using darktable's GUI. In lighttable view, expand the lua scripts installer module in the lower-left corner. Ensure that select action: install scripts is selected, then click execute. Restart darktable once for the scripts module to appear in the lower-left corner.

## Updating

To update the script repository, either use the scripts module GUI or open a terminal or command prompt and run the following commands: 

### Snap

    cd ~/snap/darktable/current/lua
    git pull

### Flatpak

    cd ~/.var/app/org.darktable.Darktable/config/darktable/lua
    git pull

### Linux and MacOS

    cd ~/.config/darktable/lua/
    git pull

### Windows

    cd %LOCALAPPDATA%\darktable\lua
    git pull
