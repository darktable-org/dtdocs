---
title: sharpen
id: sharpen
applicable-version: 3.2.1
tags: 
working-color-space: Lab 
view: darkroom
masking: true
---

Sharpen the details in the image using a standard UnSharp Mask (USM). 

This module works by increasing the contrast around edges and thereby enhancing the _impression_ of sharpness of an image. This module is applied to the L channel in Lab color space.

---

_**Note:** The USM algorithm used in this module performs blurs in Lab color space, and is therefore no longer recommended. You are advised to instead use the presets offered by the [contrast equalizer](./contrast-equalizer.md) module for deblurring or the [local contrast](./local-contrast.md) module for general sharpness._

---

# module controls

radius
: The unsharp mask applies a gaussian blur to the image as part of its algorithm. This parameter controls the radius of that blur which, in turn, defines the spatial extent of the edge enhancement. Very high values will lead to ugly over-sharpening.

amount
: The strength of the sharpening.

threshold
: Contrast differences below this threshold are excluded from sharpening. Use this to avoid amplification of noise.
