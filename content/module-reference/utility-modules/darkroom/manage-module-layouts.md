---
title: manage module layouts
id: module-groups
applicable-verison: 3.4
tags: 
view: darkroom
---

Manage the layout and grouping of processing modules.

![manage module layouts](./manage-module-layouts/manage-module-layouts.png#w100)

This maintenance screen can be accessed from the _presets_ menu beside the module group icons (below the histogram in the darkroom view).

# module controls

## preset list

The panel on the left of the screen lists the currently-defined module layout presets. Those at the top of the list are fixed and cannot be altered. Those at the bottom of the list are user-defined.

To create a new (empty) preset, click on the `+` button at the bottom of the left-hand panel. Alternatively click on the `duplicate` button to the right of one of the existing module presets to copy that preset to a new one.

Delete a user-defined preset with the `X` button.

Rename a preset using the entry at the top of the right-hand panel.

## module groups

The panel on the right of the screen allows you to create and amend module groups.

Add a new group by clicking on the `+` sign beside the "module groups" header. Remove a group by clicking on the `X` button beside the module group header.

Add a module to a group by clicking the `+` sign at the bottom of the module group you wish to add it to, and select the module from the list that appears. Remove a module by clicking the `X` beside the module name.

Change the icon assigned to a group by clicking on the existing group icon and selecting a new one from the drop-down list.

Change order the groups are displayed in by clicking on the `<` and `>` buttons beside the group headers.

Settings will be automatically saved when you exit the screen. Click `reset` to reset the settings to the start of your editing session.


# system-defined presets

There are two standard module group layouts that ship with darktable, both of which are available for selection as presets. These module groups cannot be amended:

- **default**: This is the default module group layout from darktable 3.4 onwards, and consists of a new simplified set of module groups.
- **all modules**: This contains the complete set of modules, sorted by the traditional module groupings.
- **scene referred**: This contains the modules commonly used for the [scene-referred workflow](../../../overview/workflow/edit-scene-referred.md).
- **display referred**: This contains the modules commonly used for the [display-referred workflow](../../../overview/workflow/edit-display-referred.md).
- **minimal**: This contains a limited set of modules that are most important when first starting out with darktable. It is suggested that beginners could start by copying this minimal preset, and adding to it as they gain experience with additional modules.

In addition, if you have used a version of darktable prior to 3.4, two additional presets may also be automatically created when you upgrade. These will allow you to retain some or all of your previous module group layouts and can be edited or deleted:

- **previous config**: Where a user previously set up favourites or altered the _hidden_ flag on modules, this preset contains those customisations, retaining the legacy module groups.
- **previous config with new layout**: Where a user previously set up favourites or altered the _hidden_ flag on modules, this preset contains those customisations but with modules grouped according to the new (darktable 3.4+) group layout.

## default preset

The _default_ module group layout consists of 4 module groups

![module-group-active-icon](./manage-module-layouts/module-group-active-icon.png) active modules
: This group indicates which modules are currently active in the pixel pipeline. Clicking on this icon a second time shows a complete list of visible modules

![module-group-technical-icon](./manage-module-layouts/module-group-technical-icon.png) technical modules
: This group contains modules that deal with technical issues relsting to the physics of sensors and denoising, lenses and associated corrections, color profiles, dynamic range and tone mapping, and recovering from damage to the image by physical limitations (hot pixels, recovery from clipped highlights, etc.)

![module-group-grading-icon](./manage-module-layouts/module-group-grading-icon.png) grading modules
: Everything concerning primary (corrective) and secondary (creative) subjective corrections of colors and tones

![module-group-effects-icon](./manage-module-layouts/module-group-effects-icon.png) (special) effects modules
: Includes special effects such as retouching, liquifying, blooming, sharpness, etc..

## all modules preset

The _all modules_ preset contains all modules, sorted according to the following groups:

![module-group-active-icon](./manage-module-layouts/module-group-active-icon.png) active modules
: Works the same as in the default layout.

![module-group-basic-icon](./manage-module-layouts/module-group-basic-icon.png) base modules
: A minimal set of modules normally required to render a presentable image.

![module-group-tone-icon](./manage-module-layouts/module-group-tone-icon.png) tone modules
: Other modules relating to tone levels and contrast

![module-group-color-icon](./manage-module-layouts/module-group-color-icon.png) color modules
: Modules relating to color grading and color profiles

![module-group-correct-icon](./manage-module-layouts/module-group-correct-icon.png) corrective modules
: Modules relating to correcting problems relating to lens distortions, sensor noise, sharpening, etc..

![module-group-effects-icon](./manage-module-layouts/module-group-effects-icon.png) (special) effects modules
: Includes special effects such as retouching, liquifying, blooming, sharpness, etc..

## scene-referred and display-referred presets

The _scene-referred_ and _display-referred_ presets define groups of modules relevant to those workflows, sorted into groups as shown below:

![module-group-active-icon](./manage-module-layouts/module-group-active-icon.png) active modules
: Works the same as in the default layout.

![module-group-basic-icon](./manage-module-layouts/module-group-basic-icon.png) base modules
: A basic set of modules to adjust the cropping/orientation, adjust the exposure, and apply tone mappings and contrast as appropriate to the workflow.

![module-group-color-icon](./manage-module-layouts/module-group-color-icon.png) color modules
: Modules relating to color grading and color saturation.

![module-group-correct-icon](./manage-module-layouts/module-group-correct-icon.png) corrective modules
: Modules relating to correcting problems relating to lens distortions, sensor noise, sharpening, retouching, etc..

![module-group-effects-icon](./manage-module-layouts/module-group-effects-icon.png) (special) effects modules
: Includes special effects such as applying watermarks and framing, vignetting, etc..

## minimal preset 

The _minimal_ preset provides a minimal set of modules targeted as a starting point for beginners, and consists of the following module groups:

![module-group-basic-icon](./manage-module-layouts/module-group-basic-icon.png) base modules
: A basic set of modules to adjust the cropping/orientation, adjust the exposure, and apply a basic tone mapping via base curve or basic adjustments.

![module-group-grading-icon](./manage-module-layouts/module-group-grading-icon.png) grading modules
: Modules dealing with creative tone and color grading.

![module-group-effects-icon](./manage-module-layouts/module-group-effects-icon.png) (special) effects modules
: Includes special effects such as retouching, sharpening, watermarks, etc..

## previous config module groups

These follow the layouts of the previous two groups, but include an additional _favourites_ group where users made use of this feature in the past. Now that users may create their own custom groups, there is no longer a need for an explicit "favourites" group.

![module-group-favourites-icon](./manage-module-layouts/module-group-favorites-icon.png) favourite modules
: This group was previously used by users to make it easier to find frequently-used modules, and is available under the "previous config" presets. New users can, of course, still create their own custom group and name it "favourites" if they so desire.

## active module group

In addition, all module layouts include the ![module-group-active-icon](./manage-module-layouts/module-group-active-icon.png) _active group_, which lists all modules that are currently active in the pixel pipeline.
