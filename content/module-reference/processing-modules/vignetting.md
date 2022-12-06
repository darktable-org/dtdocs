---
title: vignetting
id: vignetting
applicable-version: 3.2.1
tags: 
working-color-space: RGB
view: darkroom
masking: false
---

Apply a vignetting effect to the image. 

Vignetting is a modification of the brightness and saturation at the borders of the image in a specified shape. Many of the parameters listed below can also be modified with a graphical control that overlays the image when the module has focus, showing the shape and extent of the effect.

---

**Note:** This module is known to provoke banding artifacts under certain conditions. You should consider activating the [_dithering_](./dithering.md) module to alleviate this.

---

_**Also note:** This module can produce unnatural-looking results and should be used with care. Instead, use the [exposure](./exposure.md) module with an [elliptical mask](../../darkroom/masking-and-blending/masks/drawn.md) with a large transition area and, if necessary, use the [color balance rgb](./color-balance-rgb.md) module with the same mask to reduce saturation at the edges._

---

# module controls

scale
: The radius of the vignetting area.

fall-off strength
: The progressiveness of the fall-off. Lower values cause a steeper transition.

brightness
: The intensity of brightening (positive values) or darkening (negative values).

saturation
: Control how strong colors become when desaturated/saturated in the darkened/brightened vignetting area.

horizontal/vertical center
: Shift the center of the vignetting area horizontally/vertically.

shape
: The shape of the vignetting effect. The default value of 1 creates a circular or elliptical area. Smaller values shift the shape to being more square; higher values turn it into a cross-like shape.

automatic ratio
: Automatically adjust the width/height ratio of the vignetting area to match the aspect ratio of the underlying image. This typically causes the vignetting area to become elliptical.

width/height ratio
: Manually adjust the width/height ratio of the vignetting area.

dithering
: Activate random noise dithering to alleviate banding artifacts caused by vignette gradients. Select “8-bit output” to prevent banding on monitor display and for JPEGs. When set to “16-bit output”, only a small amount of dithering is applied, just strong enough to compensate for banding on the fine grained 16-bit level. It is now recommended that you instead use the [_dithering_](./dithering.md) module to alleviate banding artifacts.
