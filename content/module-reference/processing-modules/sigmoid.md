---
title: sigmoid
id: sigmoid
weight: 10
applicable-version: 4.6
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

keep skew at bay
: For images like portraits, it is best to refrain from using skew values above zero. This way you will avoid harsh transitions in the skin tones. This is particularly important when hue preservation is not enabled, as the skew also affects the hue path of the skin tones.

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
: All colors that lie between the primary colors (red, green, and blue) converge towards the closest secondary colors (yellow, magenta, and cyan). The _per channel hue skew_ effect creates yellow sunsets and fires, magenta-looking blue lights, and cyan skies. The skew is stronger for brighter and more saturated pixels.

target black
: Lower bound that the sigmoid curve converges to as the scene value approaches zero -- this should normally be left unchanged. You _can_ use this to give a faded analog look, but should instead prefer to use the "global offset" slider in [_color balance rgb_](./color-balance-rgb.md) to achieve a similar effect.

target white
: Upper bound that the sigmoid curve converges to as the scene value approaches infinity -- this should normally be left unchanged. You can use this to clip white at a defined scene intensity.

## primaries

Expand this section to set custom primaries. You are advised to use the "smooth" preset as a starting point and then adjust using the following controls:

---

**Note**: These settings apply only to the _per channel_ processing mode.

---

base primaries
: Choose the set of primaries to use as the base for adjustments. This is a bit like locally overriding the working profile, and is necessary to allow presets to be created that don't change even if the user amends the working profile used in the pixel pipeline.

red/green/blue attenuation
: Attenuate (decrease) the [purity](../../special-topics/color-management/color-dimensions.md#definitions) of the red, green or blue primaries before the signal is processed through _sigmoid_'s per-channel curves. An important consequence is that now even the brightest and most pure inputs get smoothly degraded to achromatic at the high end. This avoids posterization and flat-looking patches, which are often seen with, for example, blue LED lights.

red/green/blue rotation
: Rotate the primaries where the per-channel curves are applied. This affects the hue paths when approaching white in the high end. These controls should not normally need large adjustments from the starting values given in the "smooth" preset.

recover purity
: Recover some of the original purity. A value of 100 causes all of the attenuations to be restored after the per-channel process is done. This lands the middle range values near their original purities. A value of 0 doesn’t restore the purity at all, so the more you apply attenuation, the less purity there is in the final picture. The rotations are always restored regardless of the value of this slider. When this slider is at 0, the output of the module is guaranteed to remain within the gamut footprint of the chosen base primaries.

Bear in mind that unlike the [_rgb primaries_](./rgb-primaries.md) module, this is not a tool for creative color grading but rather a set of controls to provide a reasonable starting point for further edits. The effect of these adjustments is not the same as the rgb primaries module even though the interface looks similar.
