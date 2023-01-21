---
title: final resampling
date: 2023-01-21
id: final-resampling
tags: ["sampling"]
applicable-version: 4.0
working-color-space: RGB
view: darkroom
masking: false
include_toc: true
---

This module has always been in the pixel pipeline but was hidden in darktable GUI. Ansel 0.0 exposes it to allow users to fix a mistake in the default pipeline order of darktable.

## Action

When exporting images to save them to a file, the picture is processed at full resolution and then rescaled to the specified output size by this module.

_Final resampling_ is never used when producing previews, for the lighttable thumbnails or in the darkroom, because in this case images are resampled earlier in the pipeline, for better rendering speed. It has no effect if the image is exported at its full (original) resolution either.

## Problem

In darktable legacy pipeline order as well as in the darktable v3.0 default pipeline order, the final resampling is positionned after the [output color profile](./output-color-profile.md), which means it resamples RGB data encoded with an [OETF](https://en.wikipedia.org/wiki/Transfer_functions_in_imaging) (improperly called "gamma" in ICC color profiles), meaning it processes non-linear RGB.

Resampling non-linear RGB is known to create artifacts such as fringes around sharp and contrasted edges, and should be avoided in general. However, in a majority of cases, it makes no perceptible difference, especially when processing low-dynamic-range images.

## Solution

Ansel exposes the GUI widget of the _final resampling_ module to give users the opportunity to correct themselves the position of the module in the pipeline, pending a new default pipeline order.

It is recommanded to place the _final resampling_ before the _output color profile_ module, and even before [_filmic_](./filmic-rgb.md) for best results.

## Controls

The type of interpolation used for this final rescaling is defined globally in the software, in the [_preferences_](../../preferences-settings/processing.md), under the _pixel interpolator (scaling)_ parameter. _Bilinear_ is safe, fast and robust but will typically be slightly blurrier. _Bicubic_ offers the best all-around quality/cost ratio. _Lanczos_ interpolator are the sharpest but are known to [overshoot](https://mazzo.li/posts/lanczos.html#sinc-problems) at very contrasty edges and may create ringing.

## Enhancements

A common practice is to apply some sharpening after the downsampling. Ansel does not do it by default, but you can by duplicating an instance of [_diffuse and sharpen_](./diffuse.md), [_sharpen_](./sharpen.md) or [_contrast equalizer_](./contrast-equalizer.md) and moving it after (above) the _final resampling_ module. In that case, ensure _final resampling_ is before the display view transform (_filmic_ or the _base curve_) such that your sharpening instance can go in-between. You should also avoid re-sharpening when using _Lanczos_ intepolators (it may worsen its typical artifacts if any) and keep your sharpening at the pixel level, with a radius of 1-2 px maximum.
