---
title: overview
id: overview
weight: 10
draft: false
---

By default a module takes input from the preceding module, performs its operation on the image and hands the output over to the next module in the pixelpipe. 

A module's output can optionally be reprocessed (combined) with its input before being handed to the next module. This additional processing step is called _blending_. Input and output are processed using algorithms called blending operators or [blend modes](./blend-modes.md).

Each blend mode is further controlled by the _opacity_ parameter, with a value between 0% and 100%, which defines how much the input and output images contribute to the final result. Typically an opacity of 0% outputs an image which is identical to the input image (the module has no effect) whereas an opacity of 100% delivers the maximum effect of the module.

The opacity can be the same for all image pixels (by simply combining a blend mode with the single opacity slider). In this case blending acts uniformily on the entire image. Alternatively the opacity values can vary based on the properties or location of each pixel. This local modification of opacity is called a _mask_. Masks provide the user with fine control over which parts of an image are affected by a module and to what extent. At your choice you may activate a [drawn mask](./masks/drawn.md), a [parametric mask](./masks/parametric.md) or a [combination of the two](./masks/drawn-and-parametric.md). 

Blending and masking functionality is controlled via a group of icons located at the bottom of each applicable module. Not all of these blend options are available for every module.

**ICON LIST IMAGE HERE**

off
: Module output is passed to the next module in the pixelpipe without additional reprocessing. No further controls are displayed. 

uniformly
: Input and output images are reprocessed to the same extent for all pixels with the extent of the blending controlled by a single opacity slider. Additional controls to choose the blend mode and opacity are displayed. The default blend mode is “normal” with an opacity of 100%.

[drawn mask](./masks/drawn.md)
: Reprocessing takes place with the chosen blend mode and opacity based on pixel location as defined with a drawn mask. Additional controls are displayed which allow you to draw a mask using one or more shapes. If no mask elements are drawn then all pixels have the same opacity, as defined by the opacity slider.

[parametric mask](./masks/parametric.md)
: Reprocessing takes place with the chosen blend mode and opacity based on pixel properties. Additional controls are displayed that allow you to adjust the opacity on a per-pixel basis determined by pixel values.

[drawn & parametric mask](./masks/drawn-and-parametric.md)
: Reprocessing takes place with the chosen blend mode and opacity based on a combination of a drawn mask parametric mask.

[raster mask](./masks/raster.md)
: Reprocessing takes place with the chosen blend mode and opacity based on a mask that was generated on a different module
