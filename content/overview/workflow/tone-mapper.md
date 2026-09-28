---
title: tone mapper
id: tone-mapper
weight: 35
---

Camera sensors are capable of capturing a wider dynamic range than can be displayed on a monitor or print. At some point in the pixelpipe, these pixel values are compressed by a non-linear tone mapping operation into a smaller dynamic range more suitable for display. To compress the values, darktable uses a tone mapper (also known as a display transform). With the exception of base curve, the tone mappers are part of a scene-referred workflow - these concepts are further discussed in [module order and workflows](../../darkroom/pixelpipe/the-pixelpipe-and-module-order/#module-order-and-workflows).

Typically exactly one tone mapper is enabled for an image, but darktable allows you to be creative and have zero, one, or more tone mappers enabled.

darktable has four scene-referred tone mappers:

* [_AgX_](../../module-reference/processing-modules/agx.md)
* [_filmic rgb_](../../module-reference/processing-modules/filmic-rgb.md)
* [_sigmoid_](../../module-reference/processing-modules/sigmoid.md)
* [_spektrafilm_](../../module-reference/processing-modules/spektrafilm.md)

For a display-referred workflow you can use the [_base curve_](../../module-reference/processing-modules/base-curve.md).

You can enable a default tone mapper in preferences > processing > [auto-apply pixel workflow defaults](../../preferences-settings/processing.md#image-processing).
