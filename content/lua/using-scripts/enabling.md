---
title: enabling a Lua script
id: enabling
weight: 20
---

Enabling a Lua script for use is a two-step process:
1. finding it, as described below, and then
1. [starting it](#starting-a-script).

## finding a script

To find the folder containing a script, such as "rename-images",
use the following steps.

1. Open the lighttable view.
1. In the lower part of the leftmost pane in the lighttable view you should see the scripts module. Click (once) on the right-facing arrowhead, to open the module. 
(If the scripts module does not appear, make sure that in the darktable preferences under "Lua options" that the checkbox for "disable Lua scripts" is _not_ checked (that is uncheck it), see [preferences > lua options](../../preferences-settings/lua-options), and then start darktable again.)
1. You should then see an initial view of the scripts module.
1. Check that the scripts module has the "start/stop scripts" action selected, which should appear to the right of the word "action" in the second row from the top as shown above. (If that action is not selected, click on the word "action" and then select "start/stop scripts" from the menu that appears.)
1. Find out what folder contains the script you want to enable. To do that [look at the darktable scripts page](https://docs.darktable.org/lua/stable/lua.scripts.manual/scripts/) and the lists under each folder.

In our example "rename-images" is a contributed script and the "contributed" folder is already selected. (If you want to enable a script in the "official" folder, then you will need to select that folder, "official", from the menu that appears when you click on "folder".)

Once the correct folder is selected, such as "contributed", use the ![left](left-folder-arrow.png#icon) left and ![right](right-folder-arrow.png#icon) right arrows to navigate through that folder to find the desired script's name. In our example, "rename-images" is (as of this writing) on the last page, so you should click the ![right](right-folder-arrow.png#icon) right folder selection arrow several times to get to the page containing that script's name.

Now start that script as described below

## starting a script

Once you have [found the folder containing a script](#finding-a-script), 
such as "rename-images", use the following steps to start it

1. Click (once) on the grayed-out start/stop icon to the left of the name of the script, which turns the script on.
1. The icon should turn bold (whiter) to indicate that the script is on and the script's user interface (if it has one) will appear in a panel in the appropriate view.
1. In this example, the user interface for the script appears in the right panel of the lighttable view. 
1. To open that user interface, click (once) on the right-facing arrowhead at the left side of the user interface to expand it. Then interact with the script as described in [its documentation](https://docs.darktable.org/lua/stable/lua.scripts.manual/scripts/).

These actions need to be repeated for each script you wish to use.
