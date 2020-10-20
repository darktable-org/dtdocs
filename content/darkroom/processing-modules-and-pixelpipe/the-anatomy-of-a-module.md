---
title: the anatomy of a module
id: the-anatomy-of-a-module
weight: 10
draft: false
---

The basic element of image processing in darktable is the [_processing module_](../../module-reference/processing-modules/). In order to process a raw image a number of modules act on the input image in sequence, each performing a different _operation_ on the image data. For those familiar with Adobe Photoshop, the concept of a _processing module_ in darktable is somewhat similar to an _adjustment layer_ in that that are both making an adjustment to an image, and each one is building on top of all the processing steps that came before.

There are also [_utility modules_](../../module-reference/utility-modules/) in darktable, however these are not directly involved in the image processing, and are instead providing a GUI that allows you to manage your images, tag them, export them and so on.

Every processing module executes independently in a similar manner:

1. Receive _input data_ from the last executed module
2. Perform some processing (the module's _operation_) on the input data to generate the output data. The _operation_ is what distinguishes individual darktable modules from one another. See [processing modules](../../module-reference/processing-modules/_index.md) for details of the available processing modules.
3. Modify the module's output data (if required) by applying a [_mask_](../masking-and-blending/masks/_index.md), which is used to selectively apply (or partially apply) the module's operation to only some parts of the image. 
4. Modify the \[masked\] output data (if required) by combining it with the input data using a [_blending operator_](../masking-and-blending/blend-modes.md)
5. Pass the output to the next module

Steps 3 and 4 are not supported by all modules. For example, the [_demosaic_](../../../module-reference/processing-modules/demosaic.md) module must be applied to the entire raw file in order to produce a legible image so it does not make sense to mask or blend its output.

Each of the above steps is defined in more detail in subsequent sections.
