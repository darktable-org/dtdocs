---
title: Batch-editing Photograhs
id: batch-editing
draft: false
weight: 110
author: "people"
---

Batch-editing is a process of developing photographs in semantically-related series that should have a consistent final look. The target can be publishing the pictures in catalogues, magazines, books, etc. It can be a tedious, frustrating and uninteresting task to complete which is why darktable has helpers to make it faster and reliable.

# preparation

## shooting color checkers

Batch-editing is the typical situation where shooting a color checker on-location can save a tremendous amount of time during post-processing. The photograph of the color checker can be quickly used as a color reference in the post-processing workflow to neutralize any color cast. darktable supports natively Datacolor and X-Rite color checkers 24 and 48.

## favouring constant lighting conditions

If possible, use artifical lighting that you can control and which can be set constant over the series, so you don't have to worry about light color temperature and intensity changes over the series. Shoot a new photograph of the same color checker every time your lighting conditions change on the scene.

## favouring manual mode

If possible, shooting in manual mode with constant exposure settings will help removing some variability in the series. In terms of post-processing, any variability means individual adjustments will be needed on the pictures, which will hinder your productivity.

# post-processing

## concepts

The post-processing needs to be split in 2 fully separated parts:

1. the primary color-grading,
2. the secondary color-grading.

The primary color-grading happens first in the pixel pipeline __and__ in the editing workflow, with modules such as [_exposure_](../module-reference/processing-modules/exposure.md), [_input color profile_](../module-reference/processing-modules/input-color-profile.md) and [_color calibration_](../module-reference/processing-modules/input-color-profile.md). Its purpose is to normalize each picture to the same neutral ground-truth, in terms of overall brightness, color accuracy and white balance. This stage aims at making all pictures look similarly boring by removing any color cast and ensuring a perfectly neutral white. It is specifically important to achieve this if your series uses different cameras. This whole stage is not about artistic intents or expressions, but simply about preparing a sane basis for the next stage.

The secondary color-grading happens next in the pixel pipeline __and__ in the editing workflow. This is where all the artistic expression happens, with modules such as [_color balance rgb_](../module-reference/processing-modules/color-balance-rgb.md). __If and only if__ the previous stage was successful at perfectly neutralizing all images to the same ground-truth, then copy-pasting the secondary color-grading should have exactly the same visual effect, no matter if the images were shot with a different camera or under _slightly_ varying lighting conditions.

In a nutshell, the whole purpose of the primary color-grading is to ensure the reproductability of the secondary color-grading. For example, if a non-neutral white balance is expected in the series, it is much easier to re-introduce non-neutrality in _color balance rgb_ using the same color shift on fully-neutralized pictures, than to fine-tune the primary color-grading individually on each image, especially if several different cameras were used.

## method

### profiling the series

You need first to extract a [color calibration profile](../module-reference/processing-modules/color-balance-rgb.md#extracting-settings-using-a-color-checker) from the picture(s) of your color checker. This profile can then be applied to all the pictures shot under the same lighting conditions with the same camera by copy-pasting the development history stack in the [_lighttable_](../module-reference/utility-modules/lighttable/history-stack.md.). This step needs to be redone for each camera and for each lighting setup.

Note that this works only with the [_modern chromatic adaptation_](../preferences-settings/darkroom.md#image-processing) workflow, which assumes hard-setting the [_white balance_](../module-reference/processing-modules/white-balance.md) to a D65 (_camera reference_) illuminant.

### editing the reference picture

Choose a reference picture which was taken in the lighting conditions closest to those of the color checker picture that served as your profiling reference. Your primary color-grading should be already taken-care of by the profile used in the _color calibration_ module (in conjuction with the _input color profile_ module), what remains to do to complete this stage is to adjust the [_exposure_](../module-reference/processing-modules/exposure.md) setting to match the overall brightness that you expect.

Then proceed with [_filmic_](../module-reference/processing-modules/filmic-rgb.md#scene) white and black relative exposures, as well as contrast setting. Finish with the secondary color-grading.

When this is done, you can measure the brightness and chromaticity of a control sample, located preferable on a non-moving surface constantly lit across your series (and appearing in all the frames). These measurements are done in [_exposure spot mapping_](../module-reference/processing-modules/exposure.md#spot-exposure-mapping) and [_color calibration spot mapping_](../module-reference/processing-modules/color-balance-rgb.md#spot-color-mapping). It will be memorized and will served as a target to individually match pictures if needed.

### propagating the look

You can then propagate your secondary color-grading (including filmic) to all the other images of the series, no matter if they were shot in the same lighting conditions or not, since you should already have propagated your primary color-grading (calibration profile) to the relevant pictures. Don't forget to paste the history in _append_ mode.

However, this alone will not ensure a consistent look for the whole series.

### fine-tune individual settings

If there was some variability in your lighting conditions, each image will need some fine-tuning adjustments to account for this. Fortunately, if you have applied the proposed method so far, this should be relatively straight-forward.

Homogenize the exposure first, using your control sample and the [_exposure spot mapping_](../module-reference/processing-modules/exposure.md#spot-exposure-mapping).

Then, adjust filmic white exposure if needed, preferably using the color-picker. The contrast should not need any adjustment since it is dynamic-range invariant.

Finally, homogenize the chromatic adaptation, using your control sampe and the [_color calibration spot mapping_](../module-reference/processing-modules/color-balance-rgb.md#spot-color-mapping).

This should get you close enough in most cases. However, if the background has changed, it is possible that these fine adjustments (aiming at technically normalizing the primary color-grading on an individual basis) are not enough to give a perceptually even look. In this case, you will need an extra step of secondary color-grading, and it is advised to perform it on top of the previous one (shared with the other pictures of the series), in new instances of the relevant modules located later in the pipe. This ensures that the base secondary color-grading stays constant for all pictures and makes for a better workflow. Large changes in the primary color-grading are not recommended to take care of perceptual discrepancies involving contrast with the background.

### controlling your series

The _culling_ mode in the _lighttable_ view will help you compare images side-by-side when the work is done. To get your reference edit in the _darkroom_, you may display the _film strip_ and increase its height, or use a _snapshot_ of the reference overlaid on the current image (which will not necessarily have the same size).
