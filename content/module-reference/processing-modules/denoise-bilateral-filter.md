---
title: denoise (bilateral filter)
id: deboise-bilateral
applicable-verison: 3.2.1
tags: 
working-color-space: RGB 
view: darkroom
masking: true
---

Denoise high ISO images. 

This module reduces noise in the image while preserving sharp edges. This is accomplished by averaging pixels with their neighbors, taking into account not only their geometric distance but also their distance on the range scale (i.e. differences in the RGB values).  This module is particularly effective if one RGB channel is more noisy than the others. In such a case, use the [_channel mixer_](./channel-mixer.md) module to examine the channels one by one, in order to set the blur intensities accordingly.

As denoising is a resource-intensive process, it slows down pixelpipe processing significantly. Consider activating this module late in your workflow.

# module controls

radius
: The spacial extent of the gaussian blur.

red, green, blue
: The blur intensity for each of the RGB channels.
