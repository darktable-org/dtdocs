---
title: overview
id: overview
weight: 10
draft: false
---

By default a module takes its input from the preceding module, performs its calculations and hands its output over to the next module in the pixelpipe. 

A module's output can optionally be reprocessed with its input before being handed to the next module. This additional processing step is called _blending_. Input and output are processed using algorithms called blending operators or _blend modes_.

Each blend mode is further controlled by the _opacity_ parameter, with a value between 0% and 100%, which defines how the input and output images contribute to the final result. Typically an opacity of 0% outputs an image that is identical to the input image (the module has no effect) whereas an opacity of 100% delivers the maximum effect of the module.

The opacity can be the same for all image pixels. In this case blending acts uniformily on the entire image. Alternatively opacity values can vary based on pixel location or properties. This local modification of opacity is called a _mask_ and gives fine control over what parts of an image are affected by a module and to what extent. At your choice you may activate a drawn mask or a parametric mask or a combination of both. 

This functionality is controlled with a set of icons located at the bottom of each applicable module. Some of these options are not available for some modules.

**ICON LIST IMAGE HERE**

off
: Module output is passed to the next module in pixelpipe without additional reprocessing. No further controls are displayed. 

uniformly
: Reprocessing is the same for all pixels. Additional controls to select blend mode and opacity value are displayed. The default blend mode is “normal” with an opacity of 100%.

drawn mask
: Reprocessing takes place with the chosen blend mode and opacity based on pixel location as defined with a drawn. Additional controls are displayed which allow you to draw a mask using one or more shapes. If no mask elements are drawn then all pixels have the same opacity, as defined by the opacity slider.

parametric mask
: Reprocessing takes place with the chosen blend mode and opacity based on pixel properties. Additional controls are displayed that allow you to adjust the opacity on a per-pixel basis determined by pixel values.

drawn & parametric mask
: Reprocessing takes place with the chosen blend mode and opacity based on a combination of a drawn mask parametric mask.

raster mask
: Reprocessing takes place with the chosen blend mode and opacity based on a mask which has been generated on a different module
