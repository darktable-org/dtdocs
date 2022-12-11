---
title: raw chromatic aberrations
date: 2022-12-04T02:19:02+01:00
id: raw-chromatic-aberrations
applicable-version: 3.6
tags:
working-color-space: Not Applicable (RAW)
view: darkroom
masking: false
---

Correct chromatic aberrations of raw images.

As this module operates on non-demosaiced raw data, the underlying model assumes an uncropped photographic image as input. It is therefore likely to fail when you zoom in, as it is only able to operate on the visible portion of the image. The module will therefore be bypassed at high zoom levels, and a "bypassed" message will appear at the top of the module. This limitation only applies to interactive work and not to the final export.

This module currently only works for raw images recorded with a Bayer sensor (the sensor used in the majority of cameras) -- for other types of image, you should use the [_chromatic aberrations_](./chromatic-aberrations.md) module instead.

The module will also not apply any corrections to any photos that have been identified as monochrome by their metadata, like the files produced by the Leica M10 Monochrom.

## module controls

iterations
: The number of iterations. For most images, "twice" is sufficient, and is the default value. Occasionally, increasing this control can give better results.

avoid colorshift
: If the module causes purple tinting, tick this box to apply a correction.
