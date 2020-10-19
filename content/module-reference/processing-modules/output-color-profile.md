---
title: output color profile
id: output-color-profile
applicable-verison: 3.2.1
tags: 
working-color-space: Lab 
view: darkroom
masking: true
---

Manage the output profile for export and the rendering intent to be used when mapping between color spaces.

darktable comes with pre-defined profiles _sRGB_, _AdobeRGB_, _XYZ_ and _linear RGB_. You can provide additional profiles by placing them in `$DARKTABLE/share/darktable/color/out` and `$HOME/.config/darktable/color/out` (where `$DARKTABLE` is the darktable installation directory and `$HOME` is your home directory).

The output color profile may also be defined within the [export](../utility-modules/lighttable/export-selected.md) module in the [lighttable](../../lighttable/_index.md) view.

# module controls

output intent
: The rendering intent for output/export. Rendering intent can only be selected when using LittleCMS2 to apply the output color profile (this can be changed in [`preferences > processing`](../../preferences-settings/processing.md)). If darktable's internal rendering routines are used, this option is hidden. For more details see [rendering intent](../../special-topics/color-management/rendering-intent.md).

output profile
: The profile used to render colors for output/export. The profile data will be embedded into the output file (if supported by the file format) allowing other applications to correctly interpret its colors. As not all applications are aware of color profiles, the general recommendation is to stick to sRGB unless you know what you are doing and have a good reason to do otherwise.
