---
title: organization
date: 2022-12-04T02:19:02+01:00
id: organization
weight: 60
draft: false
author: "people"
---

Processing modules are organized and accessed via the right-hand panel in the darkroom:

![organization](organization.png#w33)

Click on the icons at the top of this panel to reveal, from left to right,

![quick access](quick-access-panel-icon.png#icon)
: A customizable panel allowing quick access to commonly-used module controls.

![module-group-active-icon](module-group-active-icon.png#icon) active modules
: A group containing the modules that are currently active in the pixelpipe.  Right-click to show all modules that are present in the [history stack](../pixelpipe/history-stack.md) within the active group, regardless of whether or not they are actually active.

[module groups](./module-groups.md)
: One or more groups of processing modules. These groups are user-defined but some default groupings are provided as presets.content/darkroom/organization

[presets menu](./manage-module-layouts.md)
: A menu that allows you to access stored module layout presets and create your own (via the "manage presets.." option). You can also directly access the "manage presets" dialog by Ctrl+clicking on the presets menu.

Click once on a module group icon (including the active group) to show only the modules in that group. Click a second time to show a list of all modules that are currently active or present in any group.

You can change which widgets appear in the quick access panel and which modules appear in the module groups, by right-clicking the appropriate icon.

## search

Below the module group icons is the search bar, which you can use to access any of the processing modules, regardless of whether they are currently in a group. This option allows you to search by module name, any user-defined [instance name](../processing-modules/multiple-instances.md), as well as pre-defined module tags (for example, the [color calibration rgb](../../../module-reference/processing-modules/color-balance-rgb.md) module can also be searched using the terms "hue", "contrast" and "vibrance").
