---
title: base curve
id: base-curve
applicable-verison: 3.2.1
tags: 
working-color-space: RGB 
view: darkroom
masking: true
---

Attempt to simulate the in-camera JPEG by applying a characteristic base curve to the image.

A base curve is defined by two or more nodes. You can move any node to modify the curve. You can also create additional nodes by clicking on a curve segment between two nodes. With Ctrl+click you generate a new node at the x-location of the mouse pointer and the corresponding y-location of the current curve – this adds a node without accidentally modifying the curve. To remove a node drag it outside of the widget area.

_darktable_ comes with a number of base curve presets that mimic the curves of various camera manufacturers. These presets are automatically applied by this module according to the manufacturer ID found in the image's Exif data. The module will be switched on by default if the _default pixel workflow_ is set to "display-referred" in the _processing_ tab of the _preferences_ dialog. Base curve presets are also available that are adapted to several specific camera models. A second option in the _preferences_ dialog defines whether darktable should by default attempt to apply a camera-specific base curve or the generic manufacturer one. You can also save your own base curve as a user preset.

## Module Controls

preserve colors
: Choose a method to use to preserve colors when applying contrast.

scale
: Choose between “linear” and “logarithmic” view. In the logarithmic view more space is given to the lower values allowing a more fine-grained adjustment of the shadows.

fusion
: Trigger the exposure fusion feature (see https://en.wikipedia.org/wiki/Exposure_Fusion). This allows you to merge the image with one or two copies of itself after applying the current base curve and boosting its exposure by a selectable number of EV units. The resulting image is thus a combination of two or three different exposures of the original image. Use this feature to compress the dynamic range of extremely underexposed images or for true HDR input. For best results, use the _exposure_ module to apply a suitable adjustment for correctly exposed highlights.

exposure shift (fusion)
: The exposure difference between the merged images in EV units (default 1). This slider is only visible if the _exposure fusion_ feature is activated.

exposure bias (fusion)
: Determines how the multiple exposures are computed. With a bias of 1 (the default), the image is fused with overexposed copies of itself. With a bias of -1, it is fused with underexposed copies. A bias of 0 attempts to preserve the overall lightness of the image by combining both over- and under-exposed copies of the image. This slider is only visible if the _exposure fusion_ feature is activated.