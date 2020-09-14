---
title: lut 3D
id: lut-3d
applicable-verison: 3.2.1
tags: 
working-color-space: RGB 
view: darkroom
masking: true
---

A 3D LUT is a tridimensional table which is used to transform a given RGB value into another RGB value, and is normally used for film simulation and color grading.

This module accepts `.cube` and `.png` (haldclut) files. The 3D LUT data is not saved in the database or the XMP file, but is instead saved to the 3D LUT file path inside the 3D LUT root folder. This means that it is important to back up your 3D LUT folder properly. Sharing an image with its XMP is useless if the recipient doesn't also have the same 3D LUT file in their own 3D LUT folder.

## Module Controls

file selection
: Choose the 3D LUT file to use. File selection is inactive until the 3D LUT root folder has been defined in the darktable _preferences_ dialog.

application color space
: A 3D LUT is defined relative to a specific color space. Choose the color space for which your selected 3D LUT file has been built. Cube files are usually related to REC.709 while most others are related to sRGB.

interpolation
: This defines how to calculate output colors when input colors are not exactly on a node of the RGB cube described by the 3D LUT. There are three interpolation methods available: tetrahedral (default), trilinear and pyramid. Usually you won't see any difference between interpolation methods except with smaller sized LUTs.