---
title: lowpass
id: lowpass
weight: 10
applicable-version: 3.2.1
tags: 
working-color-space: Lab
view: darkroom
masking: true
---

Apply a low pass filter (for example, a Gaussian blur) to the image, while controlling the output contrast and saturation. 

This module is primarily intended to be used in combination with a [blend mode](../../darkroom/masking-and-blending/blend-modes.md). For example, try using the _local contrast mask_ preset with the _overlay_ blend mode.

---

_**Note:** This module performs blurs in Lab color space, which can produce undesirable effects, and is no longer recommended. Instead, use the [contrast equalizer](./contrast-equalizer.md) module for blurring or the [tone equalizer](./tone-equalizer.md) module for dynamic range compression._

---

# module controls

radius
: The radius of the blur.

soften with
: The blur algorithm to use:
: - _gaussian blur_: Blur all image channels (L, a, b)
: - _bilateral filter_: Blur the L channel only, while preserving edges

contrast
: Higher absolute values increase contrast. Lower absolute values reduce contrast. Negative values result in an inverted negative image. A value of zero leads to a neutral plane.

brightness
: Negative values darken the image. Positive values lighten the image.

saturation
: The color saturation. Negative values result in complementary colors by inverting the a/b channels. Higher absolute values increase color saturation. Lower absolute values reduce color saturation. A value of zero fully desaturates the image.
