---
title: "editing an image: workflow overview"
id: workflow-overview
draft: false
weight: 20
author: "people"
---

This section will guide you through the basics of developing an image in the [darkroom](../../darkroom/_index.md) view, where an arsenal of modules is at hand to help you reach your creative goals.

To begin, open an image in the darkroom by double clicking its thumbnail in the [lighttable](../../lighttable/_index.md) view. 

In the darkroom mode, you see a list of modules to the right hand side of the screen. Each module performs one processing step to bring an image from raw format into an image that can be seen on the screen or printed. The processing steps are performed in the order shown in the module list, starting at the bottom of the list and moveing up to the top, like a stack of building blocks where each block builds on the processing done by the modules below. The order in which the modules are applied is important to provide a correctly processed image.

On the right-hand side, there is a history stack, which shows the order in which adjustments were made the the controls of the various modules. This allows you to undo changes by going back to an earlier step in the history stack.

# typical editing workflow

When processing an image, the order in which you make adjustments to modules is not necessarily the same as the order in which the modules appear in the pixel pipe. The following diagram shows key modulesin the pixel pipe that are typically involved in basic processing of an image, and underneath are numbers showing the order in which you would normally adjust those modules.

![edit-overview](./edit-overview/edit-overview.png#w100)

1. The [_lens correction_](../../module-reference/processing-modules/lens-correction.md) module can optionally be enabled at the start, to correct problems such as barrel/pincushion distortion, vignetting and chromatic aberation. This module will try to automatically detect and correct for your camera and lens combination. Sometimes it may need some help to select the right camera and/or lens.

2. The [_exposure_](../../module-reference/processing-modules/exposure.md) module is adjusted next, in order to set brightness for the main subject in your image. This then allows to you see the image sufficently well to proceed with the subsequent steps. Note that shadows and highlights may be too dark or bright, or maybe even clipped. Don't worry about that at this stage; just set the exposure of your subject to an appropriate level, and the shadows and hightlights will be dealt with later.

3. You can now look at using the [_crop and rotate_](../../../module-reference/processing-modules/crop-rotate.md) module to straighten the image and frame it correctly. You may also want to use the [_perspective correction_](../../module-reference/processing-modules/perspective-correction.md) module to apply some keystone correction so that vertical and horitontal features in the images are properly aligned. This is the digital equivalent of using a tilt-shift lens, which is commonly used when shooting images of architecture.

4. The next step is to do a _primary color grading_, often referred to as _whitebalancing_. By ensuring the neutral colours (whites and greys) in your image are indeed neutral, it provides a reliable baseline on top of which you can apply creative color gradings. The first module for this is the [_white balance_](../../module-reference/processing-modules/white-balance.md) module, which can be used by itself. However, a more sophisticated workflow is to set the _white balance_ module to "_camera neutral_" and use the [_color calibration_](../../module-reference/processing-modules/color-calibration.md) module to fine-tune the primary grading.

5. We now do a tone mapping on the image, which is where we fix up the shadows and highlights in the image. The main module for this is [_filmic rgb_](../../module-reference/processing-modules/filmic-rgb.md). We set the white point -- if your image contains areas that should really be white, then the whitepoint autoset dropper in filmic is a convenient way to do this. Otherwise, set the white point manually. The black point may need to be adjusted if the blacks are too washed out or too crushed. The _filmic rgb_ module will set the overall tone mapping for the image; to make finer adjustments to specific areas of the image, we recommend to use the [_tone equalizer_](../../module-reference/processing-modules/tone-equalizer.md) module.

At this point, you should have neutral-looking image, which is a good base on which to apply further creative adjustments.

6. We can now proceed with a _secondary_ (or creative) _color grading_. Use the [_color balance rgb_](../../module-reference/processing-modules/color-balance-rgb.md) to play with features such as color saturation and vibrance. There is a "_basic colorfullness_" preset that may give you a good starting point. This module allows you to apply tints to the shadlows and highlights using controls similar to the _slope/power/offset_ style color grading controls that you find on many video editing applications such as _DaVincvi Resolve_.

7. The global tone mapping step may have reduced the amount of local contrast in the image , and this can be restored using the [_local contrast_](../../module-reference/processing-modules/local-contrast.md) module. This can help make the image look a bit sharper. For a more sophisticated approach to sharpening/blurring the image, take a look at the [_contrast equalizer_](../../module-reference/processing-modules/contrast-equalizer.md) or [_diffuse or sharpen_](../../module-reference/processing-modules/diffuse.md) modules.

8. If needed, you can touch up the image and remove any blemishes using the powerful [_retouch_](../../module-reference/processing-modules/retouch.md) module. It uses [_wavelets_](../../darkroom/processing-modules/wavelets.md) techniques to allow blemishes to be smoothed out while still preserving the original texture over top of the touched up area.

9. The final step is to remove noise from the image using the [_denoise (profiled)_](../../module-reference/processing-modules/denoise-profiled.md) module. This step is normally left until the end as it is computationally expensive and if enabled too early, it can slow things down while you are trying to sort out the preceding steps.

# Other modules

There are a lot of other modules available in darktable, including special effects such as [_liquify_](../../module-reference/processing-modules/liquify.md), [_censorize_](../../module-reference/processing-modules/censorize.md) and [_watermark_](../../module-reference/processing-modules/watermark.md) modules. We suggest you browse through the [_Module Reference_](../../module-reference/processing-modules/_index.md) section of this manual to see what is available.

Some modules are legacy modules that were written before darktable's transition to a [_linear scene-referred color pipeline_](../../special-topics/color-pipeline.md). Many of these modules are no longer recommended; for a list of these modules and the recommended alternatives, plase refer the the [_non-recommneded modules_](../../special-topics/non-recommended-modules.md) section.

