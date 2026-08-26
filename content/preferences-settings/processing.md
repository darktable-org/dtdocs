---
title: processing
id: processing
weight: 70
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

: lanczos3 can cause pixel overshoots leading to artifacts but sometimes gives a more crisp visual appearance. This option is therefore only provided for transforming (scaling) algorithms and is the default value.

LUT 3D root folder
: Define the root folder (and sub-folders) containing LUT files used by the [_LUT 3D_](../module-reference/processing-modules/lut-3D.md) module.

Raster mask files root folder
: Define the root folder (and sub-folders) containing raster mask files used by the [external-raster-mask](../module-reference/processing-modules/external-raster.md) module.

auto-apply pixel workflow defaults
: Choose which modules and module order are applied to new RAW image edits by default:

-   _scene-referred (filmic)_ assumes that most processing will be performed in a linear RGB color space. Selecting this option automatically enables the [_filmic rgb_](../module-reference/processing-modules/filmic-rgb.md), [_exposure_](../module-reference/processing-modules/exposure.md) and [_color calibration_](../module-reference/processing-modules/color-calibration.md) modules for new edits and sets the module order to _v3.0 RAW_.

    The _exposure_ module includes an automatic exposure adjustment of +0.7 EV (to provide a midtone brightening comparable to the +0.5 to +1.2 EV typically added by in-camera tone curves), and automatically enables the "compensate camera exposure" option for the filmic workflow. Both of these settings are intended to provide a reasonable starting-point for RAWs produced by a broad range of SLR and mirrorless cameras, but they can be overridden with an automatically-applied preset if the defaults produce consistently dark images for your camera.

    In the scene-referred workflows, the [_color calibration_](../module-reference/processing-modules/color-calibration.md) module acts in conjunction with the [_white balance_](../module-reference/processing-modules/white-balance.md) module as the modern way to handle white balance and chromatic adaptation with improved color science. Note that when using the color calibration module, the white balance module needs to be active and set to "Camera Reference" mode (this will be done automatically and warnings will appear if the two modules have inconsistent settings). When using both modules as prescribed, it is still possible to auto-detect white-balance from a specific area of the image by selecting the CCT picker tool in the CAT tab of color calibration.

-   _scene-referred (AgX)_ follows the same assumptions and overall flow as _scene-referred (filmic)_, with the exception that it auto-enables the [_AgX_](../module-reference/processing-modules/agx.md) module for tone mapping in place of _filmic rgb_.

-   _scene-referred (sigmoid)_ (default) also follows the same assumptions and overall flow as _scene-referred (filmic)_, with the exception that it auto-enables the [_sigmoid_](../module-reference/processing-modules/sigmoid.md) module for tone mapping in place of _filmic rgb_.

-   _display-referred (legacy)_ is the legacy mode (used by default in darktable 2.6 and earlier) and assumes that most processing will be performed in the Lab color space. Selecting this option automatically enables the [_base curve_](../module-reference/processing-modules/base-curve.md) module for tone mapping and sets the module order to _legacy_. This workflow uses only the _white balance_ module for chromatic adaptation.

-   _none_ sets the module order to _v3.0 RAW_ and uses the _white balance_ module for chromatic adaptation. No other exposure or tone mapping modules are enabled by default.

auto-apply per camera basecurve presets
: Use a per-camera base curve by default (if available) instead of the generic manufacturer one. This should only be used in conjunction with the _display-referred_ workflow defined above (default off).

detect monochrome previews
: Enable this option to analyse images during import and tag them with the `darkroom|mode|monochrome` tag if they are found to be monochrome. The analysis is based on the preview image embedded within the imported file. This makes for a more convenient workflow when working with monochrome images, but it slows down the import, so this setting is disabled by default.

show warning messages
: Enable this option to display warning messages in processing modules where non-standard and possibly harmful settings have been used in the pipeline. Such messages can sometimes be false-positives (because of intentional non-standard settings) and can be disregarded if you know what you are doing. Disable to hide these warnings. (default on).

# HDR alignment
**Note:** These preferences are used for the [_create hdr_](../module-reference/utility-modules/lighttable/selected-image.md#images-tab) option, and are only effective when darktable is built with OpenCV.

auto-align frames when merging HDR brackets
: When enabled, darktable will attempt to align the images being used to create an HDR image (default on). To do this, it will register and warp exposure brackets onto a reference frame before merging, removing ghosting caused by a shaky tripod or handheld shots.

pick the HDR alignment reference automatically
: Before merging, examine every bracket and align to the one richest in detail instead of the first frame. Improves alignment when the first exposure is a poor template, at the cost of one extra decode pass over the frames (default off).

alignment detail (proxy scale)
: Controls the fraction of the full sensor resolution at which feature detection and alignment are computed. Higher values find more distinctive features (better on repetitive or low-contrast scenes) at the expense of more time and memory (default 0.625). 0.5 restores the legacy speed.

shadow lift for feature detection (gamma)
:  The display-gamma applied to the linear raw before feature detection, to lift shadow detail into the detector's range (default 2.2). 1.0 disables it. Higher values help under-exposed frames but can amplify shadow noise; the percentile stretch already does part of this, so the effect is scene-dependent.

local contrast for feature detection (CLAHE clip)
: Clip limit of the local contrast enhancement (CLAHE) applied before feature detection. 0 disables it (default 0). Enabling it (e.g. 2.0) helps detect features on extremely under-exposed frames, but on repetitive textures (e.g. façades, railings, foliage) it can change descriptor signatures between exposures and cause misalignment, so it is off by default.

feature budget per frame (keypoints)
: Maximum number of Scale-Invariant Feature Transform (SIFT) keypoints kept per frame after spatial balancing, before matching (default 5000). Balancing both frames to a common budget keeps a feature-dense frame from flooding the matcher with ambiguous candidates.

save alignment debug images
: Write per-frame diagnostic images while merging: the feature-detection input, the detected keypoints and all feature matches (green = inlier, red = outlier) (default off). Saved as Netpbm (PBM and PPM) files in a darktable_hdr_align_debug folder in the system temp directory (or the folder named by the DT_HDR_DEBUG_IMAGE_DIR environment variable). Only used for diagnosing alignment problems.

# CPU / memory

darktable resources
: Choose how much of your system and graphics card (GPU) memory will be used by darktable. Four options are provided by default:

: - _small_ takes roughly 20% of your system memory and 40% of your GPU memory. This might be acceptable on very large systems, especially if you're not exporting images. Mostly, though, this can only be recommended if you are using a lot of other demanding applications at the same time as darktable.

: - _default_ takes roughly 60% of your system memory and 70% of your GPU memory. This mode is recommended if you're not exporting a lot of images, have at least 16Gb of system memory and 4Gb of GPU memory, and also are running a lot of other application at the same time as darktable.

: - _large_ takes roughly 75% of your system memory and 90% of your GPU memory. This is the best option if you are only using darktable on your system and/or are exporting a lot of images.

: See the [memory & performance tuning](../special-topics/mem-performance.md#darktable-resources) section for more information.

# OpenCL

This section configures GPU acceleration for darktable's regular image-processing pipeline. It is unrelated to the AI features' GPU acceleration, which is configured separately in [AI preferences](./ai.md) – see [AI GPU acceleration](../special-topics/ai/gpu-acceleration.md) for that setup.

activate [OpenCL](../special-topics/opencl/_index.md) support
: Your GPU can be used by darktable to significantly speed up processing. The OpenCL interface requires suitable hardware and matching OpenCL drivers on your system. If one of those is not found this option is grayed out. OpenCL support can be switched on and off at any time and takes immediate effect (default on).

OpenCL fast mode
: If set, the OpenCL compiler uses aggressive optimizing for better performance with reduced precision while having some very subtle quality loss.

OpenCL scheduling profile
: Defines how preview and full pixelpipe tasks are scheduled on OpenCL enabled systems:
: - _default_: the GPU processes the center view pixelpipe; the CPU processes the preview pipe.
: - _very fast GPU_: both pixelpipes are processed sequentially on the GPU.
: - _multiple GPUs_: both pixelpipes are processed in parallel on different GPUs -- see the [multiple devices](../special-topics/opencl/multiple-devices.md) section for more information.

tuned GPU memory
: If enabled on a system with multiple OpenCL devices you may specify a safety margin per device (headroom, default is 600MB).

OpenCL drivers
: In most cases darktable is able to find the correct OpenCL driver but this depends on how your operating system handles installation. Generally speaking, darktable must:

: - not use unreliable drivers

: - only have one active driver per hardware device. Problems are typically found where the vendor-provided driver is installed _as well as_ another driver (like `rusticl`) or (on Windows) where the `OpenCLon12` driver has been installed via the `OpenCL Compatibility Pack`.

: Toggle-switches are offered for most available drivers, though on more exotic hardware like ARM boards you will have to enable the "other platforms" fallback option. Select the drivers you want to use from the list. If you suspect that a driver is malfunctioning you can explicitly disable it here.

: See the [memory & performance tuning](../special-topics/mem-performance.md) section for more information.
