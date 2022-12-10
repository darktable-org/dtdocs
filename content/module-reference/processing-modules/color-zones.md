---
title: color zones
date: 2022-12-04T02:19:02+01:00
id: color-zones
applicable-version: 3.8
tags:
working-color-space: Lab
view: darkroom
masking: true
---

Selectively adjust the lightness, saturation and hue of pixels based on their current lightness, saturation and hue.

This module works in CIE LCh color space, which separates pixels into _lightness_, chroma (_saturation_) and _hue_ components. It allows you to manipulate the lightness, saturation and hue of targeted groups of pixels through the use of [curves](../../darkroom/processing-modules/curves.md).

You first need to choose whether you wish to adjust (select) pixels based on their lightness, saturation or hue. You can then use three curves, on their respective tabs, to adjust the lightness, saturation and hue of ranges of pixels selected via this method.

---

_**Note:** This module should be used with care, as transitions between colors may not be graceful. Instead, use the [color balance rgb](./color-balance-rgb.md) module with a [parametric mask](../../darkroom/masking-and-blending/masks/parametric.md)._

---

## pixel selection method

The _color zones_ module offers three different methods for selecting which pixels you want to adjust. They are:

select by hue (default)
: Select pixels to manipulate based on their hue. For example, you may want to darken a blue sky, or to change a red porche into a yellow one. The following image shows the full range of hues that you can choose to operate on:

: ![color zones choose hue](./color-zones/color-zones-choose-hue.png#w33)

select by lightness
: Select pixels to manipulate based on their lightness. For example, you may want to make your shadows brighter, or to make your highlights more yellow. The following image shows the range of lightness levels that you can choose to operate on, from dark to light:

: ![color zones choose lightness](./color-zones/color-zones-choose-lightness.png#w33)

select by saturation
: Select pixels to manipulate based on their saturation. For example, you may want to tone down the saturation of some already highly saturated pixels, or to change their hue. The following image shows the range of saturation levels that you can choose to operate on, from a completely unsaturated monochrome gray through to the most highly saturated color:

: ![color zones choose saturation](./color-zones/color-zones-choose-saturation.png#w33)

## pixel manipulation curves

Once you have chosen a pixel selection method, the selected range of lightness, saturation or hue levels will appear along the horizontal axis of the three pixel manipulation curves, which can be viewed and adjusted by choosing the appropriate tab (lightness, saturation, hue).

If, for example, you were to choose to _select by hue_ (the default), the horizontal axis (below the manipulation curves) would show the range of hues you can work with, and the three pixel manipulation curves would appears as follows:

lightness
: By adjusting the lightness curve up or down in a given (hue) location, you can brighten or darken pixels matching hues where the curve has been raised or lowered, respectively. In the example below the blue sky in an image has been darkened for dramatic effect:

: ![color zones adjust lightness](./color-zones/color-zones-adjust-lightness.png#w33)

saturation
: By adjusting the saturation curve up or down in a given (hue) location, you can desaturate (make less colorful) or resaturate (make more colorful) pixels matching hues where the curve has been raised or lowered, respectively. In the example below, a red object in the background has been desaturated so it is less of a distraction to the main subject of the photo:

: ![color zones adjust saturation](./color-zones/color-zones-adjust-saturation.png#w33)

hue
: By adjusting the hue curve up or down in a given (hue) location, you can shift the hue of pixels matching hues where the curve has been raised or lowered, allowing you to replace one color with another. In the example below, a pink toy in an image has been changed to blue:

: ![color zones adjust hue](./color-zones/color-zones-adjust-hue.png#w33)

The curves work similarly in the lightness- and saturation-based selection modes as well. See the section on [curves](../../darkroom/processing-modules/curves.md) to see how spline curves work in general.

Note that these examples are somewhat contrived in order to illustrate the module's usage. In practical use, they would likely need to be combined with [drawn](../../darkroom/masking-and-blending/masks/drawn.md) and/or [parametric](../../darkroom/masking-and-blending/masks/parametric.md) masks to further isolate their effect.

## range selection

When adjusting the pixel manipulation curves, it can sometimes be difficult to judge exactly where on the horizontal axis pixels will fall. To the right of the tab controls are a pair of color pickers that can be used to assist with this.

If you click the left-hand color picker and choose a pixel in the image, you will see a dark vertical line showing where that pixel falls on the horizontal axis. If you Ctrl+click or right-click on the same color picker you can choose a rectangular area from the image -- the range of values represented within the selected rectangle will be shaded vertically, with a similar dark line showing the median value.

If you click on the right-hand color picker, you can similarly choose a rectangular area on the image and the display will be shown as described above (a shaded area with a dark vertical line). However, in this case the color picker will also automatically add some control points to the curve for you, representing the highlighted range (see below). Simply drag on the center node to raise or lower the curve within the selected range. Alternatively, hold Ctrl while selecting a range to automatically create a positive curve (push up the selected range) or hold Shift while selecting to create a negative curve (pushed down).

![color zones overview](./color-zones/color-zones-overview.png#w33)

## module controls

The following controls are available in the _color zones_ module:

lightness, saturation & hue tabs
: Each tab displays a pixel manipulation curve to allow you to alter “lightness”, “saturation”, or “hue” based on the pixel selection method.

edit by area
: Choose how to interact with the curve. This setting is disabled by default, allowing the control points for the curve to be freely placed. Check the box to fall back to the legacy "edit by area" mode, which functions in a similar way to the spline curve controls used in [wavelet](../../darkroom/processing-modules/wavelets.md#spline-controls) modules.

 ![mask-icon](./color-zones/icon-mask.png#icon) mask display
: Enable the _mask display_ to highlight pixels that have been affected by _color zones_ adjustments in yellow.

select by
: Define the horizontal axis (the range of values to work on). You can choose between “lightness”, “saturation”, and “hue” (the default). Changing this parameter resets all pixel manipulation curves to their default state (horizontal straight lines). If you want to work on multiple ranges, you need to create additional instances of the module.

process mode
: Choose between a “smooth” (default) or “strong” processing mode. The default mode is less likely to cause artifacts.

mix
: Use this parameter to tune the strength of the overall effect.

interpolation method
: Define how the curve is interpolated using the user-defined control points. See the [curves](../../darkroom/processing-modules/curves.md) section for more details.
