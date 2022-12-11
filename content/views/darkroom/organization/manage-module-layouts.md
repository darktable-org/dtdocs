---
title: manage module layouts
date: 2022-12-04T02:19:02+01:00
id: manage-module-layouts
weight: 40
draft: false
author: "people"
---

Manage the layout and grouping of processing modules and the quick access panel.

![manage module layouts](./manage-module-layouts/manage-module-layouts.png#w100)

This maintenance screen can be accessed from the _presets_ menu beside the module search box or module group icons (below the scopes module in the darkroom view). Ctrl+click on the preset menu to open this screen directly.

Settings are automatically saved when you exit the screen. Click _reset_ to abandon any changes made in the current editing session.

## module controls

### global controls

The following global controls are available in the top panel of the screen.

preset
: Select an existing module group preset.

remove
: Remove the current preset (user-defined presets only).

duplicate
: Duplicate the current preset with a new name. The above example shows a new preset named "user defined", which has been created by duplicating the "modules: default" preset.

rename
: Rename the current preset (user-defined presets only). Right-click to bring up a menu that can be used to copy, paste, select all, delete or insert an emoji).

new
: Create a new preset containing a minimal list of modules.

show search line
: Choose whether to display the search bar below the module group icons

show quick access panel
: Choose whether to display the quick access panel. If checked, a new entry will appear in the bottom panel to allow you to add or remove widgets.

show all history modules in active group
: Select this to show all modules that are present in the [history stack](../pixelpipe/history-stack.md) within the active group, regardless of whether or not they are actually active.

auto-apply this preset
: Module group presets can be automatically applied based on the type of image being worked on. The check box indicates whether this preset currently has any auto-apply rules. Click on the gear icon to amend the auto-apply settings. See [presets](../processing-modules/presets.md) for details.

### module groups

The bottom panel of the screen allows you to alter the quick access panel and module groups for the selected preset (user-defined presets only).

add a group
: Click on the + sign beside the "module groups" label to add a new group.

remove a group
: Remove a group by clicking on the X button beside the group name.

add a module/widget
: Add a module to a group, or a widget to the quick access panel, by clicking the + sign below the group name. Select the required module/widget from the displayed list.

remove a module/widget
: Remove a module from a group, or a widget from the quick access panel, by clicking the X beside the module/widget name.

change a group's icon
: Change the icon assigned to a group by clicking on the existing group icon and selecting a new one from the displayed list.

change the group order
: Change the order in which the groups are displayed by clicking on the < and > buttons below the group names.

rename a group
: Rename a module group by clicking on the group name and typing. Right-click to bring up a menu that can be used to copy, paste, select all, delete or insert an emoji)
