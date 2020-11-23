---
title: processing
id: processing
weight: 70
draft: false
---

The following options control how images are processed.

always use LittleCMS 2 to apply output color profile
: If this option is activated, darktable will use the LittleCMS 2 system library to apply the output color profile instead of its own internal routines. This is significantly slower than the default but might give more accurate results in some cases. 
: If the given ICC is LUT-based or contains both a LUT and a matrix, darktable will use LittleCMS 2 to render the colors regardless of this configuration parameter's value (default off).

pixel interpolator
: The pixel interpolator used in rotation, lens correction, up-scaling and down-scaling. Options are “bilinear”, “bicubic”, “lanczos2”, “lanczos3” (default).

3D lut root folder
: Define the root folder (and sub-folders) containing Lut files used by the [_lut 3D_](../module-reference/processing-modules/lut-3D.md) module

auto-apply chromatic adaptation defaults
: Choose which module is responsible for performing white balance adjustments (chromatic adaptation) by default. Select "legacy" (default) to perform basic chromatic adaptation within the [_white balance_](../module-reference/processing-modules/white-balance.md) module only. Select "modern" to use a combination of the _white balance_ and [_color calibration_](../module-reference/processing-modules/color-calibration.md) modules to perform modern chromatic adaptation with improved color science. These settings are applied by default to new edits and will not impact old edits.

auto-apply pixel workflow defaults
: Choose which modules and module order to apply to new images by default:

- _scene-referred_ workflow is based on linear RGB modules. Selecting this option will automatically enable [_filmic rgb_](../module-reference/processing-modules/filmic-rgb.md) and [_exposure_](../module-reference/processing-modules/exposure.md) modules will set the pixelpipe order to the (scene-referred) order defined for darktable 3.0 and later. 

  The _exposure_ module will include an automatic adjustment of +0.5 EV to adjust the mid-grey to match that of the majority of SLR cameras. This adjustment can be overridden with an automatically-applied preset if the default produces consistently dark images for your camera. 

  Finally, this setting automatically enables the "compensate camera exposure" option in the _exposure_ module to adjust the global brightness appropriately in cases where the camera's exposure compensation dial was used to protect highlights in the image or Expose To The Right (ETTR) to optimally make use of the sensor's dynamic range.

- _display-referred_ (default) workflow is based on Lab modules and is the legacy mode from darktable 2.6 and earlier. Selecting this option will automatically enable the [_base curve_](../module-reference/processing-modules/base-curve.md) module and set the pixelpipe order to the legacy (display-referred) order used by default up to version 2.6.

- _none_ will not enable any modules by default and will set the pixelpipe to the (scene-referred) order defined for darktable 3.0 and later.

auto-apply per camera basecurve presets
: Use the per-camera basecurve by default instead of the generic manufacturer one if there is one available. This should only be used in conjunction with the _display referred_ workflow defined above (default off).

auto-apply sharpen
: Auto-apply the sharpen module to new images by default. This option is not recommended on cameras without a low-pass filter. (default on, requires a restart).

detect monochrome previews
: Enable this to analyse images during import and tag them with the `darkroom|mode|monochrome` tag if they are found to be monochrome. The analysis is based on the preview image embedded within the imported file. This makes for a more convenient workflow when working with monochrome images, but it slows down the import, so this setting is disabled by default.
