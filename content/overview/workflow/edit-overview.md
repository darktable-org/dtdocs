---
title: Editing an Image - Workflow Overview
id: workflow-overview
draft: false
weight: 20
author: "people"
---

When processing an image, we apply a sequence of modules, known as the *pixel pipe*. 

```
camera                                                       display
  |                                                             ^
  V                                                             |
	
scene-referred  -->   tone map compression     -->  display-referred
   modules          (eg. filmic or basecurve)            modules
```

The *scene referred* modules deal with pixel values that are proportional to the amount of light collected by the camera at the scene. At some point, the pixel values get compressed down by a tone mapping module into a non-linear dynamic range suitable for display or a monitor or a hardcopy print. This compressed representation is knowm as *display-referred* 

There are two standard workflows offered in darktable:
* [*scene-referred workflow*](edit-scene-referred): here the emphasis is doing as much processing as possible in the scene-referred part of the pipeline, and doing the dynamic range compression down to display-referred space as late as possible. This is the preferred workflow for darktable. It will use the *filmic* module for the tone mapping compression.
* [*display-referred workflow*](edit-display-referred): this is the legacy workflow that was used in darktable. It does the tone map compression much earlier in the pixel pipe, and many of the modules will operate in display-referred space. It will use the *basecurve* module for the tone mapping compression.

**Note:** when changing the preferences between scene-referred and display-referred workflow, you must restart darktable. The new setting will only apply for newly imported images. If you already imported an image using a different workflow setting, go to the *history stack* in the darkroom view, select "original image", and click "compress history stack". This will discard any edits and reset the workflow for that image.

A third option is to set the workflow presets option to *none*. In this case, the scene-referred workflow module order will be used by default, but it is also possible to choose a legacy default ordering. The *filmic* and *exposure* modules will not be applied automatically. It is up to the user to arrange for appropriate tone mappings and reorder the modules where required.

