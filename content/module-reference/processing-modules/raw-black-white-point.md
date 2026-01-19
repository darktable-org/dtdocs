---
title: raw black/white point
id: raw-black-white-point
weight: 10
---

Define camera-specific black and white points. 

This module is activated automatically for all raw images. Default settings are applied for all supported cameras. Changes to the defaults are not normally required.

# module controls

black level 0-3
: The camera-specific black level of the four pixels in the RGGB Bayer pattern. Pixels with values lower than this level are not considered to contain valid data.

white point
: The camera-specific white level. All pixels with values above this are likely to be clipped and will be handled accordingly in the [_highlight reconstruction_](./highlight-reconstruction.md) module.

flat field correction
: Use flat field correction to compensate for lens shading. This field only appears for applicable Raw files and will automatically use any GainMap embedded in the Raw. You can choose to disable this correction if desired.
