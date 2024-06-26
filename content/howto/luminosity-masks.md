---
title: make a luminosity mask
id: luminosity-masks
weight: 110
draft: false
author: "people"
---

Since a luminosity masks adjusts the strength of an effect by the
brightness of each pixel, you can accomplish this by creating a
[_parametric mask_](../darkroom/masking-and-blending/masks/parametric.md)
for the effect and adjusting the "g" (gray) or L/Jz channel controls.
For a mask targeting highlights, move the upper left triangle all the
way to the right; for a mask targeting shadows, move the upper right
triangle all the way to the left.  A midtone mask can be created by
moving both upper triangles to the middle; to match other software,
you may need to reduce the _opacity_ slider to around 50%.  The gray
channel will provide a scene-linear ramp, while the L and Jz channels
produce a perceptually linear ramp.
