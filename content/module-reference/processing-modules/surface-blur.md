---
title: surface blur
id: surface-blur
applicable-verison: 3.2.1
tags: 
working-color-space: RGB 
masking: true
---

This module provides smoothing of the surfaces in an image while preversing sharp edges by means of a bilateral filter. It can be used as a type of denoising filter, however bilateral filtering is susceptible to overshoots, and darktable offers better options for denoising. For example, the [_astrophoto denoise_](./astrophoto-denoise.md) module uses a non-local means denoising algorithm, and the [_denoise (profiled)_](./denoise-profiled.md) module provides a choice between non-local means and wavelet denoising algorithms.

This module blurs noise within the surfaces of an image by averaging pixels with their neighbors, taking into account not only their geometric distance but also their distance on the range scale (i.e. differences in the RGB values). It can be particularly useful if one RGB channel is more noisy/needs more smoothing than the others. In such a case, use the [_color calibration_](./color-calibration.md) module to examine the channels one by one, in order to set the blur intensities accordingly. It can be used as a creative filter to provide interesting effects such as lending an image a cartoon-like appearance. When used with chrominance blending, it can also be used to even out the color of a surface (for example, to remove skin redness).

As this module is a resource-intensive process, it slows down pixelpipe processing significantly. Consider activating this module late in your workflow.

# module controls

radius
: The spacial extent of the gaussian blur.

red, green, blue
: The blur intensity for each of the RGB channels.
