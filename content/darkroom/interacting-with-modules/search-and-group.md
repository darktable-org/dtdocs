---
title: searching for and grouping modules 
id: search-and-group
weight: 60
draft: false
---

Due the the large number of [_processing modules_](../../module-reference/processing-modules/) available in darktable, and so there are a few ways these modules can be organised and located while inside the darkroom view.

- you can search for a module by entering part of its name in the _search module_ textbox in the right-hand panel of _darkroom_.
- you can `Click` on one of the _module group_ icons just above the _search module_ textbox and see all the modules that belong to that group
- you can `Click` on the _show active modules_ icon to list the modules that are currently active, and if you `Click` on that icon again, you will see all modules that have not been hidden.
- you can expand the _more modules_ section at the bottom of the right-hand panel on _darkroom_ to get a complete list of modules, and from here you can hide or unhide specific modules if you `Click` on the name of the module.

While darktable ships with some standard module groupings predefined, it is possible to customise which modules belong to which groups. Please refer to the [_module groups_](../../module-reference/utility-modules/darkroom/module-groups.md) section for details on how to customise the groups.

# search 

When you enter some text in the _search module_ textbox near the top of the right-hand panel in the _Darkroom_ view, any modules whose name contains that text will be listed under the search box. All matching modules will be shown, regardless whether they have been marked as "hidden" or not in the [_more modules_](../../module-reference/utility-modules/darkroom/more-modules.md) section near the bottom of the right-hand panel. You can then activate one of the listed module by clicking on its activation icon, expand the module by clicking on its name, and adjust any settings as required.

# module groups

There are two standard group layouts that ship with darktable, which can be accessed via the _presets_ menu icon next to the module group icons that are above the _search module_ textbox. The following entries will appear by default in that presets manu:

- **default**: This is the default module group layout from darktable 3.4 onwards, and consists of a new simplified set of module groups (described below).
- **legacy layout**: This contains the default module groupings that were used in darktable prior to version 3.4
- **previous config**: Where a user previously set up favourites or customing the _hidden_ flag on modules, this preset contains those customisations classified under the legacy module groups.
- **previous config with new layout**: Where a user previously set up favourites or customing the _hidden_ flag on modules, this preset contains those customisations classified under the new module groups.
- miscellaneous other presets to provide users with examples for how to set up their own custom module group presets.

## default module groups

The default module group layout consists of 4 module groups:

(![module-group-active-icon](./search-and-group/module-group-active-icon.png)) active modules
: This group indicates which modules are currently active in the pixel pipeline. Clicking on this icon a second time shows a complete list of visible modules

(![module-group-technical-icon](./search-and-group/module-group-technical-icon.png)) technical modules
: This group contains modules that deal with technical issues relsting to the physics of sensors and denoising, lenses and associated corrections, color profiles, dynamic range and tone mapping, and recovering from damage to the image by physical limitations (hot pixels, recovery from clipped highlights, etc.)

(![module-group-grading-icon](./search-and-group/module-group-grading-icon.png)) grading modules
: Everything concerning primary (corrective) and secondary (creative) subjective corrections of colors and tones

(![module-group-effects-icon](./search-and-group/module-group-effects-icon.png)) (special) effects modules
: Includes special effects such as retouching, liquifying, blooming, sharpness, etc..


## legacy layout module groups

The legacy versions of darktable had the following module groupings:

(![module-group-active-icon](./search-and-group/module-group-active-icon.png)) active modules
: Works the same as in the default layout.

(![module-group-basic-icon](./search-and-group/module-group-basic-icon.png)) basic modules
: A minimal set of modules normally required to render a presentable image.

(![module-group-tone-icon](./search-and-group/module-group-tone-icon.png)) tone modules
: Other modules relating to tone levels and contrast

(![module-group-color-icon](./search-and-group/module-group-color-icon.png)) color modules
: Modules relating to color grading and color profiles

(![module-group-correct-icon](./search-and-group/module-group-correct-icon.png)) corrective modules
: Modules relating to correcting problems relating to lens distortions, sensor noise, sharpening, etc..

## previous config module groups

These follow the previous two sets of groups, but include an additional _favorites_ group where users made use of this feature in the past. The need for a favorites group has been rendered obsolete by the new module group customisation feature.

(![module-group-favorites-icon](./search-and-group/module-group-favorites-icon.png)) favorite modules
: This group was previously used by users to make it easier to find frequently-used modules, and is available under the "previous config" presets so that users can continue using this now obsolete feature if they desire.

