---
title: module order
id: module-order
applicable-version: 3.2.1
tags: 
view: darkroom
---

Change the order of the [processing modules](../../processing-modules/_index.md) in the darkroom using presets.

When processing an image, the active modules are applied in a specific order, which is shown in the right-hand panel of the darkroom view. This module provides information about the current ordering of the processing modules in the [pixelpipe](../../../darkroom/processing-modules-and-pixelpipe/the-pixelpipe-and-module-order.md). The single parameter "current order" can take on the following values:

v3.0
: This is the default module order for [scene-referred](../../../overview/workflow/edit-scene-referred.md) workflow. 

legacy
: This module order is used for the legacy [display-referred](../../../overview/workflow/edit-display-referred.md) workflow. You will also see this order displayed for any images you previously edited in versions prior to darktable 3.0.

custom
: Since darktable 3.0, it is possible to change the order in which modules are applied in the pixelpipe by clicking on the module header while holding Ctrl+Shift and dragging it into a new position. If you have changed the order of any modules, this parameter will show the value "custom".

---

**Note:** changing the order of modules in the pixelpipe is not a cosmetic change to the presentation of the GUI -- it has real consequences on how the image will be processed. Please do not change the order of the modules unless you have a specific technical reason and understand why this is required from an image processing perspective.

---

It is possible to reset the module order back to the v3.0 default order by clicking on the _reset parameters_ icon on the _module order_ header. You can also use the _presets menu_ to change the ordering to either v3.0 default or to legacy ordering.

For a list of the default module orders, please refer to the [default module order](../../../special-topics/module-order.md) section.

