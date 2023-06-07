---
title: raw chromatic aberrations
id: raw-chromatic-aberrations
applicable-version: 4.4
tags: 
working-color-space: Not Applicable (RAW) 
view: darkroom
masking: false
---

Correct chromatic aberrations of raw images.

This module currently only works for raw images recorded with a Bayer sensor (the sensor used in the majority of cameras) -- for other types of image, you should use the [_chromatic aberrations_](./chromatic-aberrations.md) module instead. 

The module will also not apply any corrections to any photos that have been identified as monochrome (see [developing monochrome images](../../guides-tutorials/monochrome.md) for more information).

# module controls

iterations
: The number of iterations. For most images, "twice" is sufficient, and is the default value. Occasionally, increasing this control can give better results.

avoid colorshift
: If the module causes purple tinting, tick this box to apply a correction.
