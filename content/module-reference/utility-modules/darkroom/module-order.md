---
title: module order
date: 2022-12-04T02:19:02+01:00
id: module-order
applicable-version: 3.8
tags:
view: darkroom
---

Change the order of the [processing modules](../../processing-modules/_index.md) in the darkroom using presets.

When processing an image, the active modules are applied in a specific order, which is shown in the right-hand panel of the darkroom view. This module provides information about the current ordering of the processing modules in the [pixelpipe](../../../darkroom/pixelpipe/the-pixelpipe-and-module-order.md). The name of the currently-selected preset is shown in the module header (or "custom" if the user has manually modified the order). The following presets are available for selection.

v3.0 RAW
: This is the default module order for [scene-referred](../../../darkroom/pixelpipe/the-pixelpipe-and-module-order.md/#scene-referred-workflow) RAW development workflow.

v3.0 JPEG
: This is the default module order for JPEG development.

legacy
: This module order is used for the legacy [display-referred](../../../darkroom/pixelpipe/the-pixelpipe-and-module-order.md/#display-referred-workflow) workflow. You will also see this order displayed for any images you previously edited in darktable prior to version 3.0.

---

**Note:** changing the order of modules in the pixelpipe is not a cosmetic change to the presentation of the GUI -- it has real consequences to how the image will be processed. Please do not change the order of the modules unless you have a specific technical reason and understand why this is required from an image processing perspective.

---

For more information about changing module order please refer to [the pixelpipe & module order](../../../darkroom/pixelpipe/the-pixelpipe-and-module-order.md).
