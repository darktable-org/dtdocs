---
title: "editing an image: workflow overview"
id: workflow-overview
draft: false
weight: 20
author: "people"
---

This section will guide you through the basics of developing an image in the [darkroom](../../darkroom/_index.md) view, where an arsenal of modules is at hand to help you reach your creative goals.

To begin, open an image in the darkroom by double clicking its thumbnail in the [lighttable](../../lighttable/_index.md) view. 

Each change you make to the image in the darkroom is turned into a history stack item. The history is stored in a database and in an XMP sidecar file for that image. All changes are automatically stored when you switch images or go from one darktable view to another. You can safely leave the darkroom or quit darktable at any time and come back later to continue your work. For this reason darktable does not need a “save” button and it does not have one.

On the left panel of the darkroom view is the [history stack](../../module-reference/utility-modules/darkroom/history-stack.md) module, which lists the changes you have made, starting from the bottom -- each edit adds a new item to the top of the stack. You can select an earlier point in the history to show how the image looked at that point. The stack can be compressed to remove redundant intermediate points in your edits -- when you are happy with what you have done, just compress the history stack. Note that all edits above the selected history entry are permanently deleted when compressing the history stack.

A large number of [processing modules](../../module-reference/processing-modules/_index.md) are shipped with darktable, arranged into [module groups](../../darkroom/organization/module-groups.md). These groups are accessed via buttons at the top of the right-hand panel, just below the [histogram](../../module-reference/utility-modules/shared/histogram.md).

# choosing a workflow

When processing an image, a sequence of processing modules is applied. This sequence is known as the [pixelpipe](../../darkroom/pixelpipe/_index.md). 

![edit-overview](./edit-overview/edit-overview.png#w100)

1. _Scene-referred_ modules are intended to process pixel values that are proportional to the amount of light collected by the camera at the scene. The dynamic range of an image in the scene-referred section of the pixelpipe is often larger than that of the display medium. 

2. At some point in the pixelpipe, these pixel values are compressed by a tone mapping module into a smaller dynamic range more suitable for display on a monitor or a print.

3. The remaining modules operate in this non-linear _display-referred_ section of the pixelpipe to produce the final output image.

Two default workflows are offered in darktable, which define the default starting point for your edits:

- [_scene-referred workflow_](edit-scene-referred.md) assumes that you will do most of your post-processing in the scene-referred part of the pipeline, and perform dynamic range compression (to display-referred space) as late as possible. This is the default, and recommended, workflow for darktable. It uses the [_filmic rgb_](../../module-reference/processing-modules/filmic-rgb.md) module to perform the tone mapping compression and applies a default exposure adjustment.
- [_display-referred workflow_](edit-display-referred.md) is a legacy workflow mode and operates in a similar manner to most other image processing software. In this mode, the tone mapping compression is performed much earlier in the pixelpipe, and many of the modules therefore operate in display-referred space. It uses the [_base curve_](../../module-reference/processing-modules/base-curve.md) module to perform the tone mapping compression.

A third option is to set the default workflow to _none_. In this case, the scene-referred workflow module order will be used by default but none of the above modules will be automatically applied. It is up to the user to arrange for appropriate tone mapping and reorder the modules where required. You can change your default workflow in [preferences > processing > auto-apply pixel workflow defaults](../../preferences-settings/processing.md).

---

**Note:** when changing between scene-referred and display-referred workflow defaults, the new setting will only apply for newly developed images. If you have loaded an image in the darkroom using a different workflow setting, you will need to discard your previous edits and reset your workflow. Go to the [_history stack_](../../module-reference/utility-modules/darkroom/history-stack.md) module in the darkroom view and press the reset button. 

---
