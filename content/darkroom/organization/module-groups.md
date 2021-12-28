---
title: module groups
id: module-groups
weight: 20
draft: false
author: "people"
---

A number of pre-defined module groups are shipped with darktable and are selectable as presets. These are summarized below.

All of these presets (with the exception of _modules: deprecated_ and _search only_) also include the quick access panel. All except the _modules: deprecated_ group include the search bar.

# _modules: all_

This preset contains all modules, sorted according to the traditional module groupings used prior to darktable 3.4, as follows:

![module-group-basic-icon](./manage-module-layouts/module-group-basic-icon.png#icon) base modules
: The minimal set of modules normally required to render a presentable image.

![module-group-tone-icon](./manage-module-layouts/module-group-tone-icon.png#icon) tone modules
: Other modules related to tone levels and contrast.

![module-group-color-icon](./manage-module-layouts/module-group-color-icon.png#icon) color modules
: Modules related to color grading and color profiles.

![module-group-correct-icon](./manage-module-layouts/module-group-correct-icon.png#icon) corrective modules
: Modules related to correcting problems such as lens distortions, sensor noise, sharpening, etc.

![module-group-effects-icon](./manage-module-layouts/module-group-effects-icon.png#icon) (special) effects modules
: "Special effect" modules such as bloom, diffuse or sharpen, etc.

# _modules: default_

This preset is the default module group layout from darktable 3.4 onwards and consists of a simplified set of module groups, as follows:

![module-group-technical-icon](./manage-module-layouts/module-group-technical-icon.png#icon) technical modules
: Modules that deal with technical issues relating to the physics of sensors and denoising, lenses and associated corrections, color profiles, dynamic range and tone mapping, and recovering from damage to the image by physical limitations (hot pixels, clipped highlights, etc.).

![module-group-grading-icon](./manage-module-layouts/module-group-grading-icon.png#icon) grading modules
: Modules concerned with primary (corrective) and secondary (creative) corrections of colors and tones.

![module-group-effects-icon](./manage-module-layouts/module-group-effects-icon.png#icon) (special) effects modules
: "Special effect" modules such as retouch, liquify, bloom, sharpen, etc.

# _workflow: scene-referred_ & _workflow: display-referred_

These presets define groups of modules relevant to the [scene-referred and display-referred workflows](../pixelpipe/the-pixelpipe-and-module-order.md#module-order-and-workflows), sorted into groups as shown below:

![module-group-basic-icon](./manage-module-layouts/module-group-basic-icon.png#icon) base modules
: A basic set of modules to adjust the cropping/orientation, adjust the exposure, and apply tone mappings and contrast as appropriate to the workflow.

![module-group-color-icon](./manage-module-layouts/module-group-color-icon.png#icon) color modules
: Modules relating to color grading and color saturation.

![module-group-correct-icon](./manage-module-layouts/module-group-correct-icon.png#icon) corrective modules
: Modules relating to correcting problems relating to lens distortions, sensor noise, sharpening, retouching, etc.

![module-group-effects-icon](./manage-module-layouts/module-group-effects-icon.png#icon) (special) effects modules
: "Special effect" modules such as watermark, framing, vignetting, etc.

# _workflow: beginner_

This preset provides a minimal set of modules targeted as a starting point for beginners. It is suggested that beginners start by copying this minimal preset, and add to it as they gain experience with other modules. 

![module-group-basic-icon](./manage-module-layouts/module-group-basic-icon.png#icon) base modules
: A basic set of modules to adjust the cropping/orientation, adjust the exposure, and apply a basic tone mapping via base curve or basic adjustments.

![module-group-grading-icon](./manage-module-layouts/module-group-grading-icon.png#icon) grading modules
: Modules dealing with creative tone and color grading.

![module-group-effects-icon](./manage-module-layouts/module-group-effects-icon.png#icon) (special) effects modules
: "Special effect" modules such as retouch, sharpen, watermark, etc.

# _previous config_

These presets are automatically generated for users who have upgraded from a version of darktable prior to 3.4. Where you have previously set up favourites or altered the _hidden_ flag on modules, these presets contains those customisations, retaining the legacy module groups (_previous config_ preset) or new module groups (_previous config with new layout_ preset).

If favourites were created in prior versions these will remain available in an additional group:

![module-group-favourites-icon](./manage-module-layouts/module-group-favorites-icon.png#icon) favourite modules
: This group was previously used by users to make it easier to find frequently-used modules, and is available under the "previous config" presets. New users can, of course, still create their own custom group and name it "favourites" if they so desire.

# _search only_

This preset does not include any module groupings. Modules may only be accessed using the search facility.

# _modules: deprecated_

This preset contains a list of deprecated modules. This is the only way to access deprecated modules for new edits but be warned: these modules will be removed for new edits in the next release of darktable. This group cannot be duplicated and the modules within it cannot be added to user-created groups.

