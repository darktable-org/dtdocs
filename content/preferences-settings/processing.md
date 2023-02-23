---
title: processing
date: 2022-12-04T02:19:02+01:00
id: processing
weight: 70
draft: false
---

Control how images are processed.

## image processing

always use LittleCMS 2 to apply output color profile
: If this option is activated, Ansel will use the LittleCMS 2 system library to apply the output color profile instead of its own internal routines. This is significantly slower than the default but might give more accurate results in some cases.

: If the given ICC is LUT-based or contains both a LUT and a matrix, Ansel will use LittleCMS 2 to render the colors regardless of this parameter's value (default off).

pixel interpolator (warp)
: The pixel interpolator used for rotation, lens correction, liquify, crop and final scaling.

: Whenever we scale or distort an image we have to choose a pixel interpolation algorithm (see [wikipedia](https://en.wikipedia.org/wiki/Image_scaling) for details). For warping modules, Ansel offers bilinear, bicubic or lanczos2. In general, bicubic is a safe option for most cases and is the default value.

pixel interpolator (scaling)
: The pixel interpolator used for scaling. The same options are provided as for the warp modules, but with the addition of lanczos3.

: lanczos3 can cause pixel overshoots leading to artefacts but sometimes gives a more crisp visual appearance. This option is therefore only provided for transforming (scaling) algorithms and is the default value.

3D lut root folder
: Define the root folder (and sub-folders) containing Lut files used by the [_lut 3D_](../modules/processing-modules/lut-3D.md) module

auto-apply chromatic adaptation defaults
: Choose which module is responsible for performing white balance adjustments (chromatic adaptation) by default. Select "legacy" (default) to perform basic chromatic adaptation within the [_white balance_](../modules/processing-modules/white-balance.md) module only. Select "modern" to use a combination of the _white balance_ and [_color calibration_](../modules/processing-modules/color-calibration.md) modules to perform modern chromatic adaptation with improved color science. These settings are applied by default to new edits and will not impact old edits.

auto-apply per camera basecurve presets
: Use a per-camera base curve by default (if available) instead of the generic manufacturer one. This should only be used in conjunction with the _display-referred_ workflow defined above (default off).

detect monochrome previews
: Enable this option to analyse images during import and tag them with the `darkroom|mode|monochrome` tag if they are found to be monochrome. The analysis is based on the preview image embedded within the imported file. This makes for a more convenient workflow when working with monochrome images, but it slows down the import, so this setting is disabled by default.

show warning messages
: Enable this option to display warning messages in processing modules where non-standard and possibly harmful settings have been used in the pipeline. Such messages can sometimes be false-positives (because of intentional non-standard settings) and can be disregarded if you know what you are doing. Disable to hide these warnings. (default on).

## CPU, GPU, Memory

Ansel resources
: Choose how much of your system and graphics card (GPU) memory will be used by Ansel. Four options are provided by default:
: - _small_ takes roughly 20% of your system memory and 40% of your GPU memory. This might be acceptable on very large systems, especially if you're not exporting images. Mostly, though, this can only be recommended if you are using a lot of other demanding applications at the same time as Ansel.
: - _default_ takes roughly 60% of your system memory and 70% of your GPU memory. This mode is recommended if you're not exporting a lot of images, have at least 16Gb of system memory and 4Gb of GPU memory, and also are running a lot of other application at the same time as Ansel.
: - _large_ takes roughly 75% of your system memory and 90% of your GPU memory. This is the best option if you are only using Ansel on your system and/or are exporting a lot of images.
: - _unrestricted_ is not generally recommended. In this mode Ansel may attempt to use more memory than your system has available. This might be _possible_ if your system uses swapping when all of its system memory is taken, but it could lead to system instability. Use this mode with care, only when exporting very large images that Ansel cannot otherwise handle.
: See the [memory & performance tuning](../performance/mem-performance.md#ansel-resources) section for more information.

prefer performance over quality
: Enable this option to render thumbnails and previews at a lower quality. This increases the rendering speed by a factor of 4, and is useful when working on slower computers (default off). This also improves the performance of slideshow image rendering.

enable disk backend for thumbnail cache
: If activated, Ansel stores all thumbnails on disk as a secondary cache, and thereby keeps thumbnails accessible if they are dropped from the primary cache. This needs more disk space but speeds up the [lighttable](../lighttable/_index.md) view as it avoids the reprocessing of thumbnails (default on).

enable disk backend for full preview cache
: If enabled, Ansel writes full preview images to disk (`.cache/Ansel/`) when evicted from the memory cache. Note that this can take a lot of storage (several gigabytes for 20k images) and Ansel will never delete cached images. It's safe to delete these manually if you want. Enabling this option will greatly improve lighttable performance when zooming an image in full preview mode (default off).

activate [OpenCL](../performance/opencl_index.md) support
: Your GPU can be used by Ansel to significantly speed up processing. The OpenCL interface requires suitable hardware and matching OpenCL drivers on your system. If one of those is not found the option is grayed out. Can be switched on and off at any time and takes immediate effect (default on).

OpenCL scheduling profile
: Defines how preview and full pixelpipe tasks are scheduled on OpenCL enabled systems:
: - _default_: the GPU processes the center view pixelpipe; the CPU processes the preview pipe,
: - _very fast GPU_: both pixelpipes are processed sequentially on the GPU.
: - _multiple GPUs_: both pixelpipes are processed in parallel on different GPUs -- see the [multiple devices](../performance/opencl/multiple-devices.md) section for more information,

tune OpenCL performance
: Defines how Ansel will attempt to tune OpenCL performance for your system. The following options are provided (default _nothing_):
: - _nothing_: do not attempt to tune OpenCL performance.
: - _memory size_: this parameter currently (by default) applies a fixed 400MB headroom to all devices and assumes the remainder (total device memory less 400MB) is available for OpenCL module processing. You can also choose to amend this value or have Ansel attempt to auto-detect available memory by changing a parameter in your `Anselrc` file. Please see the [memory & performance tuning](../performance/mem-performance.md#id-specific-opencl-configuration) section for more details. If you choose to enable auto-detection, switching this parameter off and on again will force a re-detection at the next pipe run.
: - _memory transfer_: when Ansel needs more memory than it has available, it breaks your images into tiles, which are processed separately. When tiling, Ansel frequently needs to transfer data between system and GPU memory. This option tells Ansel to use a special copy mode (pinned memory transfer), which can be faster, but can also require more memory on some devices. On other devices it might degrade performance. There is no safe general way to predict how this option will function on a given device so you will have to test it for yourself. If you have multiple devices, you can switch pinned memory transfer on or off on a "per device" basis by directly editing your Anselrc file.
: - _memory size and transfer_: use both tuning mechanisms.
: See the [memory & performance tuning](../performance/mem-performance.md) section for more information.


## Libraw

Ansel uses the Rawspeed library by default to decode raw image files. Rawspeed is flawlessly integrated in Ansel, but does not support Canon `.CR3` files yet. For this reason, a basic support of Libraw has been implemented such that owners of recent Canon cameras can still decode their files. Libraw also tends to support new formats faster than Rawspeed.

The options of this section allow users to force the use of Libraw for any picture they want, using rules based on file extension and camera/vendor EXIF metadata. The feature is brittle and unsafe in general because we don't check and sanitize every possible flavour of encoding.

Supported files
:  * Canon `.CR3`

Files that seem to be working
:   * Olympus `.ORF`
    * Hasselblad `.3FR`
    * Nikon `.NEF` __non-compressed__

Files that definitely don't work and make the software crash
:   * Nikon sRAW and compressed `.NEF`
    * Phase One `.IIQ`

{{< warning >}}
The library used to decode files is remembered at the application level, globally, not for each file. Editing pictures decoded by Libraw may not produce the exact same result if you revert to Rawspeed in the future. You should really stick to Rawspeed whenever possible.

You are strongly advised to save any edited picture to 16 bits TIFF at full resolution using Rec2020 linear color space as an archival backup of your work, and not rely on the consistency of the non-destructive editing result in the future.
{{</ warning >}}

Raw file extensions to load through Libraw
: case-insensitive, coma-separated list of the file extensions. Default : `cr3`.

Camera models to load through Libraw
: case-insensitive, coma-separated list of the camera models as they appear in the [_Display metadata_](../modules/utility-modules/shared/image-information.md) module, under the _model_ field. You may have to enable this field using the preferences of the module if it does not appear in the widget.

Camera makers to load through Libraw
: case-insensitive, coma-separated list of the camera manufacturers as they appear in the [_Display metadata_](../modules/utility-modules/shared/image-information.md) module, under the _maker_ field. You may have to enable this field using the preferences of the module if it does not appear in the widget.

{{< note >}}
For Canon files using the `.CR3` format, the _model_ and _maker_ metadata are not decoded properly and left blank. You have to filter them mandatorily by file extension.
{{</ note >}}

To debug this feature : 

1. Start Ansel in command line using `ansel -d imageio`. For each loaded image, it will tell which library was used to decode it,
1. If the settings you input make the software crash at startup, remove the `libraw/extensions`, `libraw/models`, `libraw/makers` configuration keys in the `anselrc` configuration file, located in `~./config/ansel` folder on Linux and Mac, or `APPDATA\.config\ansel` on Windows.
