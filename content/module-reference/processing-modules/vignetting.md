---
title: vignetting
id: vignetting
applicable-verison: 3.2.1
tags: 
working-color-space: RGB
view: darkroom
masking: false
---

Apply a vignetting effect to the image. Vignetting is a modification of the brightness & saturation at the borders of the image in a specified shape. Many of the parameters listed belowcan also be modified with a graphical control that overlays the image when the module has focus, showing the shape and extent of the effect.

This module is known to provoke banding artifacts under certain conditions; you should consider also activating the [_dithering_](./dithering.md) module to alleviate this.

# module controls

scale
: The radius of the vignetting area

fall-off strength
: The progressiveness of the fall-off. Higher values will cause a steeper transition.

brightness
: The intensity of brightening (positive values) or darkening (negative values).

saturation
: Controls how strong colors become when desaturated/saturated in the darkened/brightened vignetting area.

horizontal/vertical center
: Shifts the center of the vignetting area horizontally/vertically.

shape
: The shape of the vignetting effect. The default value of 1 creates a circular or elliptical area. Smaller values will shift the shape to being more square; higher values turn it into a cross-like shape.

automatic ratio
: Automatically adjust the width/height ratio of the vignetting area to match the aspect ratio of the underlying image. The vignetting area will typically become elliptical.

width/height ratio
: Manually adjust the width/height ratio of the vignetting area.

dithering
: Activate random noise dithering to alleviate banding artifacts caused by vignette gradients. Select “8-bit output” to prevent banding on monitor display and for JPEGs. When set to “16-bit output”, only a little dithering will be applied, just strong enough to compensate for banding on the fine grained 16-bit level. It is now recommended to instead use the [_dithering_](./dithering.md) module to achieve this.
