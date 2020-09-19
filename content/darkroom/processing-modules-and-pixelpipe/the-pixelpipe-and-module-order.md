---
title: the pixelpipe and module order
id: the-pixelpipe-and-module-order
weight: 20
draft: false
---

The sequence of [processing modules](../../module-reference/processing-modules/_index.md) operating on an input file in a defined order to generate an output image is known as the "pixelpipe".

# module order and workflows

The order in which modules are executed within the pixelpipe has been carefully chosen to give the best output quality. In previous versions of darktable it was not possible to change the module order. However, there are a number of very specific use cases and workflows where the movement of some modules in the pipe is advised.

One of the main reasons to change the module order came about with darktable version 3.0 which introduced the new _scene-referred_ way of working. Version 3.2 formalised this by introducing _workflows_, which are controlled in [`preferences` -> `processing` -> `auto-apply pixel workflow defaults`](../../../preferences-settings/processing.md).

These workflows primarily differ in when the high-dynamic-range input from the camera is compressed to fit the dynamic range of the output medium.

## display-referred workflow

Prior to version 3.0 darktable's workflow was _display-referred_. The [_base curve_](../../../module-reference/processing-modules/base-curve.md) or [_filmic rgb_](../../../module-reference/processing-modules/filmic-rgb.md) module was placed early in the pixelpipe and most other darktable modules operated on image data only after its dynamic range had already been compressed to match the output medium (monitor) by one of these modules.

This method of operation is still enabled by default (auto-apply pixel workflow defaults = "display-referred"). This setting enables the legacy (pre-darktable-3.0) module order and automatically switches on the [_base curve_](../../../module-reference/processing-modules/base-curve.md) module for new images.

Unfortunately, within the display-referred workflow, most image operations take place on non-linear input data, which is not physically realistic and can lead to artifacts with some modules.

## scene-referred workflow

The new _scene-referred_ workflow was introduced as part of darktable 3.0. The module order was entirely rearranged to place the [_filmic rgb_](../../../module-reference/processing-modules/filmic-rgb.md) and [_base curve_](../../../module-reference/processing-modules/base-curve.md) modules at the end of a sequence of modules designed to work in _linear rgb_ space and before the modules that only work in display-referred (usually _Lab_) space. It is recommended that the majority of image processing takes place using modules up to and including the [_filmic rgb_](../../../module-reference/processing-modules/filmic-rgb.md) module. Operations in this section of the pixelpipe, being truly linear, are much more physically realistic and produce fewer artifacts.

This method of operation (auto-apply pixel workflow defaults = "scene-referred") enables the new (darktable 3.0+) module order and automatically enables the [_exposure_](../../../module-reference/processing-modules/exposure.md) and [_filmic rgb_](../../../module-reference/processing-modules/filmic-rgb.md) modules with some presets designed to act as a reasonable starting point for scene-referred image editing.

# module order in the gui

It is important to note that the order in which image operation modules are executed matches exactly the order in which the modules appear in darktable's GUI. The pixelpipe runs from the bottom to the top of the modules as they appear in the darkroom view (RAW image at the bottom of the pipe and output image at the top). **Changing the order of the modules in the GUI will change how your image is processed.**

It remains highly recommended that users not change the order within the pixelpipe for a number of reasons:

- The sequence of modules has been selected with great care in order go give highest output quality. Changes to the sequence often worsen the result rather than improving it.
- Some processing modules simply don't make sense if they are shifted in the pixelpipe. For example, [_highlight reconstruction_](../../../module-reference/processing-modules/highlight-reconstruction.md) needs to be performed on raw data before [_demosaic_](../../../module-reference/processing-modules/demosaic.md), which itself needs to be performed before any [_input color profile_](../../../module-reference/processing-modules/input-color-profile.md) can be applied. For this reason it is still not possible to move some of the modules that are placed early in the pixelpipe.
- Most of darktable's modules are designed to work within a specific color space (see the [color management](../../../special-topics/color-management/_index.md) section for more details). Full flexibility would require modules to support different parallel algorithms depending on the color space they are working in which would drastically increase complexity.

# changing module order

Despite the general recommendation to leave the pixelpipe order alone, it is possible to move modules within the pixelpipe by holding `Ctrl+Shift` and dragging and dropping the desired module to a new location. This should only be done by experienced users who understand the impact this will have on the image.

The module order can be manually changed back to either the _3.0_ or _legacy_ versions using the [module order](../../../module-reference/utility-modules/darkroom/module-order.md) module, which can also be used to define your own custom module order presets.
