---
title: raw black/white point
id: raw-black-white-point
applicable-version: 3.2.1
tags: 
working-color-space: Not Applicable (RAW) 
view: darkroom
masking: false
---

Define camera-specific black and white points. 

This module is activated automatically for all raw images. Default settings are applied for all supported cameras. Changes to the defaults are not normally required.

# module controls

black level 0-3
: The camera-specific black level of the four pixels in the RGGB Bayer pattern. Pixels with values lower than this level are not considered to contain valid data.

white point
: The camera-specific white level. All pixels with values above this are likely to be clipped and will be handled accordingly in the [_highlight reconstruction_](./highlight-reconstruction.md) module.
