---
title: sigmoid
id: sigmoid
applicable-version: 4.2.0
tags: 
working-color-space: RGB 
view: darkroom
masking: true
---

Remap the tonal range of an image using a modified generalized log-logistic curve.

This module can be used to expand or contract the dynamic range of the scene to fit the dynamic range of the display.

---

**Note**: Modules placed before sigmoid in the pipeline operate in [scene-referred](../../../darkroom/pixelpipe/the-pixelpipe-and-module-order.md/#scene-referred-workflow) space. Modules after sigmoid work in [display-referred](../../../darkroom/pixelpipe/the-pixelpipe-and-module-order.md/#display-referred-workflow) space.

---

# usage

Please take note of the following guidelines while using this module within your workflow:

only use one display transform
: Never use sigmoid together with another display transform module (i.e. [_filmic rgb_](./filmic-rgb.md) or [_base curve_](./base-curve.md)).

adjust for the mid-tones first
: The sigmoid curve pivots around middle gray. Before using sigmoid, you should first use the [_exposure_](./exposure.md) module to adjust the mid-tones to your liking.

less is more
: You should try to accomplish the majority of your processing using modules in the scene-referred section of the pixelpipe and not rely on the display transform module (_sigmoid_, _filmic rgb_, _base curve_) to do all the work.

preserve hue to taste
: This module provides a number of methods to preserve hues. You are advised to use the "per channel" mode and tune the hue preservation to your liking on a per-image basis. Sunsets and fire are two examples where users commonly reduce the hue preservation to achieve a "hotter" look.

# module controls

contrast
: Adjust the aggressiveness of the compression while leaving middle-gray unchanged. Higher values require lower exposure to reach display white, and shadows become darker. Lower contrast is able to display a larger dynamic range.

skew
: Lean the compression towards shadows or highlights. Skew can be used to transfer some contrast from shadows to highlights or vice versa without changing the amount of contrast at middle gray. Positive skew flattens shadows and compresses highlights. Negative skew creates darker shadows and duller highlights.

color processing
: The mode used to map pixel values from scene to display space.
: - _per channel_ mode applies the sigmoid curve to each rgb channel separately, affecting luminance, chroma, and hue. Hue can be optionally preserved using the _preserve hue_ option (below). This mode is in line with the behavior of the color layers in analog film, and handles smooth roll-off to bright areas very well.
: - _rgb ratio_ is similar to _preserve color_ in [filmic rgb](./filmic-rgb.md). It maps the rgb triplet uniformly using the sigmoid curve, which preserves the spectral color of the pixel. Bright colorful pixels are desaturated along spectral lines as they would otherwise end up outside the display gamut.

preserve hue _(per channel mode only)_
: Choose how much to preserve hue -- 100% preserves the spectral hue of the image (identical to using the "rgb ratio" color processing mode); 0% uses the per-channel mode with heavy hue skewing (see below). An acceptable approximation of preserved perceptual hue is usually somewhere between the two extremes.
: All colors that lie between the primary colors (red, green, and blue) converge towards the closest secondary colors (yellow, magenta, and cyan). The _per channel hue skew_ effect creates yellow sunsets and fires, magneta-looking blue lights, and cyan skies. The skew is stronger for brighter and more saturated pixels.

target black
: Lower bound that the sigmoid curve converges to as the scene value approaches zero -- this should normally be left unchanged. You _can_ use this to give a faded analog look, but should instead prefer to use the "global offset" slider in [_color balance rgb_](./color-balance-rgb.md) to achieve a similar effect.

target white
: Upper bound that the sigmoid curve converges to as the scene value approaches infinity -- this should normally be left unchanged. You can use this to clip white at a defined scene intensity.
