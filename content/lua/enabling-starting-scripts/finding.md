---
title: finding a script's folder
id: finding
weight: 20
---

To find the folder containing a script, such as "rename-images",
use the following steps.

1. Open the lighttable view.
1. In the lower part of the leftmost pane in the lighttable view you should see the scripts module. Click (once) on the right-facing arrowhead, to open the module. 
(If the scripts module does not appear, make sure that in the darktable preferences under "Lua options" that the checkbox for "disable Lua scripts" is _not_ checked (that is uncheck it), see [preferences > lua options](../../preferences=settings/lua-options), and then start darktable again.)
1. You should then see
![the open scripts module](enabling-starting-scripts/finding/scripts-module-initial-view.png#w50) an initial view of the scripts module.
1. Check that the scripts module has the "start/stop scripts" action selected, which should appear to the right of the word "action" in the second row from the top as shown above. (If that action is not selected, click on the word "action" and then select "start/stop scripts" from the menu that appears.)
1. Find out what folder contains the script you want to enable. To do that look at https://docs.darktable.org/lua/stable/lua.scripts.manual/scripts/ and the lists under:
* [contributed scripts](https://docs.darktable.org/lua/stable/lua.scripts.manual/scripts/contrib/), or
* [official scripts](https://docs.darktable.org/lua/stable/lua.scripts.manual/scripts/official/)

In our example "rename-images" is a contributed script and the "contributed" folder is already selected. (If you want to enable a script in the "official" folder, then you will need to select that folder, "official", from the menu that appears when you click on "folder".)

Once the correct folder is selected, such as "contributed", use the ![left](left-folder-arrow.png#icon) left and ![right](right-folder-arrow.png#icon) right folder selection arrow icons arrows to navigate through that folder to find the desired script's name. In our example, "rename-images" is on the last page you click the ![right](right-folder-arrow.png#icon) right folder selection arrow several times to get to the page containing that script's name.
![the contributed folder showing rename-images](contributed-folder-showing-rename-images.png#w50)

Now [start that script](starting).






