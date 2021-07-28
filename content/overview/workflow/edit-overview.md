---
title: "editing an image: workflow overview"
id: workflow-overview
draft: false
weight: 20
author: "people"
---

This section will guide you through the basics of developing an image in the [darkroom](../../darkroom/_index.md) view, where an arsenal of modules is at hand to help you reach your creative goals. Many other raw processing applications try to present an image approximating the jpeg file produced by the camera, however the philosophy behind darktable is to do minimal pre-processing and provide the user with a neutral image onto which they can apply their creative vision.

As an example, see the 3 images below. The first image is the JPEG file produced by the camera. The second image is a raw file opened by darktable, with just the default modules applied -- notice how the image looks somewhat flat and neutral. The third image is the sort of image you might get by following the steps in this workflow page.

![edit-overview_ooc](./edit-overview/edit-overview_ooc.jpg#w33#inline)
![edit-overview_flat](./edit-overview/edit-overview_flat.jpg#w33#inline)
![edit-overview_edited](./edit-overview/edit-overview_edited.jpg#w33#inline)


To begin editing an image, open it in the darkroom by double clicking its thumbnail in the [lighttable](../../lighttable/_index.md) view. 

In the darkroom mode, you see a list of modules to the right hand side of the screen. Each module performs one processing step to bring an image from raw format into an image that can be seen on the screen or printed. The processing steps are performed in the order shown in the module list, starting at the bottom of the list and moving up to the top, like a stack of building blocks where each block builds on the processing done by the modules below. The order in which the modules are applied is important to provide a correctly processed image.

On the left-hand side, there is a history stack, which shows the order in which adjustments were made the the controls of the various modules. This allows you to undo changes by going back to an earlier step in the history stack.

# typical editing workflow

When processing an image, the order in which you adjust the module settings is not necessarily the same as the order in which the modules appear in the pixel pipe and do their work. The following diagram shows key modules in the pixel pipe that are typically involved in basic processing of an image, and underneath are numbers showing the order in which you would normally adjust the module settings.

![edit-overview](./edit-overview/edit-overview.png#w100)

1. The [**_lens correction_**](../../module-reference/processing-modules/lens-correction.md) module can optionally be enabled at the start, to correct problems such as barrel/pincushion distortion, vignetting and chromatic aberration. This module will try to automatically detect and correct for your camera and lens combination. Sometimes it may need some help to select the right camera and/or lens.

2. The [**_exposure_**](../../module-reference/processing-modules/exposure.md) module is adjusted next, in order to set brightness for the main subject in your image. This then allows to you see the image sufficiently well to proceed with the subsequent steps. Note that shadows and highlights may be too dark or bright, or maybe even clipped. Don't worry about that at this stage; just set the exposure of your subject to an appropriate level, and the shadows and highlights will be dealt with later. 

   By default, the exposure module adds +0.5 EV of exposure. Some camera models may need a bit more exposure by default, and an [_auto-apply preset_](../../darkroom/processing-modules/presets.md) can be used to override this value. The _compensate camera exposure_ setting is selected by default, to take into consideration cases where the camera's exposure compensation dial was used to "Expose To The Right" (ETTR). See the [_prerequisites_](../../module-reference/processing-modules/filmic-rgb.md#prerequisites) section of the _filmic rgb_ module for more detail about this workflow. 

3. The [**_crop and rotate_**](../../../module-reference/processing-modules/crop-rotate.md) module can now be used to straighten the image and frame it correctly. You may also want to use the [_perspective correction_](../../module-reference/processing-modules/perspective-correction.md) module to apply some keystone correction so that vertical and horizontal features in the images are properly aligned. This is the digital equivalent of using a tilt-shift lens, which is commonly used when shooting images of architecture.

4. The [**_white balance_**](../../module-reference/processing-modules/white-balance.md) module does a _primary color grading_, often referred to as _white balancing_. By ensuring the neutral colours (whites and greys) in your image are indeed neutral, it provides a reliable baseline on top of which you can apply creative color gradings. The _white balance_ module normally detects the white balance settings proposed by the camera, however this can be overridden by using sliders or presets that simulate white balance settings in your camera. A more sophisticated workflow is to set the _white balance_ module to "_camera neutral_" and use the [_color calibration_](../../module-reference/processing-modules/color-calibration.md) module to fine-tune the primary grading. This will be done automatically if you set [`preferences > processing > auto-apply chromatic adaptation defaults`](../../preferences-settings/processing.md) to _modern_.

5. The [**_filmic rgb_**](../../module-reference/processing-modules/filmic-rgb.md) module is now used to do a global tone mapping on the image, where we fix up the shadows and highlights in the image. First we set the white relative exposure (the auto picker next to the slider can be helpful if your image contains pure white regions). The black relative exposure is adjusted if the blacks are too washed out or too crushed. The _filmic rgb_ module will set the overall tone mapping for the image; to make finer adjustments to specific areas of the image, we recommend to use the [_tone equalizer_](../../module-reference/processing-modules/tone-equalizer.md) module.

At this point, you should have neutral-looking image, which is a good base on which to apply further creative adjustments.

6. The [**_color balance rgb_**](../../module-reference/processing-modules/color-balance-rgb.md) module is now used to  _secondary_ or _creative_ color grading. Use it to adjust things like color saturation and vibrance. There is a "_basic colorfulness_" preset that may give you a good starting point. This module allows you to apply tints to the shadows and highlights using controls similar to the _slope/power/offset_ style color grading controls that you find on many video editing applications such as _DaVincvi Resolve_.

7. The [**_local contrast_**](../../module-reference/processing-modules/local-contrast.md) module can be used to restore some of the local contrast that may have been lost during the global tone mapping. This can help add definition to the image. For a more sophisticated approach to sharpening/blurring the image, take a look at the [_contrast equalizer_](../../module-reference/processing-modules/contrast-equalizer.md) or [_diffuse or sharpen_](../../module-reference/processing-modules/diffuse.md) modules.

8. The [**_retouch_**](../../module-reference/processing-modules/retouch.md) module can used to touch up and remove any blemishes in the image. This uses powerful [_wavelets_](../../darkroom/processing-modules/wavelets.md) techniques to allow blemishes to be smoothed out while still preserving the original texture over top of the touched up area.

9. The [**_denoise (profiled)_**](../../module-reference/processing-modules/denoise-profiled.md) module is now used to reduce the amount of noise/graininess in the image. This step is normally left until the end as it is computationally expensive and if enabled too early, it can slow things down while you are trying to sort out the preceding steps.

# Other modules

There are a lot of other modules available in darktable, including special effects such as [_liquify_](../../module-reference/processing-modules/liquify.md), [_censorize_](../../module-reference/processing-modules/censorize.md) and [_watermark_](../../module-reference/processing-modules/watermark.md) modules. We suggest you browse through the [_Module Reference_](../../module-reference/processing-modules/_index.md) section of this manual to see what is available.

Some modules are legacy modules that were written before darktable's transition to a [_linear scene-referred color pipeline_](../../special-topics/color-pipeline.md). Many of these modules are no longer recommended; for a list of these modules and the recommended alternatives, please refer the the [_non-recommended modules_](../../special-topics/non-recommended-modules.md) section.

