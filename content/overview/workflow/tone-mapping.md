---
title: tone mapping
id: tone-mapping
weight: 35
---

Camera sensors are capable of capturing a wider dynamic range than can be displayed on a monitor or print. So at some point during processing the cameras data has to be compressed or clipping will occur. This is called [_tone mapping_](https://en.wikipedia.org/wiki/Tone_mapping) or sometimes a _display transform_. You may be familiar with the term _tone mapping_ from HDR-processing but it is not limited to that field: every JPEG produced by your camera and every raw processing application has to tone-map at some point. In many other raw-processors, the tone mapping is done early in the processing pipeline. In darktable's [scene referred approach](../../darkroom/pixelpipe/the-pixelpipe-and-module-order/#module-order-and-workflows) it is usually one of the last modules in the module order.

Typically exactly one tone mapper is enabled for an image, but darktable allows you to be creative and have zero, one, or more tone mappers enabled. For instance, scenes with a low dynamic range can work well without any tone mapper.

darktable has four scene-referred tone mappers:

* [_AgX_](../../module-reference/processing-modules/agx.md)
* [_filmic rgb_](../../module-reference/processing-modules/filmic-rgb.md)
* [_sigmoid_](../../module-reference/processing-modules/sigmoid.md)
* [_spektrafilm_](../../module-reference/processing-modules/spektrafilm.md)

In the display-referred workflow, which darktable offered as a default in the past, [_base curve_](../../module-reference/processing-modules/base-curve.md) is used early in the pipeline.

You can enable a default tone mapper in preferences > processing > [auto-apply pixel workflow defaults](../../preferences-settings/processing.md#image-processing).
