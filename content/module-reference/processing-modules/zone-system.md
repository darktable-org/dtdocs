---
title: zone system (deprecated)
id: zone-system
applicable-verison: 3.4
tags: 
working-color-space: Lab 
view: darkroom
masking: true
---

---

**Please note that this module is deprecated in darktable 3.4 and should no longer be used for new edits. Please use the [_tone equalizer_](./tone-equalizer.md) or multiple instances of the [_exposure_](./exposure.md) module with [parametric masks](../../darkroom/masking-and-blending/masks/parametric.md) to narrow down on a zone.**

---

Adjust the lightness of an image using Ansel Adams' [zone system](https://en.wikipedia.org/wiki/Zone_System).

The lightness of the image (the L channel in Lab color space) is divided into a number of zones ranging from pure black to pure white. These zones are displayed in a zonebar beneath a preview image. The number of zones can be changed by mouse-scrolling on that bar (default 10 zones).

![zone-system](./zone-system/zone-system.png#w33)

The zonebar is split horizontally with the lower part showing the zones of the module's input and the upper part the zones of the module's output. In its default state both parts are fully aligned. While the output zones are static you can left click and drag a control point in the input zones to modify the mapping between input and output. 

Shifting a control point proportionally expands the zones on one side and compresses the zones on the other side of that point. All pre-existing control points stay in place, effectively preventing changes to the zones beyond the next control point. Use right click to remove a control point. 

The preview image above the zonebar shows how the image's zones are broken down. When hovering above a zone, that zone – either from input or output – is highlighted in yellow on the preview image.
