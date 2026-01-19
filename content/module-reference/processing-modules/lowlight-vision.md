---
title: lowlight vision
id: lowlight-vision
weight: 10
---

Simulate human lowlight vision. This module can also be used to perform a day-to-night conversion.

The idea is to calculate a [scotopic vision](http://en.wikipedia.org/wiki/Scotopic_vision) image, which is perceived by the rods rather than the cones in the eyes under low light. Scotopic lightness is then mixed with photopic value (regular color image pixel) using some blending function. This module can also simulate the [Purkinje effect](http://en.wikipedia.org/wiki/Purkinje_effect) by adding some blueness to the dark parts of the image.

This module comes with several presets, which can be used to get a better idea of how the module works.

# module controls

curve
: The horizontal axis represents pixel lightness from dark (left) to bright (right). The vertical axis represents the kind of vision from night vision (bottom) to day vision (top).

blue
: Set the blue hint in shadows (Purkinje effect).
