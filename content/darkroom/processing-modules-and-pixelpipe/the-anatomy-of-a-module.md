---
title: the anatomy of a module
id: the-anatomy-of-a-module
weight: 10
draft: false
---

The basic element of image processing in darktable is the [processing module](../../module-reference/processing-modules/). In order to process a raw image a number of such modules act on the input image in sequence, each performing a different _operation_ on the image data. For those familiar with Adobe Photoshop, the concept of a _processing module_ in darktable is analagous to that of an _adjustment layer_ in that both make an incremental adjustment to the image, building on top of the adjustments that came before.

darktable also provides [utility modules](../../module-reference/utility-modules/), however these are not directly involved in image processing, and instead provide a GUI that allows you to manage your images, tag them, export them and so on.

Every processing module executes independently in a similar manner:

![module anatomy](./the-anatomy-of-a-module/module-anatomy.png#w100)

1. Receive the _module input_ from the last executed module and perform an _operation_ it to produce the _processed output_. This _operation_ is different for every [processing module](../../module-reference/processing-modules/_index.md).

2. Combine the _module input_ and _processed output_ using a [blending operator](../masking-and-blending/blend-modes.md) to produce the _blended output_. If no blending is performed, the output of this step is the same as the _processed output_.

3. Generate a _mask_, which defines an _opacity_ for each pixel in the image. The _opacity_ is later used to control how strongly the module's operation is applied to each part of the image. 

   You may define your own mask by drawing shapes over the image or by using pixel properties from the _module input_ or _processed output_ (see [masks](../masking-and-blending/masks/_index.md) for details). This mask may be further modified with a global opacity setting, which affects every pixel equally. 

   If no drawn/parametric mask is used, the output of this step is a mask where every pixel has the same opacity (governed by the global opacity setting). If no opacity is defined (no blending is performed) a global opacity of 1.0 (or 100%) is assumed.

4. Combine the _module input_ and _blended output_ pixel-by-pixel using the _mask_ as a mixing operator, to produce the _final output_. Where the mask opacity is 100%, the _final output_ is the _blended output_ for that pixel. Where the mask opacity is 0 the final output is the _module input_ for that pixel. An intermediate opacity combines the _blended output_ and _module input_ proportionally. The _final output_ is passed to the next module for further processing.

Steps 2 and 3 are optional and not supported by all modules. For example, the [demosaic](../../../module-reference/processing-modules/demosaic.md) module must be applied to the entire raw file in order to produce a legible image so it does not make sense to mask or blend its output.

Each of the above steps is defined in more detail in subsequent sections.
