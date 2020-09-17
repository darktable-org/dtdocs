---
title: graduated density
id: graduated-density
applicable-verison: 3.2.1
tags: 
working-color-space: RGB 
view: darkroom
masking: true
---

Simulate a graduated density filter in order to correct exposure and color in a progressive manner.

A line is shown on screen allow the position and rotation of the gradient to be manually modified using the mouse.

This module is known to provoke banding artifacts under certain conditions. You should consider activating the [_dithering_](./dithering.md) module to alleviate these issues.

# module controls

density
: Set the density of the filter (EV). A low value underexposes slightly whereas a high value creates a strong filter.

hardness
: The progressiveness of the gradient. A low value creates a smooth transition, whereas a high value makes the transition abrupt.

rotation
: The rotation of the filter. Negative values turn clockwise. This can also be set by moving the end of the gradient line with the mouse.

hue
: The hue of the color cast to add to the gradient

saturation
: The saturation of the color cast to add to the gradient (defaults to a neutral color cast - i.e. zero saturation)
