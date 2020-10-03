---
title: module order
id: module-order
applicable-verison: 3.2.1
tags: 
view: darkroom
---

When processing an image, the active [_processing modules_](../../processing-modules/_index.md) are applied in a very particluar order, which is shown in the right-hand section of the darkroom view. Towards the bottom of the module list is a utility module named "module order". This utility module provides information about the current ordering of the processing modules in the pixel pipeline. The parameter "current order" can take on 3 possible values:

v3.0
: This is the default module ordering, and it corresponds to the [_scene-referred_](../../../overview/workflow/edit-scene-referred.md) workflow. 

legacy
: This module ordering is used for the older [_display-referred_](../../../overview/workflow/edit-display-referred.md) workflow. You will also see this lecacy module ordering for any images you previously editing using a version of darktable older than 3.0.

custom
: Since darktable 3.0, it is possible to change the order that modules will be applied in the pixel pipeline, by using `Ctrl+Shift+Drag` on the titlebar of the module, and dropping it into its new position in the pixel pipeline. If you have changed the order of any modules, then this parameter will show the value "custom".

---

**Note:** changing the order of modules in the pixel pipeline is not a cosmetic change to the presentation of the GUI, it has real consequences on how the image will be processed. Please do not change the order of the modules unless you have a specific technical reason why this is required from an image processing perspective.

---

It is possibly to reset the module order back to the v3.0 default order by clicking on the _reset parameters_ icon on the _module order_ header. You can also use the _presets menu_ to change the ordering to either v3.0 default or to legacy ordering.

For a list of the default module orderings, please refer to the [_default module order_](../../../special-topics/module-order.md) section.

