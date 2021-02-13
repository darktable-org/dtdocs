---
title: "editing an image: workflow overview"
id: workflow-overview
draft: false
weight: 20
author: "people"
---

This section will guide you through the basics of developing an image in the [darkroom](../../darkroom/_index.md) view, where an arsenal of modules is at hand to help you reach your creative goals.

To begin, open an image in the darkroom by double clicking an image thumbnail in the [lighttable](../../lighttable/_index.md) view. 

Each change you make to the image in the darkroom is turned into a history stack item. The history is stored in a database and in an XMP sidecar file for that image. All changes are stored automatically when you switch images or go from one darktable view to another. You can safely leave darkroom mode or quit darktable at any time and come back later to continue your work. For this reason darktable does not need a “save” button and it does not have one.

On the left panel in darkroom mode is the [history stack](../../module-reference/utility-modules/darkroom/history-stack.md) module, listing the changes you have made, starting from the bottom -- each edit adds a new item to the top of the stack. You can select an earlier point in this history to show how the image looked at that point, for comparison between changes. The stack can be compressed to remove redundant intermediate points in your edits -- when you are happy with what you have done, just compress the history stack. Note that all edits above the selected history entry are permanently deleted when compressing the history stack.

A large number of [processing modules](../../module-reference/processing-modules/_index.md) are shipped with darktable, arranged into [module groups](../../darkroom/processing-modules/search-and-group.md). These groups are accessed via toggle buttons at the top of the right panel, just below the [histogram](../../module-reference/utility-modules/shared/histogram.md).

# choosing a workflow

When processing an image, we apply a sequence of modules, known as the [pixelpipe](../../darkroom/pixelpipe/_index.md). 

![edit-overview](./edit-overview/edit-overview.png#w100)

1. The _scene-referred_ modules are intended to process pixel values that are proportional to the amount of light collected by the camera at the scene. The dynamic range of an image in the scene-referred section of the pixelpipe is often larger than that of the display medium. 

2. At some point in the pixelpipe, these pixel values are compressed by a tone mapping module into a smaller dynamic range more suitable for display on a monitor or hardcopy print.

3. The remaining modules operate in this non-linear _display-referred_ section of the pixelpipe to produce the final output image.

There are two standard workflows offered in darktable (these can be changed in [preferences > processing > auto-apply pixel workflow defaults](../../preferences-settings/processing.md)):
* [_scene-referred workflow_](edit-scene-referred.md): Here the emphasis is on doing as much processing as possible in the scene-referred part of the pipeline, and performing dynamic range compression to display-referred space as late as possible. This is the preferred workflow for darktable. It uses the [_filmic rgb_](../../module-reference/processing-modules/filmic-rgb.md) module to perform the tone mapping compression.
* [_display-referred workflow_](edit-display-referred.md): This is the legacy workflow and is still the default setting when darktable is first installed. It performs the tone mapping compression much earlier in the pixelpipe, and many of the modules therefore operate in display-referred space. It uses the [_base curve_](../../module-reference/processing-modules/base-curve.md) module to perform the tone mapping compression.

A third option is to set the workflow presets option to _none_. In this case, the scene-referred workflow module order will be used by default but none of the above modules will be automatically applied. It is up to the user to arrange for appropriate tone mapping and reorder the modules where required.

---

**Note:** when changing the preferences between scene-referred and display-referred workflow, the new setting will only apply for newly imported images. If you have already imported an image using a different workflow setting, go to the [_history stack_](../../module-reference/utility-modules/darkroom/history-stack.md) module in the darkroom view, select "original image", and click "compress history stack". This will discard any previous edits and reset the workflow for that image.

---
