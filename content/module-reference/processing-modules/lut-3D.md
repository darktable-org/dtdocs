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

# module controls

file selection
: Choose the 3D LUT file to use. File selection is inactive if the 3D LUT root folder has not been defined in [preferences > processing](../../preferences-settings/processing.md).

application color space
: A 3D LUT is defined relative to a specific color space. Choose the color space for which the selected 3D LUT file has been built. Cube files are usually related to REC.709 while most others are related to sRGB.

interpolation
: This defines how to calculate output colors when input colors are not exactly on a node of the RGB cube described by the 3D LUT. There are three interpolation methods available: tetrahedral (default), trilinear and pyramid. Usually you won't see any difference between interpolation methods except with smaller sized LUTs.
