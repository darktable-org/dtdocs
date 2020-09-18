---
title: culling
id: culling
draft: false
weight: 30
author: "people"
---

Culling mode allows you to display images side by side in order to easily compare them. There are two different methods of defining the number of images to show at the same time : “fixed” and “dynamic”.

Once in culling mode, you can switch between "fixed" and "dynamic" by pressing _<_.

fixed mode
: In fixed mode, the number of image displayed is always the same, independent of the selection length. This number can be set with a slider on the bottom panel.

: In this mode, you will navigate through all selected images. If no selection is set (or if only 1 image is selected), you'll navigate through all images.

: The default keyboard shortcut to enter culling in fixed mode is _X_.

dynamic mode
: In dynamic mode, all of the selected images are shown. If no selection is set (or if only 1 image is selected) the last value from fixed mode is used.

: The default keyboard shortcut to enter culling in dynamic mode is _Ctrl+X_.

# zoom and pan

In culling mode, you can zoom and pan in the images to see details. Images can be zoomed to 100%.

_Ctrl+scroll_ to zoom in/out of images. _click+drag_ to pan within zoomed images.

By default, zooming and panning are synchronized between all visible images. If you want to zoom or pan only a specific image, add the _Shift_ key to the above actions.

To enhance performance when loading zoomed images, you can enable the disk backend for full preview cache (in the [_cpu/gpu/memory_ tab of the _preferences_](../../preferences-settings/cpu-gpu-memory.md) dialog). Bear in mind that this could occupy a lot of disk space.
