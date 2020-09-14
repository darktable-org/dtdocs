---
title: lowpass
id: lowpass
applicable-verison: 3.2.1
tags: 
working-color-space: Lab
view: darkroom
masking: true
---

Apply a lowpass filter (e.g. gaussian blur) to the image, while controlling the output contrast and saturation. This module is normally used with a _blending operator_. For example, try using the "local contrast mask" preset with an _overlay_ blending mode.

## Module Controls

radius
: The radius of the blur

soften with
: The blur algorithm to use
: **gaussian blur**: Blur all image channels (L, a, b)
: **bilateral filter**: Blur the L channel only, while preserving edges

contrast
: The contrast. Negative values result in an inverted negative image. Higher absolute values increase contrast; lower absolute values reduce contrast. A value of zero leads to a neutral plane.

brightness
: The brightness. Negative values darken the image. Positive values lighten the image.

saturation
: The color saturation. Negative values result in complementary colors by inverting the a/b channels. Higher absolute values increase color saturation; lower absolute values reduce color saturation. A value of zero leads to a desaturated image.