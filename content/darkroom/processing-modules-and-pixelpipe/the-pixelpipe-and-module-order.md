---
title: the pixelpipe and module order
id: the-pixelpipe-and-module-order
weight: 20
draft: false
---

The ordered sequence of [processing modules](../../module-reference/processing-modules/_index.md) operating on an input file to generate an output image is known as the "pixelpipe". 

The order of the pixelpipe is represented graphically by the order in which modules are presented in the user interface -- the pixelpipe starts with a RAW image at the bottom of the list, and applies the processing modules one by one, piling up layer upon layer of processing from the bottom up, until it reaches the top of the list, where it outputs the fully processed image.

---

**Note:** The order in which processing modules are executed exactly matches the order in which the modules appear in darktable's user interface. **Changing the order of the modules in the user interface will change how your image is processed.**

---

# module order and workflows

The order in which modules are executed within the pixelpipe has been carefully chosen to give the best output quality. In previous versions of darktable it was not possible to change the module order. However, there are a number of very specific use cases where the movement of some modules within the pixelpipe is advised.

One of the main reasons to change the module order came about with darktable version 3.0, which introduced the new _scene-referred_ way of working. Version 3.2 formalised this by introducing the _display-referred_ and _scene-referred_ workflows, which are controlled by the [`preferences > processing > auto-apply pixel workflow defaults`](../../../preferences-settings/processing.md) setting.

The main difference between these two workflows is that _display-referred_ operates primarily in the low-dynamic-range of the user's screen, whereas _scene-referred_ operates in the high-dynamic range of the original RAW file. The transition between _scene-referred_ and _display-referred_ is usually performed by a _tone mapping_ module which takes the high-dynamic-range input from the camera and compresses it to fit the dynamic range of the output medium.

## display-referred workflow

Prior to version 3.0 darktable's workflow was _display-referred_ (`auto-apply pixel workflow defaults` = "display-referred") and this is still provided as the default workflow in the current version. In this workflow, the [_base curve_](../../../module-reference/processing-modules/base-curve.md) or [_filmic rgb_](../../../module-reference/processing-modules/filmic-rgb.md) module performs tone mapping early in the pixelpipe and most other darktable modules operate on image data in the compressed _display-referred_ space.

This worfklow enables the legacy (pre-darktable-3.0) module order and automatically switches on the [_base curve_](../../../module-reference/processing-modules/base-curve.md) module for new images.

Pixel data within the _display-referred_ space is non-linear and is not a physically realistic representation of the original scene. This can lead to various artifacts with sime modules, hence the creation of the (now recommended) _scene-referred_ workflow.

## scene-referred workflow

The new _scene-referred_ workflow (`auto-apply pixel workflow defaults` = "scene-referred") was introduced as part of darktable 3.0. The module order was entirely rearranged to place the [_filmic rgb_](../../../module-reference/processing-modules/filmic-rgb.md) and [_base curve_](../../../module-reference/processing-modules/base-curve.md) tone mapping much later in the pixelpipe. This means that most pixel operations now operate in _linear rgb_ space with only a few modules remaining within the non-linear _display-referred_ space. Within this workflow it is now recommended that the majority of image processing takes place using the modules modules up to and including [_filmic rgb_](../../../module-reference/processing-modules/filmic-rgb.md). Operations in this section of the pixelpipe, being truly linear, are much more physically realistic and produce fewer artifacts.

This workflow enables the new (darktable 3.0+) module order and automatically enables the [_exposure_](../../../module-reference/processing-modules/exposure.md) and [_filmic rgb_](../../../module-reference/processing-modules/filmic-rgb.md) modules with some presets designed to act as a reasonable starting point for scene-referred image editing.

# changing module order

It remains highly recommended that users not change the order within the pixelpipe for a number of reasons:

- The sequence of modules has been selected with great care in order go give highest output quality. Changes to the sequence often worsen the result rather than improving it.
- Some processing modules simply don't make sense if they are shifted in the pixelpipe. For example, [_highlight reconstruction_](../../../module-reference/processing-modules/highlight-reconstruction.md) needs to be performed on raw data before [_demosaic_](../../../module-reference/processing-modules/demosaic.md), which itself needs to be performed before any [_input color profile_](../../../module-reference/processing-modules/input-color-profile.md) can be applied. For this reason it is still not possible to move some of the modules that are placed early in the pixelpipe.
- Most of darktable's modules are designed to work within a specific color space (see the [color management](../../../special-topics/color-management/_index.md) section for more details). Full flexibility would require modules to support different parallel algorithms depending on the color space they are working in, which would drastically increase complexity.

Despite the general recommendation to leave the pixelpipe order alone, it is possible to move modules within the pixelpipe by holding `Ctrl+Shift` and dragging and dropping the desired module to a new location. This should only be done by experienced users who understand the impact this will have on the image.

The module order can be manually changed back to either the _3.0_ or _legacy_ versions using the [module order](../../../module-reference/utility-modules/darkroom/module-order.md) module, which can also be used to define your own custom module order presets.
