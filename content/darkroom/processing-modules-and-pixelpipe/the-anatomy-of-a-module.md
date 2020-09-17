---
title: the anatomy of a module
id: the-anatomy-of-a-module
weight: 10
draft: false
---

The basic element of image processing in darktable is the _module_. In order to process a raw image a number of modules are required, each performing a different _operation_ on the image.

Modules are designed to operate independently of one another. 

Every processing module executes in a similar manner, as follows

1. Receive _input data_ from the last executed module
2. Perform some processing on the input data to generate the module's output data. The _operation_ is what distinguishes individual darktable modules from one another.
3. Optionally modify the module's output data using a _mask_ which is used to selectively apply (or partially apply) the module's operation to only some parts of the image. 
4. Optionally modify the module's output data by combining it with the module's input data using a _blending operator_
5. Pass the output to the next module

Steps 3 and 4 are not supported by all modules. For example, the [_demosaic_](../../../module-reference/processing-modules/demosaic.md) module must be applied to the entire raw file in order to produce a legible image so it does not make sense to mask or blend its output.

Each of the above steps is defined in more detail in subsequent sections.
