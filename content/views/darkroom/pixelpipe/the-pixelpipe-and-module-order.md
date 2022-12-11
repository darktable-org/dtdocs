---
title: the pixelpipe & module order
date: 2022-12-04T02:19:02+01:00
id: the-pixelpipe-and-module-order
weight: 20
draft: false
---

The ordered sequence of [processing modules](../../../../../../module-referen../../../processing-modul../../../_index.md) operating on an input file to generate an output image is known as the "pixelpipe".

The order of the pixelpipe is represented graphically by the order in which modules are presented in the user interface -- the pixelpipe starts with a RAW image at the bottom of the module list, and applies the processing modules one by one, piling up layer upon layer of processing from the bottom up, until it reaches the top of the list, where it outputs the fully processed image.

---

**Note:** The order in which processing modules are executed exactly matches the order in which the modules appear in Ansel's user interface. **Changing the order of the modules in the user interface changes how your image is processed.**

---

## module order and workflows

The order in which modules are executed within the pixelpipe has been carefully chosen to give the best output quality. In previous versions of Ansel it was not possible to change the module order. However, there are a number of very specific use cases where the movement of some modules within the pixelpipe is advised.

The _scene-referred_ workflow attempts to perform as many operations as possible in a linear RGB color space, only compressing the tones to fit the output medium (with a non-linear tone mapping) at the end of the pixelpipe. This has the advantage of being a more physically-realistic space to do transformations than the traditional _display-referred_ workflow, which attempts to perform operations in a non-linear _perceptual_ color space. Honoring the physical realism (rather than the perceptual realism) makes it much easier to produce predictable processing algorithms with a minimum of artifacts.

The following diagram should help you to understand the difference between these workflows:

![scene-referred and display-referred modules]../../../the-pixelpipe-and-module-ord../../../scene-display-workflows.png)

1. _Scene-referred_ modules process linear data that is proportional to the amount of light collected by the camera at the scene. The dynamic range of an image in the scene-referred section of the pixelpipe is often larger than that of the display medium.

2. At some point in the pixelpipe, these pixel values are compressed by a non-linear tone mapping operation into a smaller dynamic range more suitable for display on a monitor or a print.

3. The remaining modules operate in the non-linear _display-referred_ section of the pixelpipe to produce the final output image.

## changing module order

It remains highly recommended that users not change the order within the pixelpipe for a number of reasons:

- The sequence of modules has been selected with great care in order to give highest output quality. Changes to the sequence often worsen the result rather than improving it.
- Some processing modules simply don't make sense if they are shifted in the pixelpipe. For example, [_highlight reconstruction_](../../../../../../../../../module-referen../../../processing-modul../../../highlight-reconstruction.md) needs to be performed on raw data before [_demosaic_](../../../../../../../../../module-referen../../../processing-modul../../../demosaic.md), which itself needs to be performed before any [_input color profile_](../../../../../../../../../module-referen../../../processing-modul../../../input-color-profile.md) can be applied. For this reason it is still not possible to move some of the modules that are placed early in the pixelpipe.
- Most processing modules are designed to work within a specific color space (see the [color management](../../../../../../../../../special-topi../../../color-manageme../../../_index.md) section for more details). Full flexibility would require modules to support different parallel algorithms depending on the color space they are working in, which would drastically increase complexity.

Despite the general recommendation to leave the pixelpipe order alone, it is possible to move modules within the pixelpipe by holding Ctrl+Shift and dragging and dropping the desired module to a new location. This should only be done by experienced users who understand the impact this will have on the image.

The module order can be manually changed back to either the _v3.0_ or _legacy_ versions using the [module order](../../../../../../../../../module-referen../../../utility-modul../../../darkro../../../module-order.md) module, which can also be used to define your own custom module order presets.
