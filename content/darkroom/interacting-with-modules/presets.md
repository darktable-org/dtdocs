---
title: presets
id: presets
weight: 30
draft: false
---

Presets are stored configurations for a module's parameters. Some modules already come with internal pre-defined presets but you can also define your own. Both internal and user-defined presets can be shown by clicking the _presets menu_ in the module header.

# the presets menu

The presets menu will contain one or more of the following entries:

preset list
: A list of the currently available presets. The currently selected preset (if any) is shown in **bold**.

edit this preset
: If a preset is currently selected, edit that preset (see below)

delete this preset
: If a preset is currently selected, delete that preset.

update preset \[_name_\]
: Update the named preset to match the current module parameters.

store new preset
: Create a new preset with the current module parameters.

If you _middle-click_ on a preset name this will create a new instance of the current module and set its parameters to match the selected preset.

# creating and editing presets

When creating or editing presets, the following dialog is shown:

**INSERT IMAGE HERE**

The following options are provided in this dialog:

name
: The name of the preset

description
: A searchable description of the preset (optional)

auto apply this preset to matching images
: Checking this box brings up additional selection fields where you can define a filter used to decide if the preset should be automatically applied when opening other similar images in darkroom for the first time. 

: This data is retrieved from the image's Exif information. For example, if you want a preset to be applied to all images from a specific camera leave all fields at default values except for the model field. Leave all fields at their default values to auto-apply the preset to all images.

: The example dialog above sets up following rules: if lens name matches and aperture is greater or equal to f/8 and focal length is between 24 and 35mm the preset will be automatically applied. Also the second checkbox is clicked so this preset will only be shown in the preset list if the image matches the rule. 

: Tip: The image information panel for your image displays your model name, use this to ensure you have the correct spelling **LINK TBC** (see Section 2.3.5, “Image information”).

only show this preset for matching images
: Checking this box brings up additional selection fields (as above) where you can define a filter used to decide if the preset should be automatically shown in the presets menu.

# managing presets

Both user created and pre-defined presets can be viewed and managed from within the [_presets_ tab in the _preferences_](../../../preferences-settings/presets.md) dialog.
