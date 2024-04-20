---
title: highpass
id: highpass
weight: 10
applicable-version: 3.2.1
tags: 
working-color-space: Lab
view: darkroom
masking: true
---

A high pass filter. 

This module is primarily intended to be used in combination with a [_blend mode_](../../darkroom/masking-and-blending/blend-modes.md). For example, try using the module with a blend mode of "soft light" for high pass sharpening.

---

_**Note:** This module performs blurs in Lab color space, which can result in undesirable effects, and is no longer recommended. Instead, use the [contrast equalizer](./contrast-equalizer.md) module for fine sharpness or the [local contrast](./local-contrast.md) module for general sharpness._

---

## Module Controls

sharpness
: The sharpness of the filter

contrast boost
: The contrast boost
