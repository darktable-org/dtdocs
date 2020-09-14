---
title: Preferences - processing tab
date: 2020-09-09
draft: false
---

always use LittleCMS 2 to apply output color profile
: If this option is activated, darktable will use system library LittleCMS 2 instead of its own internal routines. This is significantly slower than the default but might give more accurate results in some cases (default off).

: Note that if the given ICC is LUT-based or contains both, a LUT and a matrix, darktable will use LittleCMS 2 to render the colors regardless of this configuration parameter's value.

pixel interpolator
: Pixel interpolator used in rotation, lens correction, up-and-down scaling; options are “bilinear”, “bicubic”, “lanczos2”, “lanczos3” (default).

3D lut root folder
: Define the root folder (and sub-folders) that contains Lut files used by the _lut 3D_ module

auto-apply pixel workflow defaults
: Choose which modules and module order to apply to new images by default:

: **scene-referred** workflow is based on linear RGB modules. Selecting this option will automatically enable _filmic rgb_ and _exposure_ modules will set the pixelpipe order to the (scene-referred) order defined for darktable 3.0 and later. 

: The _exposure_ module will include an automatic adjustment of +0.5 EV to adjust the mid-grey to match that of the majority of SLR cameras. This adjustment can be overridden with an automatically-applied preset if the default produces consistently dark images for your camera. 

: Finally, this setting automatically enables the "compensate camera exposure" option in the _exposure_ module to adjust the global brightness appropriately in cases where the camera's exposure compensation dial was used to protect highlights in the image or Expose To The Right (ETTR) to optimally make use of the sensor's dynamic range.

: **display-referred** (default) workflow is based on Lab modules and is the legacy mode from darktable 2.6 and earlier. Selecting this option will automatically enable the _base curve_ module and will set the pixelpipe order to the legacy (display-referred) order used by default up to version 2.6.

: **none** will not enable any modules by default and will set the pixelpipe to the (scene-referred) order defined for darktable 3.0 and later.

auto-apply per camera basecurve presets
: Use the per-camera basecurve by default instead of the generic manufacturer one if there is one available. This should only be used in conjunction with the _display referred_ workflow defined above (default off).

auto-apply sharpen
: Auto-apply the sharpen module to new images by default. This option is not recommended on cameras without a low-pass filter. The default is to not add any sharpening automatically as most recent cameras have no low-pass filter (requires a restart).