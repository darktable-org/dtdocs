---
title: manage module layouts
id: module-groups
applicable-verison: 3.4
tags: 
view: darkroom
---

Manage the layout and grouping of processing modules.

![manage module layouts](./manage-module-layouts/manage-module-layouts.png#w100)

This maintenance screen can be accessed from the _presets_ menu beside the module search box or group icons (below the histogram in the darkroom view).

# module controls

## preset list

The left-hand panel lists the currently-defined module layout presets. Those at the top of the list are fixed and cannot be altered. User-defined presets are placed at the bottom of the list.

To create a new (empty) preset, click on the + button at the bottom of the left-hand panel. Alternatively click on the _duplicate_ button to the right of one of the existing module presets to copy that preset to a new one. The above screenshot shows a new preset which has been created by duplicating the "modules: default" preset.

Delete a user-defined preset with the X button.

Rename a preset using the text entry box at the top of the right-hand panel. Right-click to bring up a menu which can be used to copy, paste, select all, delete or insert an emoji)

## module groups

The right-hand panel allows you to create and amend module groups for the selected preset.

Add a new group by clicking on the + sign beside the "module groups" header. Remove a group by clicking on the X button beside the header of that module group.

Add a module to a group by clicking the + sign at the bottom of the group, and select the required module from the list that appears. Remove a module by clicking the X beside the module name.

Change the icon assigned to a group by clicking on the existing group icon and selecting a new one from the drop-down list.

Change order the groups are displayed in by clicking on the < and > buttons beside the group headers.

Rename a module group using the text entry box at the top of the module list. Right-click to bring up a menu which can be used to copy, paste, select all, delete or insert an emoji)

Settings will be automatically saved when you exit the screen. Click _reset_ to reset the settings to the start of your editing session.


# system-defined presets

There are seven standard presets that ship with darktable, which cannot be amended:

- **modules: all**: This contains the complete set of modules, sorted by the traditional module groupings used before darktable 3.4.
- **modules: default**: This is the default module group layout from darktable 3.4 onwards, and consists of a new simplified set of module groups.
- **modules: deprecated**: This contains a list of deprecated modules. This is the only way to access deprecated modules for new edits but be warned: these modules will be removed for new edits in the next release of darktable. This group cannot be duplicated and the modules within it cannot be added to user-created groups.
- **search only**: Display the module search box but do not show module groups.
- **workflow: beginner**: This contains a limited set of modules that are most important when first starting out with darktable. It is suggested that beginners start by copying this minimal preset, and add to it as they gain experience with additional modules.
- **workflow: display referred**: This contains the modules commonly used for the [display-referred workflow](../../../overview/workflow/edit-display-referred.md).
- **workflow: scene referred**: This contains the modules commonly used for the [scene-referred workflow](../../../overview/workflow/edit-scene-referred.md).

For each preset you can also choose whether or not to show the search line using the tick box at the top of the screen.

In addition, if you have upgraded an older version of darktable to 3.4, two additional presets may be automatically created as part of the upgrade. These allow you to retain some or all of your previous module group layouts and can be edited or deleted as required:

- **previous config**: Where you have previously set up favourites or altered the _hidden_ flag on modules, this preset contains those customisations, retaining the legacy module groups.
- **previous config with new layout**: Where you have previously set up favourites or altered the _hidden_ flag on modules, this preset contains those customisations but with modules grouped according to the new (darktable 3.4+) default group layout.

## _modules: default_

The _modules: default_ layout preset consists of the following module groups

![module-group-technical-icon](./manage-module-layouts/module-group-technical-icon.png) technical modules
: Modules that deal with technical issues relating to the physics of sensors and denoising, lenses and associated corrections, color profiles, dynamic range and tone mapping, and recovering from damage to the image by physical limitations (hot pixels, clipped highlights, etc.)

![module-group-grading-icon](./manage-module-layouts/module-group-grading-icon.png) grading modules
: Modules concerned with primary (corrective) and secondary (creative) subjective corrections of colors and tones

![module-group-effects-icon](./manage-module-layouts/module-group-effects-icon.png) (special) effects modules
: "Special effect" modules such as retouch, liquify, bloom, sharpen, etc..

## _modules: all_

The _modules: all_ preset contains all modules, sorted according to the following groups:

![module-group-basic-icon](./manage-module-layouts/module-group-basic-icon.png) base modules
: A minimal set of modules normally required to render a presentable image.

![module-group-tone-icon](./manage-module-layouts/module-group-tone-icon.png) tone modules
: Other modules relating to tone levels and contrast

![module-group-color-icon](./manage-module-layouts/module-group-color-icon.png) color modules
: Modules relating to color grading and color profiles

![module-group-correct-icon](./manage-module-layouts/module-group-correct-icon.png) corrective modules
: Modules relating to correcting problems relating to lens distortions, sensor noise, sharpening, etc..

![module-group-effects-icon](./manage-module-layouts/module-group-effects-icon.png) (special) effects modules
: Includes special effects such as retouch, liquify, bloom, sharpen, etc..

## _workflow: scene-referred_, _workflow: display-referred_

The _workflow: scene-referred_ and _workflow: display-referred_ presets define groups of modules relevant to those workflows, sorted into groups as shown below:

![module-group-basic-icon](./manage-module-layouts/module-group-basic-icon.png) base modules
: A basic set of modules to adjust the cropping/orientation, adjust the exposure, and apply tone mappings and contrast as appropriate to the workflow.

![module-group-color-icon](./manage-module-layouts/module-group-color-icon.png) color modules
: Modules relating to color grading and color saturation.

![module-group-correct-icon](./manage-module-layouts/module-group-correct-icon.png) corrective modules
: Modules relating to correcting problems relating to lens distortions, sensor noise, sharpening, retouching, etc..

![module-group-effects-icon](./manage-module-layouts/module-group-effects-icon.png) (special) effects modules
: Includes special effects such as watermarks, framing, vignetting, etc..

## _workflow: beginner_

The _workflow: beginner_ preset provides a minimal set of modules targeted as a starting point for beginners, and consists of the following module groups:

![module-group-basic-icon](./manage-module-layouts/module-group-basic-icon.png) base modules
: A basic set of modules to adjust the cropping/orientation, adjust the exposure, and apply a basic tone mapping via base curve or basic adjustments.

![module-group-grading-icon](./manage-module-layouts/module-group-grading-icon.png) grading modules
: Modules dealing with creative tone and color grading.

![module-group-effects-icon](./manage-module-layouts/module-group-effects-icon.png) (special) effects modules
: Includes special effects such as retouch, sharpen, watermarks, etc..

## previous config module groups

These follow the layouts of the previous two groups, but include an additional _favourites_ group where users made use of this feature in prior versions of darktable. Now that users may create their own custom groups, there is no longer a need for an explicit "favourites" group.

![module-group-favourites-icon](./manage-module-layouts/module-group-favorites-icon.png) favourite modules
: This group was previously used by users to make it easier to find frequently-used modules, and is available under the "previous config" presets. New users can, of course, still create their own custom group and name it "favourites" if they so desire.

## active module group

In addition, all module layouts include the ![module-group-active-icon](./manage-module-layouts/module-group-active-icon.png) _active group_, which lists all modules that are currently active in the pixelpipe.
