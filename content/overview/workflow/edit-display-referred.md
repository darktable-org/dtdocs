---
title: "editing an image: display-referred workflow"
id: edit-display-referred
draft: false
weight: 40
author: "people"
---

This is a legacy mode which is retained to provide backward-compatibility with edits in older darktable versions, and to allows users to continue with their former way of working without forcing them to use the newer _scene-referred_ workflow. 

The _display-referred_ workflow places more emphasis on performing image processing in the non-linear _display-referred_ part of the [pixelpipe](../../darkroom/processing-modules-and-pixelpipe/_index.md). By default it uses the [_base curve_](../../module-reference/processing-modules/base-curve.md) module to tone map images from the linear _scene-referred_ space into _display-referred_ space, although other tone-mapping tools (such as the [_tone curve_](../../module-reference/processing-modules/tone-curve) module) can also be used. Many modules are moved later in the pipeline (after this tone mapping transition) so that they work with gamma-encoded (_display-referred_) pixel values rather than linearly-encoded (_scene-referred_) pixel values. 

Most of the basic steps required to develop images under the _display-referred_ workflow are quite similar to the _scene-referred_ workflow. The main differences lie in the choice of modules, and the order in which they appear in the pixelpipe.  To see the difference in the ordering of the modules between the _display-referred_ and _scene-referred_ workflows, please refer to the [default module order](../../special-topics/module-order.md) section.

---

**Note:** This section discusses a number of legacy modules that are no longer recommended for use in the scene-referred workflow, and new users are recommended to instead refer to the [scene-referred](./edit-scene-referred.md) section for a guide to how best to process images in darktable.

---

white balance
: The [_white balance_](../../module-reference/processing-modules/white-balance.md) module works the same as in _scene-referred_ workflow and, by default, uses the white balance coefficients provided by the camera. If this does not give acceptable results, use the camera presets or take the white balance from a neutral spot in your image. The temperature slider can be used to make the image "warmer" or "cooler". More advanced color grading is better left to other modules, as discussed later.

exposure correction
: The [_exposure_](../../module-reference/processing-modules/exposure.md) module works the same as in _scene-referred_ mode, but the way you use it is a little different. In _display-referred_ mode, you need to make sure you don't blow out your highlights too much, and use the [_base curve_](../../module-reference/processing-modules/base-curve.md) module to adjust the middle tones if needed.

: While you can use the _exposure_ module to tweak the black level to supply more contrast, you need to be very careful doing this as you can end up with negative RGB values. It is better to increase the contrast by adjusting the toe of the _base curve_, however this can be a little fiddly and it is one of the reasons why the [_filmic rgb_](../../module-reference/processing-modules/filmic-rgb.md) module was introduced to darktable. 

noise reduction
: As with the _scene-referred_ workflow, the best starting point for noise reduction is the [_denoise (profiled)_](../../module-reference/processing-modules/denoise-profiled.md) module.  Similarly, you may also choose to use [_raw denoise_](../../module-reference/processing-modules/raw-denoise.mf), [_surface blur_](../../module-reference/processing-modules/surface-blur.md), [_astrophoto denoise_](../../module-reference/processing-modules/astrophoto-denoise.md), or the [_contrast equalizer_](../../module-reference/processing-modules/contrast-equalizer.md) module.

fixing spots
: As with the _scene-referred_ workflow, you can use the [_retouch_](../../module-reference/processing-modules/retouch.md), [_spot removal_](../../module-reference/processing-modules/spot-removal.md) and [_hot pixels_](../../module-reference/processing-modules/hot-pixels.md) modules to correct artifacts in your image.

geometrical corrections
: As with the _scene-referred_ workflow you can use the [_crop and rotate_](../../module-reference/processing-modules/crop-rotate.md), [_perspective correction_](../../module-reference/processing-modules/perspective-correction.md) and [_lens correction_](../../module-reference/processing-modules/lens-correction.md) modules to correct distortions and crop your image.

bringing back detail
: Raw images often contain more information than you can see at first sight, especially in the shadows. The [_shadows and highlights_](../../module-reference/processing-modules/shadows-and-highlights.md) module helps bring these details back into visible tonal values. Structural details in fully blown-out highlights, by nature of the digital sensor, can not be recovered. However, you can correct unfavorable color casts in these areas with the [_highlight reconstruction_](../../module-reference/processing-modules/highlight-reconstruction.md) module. The [_color reconstruction_](../../module-reference/processing-modules/color-reconstruction.md) module is able to fill overexposed areas with suitable colors based on their surroundings. The [_filmic rgb_](../../module-reference/processing-modules/filmic-rgb.md) module also offers highlight reconstruction, but be sure to disable [_base curve_](../../module-reference/processing-modules/base-curve.md) first.

adjusting tonal values
: Almost every workflow is likely to include adjusting the image's tonal range and darktable offers several modules to assist with this. The most basic is the [_contrast brightness saturation_](../../module-reference/processing-modules/contrast-brightness-saturation.md) module. In the [_tone curve_](../../module-reference/processing-modules/tone-curve.md) module, tonal values are adjusted by constructing a curve. The [_levels_](../../module-reference/processing-modules/levels.md) and [_rgb levels_](../../module-reference/processing-modules/rgb-levels.md) modules offer a concise interface, with three markers in a histogram. And of course, there is nothing to stopping you from using the [_filmic rgb_](../../module-reference/processing-modules/filmic-rgb.md) module in a _display-referred_ workflow if you so wish (after disabling [_base curve_](../../module-reference/processing-modules/base-curve.md)).

enhancing local contrast
: Local contrast enhancement can emphasize detail and clarity in your image. Carefully used, it can give your photograph the right pop. Several modules are available for this task. The [_local contrast_](../../module-reference/processing-modules/local-contrast.md) module is easy to handle, with just a few parameters. A much more versatile, but also more complex, technique is offered by the [_contrast equalizer_](../../module-reference/processing-modules/contrast-equalizer.md) module. Take a look at its presets to get a feeling for how it works. The _contrast equalizer_ is darktable's "Swiss Army Knife" for many adjustments where spatial dimension plays a role. Note that the location of this module in the pixel pipeline differs significantly between the _scene-referred_ and _display-referred_ workflows.

color adjustments
: darktable offers many modules for adjusting colors in an image. A very straightforward technique is implemented in the [_color correction_](../../module-reference/processing-modules/color-correction.md) module. Use this module to give an image an overall tint or to adjust overall color saturation. The [_color zones_](../../module-reference/processing-modules/color-zones.md) module offers a much finer control to adjust saturation, lightness and hue, in user defined zones. The [_tone curve_](../../module-reference/processing-modules/tone-curve.md) module -- in addition to the classical adjustment of tonal values -- gives you fine control over the colors in an image. Finally, if you intend to convert an image into black & white, a good starting point, with an easy to use and intuitive user interface, is offered by the [_monochrome_](../../module-reference/processing-modules/monochrome.md) module. Alternatively, you might consider using the [_color calibration_](../../module-reference/processing-modules/color-calibration.md) module.

sharpening
: If you start your workflow from a raw image, your final output will need to be sharpened. The [_sharpen_](../../module-reference/processing-modules/sharpen.md) module can do this with the classical USM (unsharp mask) approach, available in most image processing software. Another very versatile way to enhance edges in an image is offered by the [_highpass_](../../module-reference/processing-modules/highpass.md) module, in combination with darktable's rich set of [_blending_](../../darkroom/masking-and-blending/blend-modes.md) operators.

artistic effects
: darktable comes with a rich set of artistic effect modules. For example you can use the [_watermark_](../../module-reference/processing-modules/watermark.md) module to add a watermark to your image. The [_grain_](../../module-reference/processing-modules/grain.md) module simulates the typical noise of classical analogue footage. Use the [_color mapping_](../../module-reference/processing-modules/color-mapping.md) module to transfer the look and feel of one color image onto another. The [_low light_](../../module-reference/processing-modules/lowlight-vision.md) module allows you to simulate human vision to make lowlight pictures look closer to reality. The [_graduated density filter_](../../module-reference/processing-modules/graduated-density.md) adds a neutral or colored gradient to your image for exposure and color correction.  

