---
title: lut 3D
id: lut-3d
applicable-version: 3.6
tags:
working-color-space: RGB
view: darkroom
masking: true
---

Transform RGB values with a 3D LUT file.

A 3D LUT is a tridimensional table that is used to transform a given RGB value into another RGB value. It is normally used for film simulation and color grading.

This module accepts `.cube`, `.3dl`, `.png` (haldclut) and `.gmz` files. Uncompressed 3D LUT data is not saved in the database or the XMP file, but is instead saved to the 3D LUT file path inside the 3D LUT root folder. It is therefore important to back up your 3D LUT folder properly -- sharing an image with its XMP is pointless if the recipient doesn't also have the same 3D LUT file in their own 3D LUT folder.

The compressed format `.gmz` is only available when GMIC is installed. This format can hold a full library of LUTs, and LUT data loaded from this type of file _can_ be saved to the database and XMP files.

---

**Note**: the module clips all values outside of the range [0,1]. You may have to reduce the range of the input before applying.

---

# usage

LUTs are most commonly used in Ansel for color grading or film look simulation. For this reason, by default, the module is placed after the [_filmic rgb_](./filmic-rgb.md) module in the pixelpipe and should be applied to a neutral image (without first applying a specific look). While you can find hundreds of free LUTs on the internet, you should note that not all of them are compatible with the Ansel environment and workflow -- incompatible LUTs will not produce the advertised look. To limit the risk, a color grading LUT should have been created to work with one of the available "application color spaces" (see below), for both the input and the output of the module.

Camera log LUTs (as F-log or S-Log3) are different to color-grading and film-look-simulation LUTs, and are intended to convert the camera log raw data into something (linear raw data or other color space) that Ansel is able to understand. In this case the _lut 3D_ module should be manually placed between the [_demosaic_](./demosaic) and [_input color profile_](./input-color-profile.md) modules. Once you have done this, you can no longer choose an "application color space". The "input profile" of input color profile module should be aligned with the output of the LUT. _Please note that this use case has not yet been tested._

# module controls

file selection
: Choose the 3D LUT file to use. File selection is inactive if the 3D LUT root folder has not been defined in [preferences > processing](../../preferences-settings/processing.md).

application color space
: A 3D LUT is defined relative to a specific color space. Choose the color space for which the selected 3D LUT file has been built. Cube files are usually related to REC.709 while most others are related to sRGB.

interpolation
: This defines how to calculate output colors when input colors are not exactly on a node of the RGB cube described by the 3D LUT. There are three interpolation methods available: tetrahedral (default), trilinear and pyramid. Usually you won't see any difference between interpolation methods except with smaller sized LUTs.
