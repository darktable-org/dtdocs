---
title: color equalizer
id: color-equalizer
weight: 10
applicable-version: 4.8
tags: color color-processing
working-color-space: UCS
view: darkroom
masking: true
include_toc: true
---

Selectively adjust the hue, saturation, and brightness of pixels based on the color.

Color Equalizer is essentially an implementation of the Color Zones module, but works in the scene referred part of darktable's pixelpipe.

This module works in darktable's UCS 22 color space.

he entire hue range is represented as a curve with eight overlapping sections divided by eight fixed nodes. Choose whether you wish to adjust (select) pixels based on their hue, saturation, and brightness. You can then use the equalizer interface nodes, on their respective tabs, to adjust the hue, saturation, and brightness of ranges of pixels selected via this method.

The distances between nodes cannot be changed but all nodes together can be moved by +/- 23 degrees along the color wheel using the node placement slider.

---

**Note**: Because all processing in color  equalizer is based on the hue data of each pixel, it can result in increased chroma noise or even increased luma noise if a lot of brightness changes are applied.

---

# module controls

## hue tab

Click+drag the control points on the curve to change the color of all pixels where the mask includes the given color.

## saturation tab

Click+drag the control points on the curve to change the saturation of all pixels where the mask includes the given color.

## brightness tab

Click+drag the control points on the curve to change the lightness of all pixels where the mask includes the given color.

## node placement

node placement
: Move the position of the nodes horizontally.

: Use the color picker to show a color from the photo on the equalizer interface.

## options

white level
: Set the upper bound for the brightness correction via the slider or picker.

hue curve
: Control how the curve is interpolated between control points. Move the slider to the right to make the transitions between the control points more gradual. Move the slider to the left for a sharper transition, but beware that this can result in harsher transitions.

use guided filter
: Enable or disable the use of the guided filter to separate each color node.

hue analysis radius
: Set the radius for the chroma analysis guided filter. Increase the value if there is a large amount of hue variance or chroma noise.

saturation threshold
: Set the upper bound for the guided filter's saturation threshold. Decrase the value to allow changes to areas with low chromaticity. Increase the value to restrict changes to areas of high chromaticity.

contrast
: Set the color contrast for the guided filter. Incrase th value to favor sharp transitions between colors and increase color contrast. Decrease the value for smoother color transition.

effect radius
: Set the radius for the guided filter.
