---
title: lowlight vision
id: lowlight-vision
applicable-verison: 3.2.1
tags: 
working-color-space: Lab 
view: darkroom
masking: true
---

Simulate human lowlight vision, thus providing the ability to make lowlight pictures look closer to human lowpight perception. It can also be used to perform a day to night conversion.

The idea is to calculate a [scotopic vision](http://en.wikipedia.org/wiki/Scotopic_vision) image which is perceived by rods rather than than cones in the eye under low light. Scotopic lightness then is mixed with photopic value (regular color image pixel) using some blending function. This module is also able to simulate the [Purkinje effect](http://en.wikipedia.org/wiki/Purkinje_effect) by adding some blueness to the dark parts of the image.

The module comes with several presets which can be used to get a better idea about how the module works.

## Module Controls

curve
: The horizontal axis represents pixel lightness from dark (left) to bright (right). The vertical axis represents the kind of vision from night vision (bottom) to day vision (top).

blue
: Set the blue hint in shadows (Purkinje effect).
