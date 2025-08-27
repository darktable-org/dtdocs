---
title: agx
id: agx
weight: 10
applicable-version: 5.4
tags:
working-color-space: RGB
view: darkroom
masking: true
---

Remap the tonal range of an image using a sigmoidal function (an 'S-curve') applied to log-transformed data.

This module can be used to expand or compress the dynamic range of the scene to fit the dynamic range of the display. It is derived from another module of the same name in [Blender 3D modeller](https://www.blender.org/) by T. J. Sobotka.

---

**Note**: Modules placed before agx in the pipeline operate in [scene-referred](../../../darkroom/pixelpipe/the-pixelpipe-and-module-order.md/#scene-referred-workflow) space. Modules after agx work in [display-referred](../../../darkroom/pixelpipe/the-pixelpipe-and-module-order.md/#display-referred-workflow) space.

---

# usage

Please take note of the following guidelines while using this module within your workflow:

only use one display transform
: Never use _agx_ together with another display transform module (i.e. [_sigmoid_](./sigmoid.md), [_filmic rgb_](./filmic-rgb.md) or [_base curve_](./base-curve.md)).

adjust for the mid-tones first
: By default, the module preserves middle gray. Before using _agx_, you should first use the [_exposure_](./exposure.md) module to adjust the mid-tones to your liking.

usage guidelines
: to help you navigate the module, some practical advice is provided after a description of the controls.

**=> TODO add guidelines later at the end**

# module controls

The module's controls are divided into three categories:
- look
- tone mapping controls
- color-related controls.

Due to the high number of controls, related controls are often grouped together in collapsible sections, and the controls are distributed between either two or three tabs.

The tabs are:
- settings
- curve (if enabled)
- primaries.

First, the contents of the various tabs (as some controls may appear at different places, depending on the choice of 2 or 3-tab mode) are listed. Then, each control will be described in detail.

# Tabs

## _settings_

The _settings_ tab holds the most often-used controls:

- the _look_ section
- the _input exposure range_ section
- the collapsible curve plot (in 2-tab mode)
- the _basic curve parameters_
- the collapsible _advanced curve parameters_ section (in 2-tab mode)

## _curve_

Controls on the _curve_ tab:

- the collapsible curve plot (moved from the _settings_ tab)
- the _basic curve parameters_ (also visible on the _settings_ tab, repeated here for convenience)
- the collapsible _advanced curve parameters_ section (moved from the _settings_ tab)

The _curve_ tab is only visible in 3-tab mode, controlled via the `plugins/darkroom/agx/enable_curve_tab` variable in `darktablerc`. If the variable is set to `true`, the curve plot and the advanced parameters are removed from the _settings_ tab, and can be accessed via the _curve_ tab, saving vertical space. The setting is intended to be used with lower-resolution displays, to avoid the need to scroll the module.

## _primaries_

This tab holds controls similar to, but more extensive than, the [_sigmoid_](./sigmoid.md) module's _primaries_ collapsible section:

- _disable adjustments_ checkbox
- preset selector
- attenuation and rotation sliders for preprocessing before tone mapping
- attenuation and rotation reversal sliders for postprocessing after tone mapping

# Controls

## The _look_ section

These controls allow post-processing after the tone mapping operation, to fine-tune the result. Since they are applied after the tone mapping, they are _display-referred_ operations, and can result in clipping. Use them carefully. Middle gray is not preserved when using these sliders. 

slope
: A simple multiplication of brightness. Values above 1 brighten the image, increase contrast, and can lead to blown highlights; those below darken the image and reduce contrast. Black is not affected by this slider.

offset
: Brightens or darkens the image by shifting brightness up or down. Contrary to many implementations, only blacks are fully affected, and the effect is gradually reduced with increasing brightness; whites are not affected at all. It is important to note that the brightness range below the selected _relative black exposure_ (see _Input exposure range_ below) cannot be recovered using this control; also, valued pushed to black using the _offset_ control cannot be brightened using _slope_. Negative values crush shadows (they move the black point to the right along the x-axis); positive values can produce a faded look (they lift the black point along the y-axis).

power
: Affects brightness and contrast. Values above 1 make the image darker and compress shadows; those below 1 brighten the image, opening up shadows. The black and white points are not affected. 

saturation
: Controls color intensity. Zero turns the image black-and-white. High values can lead to oversaturation. You can control image saturation in more detail via the controls on the _primaries_ tab.

preserve hue
: At a value of 0%, the colors output by the module will be based solely on the colors resulting from processing by the AgX algorithm, details of which will be provided in the section about the _primaries_ tab.. (**TODO** describe it in primaries) By raising the slider, the original input colours can be fully or partially restored, if desired. 

## The _input exposure range_

Provides controls similar to the [_filmic rgb_](./filmic-rgb.md) module, allowing you to set the black and white point. Any channel value lower than the selected _black relative exposure_ will be clipped to 0; any above the selected _white relative exposure_ will be clipped to 1. Due to implementation differences, the values will be similar to, but not identical with, the values _filmic rgb_ would pick.

Color pickers are provided to quickly pick the black or white point, or both. A safety margin can be applied via the _dynamic range scaling_ slider: contrast at the ends of the dynamic range is more easily controlled via the _toe_ and _shoulder_ controls described below.

The selected exposure range will then be used as the input range of a logarithmic tone mapping operation, which then provides data that is further processed by the curve.

## The curve

The plot of curve can be displayed by opening the _show curve_ collapsible section. In 2-tab mode, this is visible on the _settings_ page; in 3-curve mode, it is available on the _curve_ page. It can be a useful tool to learn about the behavior of the curve and the effect of related controls; after some practice, unless large adjustments are made to curve parameters, you may prefer to keep it collapsed most of the time, to save space on the screen. The plot is not interactive (does not react to dragging by the mouse, for example); it simply illustrates the effect of the sliders.

The x-axis of the graph shows the selected input exposure range, measured in EV, with values relative to mid-gray; mid-gray is therefore at the 0 EV mark. The y-axis displays the linear output brightness, 18% indicating mid-gray. The scaling of the y-axis is not linear; horizontal grid lines help visualise the non-linearity. The degree of non-linearity is governed by a gamma value (default: 2.2, so the 18% mid-gray value is about halfway up the y-axis). More information on the gamma is provided in the description of the _advanced curve parameters_.

The curve has 5 important points:
- The _black and white points_ are at the left and right edges of the graph, respectively; their y values (by default, 0 and 1) can be controlled by the _target black_ and _target white_ sliders in the _advanced_ section. Adjusting those values is rarely needed, although the black point may be raised to give the image a faded look, similar to the _offset_ control in the _look_ section.
- the _pivot_ is the point around which the curve is built, and is indicated by a dot; by default, its input and output are set to mid-gray (0 EV and 18% on the x and y-axis, respectively). The contrast of the curve is set for this point.
- _toe and shoulder starting points_: it is possible to maintain a section of constant contrast above and below the pivot point. By default, in order to provide the smoothest possible transition, the toe and shoulder starting points are set to the pivot point, effectively removing this section. The steepness of the toe and shoulder section has a decisive effect on contrast in shadows and highlights, respectively, and the tool provides detailed control over this behavior, which will be discussed below (see _toe / shoulder power_ and _toe / shoulder start_).

show curve
: Expands or collapses the plot of the curve.

### basic curve parameters

This section is always available on the _settings_ page, both 2 and 3-tab mode. In 3-tab mode, it is also available on the _curve_ tab, and changes are synchronized between the pages.

pivot input shift
: Allows you to slide the pivot towards the left (darker tones) or right (brighter tones), without affecting its output brightness; however, using this control without changing the _pivot target output_ will affect the brightness distribution of midtones. For example, starting with the defaults, the pivot is set to map mid-gray to mid-gray; sliding it towards the left will result in an input tone that is below mid-gray to be mapped to mid-gray, effectively brightening the image.

Since normally contrast is highest around the pivot, this slider also allows you to choose at which part of the input tonal range you want to make most contrasty.

pivot target output
: Sets the output brightness belonging to tone selected by the pivot's x-coordinate. Increasing it brightens, decreasing it darkens the image.

A color picker, placed next to _pivot input shift_, is provided to pick an image area. The pivot x and y values will be adjusted so that the average value of the selected area is mapped to the current average output. This allows you to quickly select the area around which you want to center the tones of your image, without altering its brightness. You may wish to subsequently adjust the _pivot target output_ value to fine-tune the brightness of the selected area.

While you can select any value between 0 and 1, the y coordinate of the pivot is constrained by the _target black / white_ values (set to 0% and 100%, respectively).

contrast around the pivot
: Sets the contrast. This value is scaled internally, to make sure changing the exposure range does not affect apparent contrast around the pivot. This behavior is similar to that of _filmic rgb_.

**Note:** While, like with any S-shaped curve, the contrast is normally highest in the middle of the curve, around the pivot, too low values of contrast will cause the toe and/or shoulder to become 'inverted', as the curve will always make sure the selected black and white points are mapped to the selected black and white target values. In these cases, the inverted toe/shoulder will have a higher, instead of lower, contrast than the value selected here. This can be easily seen on the curve's graph. When such an inversion occurs, the respective _toe/shoulder power_ control becomes ineffective. This may sound complicated, but you will understand it immediately if you display the curve, and set a low contrast value.

toe power / shoulder power
: The word _toe_ refers to the lower bend of the curve, while the _shoulder_ is the higher bend. Normally (for an S-curve), these are the sections where the curve's contrast gradually drops as it approaches black or white, for the toe and shoulder, respectively. The _toe / shoulder power_ sliders determine how long the contrast remains mostly unchanged. Higher power values result in the contrast remaining close to the value set around the pivot for longer, followed by a more abrupt, quicker drop, and lower final contrast around the black or white point. As already noted above in the description of _contrast around the pivot_, if the initial contrast is not enough to reach the black or white point from the pivot, the corresponding section of the curve becomes inverted (the toe may become convex, pointing downwards, or the shoulder may become concave, pointing upwards), rendering the toe or shoulder power control ineffective.  

### advanced curve parameters

toe start
: Defines the left-hand side point where the linear portion of the curve ends, and below which the curve starts losing slope, becoming flatter, therefore adjusting the handling of shadows. Keeping the value at 0% allows transition to start at the pivot; higher values push the transition point down towards the chosen _target black_, which is reached at 100% (provided that the curve has enough contrast). The effect is similar to the _toe power_, but allows hard clipping, leading to a loss of details in the shadows.

target black
: Lower bound that the sigmoid curve converges to as the scene value approaches the selected black point. The control can be used to create a faded analog look. Another way to achieve a similar effect is Another way to create a similar effect is the _look offset_. Alternatively, you may prefer the _global offset_ slider in the [_color balance rgb_](./color-balance-rgb.md) module.

shoulder start
: Defines the right-hand side point where the linear portion of the curve ends, and above which the curve starts losing slope, becoming flatter, therefore adjusting the handling of highlights. Keeping the value at 0% allows transition to start at the pivot; higher values push the transition point down towards the chosen _target white_, which is reached at 100% (provided that the curve has enough contrast). The effect is similar to the _shadow power_, but allows hard clipping, leading to a loss of details in the highlights.

target white
: Upper bound that the sigmoid curve converges to as the scene value approaches the selected white point. The control can be used to limit the maximum output brightness.

keep the pivot on identity line
: Automatically adjusts _curve y gamma_ to guarantee that the curve always stays S-shaped, keeping toe and shoulder controls effective. See more below, at _curve y gamma_.

curve y gamma
: Shifts the representation of the pivot along the y-axis without changing its output brightness. This has nothing to do with the 'gamma' of the screen was calibrated to, but is an internal parameter of the algorithm. High values increase overall contrast (between the darkest and brightness regions) and saturation; low values make the image more washed-out. The immediate brightness range around the pivot, and therefore contrast around the pivot, are not affected.


# TO BE CONTINUED, below is just a copy of sigmoid's docs.

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
: Recover some of the original purity. A value of 100 causes all of the attenuations to be restored after the per-channel process is done. This lands the middle range values near their original purities. A value of 0 doesn’t restore the purity at all, so the more you apply attenuation, the less purity there is in the final image. The rotations are always restored regardless of the value of this slider. When this slider is at 0, the output of the module is guaranteed to remain within the gamut footprint of the chosen base primaries.

Bear in mind that unlike the [_rgb primaries_](./rgb-primaries.md) module, this is not a tool for creative color grading but rather a set of controls to provide a reasonable starting point for further edits. The effect of these adjustments is not the same as the rgb primaries module even though the interface looks similar.
