---
title: lut 3D
id: lut-3d
applicable-version: 3.2.1
tags:
working-color-space: RGB
view: darkroom
masking: true
---

A 3D LUT is a tridimensional table which is used to transform a given RGB value into another RGB value, and is normally used for film simulation and color grading.

This module accepts `.cube`, `.3dl`, `.png` (haldclut) and `.gmz` files. The uncompressed 3D LUT data are not saved in the database or the XMP file, but are instead saved to the 3D LUT file path inside the 3D LUT root folder. This means that it is important to back up your 3D LUT folder properly. Sharing an image with its XMP is useless if the recipient doesn't also have the same 3D LUT file in their own 3D LUT folder.

The format `.gmz` is only available when GMIC is installed. That's a compressed format. It can hold a full library of LUTs. That's the only format which allows to save the LUT data in database or XMP files.

# module controls

file selection
: Choose the 3D LUT file to use. File selection is inactive until the 3D LUT root folder has been defined in [preferences > processing](../../preferences-settings/processing.md).

application color space
: A 3D LUT is defined relative to a specific color space. Choose the color space for which the selected 3D LUT file has been built. Cube files are usually related to REC.709 while most others are related to sRGB.

interpolation
: This defines how to calculate output colors when input colors are not exactly on a node of the RGB cube described by the 3D LUT. There are three interpolation methods available: tetrahedral (default), trilinear and pyramid. Usually you won't see any difference between interpolation methods except with smaller sized LUTs.
