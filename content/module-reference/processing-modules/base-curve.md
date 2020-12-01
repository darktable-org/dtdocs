---
title: base curve
id: base-curve
applicable-verison: 3.2.1
tags: 
working-color-space: RGB 
view: darkroom
masking: true
---

Simulate the in-camera JPEG by applying a characteristic base curve to the image.

darktable comes with a number of base curve presets that attempt to mimic the curves of various camera manufacturers. These presets are automatically applied according to the manufacturer ID found in the image's Exif data. Camera-specific base curve presets are also available for some camera models. 

This module will be enabled by default if the _default pixel workflow_ is set to "display-referred" in [preferences > processing](../../preferences-settings/processing.md).  A second option in the preferences dialog defines whether darktable should by default attempt to apply a camera-specific base curve (if found) or the generic manufacturer one.

# module controls

_Please refer to the [curves](../../darkroom/interacting-with-modules/curves.md) section for more details about how to modify curves including the **scale for graph** and **preserve colors** controls._

fusion
: Trigger the exposure fusion feature (see this [Wikipedia article](https://en.wikipedia.org/wiki/Exposure_Fusion)). This feature allows you to merge the image with one or two copies of itself after applying the current base curve and boosting its exposure by a selected number of EV units. The resulting image is thus a combination of two or three different exposures of the original image. Use this feature to compress the dynamic range of extremely underexposed images or for true HDR input. For best results, use the [_exposure_](./exposure.md) module to apply a suitable adjustment for correctly exposed highlights.

exposure shift (fusion)
: The exposure difference between the merged images in EV units (default 1). This slider is only visible if the _exposure fusion_ feature is activated.

exposure bias (fusion)
: Determines how the multiple exposures are computed. With a bias of 1 (the default), the image is fused with overexposed copies of itself. With a bias of -1, it is fused with underexposed copies. A bias of 0 attempts to preserve the overall lightness of the image by combining both over- and under-exposed copies of the image. This slider is only visible if the _exposure fusion_ feature is activated.
