---
title: overview
id: overview
weight: 10
draft: false
author: "people"
---

`darktable-chart` is a tool for extracting luminance and color values out of images taken from color reference cards such as IT8.7/1 charts. Its main purpose is to compare a source image (typically a largely unprocessed raw image) to a target image (typically a JPEG image created in-camera) and produce a darktable style that is able to use the luminance and color values of the source image to produce the target image. This style employs the [_tone curve_](../../module-reference/processing-modules/tone-curve.md) module, the [_input color profile_](../../module-reference/processing-modules/input-color-profile.md) module, and the [_color look up table_](../../module-reference/processing-modules/color-look-up-table.md) module for that purpose.

Some cameras offer various film simulation modes of your choice. With the help of `darktable-chart` and the underlying modules you can create styles that replicate these film simulations from within darktable.
