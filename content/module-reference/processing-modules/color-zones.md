---
title: color zones
id: color-zones
applicable-verison: 3.2.1
tags: 
working-color-space: Lab
view: darkroom
masking: true
---

Selectively adjust the lightness, saturation and hue of pixels based on their current lightness, saturation and hue.

This module works in CIE LCh color space, which separates pixels into _lightness_, chroma (or _saturation_) and _hue_ components. It allows you to manipulate the lightness, saturation and hue of targeted groups of pixels through the use of [curves](../../darkroom/interacting-with-modules/curves.md).

In the _color zones_ module, you first need to choose whether you wish to adjust (select) pixels based on their lightness, saturation or hue. Once you have chosen the pixel selection method you can then use three curves, on their respective tabs, to adjust the lightness, saturation and hue of ranges of pixels selected via this method.

# pixel selection method

The _color zones_ module offers three different methods for selecting which pixels you want to adjust. They are:

select by hue (default)
: Choose which pixels to manipulate based on their hue. For example, you may want to darken a blue sky, or to change a red porche into a yellow one. The following image shows the full range of hues that you can choose to operate on:

: ![color zones choose hue](./color-zones/color-zones-choose-hue.png#w50)

select by lightness
: Choose which pixels to manipulate based on their lightness. For example, you may want to make your shadows brighter (which is like doing a sort of tone mapping), or to make your highlights a little more yellow in hue. The following image shows the range of lightness levels that you can choose to operate on, from dark to light:

: ![color zones choose lightness](./color-zones/color-zones-choose-lightness.png#w50)

select by saturation
: Choose which pixels to manipulate based on their saturation. For example, you may want to tone down the saturation of some already highly saturated pixels, or to change their hue. The following image shows the range of saturation levels that you can choose to operate on, from a completely unsaturated monochrome grey through to the most highly saturated color:

: ![color zones choose saturation](./color-zones/color-zones-choose-saturation.png#w50)

# pixel manipulation curves

Once you have chosen a pixel selection method, the selected range of lightness, saturation or hue levels will appear along the horizonal axis of the pixel manipulation curves. There are three tabs, each with their own curve for manipulating either the hue, lightness or saturation. 

If, for example, you were to choose to _select by hue_ (the default), the horizontal axis (below the manipulation curves) would show the range of hues you can work with, and the three pixel manipulation curves would appears as follows:

lightness
: By adjusting the lightness curve up or down in a given (hue) location, you can brighten or darken pixels matching hues where the curve has been raised or lowered, respectively. In the example below the blue sky in an image has been darkened for dramatic effect:

: ![color zones adjust lightness](./color-zones/color-zones-adjust-lightness.png#w50)

saturation
: By adjusting the saturation curve up or down in a given (hue) location, you can desaturate (make less colorful) or resaturate (make more colorful) pixels matching hues where the curve has been raised or lowered, respectively. In the example below, a red object in the background has been desaturated so it is less of a distraction to the main subject of the photo:

: ![color zones adjust saturation](./color-zones/color-zones-adjust-saturation.png#w50)

hue
: By adjusting the hue curve up or down in a given (hue) location, you can shift the hue of pixels matching hues where the curve has been raised or lowered, respectively, allowing you to replace one color with another. In the example below, a pink toy in an image has been changed to blue:

: ![color zones adjust hue](./color-zones/color-zones-adjust-hue.png#w50)

The curves work similarly in the lightness-based and saturation-based selection modes as well. See the section on [curves](../../darkroom/interacting-with-modules/curves.md) to see how spline curves work in general.

In practical use, these examples would probably need to be combined with [drawn](../../darkroom/masking-and-blending/masks/drawn.md) and/or [parametric](../../darkroom/masking-and-blending/masks/parametric.md) masks to further isolate their effect. 

# range selection

When adjusting the pixel manipulation curves, it can sometimes be difficult to judge exactly where on the horizontal axis pixels will fall. Just above the curve are a pair of color pickers that can be used to help identify where to make your adjustments, and they can even assist further by automatically setting up some initial control points for you.

If you `click` the color picker on the left and then choose a pixel in the image, you will see a dark vertical line showing where that pixel falls on the horizontal axis. If you `Ctrl+click` on the same color picker you can choose a rectangular area from the image -- the range of values represented within that rectangular will be shaded vertically, with a similar dark line showing the median value.

If you `click` on the color picker on the right, you can similarly choose a rectangular area on the image and the display will be shown as described above (a shaded area with a dark vertical line). However, in this case the color picker will also automatically add some control points to the curve for you, at the start, median and end of the highlighted range (see below). Simply drag on the center notde to push up or pull down the curve within that selected range. 

If you hold `Ctrl` while selecting a region using the right-hand color picker, the auto-generated curve nodes will be automatically pushed up in the selected range. You can then fine-tune by dragging on the individual nodes. If you hold `Shift` while selecting a region, the curve will instead be pushed down in the selected range.

![color zones overview](./color-zones/color-zones-overview.png#w50)

# module controls

Here is a summary of all the settings available in the _color zones_ module:

tabbed controls
: The module provides tabs with a curve for each of the three channels “lightness”, “saturation”, and “hue”, so that you can adjust these attributes individually based on the pixel selection method (see the _pixel manipulation curves_ section above).

edit by area
: Control the interaction mode with the curve. This setting is disabled by default, which allows the control points for the curve to be freely placed and dragged. By enabling this setting, the adjustment of the curve falls back to a legacy mode, which functions in a similar to the spline curve controls used in the [wavelets](../../darkroom/interacting-with-modules/wavelets.md) modules.

mask display (![mask-icon](./color-zones/icon-mask.png))
: Enable the _mask display_ to highlight any pixels that have been affected by _color zones_ adjustments in yellow.

select by
: Define the horizontal axis, i.e. the range of values to work on. You can choose between “lightness”, “saturation”, and “hue” (default). Changing this parameter resets any defined curve to a straight horizontal line. If you want to work on multiple ranges, you'll need to use multiple instances of the _color zones_ module.

process mode
: Choose between a “smooth” (default) or “strong” processing mode, which alters the final effect.

mix
: Use this parameter to tune the strength of the overall effect.

interpolation method
: The interpolation is the strategy used to draw a continuous curve through a set of control points. The different interpolation methods are described more fully in the [curves](../../darkroom/interacting-with-modules/curves.md) section.

