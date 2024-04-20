---
title: bloom
id: bloom
weight: 10
applicable-version: 3.2.1
tags: 
working-color-space: Lab 
view: darkroom
masking: true
---

Create a soft bloom effect. 

This module works by blurring the highlights and then blending the result with the original image.

---

_**Note:** This module performs blurs in Lab color space, and is no longer recommended. Instead, use the [tone equalizer](./tone-equalizer.md) module or the [exposure](./exposure.md) module with a [parametric mask](../../darkroom/masking-and-blending/masks/parametric.md)._

---

# module controls

size
: The spatial extent of the bloom effect.

threshold
: The threshold for the brightness increase.

strength
: The strength of the overlighting.
