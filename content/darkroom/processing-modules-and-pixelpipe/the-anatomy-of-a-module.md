---
title: the anatomy of a module
id: the-anatomy-of-a-module
weight: 10
draft: false
---

The basic element of image processing in darktable is the [_processing module_](../../module-reference/processing-modules/). In order to process a raw image a number of such modules act on the input image in sequence, each performing a different _operation_ on the image data. For those familiar with Adobe Photoshop, the concept of a _processing module_ in darktable is analagous to that of an _adjustment layer_ in that both make an incremental adjustment to the image, building on top of the adjustments that came before.

darktable also provides [_utility modules_](../../module-reference/utility-modules/), however these are not directly involved in image processing, and instead provide a GUI that allows you to manage your images, tag them, export them and so on.

Every processing module executes independently in a similar manner:

![module anatomy](./the-anatomy-of-a-module/module-anatomy.png#w100)

1. Receive _input data_ from the last executed module. Perform some processing on that data to generate the module's _output data_. This _operation_ is what distinguishes individual [processing modules](../../module-reference/processing-modules/_index.md) from one another.

2. Generate a mask, which defines an _opacity_ for each pixel in the image. The opacity is later used to control how strongly the module's operation is applied to each part of the image. 

   The user may define their own mask by drawing shapes on the image or by using the properties of the individual pixels of either the input or output image (see [_masks_](../masking-and-blending/masks/_index.md) for details). This mask may then be further modified with a global opacity setting, which impacts every pixel equally. 

   If no drawn/parametric mask is used, the output of this step is a mask where every pixel has the same opacity (governed by the global opacity setting). If no opacity is defined (no blending is performed) a global opacity of 1.0 (or 100%) is assumed.

3. Combine the module's _input data_ and _output data_ using a [_blending operator_](../masking-and-blending/blend-modes.md) to produce the _blended output_.

4. Combine the _blended output_ with the _mask_ and the _input data_, to produce the _final output_, which is passed to the next module. This combination is performed pixel-by-pixel, where a mask opacity of 100% returns the _blended output_ for that pixel, an opacity of 0 returns the _input data_ for that pixel and an intermediate opacity blends the two proportionally.

Steps 2 and 3 are not supported by all modules. For example, the [_demosaic_](../../../module-reference/processing-modules/demosaic.md) module must be applied to the entire raw file in order to produce a legible image so it does not make sense to mask or blend its output.

Each of the above steps is defined in more detail in subsequent sections.
