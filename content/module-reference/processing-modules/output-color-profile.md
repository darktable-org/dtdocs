---
title: output color profile
id: output-color-profile
applicable-verison: 3.2.1
tags: 
working-color-space: Lab 
view: darkroom
masking: true
---

This module manages the output profiles for export as well as the rendering intent to be used when mapping between the different color spaces.

darktable comes with pre-defined profiles _sRGB_, _AdobeRGB_, _XYZ_ and _linear RGB_ but you can provide additional profiles by placing them in `$DARKTABLE/share/darktable/color/out` and `$HOME/.config/darktable/color/out` (where `$DARKTABLE` represents the darktable installation directory and `$HOME` your home directory).

The output color profile may also be defined within the lighttable _export_ module.

## Module Controls

output intent
: The rendering intent for output/export. For more details see (**LINK TBC** “Rendering intent”). Rendering intent can only be selected when using LittleCMS2 to apply the output color profile (**LINK TBC** this can be changed in the _preferences_ dialog). If darktable's internal rendering routines are used, this option is hidden.

output profile
: The profile used to render colors for output/export. The profile data will be embedded into the output file (if supported by the file format) allowing other applications to correctly interpret its colors. As not all applications are aware of color profiles, the general recommendation is to stick to sRGB unless you know what you are doing and have a good reason.