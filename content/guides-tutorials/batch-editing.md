---
title: batch-editing images
date: 2022-12-04T02:19:02+01:00
id: batch-editing
draft: false
weight: 110
author: "people"
---

Batch-editing is the process of developing images in a semantically-related series that are expected to have a consistent final look, often with the intent of publishing the images in catalogues, magazines or books. It can be a tedious, frustrating and unexciting task, so Ansel includes functionality to help make it faster and more reliable.

## preparation

### shooting color checkers

Shooting a color checker on-location can save a tremendous amount of time during batch post-processing of a series of images. The image of the color checker can be quickly used as a color reference in the post-processing workflow to neutralize any color cast -- Datacolor and X-Rite color checkers (24 and 48) are natively supported.

### prefer consistent lighting conditions

If possible, use controlled artifical lighting to maintain consistent lighting over the series of images. This means that you won't have to worry about light color temperature and intensity changes between images. Shoot a new image of the same color checker every time your lighting conditions change.

### prefer manual mode

If possible, shooting in manual mode with constant exposure settings will help to remove some variability in the series. In terms of post-processing, any variation means that individual adjustments will be needed on each image, which will hinder your productivity.

## post-processing

### concepts

The post-processing needs to be split in 2 fully separated parts:

1. primary color-grading,
2. secondary color-grading.

Primary color-grading is performed first in the pixel pipeline **and** in the editing workflow, with modules such as [_exposure_](../module-reference/processing-modules/exposure.md), [_input color profile_](../module-reference/processing-modules/input-color-profile.md) and [_color calibration_](../module-reference/processing-modules/color-calibration.md). Its purpose is to normalize each image to the same neutral ground-truth, in terms of overall brightness, color accuracy and white balance. This stage aims at making all images look similarly boring by removing any color cast and ensuring a perfectly neutral white, and is particularly important if your series uses different cameras. Primary color-grading is not about artistic intent or expression, but simply about preparing a sane and consistent basis for the next stage.

Secondary color-grading happens next in the pixel pipeline **and** in the editing workflow. This is where all the artistic expression happens, with modules such as [_color balance rgb_](../module-reference/processing-modules/color-balance-rgb.md). **If and only if** the primary color-grading was successful at perfectly neutralizing all images to the same ground-truth, copying and pasting the secondary color-grading steps between images should have exactly the same visual effect on each image, no matter if the images were shot with a different camera or under _slightly_ different lighting conditions.

In a nutshell, the whole purpose of the primary color-grading is to ensure the repeatability of the secondary color-grading between images. For example, if a non-neutral white balance is expected in the series, it is much easier to re-introduce non-neutrality in _color balance rgb_ (using the same color shift) on fully-neutralized images, than to fine-tune the primary color-grading individually on each image, especially if several different cameras were used.

### method

#### profiling the series

You will first need to extract a [color calibration profile](../module-reference/processing-modules/color-calibration.md#extracting-settings-using-a-color-checker) from the image(s) of your color checker. This profile can then be applied to all images shot under the same lighting conditions with the same camera by copying and pasting the [development history stack](../module-reference/utility-modules/lighttable/history-stack.md) in the lighttable view. This step needs to be repeated for each camera and lighting setup.

---

**Note**: this process only works with the [_modern chromatic adaptation_](../preferences-settings/processing.md#image-processing) workflow, which assumes hard-setting the [_white balance_](../module-reference/processing-modules/white-balance.md) to a D65 (_camera reference_) illuminant. See the documentation in the [_color calibration_](../module-reference/processing-modules/color-calibration.md#white-balance-in-the-chromatic-adaptation-transformation-cat-tab) module for more information.

---

#### editing the reference image

Choose a reference image that was taken in the lighting conditions closest to those of the color checker image that served as your profiling reference. Your primary color-grading should already be handled by the profile used in the _color calibration_ module (in conjuction with the _input color profile_ module). What remains to complete this stage is to adjust the [_exposure_](../module-reference/processing-modules/exposure.md) setting to match the overall brightness that you expect.

Next, proceed with the [_filmic rgb_](../module-reference/processing-modules/filmic-rgb.md#scene) white and black relative exposures, as well as the contrast setting. Finish with the secondary color-grading.

When this is done, you can measure the brightness and chromaticity of a control sample, preferably located on a non-moving surface that is consistently lit across your series (and appearing in all the frames). These measurements are taken using the [_spot exposure mapping_](../module-reference/processing-modules/exposure.md#spot-exposure-mapping) and [_color calibration spot mapping_](../module-reference/processing-modules/color-calibration.md#spot-color-mapping) tools. They will be memorized and will serve as a target for individual images as needed.

#### propagating the look

You can then propagate your secondary color-grading (including _filmic rgb_) to all the other images of the series, no matter whether or not they were shot in the same lighting conditions, since you should already have propagated your primary color-grading (calibration profile) to the relevant images. Don't forget to paste the history using _append_ mode or you will overwrite your primary color-grading as well.

However, this alone will not ensure a consistent look for the whole series.

#### fine-tune individual settings

If there was some variability in your lighting conditions, each image will need some further fine-tuning adjustments. Fortunately, if you have applied the proposed method so far, this should be relatively straightforward.

First, homogenize the exposure using your control sample and the [_spot exposure mapping_](../module-reference/processing-modules/exposure.md#spot-exposure-mapping) tool.

Then, adjust the _filmic rgb_ white relative exposure if needed, preferably using the color picker. The contrast should not require any adjustment since it does not depend on the dynamic-range of the image.

Finally, homogenize the chromatic adaptation, using your control sample and the [_color calibration spot mapping_](../module-reference/processing-modules/color-calibration.md#spot-color-mapping) tool.

This should get you close enough in most cases. However, if the background has changed, it is possible that these fine adjustments (aimed towards technically normalizing the primary color-grading on an individual basis) are not sufficient to give a perceptually-even look. In this case, you will need an extra step of secondary color-grading, which you are advised to perform on top of the previous one (shared with the other images of the series), in new instances of the relevant modules located later in the pipe. This ensures that the base secondary color-grading stays constant for all images and makes for a better workflow. You are not advised to make large changes in the primary color-grading to manage perceptual discrepancies involving contrast with the background.

#### controlling your series

The [culling mode](../lighttable/lighttable-modes/culling.md) in the _lighttable_ view will help you to compare images side-by-side when the work is done. To view your reference edit in the darkroom view, you may display the [filmstrip](../module-reference/utility-modules/shared/filmstrip.md) and increase its height, or use a [snapshot](../module-reference/utility-modules/darkroom/snapshots.md) of the reference overlaid on the current image (which will not necessarily have the same size).
