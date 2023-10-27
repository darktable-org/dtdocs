---
title: surface blur
id: surface-blur
applicable-version: 3.4
tags: 
working-color-space: RGB 
masking: true
---

Smooth image surfaces while preserving sharp edges using a bilateral filter. 

This module _can_ be used to denoise images, however you should be aware that bilateral filters are susceptible to overshoots and darktable offers much better alternatives. For example, the [_astrophoto denoise_](./astrophoto-denoise.md) module uses a non-local means denoising algorithm, and the [_denoise (profiled)_](./denoise-profiled.md) module provides a choice between non-local means and wavelet denoising algorithms. 

The _surface blur_ module blurs noise within the surfaces of an image by averaging pixels with their neighbors, taking into account not only their geometric distance but also their distance on the range scale (i.e. differences in their RGB values). It can be particularly useful if one RGB channel is more noisy/needs more smoothing than the others. In such a case, use the [_color calibration_](./color-calibration.md) module to examine the channels one by one, in order to set the blur intensities accordingly. 

In [chromaticity blending mode](../../darkroom/masking-and-blending/blend-modes.md), this module can be used to reduce the appearance of color moire resulting from fine repeated patterns on the object being photographed.  You will likely need to increase the values of the Red, Green, and Blue sliders from their defaults for optimal effectiveness.

The module can also be used as a creative filter to provide interesting effects, for example to lend an image a cartoon-like appearance. When used with chrominance blending, it can also be used to even out the color of a surface (for example, to remove skin redness).

This module is resource-intensive and slows down pixelpipe processing significantly. You should consider activating it late in your workflow.

# module controls

radius
: The spatial extent of the gaussian blur.

red, green, blue
: The blur intensity for each of the RGB channels.
