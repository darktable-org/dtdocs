---
title: overview
id: overview
weight: 10
draft: false
---

By default each module takes its input from the preceding module in the pixelpipe, performs its operation on the image data, and hands the output over to the next module in the pixelpipe. 

A module's output data can optionally be reprocessed (combined) with its input data before being handed to the next module. This additional processing step is called _blending_. Input and output data is reprocessed using algorithms called blending operators or [blend modes](./blend-modes.md).

Each blend mode is further controlled by the _opacity_ parameter, having a value between 0% and 100%, which defines how much the input and output images contribute to the final result. Typically an opacity of 0% outputs an image which is identical to the input image (the module has no effect) whereas an opacity of 100% delivers the maximum effect of the module.

The opacity can be the same for every pixel in the image (by simply combining a blend mode with the single opacity slider) -- in this case blending acts uniformily on the entire image. Alternatively the opacity values can vary based on the properties or location of each pixel. This local modification of opacity is called a _mask_. Masks provide the user with fine control over which parts of an image are affected by a module and to what extent. At your choice you may activate a [drawn mask](./masks/drawn.md), a [parametric mask](./masks/parametric.md) or a [combination of the two](./masks/drawn-and-parametric.md). 

Blending and masking functionality is controlled via a group of icons located at the bottom of each applicable module. 

![mask & blend options](./overview/mask-blend-options.png#w33)

These icons enable the following masking and blending options, from left to right:

off
: Module output is passed to the next module in the pixelpipe without additional reprocessing. No further controls are displayed. 

uniformly
: Input and output images are reprocessed to the same extent for all pixels with the extent of the blending controlled by a single opacity slider. Additional controls to choose the blend mode and opacity are displayed. The default blend mode is “normal” with an opacity of 100%.

[drawn mask](./masks/drawn.md)
: Reprocessing takes place with the chosen blend mode and opacity based on pixel location as defined with a drawn mask. Additional controls are displayed which allow you to draw a mask using one or more shapes. If no mask elements are drawn then all pixels have the same opacity, as defined by the opacity slider.

[parametric mask](./masks/parametric.md)
: Reprocessing takes place with the chosen blend mode and opacity based on the properties of individual pixels. Additional controls are displayed that allow you to adjust the opacity on a per-pixel basis determined by pixel values.

[drawn & parametric mask](./masks/drawn-and-parametric.md)
: Reprocessing takes place with the chosen blend mode and opacity based on a combination of a drawn mask parametric mask.

[raster mask](./masks/raster.md)
: Reprocessing takes place with the chosen blend mode and opacity based on a mask that was generated within a different module

blending options
: Choose which color space to use when calculating the blending mask, and specify whether or not to allow a mask to be generated based on the module's output channels (normally a parametric mask is generated based on the input channels coming into the module). The following options are available:
: - _reset to default blend colorspace_: Use the default color space for the module to specify the parametric mask.
: - _Lab_: Use the Lab color space (where available) when specifying the parametric mask.
: - _RGB (display)_: Use the display-referred RGB/HSL color space to specify the parametric mask.
: - _RGB (scene)_: Use the scene-referred RGB/J<sub>z</sub>C<sub>z</sub>h<sub>z</sub> color space to specify the parametric mask.
: - _show output channels_: Show the [parametric mask](./masks/parametric.md) output channel controls, so that the parametric mask can be defined in terms of the module's output channels.

---

**Note:** Not all of these blend options are available for every module.

---

