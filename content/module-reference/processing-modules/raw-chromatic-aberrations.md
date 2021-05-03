---
title: raw chromatic aberrations
id: raw-chromatic-aberrations
applicable-version: 3.6
tags: 
working-color-space: Not Applicable (RAW) 
view: darkroom
masking: false
---

Correct chromatic aberrations of raw images.

As this module operates on non-demosaiced raw data, the underlying model assumes an uncropped photographic image as input. It is therefore likely to fail when you zoom in, as it is only able to operate on the visible portion of the image. The module will therefore be bypassed at high zoom levels, and a "bypassed" message will appear at the top of the module. This limitation only applies to interactive work and not to the final export. 

This module currently only works for images recorded with a Bayer sensor (the sensor used in the majority of cameras). It will not apply any corrections to photos that have been identified as monochrome (see [developing monochrome images](../../guides-tutorials/monochrome.md) for more information).

# module controls

iterations
: The number of iterations. For most images, "twice" is sufficient, and is the default value. Occasionally, increasing this control can give better results.

avoid colorshift
: If the module causes purple tinting, tick this box to apply a correction.
