---
title: processing
id: processing
weight: 70
draft: false
---

Control how images are processed.

# image processing

always use LittleCMS 2 to apply output color profile
: If this option is activated, darktable will use the LittleCMS 2 system library to apply the output color profile instead of its own internal routines. This is significantly slower than the default but might give more accurate results in some cases. 

: If the given ICC is LUT-based or contains both a LUT and a matrix, darktable will use LittleCMS 2 to render the colors regardless of this parameter's value (default off).

pixel interpolator (warp)
: The pixel interpolator used for rotation, lens correction, liquify, crop and final scaling.

: Whenever we scale or distort an image we have to choose a pixel interpolation algorithm (see [wikipedia](https://en.wikipedia.org/wiki/Image_scaling) for details). For warping modules, darktable offers bilinear, bicubic or lanczos2. In general, bicubic is a safe option for most cases and is the default value.

pixel interpolator (scaling)
: The pixel interpolator used for scaling. The same options are provided as for the warp modules, but with the addition of lanczos3.

: lanczos3 can cause pixel overshoots leading to artefacts but sometimes gives a more crisp visual appearance. This option is therefore only provided for transforming (scaling) algorithms and is the default value.

3D lut root folder
: Define the root folder (and sub-folders) containing Lut files used by the [_lut 3D_](../module-reference/processing-modules/lut-3D.md) module

auto-apply pixel workflow defaults
: Choose which modules and module order to apply to new images by default:

- _scene-referred_ workflow (default) assumes that most processing will be performed in a linear RGB color space. Selecting this option will automatically enable the [_filmic rgb_](../module-reference/processing-modules/filmic-rgb.md) and [_exposure_](../module-reference/processing-modules/exposure.md) modules and will set the pixelpipe order to _v3.0_ which is the (scene-referred) order defined for darktable 3.0 and later. 

  The _exposure_ module will include an automatic adjustment of +0.5 EV to adjust the mid-gray to match that of the majority of SLR cameras. This adjustment can be overridden with an automatically-applied preset if the default produces consistently dark images for your camera. 

  Finally, this setting automatically enables the "compensate camera exposure" option in the _exposure_ module to adjust the global brightness appropriately in cases where the camera's exposure compensation dial was used.

- _display-referred_ workflow assumes that most processing will be performed in the Lab color space and is the legacy mode from darktable 2.6 and earlier. Selecting this option will automatically enable the [_base curve_](../module-reference/processing-modules/base-curve.md) module and set the pixelpipe order to the _legacy_ (display-referred) order used by default up to version 2.6.

- _none_ will not enable any modules by default and will set the pixelpipe to the _v3.0_ (scene-referred) order defined for darktable 3.0 and later.

auto-apply chromatic adaptation defaults
: Choose which module is responsible for performing white balance adjustments (chromatic adaptation) by default. Select "legacy" (default) to perform basic chromatic adaptation within the [_white balance_](../module-reference/processing-modules/white-balance.md) module only. Select "modern" to use a combination of the _white balance_ and [_color calibration_](../module-reference/processing-modules/color-calibration.md) modules to perform modern chromatic adaptation with improved color science. These settings are applied by default to new edits and will not impact old edits.

auto-apply per camera basecurve presets
: Use a per-camera base curve by default (if available) instead of the generic manufacturer one. This should only be used in conjunction with the _display-referred_ workflow defined above (default off).

auto-apply sharpen
: Auto-apply the sharpen module to new images by default. This option is not recommended on cameras without a low-pass filter. (default on, requires a restart).

detect monochrome previews
: Enable this option to analyse images during import and tag them with the `darkroom|mode|monochrome` tag if they are found to be monochrome. The analysis is based on the preview image embedded within the imported file. This makes for a more convenient workflow when working with monochrome images, but it slows down the import, so this setting is disabled by default.

show warning messages
: Enable this option to display warning messages in processing modules where non-standard and possibly harmful settings have been used in the pipeline. Such messages can sometimes be false-positives (because of intentional non-standard settings) and can be disregarded if you know what you are doing. Disable to hide these warnings. (default on).

# cpu / gpu / memory

darktable resources
: Choose how much of your system and graphics card (GPU) memory will be used by darktable. Four options are provided by default:
: - _small_ takes roughly 20% of your system memory and 40% of your GPU memory. This might be acceptable on very large systems, especially if you're not exporting images. Mostly, though, this can only be recommended if you are using a lot of other demanding applications at the same time as darktable.
: - _default_ takes roughly 60% of your system memory and 70% of your GPU memory. This mode is recommended if you're not exporting a lot of images, have at least 16Gb of system memory and 4Gb of GPU memory, and also are running a lot of other application at the same time as darktable.
: - _large_ takes roughly 75% of your system memory and 90% of your GPU memory. This is the best option if you are only using darktable on your system and/or are exporting a lot of images.
: - _unrestricted_ is not generally recommended. In this mode darktable may attempt to use more memory than your system has available. This might be _possible_ if your system uses swapping when all of its system memory is taken, but it could lead to system instability. Use this mode with care, only when exporting very large images that darktable cannot otherwise handle.
: See the [memory & performance tuning](../special-topics/mem-performance.md#darktable-resources) section for more information. 

prefer performance over quality
: Enable this option to render thumbnails and previews at a lower quality. This increases the rendering speed by a factor of 4, and is useful when working on slower computers (default off). This also improves the performance of slideshow image rendering.

enable disk backend for thumbnail cache
: If activated, darktable stores all thumbnails on disk as a secondary cache, and thereby keeps thumbnails accessible if they are dropped from the primary cache. This needs more disk space but speeds up the [lighttable](../lighttable/_index.md) view as it avoids the reprocessing of thumbnails (default on).

enable disk backend for full preview cache
: If enabled, darktable writes full preview images to disk (`.cache/darktable/`) when evicted from the memory cache. Note that this can take a lot of storage (several gigabytes for 20k images) and darktable will never delete cached images. It's safe to delete these manually if you want. Enabling this option will greatly improve lighttable performance when zooming an image in full preview mode (default off).

activate [OpenCL](../special-topics/opencl/_index.md) support
: Your GPU can be used by darktable to significantly speed up processing. The OpenCL interface requires suitable hardware and matching OpenCL drivers on your system. If one of those is not found the option is grayed out. Can be switched on and off at any time and takes immediate effect (default on).

OpenCL scheduling profile
: Defines how preview and full pixelpipe tasks are scheduled on OpenCL enabled systems: 
: - _default_: the GPU processes the center view pixelpipe; the CPU processes the preview pipe, 
: - _very fast GPU_: both pixelpipes are processed sequentially on the GPU. 
: - _multiple GPUs_: both pixelpipes are processed in parallel on different GPUs -- see the [multiple devices](../special-topics/opencl/multiple-devices.md) section for more information, 

tune OpenCL performance
: Defines how darktable will attempt to tune OpenCL performance for your system. The following options are provided (default _nothing_):
: - _nothing_: do not attempt to tune OpenCL performance.
: - _memory size_: this parameter currently (by default) applies a fixed 400MB headroom to all devices and assumes the remainder (total device memory less 400MB) is available for OpenCL module processing. You can also choose to amend this value or have darktable attempt to auto-detect available memory by changing a parameter in your `darktablerc` file. Please see the [memory & performance tuning](../special-topics/mem-performance.md#id-specific-opencl-configuration) section for more details. 
: - _memory transfer_: when darktable needs more memory than it has available, it breaks your images into tiles, which are processed separately. When tiling, darktable frequently needs to transfer data between system and GPU memory. This option tells darktable to use a special copy mode (pinned memory transfer), which can be faster, but can also require more memory on some devices. On other devices it might degrade performance. There is no safe general way to predict how this option will function on a given device so you will have to test it for yourself. If you have multiple devices, you can switch pinned memory transfer on or off on a "per device" basis by directly editing your darktablerc file.
: - _memory size and transfer_: use both tuning mechanisms.
: See the [memory & performance tuning](../special-topics/mem-performance.md) section for more information.
