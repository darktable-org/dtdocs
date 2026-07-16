---
title: scripts
id: scripts
---

The _scripts_ module is created by the _script manager_ and lets you start, stop, configure, install and update darktable's Lua scripts directly from the lighttable. See [basic principles](../../../lua/basic-principles.md) for an explanation of how the script manager loads scripts.

Since darktable 5.6 a collection of scripts is [bundled](../../../lua/darktables-scripts.md) with the program, so this module is available without any manual installation. Documentation for the individual bundled scripts is available in the [lua docs](https://docs.darktable.org/lua/stable/lua.scripts.manual/scripts/).

Installing or updating scripts requires [git](https://git-scm.com/) to be installed and available on your path.

The module can be disabled in [preferences > lua options](../../../preferences-settings/lua-options.md) by disabling lua scripts. 

# module controls

The __action__ dropdown at the top of the module switches between three views: _start/stop scripts_, _configure_ and _install/update scripts_. The module remembers the last selected view.

## start/stop scripts

Lists the scripts contained in the selected folder, each preceded by an on/off button used to start or stop it.

folder
: Select which group of scripts to display. The bundled scripts are grouped into _contributed_, _examples_, _official_ and _tools_. Scripts placed in `[configuration directory]/lua/FOLDER/file.lua` can be selected here. See [basic principles](../../../lua/basic-principles.md) on how darktable loads added scripts. 

page navigation
: When a folder holds more scripts than fit on a single page, use the _<_ and _>_ buttons to move between pages. The current position is shown as "page x of y". The number of scripts shown per page is set in the _configure_ view.

script buttons
: Each entry shows the script's name preceded by an on/off button. Click it to start or stop that script. A started script stays active for the current session and is started again automatically the next time darktable runs.

## configure

scripts per page
: Set how many lines are shown per page, between 5 and 20 (default 10).

change number of buttons
: Apply the value selected above. The button list updates immediately; no restart is required.

## install/update scripts

This view is split into three sections.

__update scripts__

scripts to update
: Select an installed script collection to update. The bundled scripts appear here as _lua-scripts_; any additional scripts you have added are listed by their folder name.

update scripts
: Pull the latest version of the selected collection from its git repository.

__add more scripts__

URL to download additional scripts from
: Enter the URL of a git repository that contains the scripts you want to add.

new folder to place scripts in
: Enter a name for the folder the scripts will be cloned into (created under `lua/` in your [configuration directory](../../../preferences-settings/config-directory.md)).

install additional scripts
: Clone the repository into the folder named above. Once installed, the scripts appear under that folder name in the _start/stop scripts_ view.

__disable scripts__

enable "disable scripts" button
: A safety check that must be ticked before the _disable scripts_ button becomes active, to prevent it from being clicked by accident.

disable scripts
: Renames the `luarc` file in your [configuration directory](../../../preferences-settings/config-directory.md) to `luarc.disabled`. Note that in the bundled installation (5.6 onwards) this does _not_ stop the bundled scripts from loading. They are loaded independently of your `luarc`. To actually prevent the Lua scripts from running, use the _disable Lua scripts_ option in [preferences > lua options](../../../preferences-settings/lua-options.md) instead. (To undo the rename, change `luarc.disabled` back to `luarc`.)
