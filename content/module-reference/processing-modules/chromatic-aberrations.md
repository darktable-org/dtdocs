---
title: chromatic aberrations
id: chromatic-aberrations
applicable-version: 3.2.1
tags: 
working-color-space: Not Applicable (RAW) 
view: darkroom
masking: false
---

Correct chromatic aberrations.

The underlying model assumes as input an uncropped photographic image. The module is therefore likely to fail when you zoom in, as it is only able to operate on the visible portion of the image. This limitation only applies to interactive work and not to the final export. 

This module currently only works for images recorded with a Bayer sensor (the sensor used in the majority of cameras). It will not apply any corrections to photos that have been identified as monochrome (see [developing monochrome images](../../guides-tutorials/monochrome.md) for more information). This module has no parameters.
