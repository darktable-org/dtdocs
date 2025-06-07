---
title: the pixelpipe & module order
id: the-pixelpipe-and-module-order
weight: 20
draft: false
---

The ordered sequence of [processing modules](../../module-reference/processing-modules/_index.md) operating on an input file to generate an output image is known as the "pixelpipe". 

The order of the pixelpipe is represented graphically by the order in which modules are presented in the user interface -- the pixelpipe starts with a RAW image at the bottom of the module list, and applies the processing modules one by one, piling up layer upon layer of processing from the bottom up, until it reaches the top of the list, where it outputs the fully processed image.

---

**Note:** The order in which processing modules are executed exactly matches the order in which the modules appear in darktable's user interface. **Changing the order of the modules in the user interface changes how your image is processed.**

---

# types of pixelpipe

Processing images can be very resource-intensive. For this reason, darktable includes various types of pixelpipe, optimised for different parts of the system. For example:

- The export pixelpipe processes the full-sized image at full quality. This is the slowest type of pixelpipe, but provides the maximum available image quality.
- The thumbnail pixelpipe is optimised for speed, since it needs to process multiple small images at the same time without impacting lighttable or filmstrip performance. These optimisations impact image quality, but this is not usually a problem for the small images used in thumbnail generation.
- The standard darkroom pixelpipe attempts to produce as accurate an image as possible, while also maintaining responsiveness when modifying module parameters. It does this by only processing the pixels that are visible on-screen -- known as the "region of interest" (ROI). However, this can mean that the image doesn't accurately reflect the exported file, especially when using modules that rely on the properties of neighboring pixels. This is particularly noticeable in modules that impact local contrast (e.g. _diffuse or sharpen_, _denoise (profiled)_ and _local contrast_) and can mean that the darkroom view appears over-sharpened compared to a full-sized export.
- A cut-down darkroom pixelpipe is used while interacting with some darkroom modules that display the full image with overlays (like _retouch_, _crop_ and _liquify_). This pixelpipe excludes some long-running modules (like _diffuse or sharpen_) in order to improve responsiveness, but can temporarily make the image look under-processed (blurred). This limitation is removed as soon as you move focus to a different module.
- In order to overcome the above limitations within the standard darkroom pixelpipe, you can enable [high quality processing mode](../../module-reference/utility-modules/darkroom/high-quality-processing.md) in the darkroom view. This mode processes the entire image using the export pixelpipe and only downscales for display at the end of the pipe. This means that the darkroom image will very closely match the exported image, but will significantly degrade responsiveness when interacting with processing modules. You are advised to only use this mode after you have already done most of your processing. Its performance will be significantly improved by using an OpenCL-capable GPU.

# module order and workflows

The order in which modules are executed within the pixelpipe has been carefully chosen to give the best output quality. In previous versions of darktable it was not possible to change the module order. However, there are a number of very specific use cases where the movement of some modules within the pixelpipe is advised.

One of the main reasons to change the module order came about with darktable version 3.0, which introduced the new _scene-referred_ way of working. Version 3.2 formalised this by introducing the _display-referred_ and _scene-referred_ workflows, which are controlled by the [preferences > processing > auto-apply pixel workflow defaults](../../../preferences-settings/processing.md) setting. Starting with version 3.6, _scene-referred_ workflow is now the official recommended (and default) way to use darktable.

The _scene-referred_ workflow attempts to perform as many operations as possible in a linear RGB color space, only compressing the tones to fit the output medium (with a non-linear tone mapping) at the end of the pixelpipe. This has the advantage of being a more physically-realistic space to do transformations than the traditional _display-referred_ workflow, which attempts to perform operations in a non-linear _perceptual_ color space. Honoring the physical realism (rather than the perceptual realism) makes it much easier to produce predictable processing algorithms with a minimum of artifacts.

The following diagram should help you to understand the difference between these workflows:

![scene-referred and display-referred modules](./the-pixelpipe-and-module-order/scene-display-workflows.png)

1. _Scene-referred_ modules process linear data that is proportional to the amount of light collected by the camera at the scene. The dynamic range of an image in the scene-referred section of the pixelpipe is often larger than that of the display medium. 

2. At some point in the pixelpipe, these pixel values are compressed by a non-linear tone mapping operation into a smaller dynamic range more suitable for display on a monitor or a print.

3. The remaining modules operate in the non-linear _display-referred_ section of the pixelpipe to produce the final output image.

## display-referred workflow

Prior to version 3.0 darktable's workflow was _display-referred_ (auto-apply pixel workflow defaults = "display-referred") and this option is still provided as a legacy mode. In this workflow, the [_base curve_](../../../module-reference/processing-modules/base-curve.md) module performs tone mapping early in the pixelpipe and most other darktable modules operate on image data in the compressed _display-referred_ space.

Selecting the display-referred workflow enables the legacy (pre-darktable-3.0) module order and automatically switches on the [_base curve_](../../../module-reference/processing-modules/base-curve.md) module for new images.

Pixel data within the _display-referred_ space is non-linear and is not a physically realistic representation of the original scene. This can lead to various artifacts with some modules, hence the creation of the (now default) _scene-referred_ workflow.

## scene-referred workflow

_Scene-referred_ workflow was introduced as part of darktable 3.0, and is used when the "auto-apply pixel workflow defaults" preference is set to one of "scene-referred(filmic)" or, by default, "scene-referred(sigmoid)". The module order was entirely rearranged to place the tone mapping modules much later in the pixelpipe. This means that most modules now operate in _linear rgb_ space with only a few modules remaining within the non-linear _display-referred_ space. Within this workflow it is now recommended that the majority of image processing takes place using the modules up to and including [_sigmoid_](../../../module-reference/processing-modules/sigmoid.md) or [_filmic rgb_](../../../module-reference/processing-modules/filmic-rgb.md). Operations in this section of the pixelpipe, being truly linear, are much more physically realistic and produce fewer artifacts.

Selecting the scene-referred workflow enables the _v5.0_ module order and automatically enables the [_exposure_](../../../module-reference/processing-modules/exposure.md) and either [_sigmoid_](../../../module-reference/processing-modules/sigmoid.md) or [_filmic rgb_](../../../module-reference/processing-modules/filmic-rgb.md) modules with some presets designed to act as a reasonable starting point for scene-referred editing.

# changing module order

It remains highly recommended that users not change the order within the pixelpipe for a number of reasons:

- The sequence of modules has been selected with great care in order to give highest output quality. Changes to the sequence often worsen the result rather than improving it.
- Some processing modules simply don't make sense if they are shifted in the pixelpipe. For example, [_highlight reconstruction_](../../../module-reference/processing-modules/highlight-reconstruction.md) needs to be performed on raw data before [_demosaic_](../../../module-reference/processing-modules/demosaic.md), which itself needs to be performed before any [_input color profile_](../../../module-reference/processing-modules/input-color-profile.md) can be applied. For this reason it is still not possible to move some of the modules that are placed early in the pixelpipe.
- Most processing modules are designed to work within a specific color space (see the [color management](../../../special-topics/color-management/_index.md) section for more details). Full flexibility would require modules to support different parallel algorithms depending on the color space they are working in, which would drastically increase complexity.

Despite the general recommendation to leave the pixelpipe order alone, it is possible to move modules within the pixelpipe by holding Ctrl+Shift and dragging and dropping the desired module to a new location. This should only be done by experienced users who understand the impact this will have on the image.

The module order can be manually changed back to either the _v5.0_, _v3.0_ or _legacy_ versions using the [module order](../../../module-reference/utility-modules/darkroom/module-order.md) module, which can also be used to define your own custom module order presets.
