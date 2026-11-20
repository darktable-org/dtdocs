---
title: overview
id: overview
weight: 10
---

---

**Note:** The masking system was redesigned after darktable 5.6. If you are familiar with the drawn, parametric and raster mask modes and the mask manager, read [migrating from classic masks](./masks/migration.md) first.

---

# introduction

Each processing module takes its input from the preceding module in the pixelpipe, performs its operation on the image data, and then hands the output to the next module in the pixelpipe.

A module's output data can optionally be reprocessed (combined) with its input data before being handed to the next module. This additional processing step is called _blending_ -- input and output data is reprocessed using algorithms called blending operators or [blend modes](./blend-modes.md). The most commonly used (and default) blend mode is _normal_, which simply passes the module's output on to the next module, influenced only by the _opacity_ parameter described below.

Each blend mode is further controlled by the _opacity_ parameter (having a value between 0% and 100%) which defines how much the input and output images contribute to the final result. Typically an opacity of 0% outputs an image which is identical to the input image (the module has no effect) whereas an opacity of 100% delivers the maximum effect of the module.

This opacity can be the same for every pixel, in which case blending acts uniformly over the entire image. Alternatively the opacity values can vary depending on the properties or location of each pixel. This local modification of opacity is called a _mask_. Masks provide the user with fine control over which parts of an image are affected by a module and to what extent. A mask is built from [shapes drawn on the image](./masks/drawn.md), from [ranges of pixel values](./masks/parametric.md), from [masks of other modules](./masks/raster.md) and from [AI-selected objects](./masks/ai-masking.md), combined in any way you like -- see [masks](./masks/overview.md).

# the mask panel

Blending and masking are controlled from the [mask panel](./masks/mask-panel.md), which is located at the bottom of each module that supports blending (it can also be moved to a utility module or beside the image -- see [panel position](./masks/mask-panel.md#panel-position)).

![blending controls in the mask panel](./overview/mask-panel-blending.png#w33)

The blending controls are always at the top of the panel:

blend mode
: The [blend mode](./blend-modes.md) used to combine the module's input and output. The button to its right reverses the blending order (input on top of output).

fulcrum
: Shown only for blend modes that need a reference level, in the "RGB (scene)" blend colorspace. See [blend modes](./blend-modes.md).

opacity
: The global opacity of the module's effect. It applies on top of any mask. A warning sign is displayed next to its label when the opacity is below 10%, as the module then has very little effect on the image.

The blend mode, blend order and opacity are part of the mask panel, so they take effect only when the mask is switched on (with the ![mask on/off](./overview/icon-mask-toggle.png#icon) toggle in the panel header), even if the mask itself is empty and no masking takes place. This gives three possible states:

mask off
: The module's output is passed to the next module without blending (the "off" mode of darktable 5.6 and earlier).

mask on, empty
: The module is blended uniformly over the whole image with the chosen blend mode and opacity (the "uniformly" mode of darktable 5.6 and earlier). Turning on the "display mask" overlay in this state shows a message with the current blend mode and opacity, since there is no mask to display.

mask on, with elements
: The module is blended according to the mask built in the panel. Changing any mask control while the mask is off switches it on.

# blending options

Right-click the ![mask on/off](./overview/icon-mask-toggle.png#icon) toggle to open the [mask options](./masks/mask-panel.md#mask-options) popover. Its _instance settings_ section sets the _blend colorspace_, i.e. the color space in which the module is blended and in which its [parametric elements](./masks/parametric.md) are evaluated:

- _default_: use the default color space for the module.
- _Lab_: use the Lab color space. Only offered on modules that work in Lab.
- _RGB (display)_: use the display-referred RGB/HSL color space.
- _RGB (scene)_: use the scene-referred RGB/J<sub>z</sub>C<sub>z</sub>h<sub>z</sub> color space.

Parametric elements are tied to the blend colorspace. If you change it while the mask contains parametric elements, darktable asks for confirmation and removes them.

---

**Note:** Not all of these options are available for every module.

---
