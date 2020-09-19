---
title: presets
id: presets
weight: 30
draft: false
---

Presets allow you to store commonly used module settings for future use. Some modules already come with pre-defined presets but you can also define your own. Both internal and user-defined presets can be shown by clicking the _presets menu_ in the [module header](./module-header.md).

# the presets menu

The presets menu will contain one or more of the following entries depending on the presets that are defined or selected for the module:

preset list
: A list of the currently available presets. The currently selected preset (if any) is shown in **bold**.

edit this preset
: If a preset has been selected, click to edit that preset (see below)

delete this preset
: If a preset has been selected, delete that preset.

update preset \[name\]
: Update the named preset to match the module's current parameters.

store new preset
: Create a new preset with the module's current parameters.

`Middle-click` on a preset name to create a new instance of the module using the parameters of the selected preset.

# creating and editing presets

When creating or editing presets, the following dialog is shown:

**INSERT IMAGE HERE**

The following options can be set:

name
: The name of the preset

description
: A searchable description for the preset (optional)

auto apply this preset to matching images
: Check this box to automatically apply this preset to matching images when they are opened in the darkroom for the first time. Additional controls will appear to allow you to define which images the preset will be applied to based on image Exif data.

: For example, if you want a preset to be applied to all images from a specific camera leave all fields at default values except for the model field. Leave all fields unchanged to auto-apply a preset to all images.

: The example dialog above sets up following rules: if the lens name matches, the aperture is greater than or equal to f/8 and the focal length is between 24 and 35mm the preset will be automatically applied. 

: _Tip: The image information panel for your image displays your model name, use this to ensure you have the correct spelling. See [image information](../../module-reference/utility-modules/shared/image-information.md) for more details._

only show this preset for matching images
: Check this box to automatically show the preset in the preset menu, using a similar set of filters as above.

# managing presets

Both user created and pre-defined presets can be viewed and managed from within [`preferences` -> `presets`](../../../preferences-settings/presets.md).
