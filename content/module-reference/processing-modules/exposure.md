---
title: exposure
id: exposure
applicable-version: 4.0
tags:
working-color-space: RGB
view: darkroom
masking: true
---

Increase or decrease the overall brightness of an image.

This module has two modes of operation:

manual
: Set the _exposure_, _black level_ and _clipping threshold_ manually

automatic (RAW images only)
: Use an analysis of the image's histogram to automatically set the exposure. Darktable automatically selects the exposure compensation that is required to shift the selected _percentile_ to the selected _target level_ (see definitions below). This mode is particularly useful for automatically altering a large number of images to have the same exposure. A typical use case of automatic mode is deflickering of time-lapse photographs.

# module controls

mode
: Choose the mode of operation (automatic/manual).

compensate camera exposure (manual mode)
: Automatically remove the camera exposure bias (taken from the image's Exif data).

exposure (manual mode)
: Increase (move to the right) or decrease (move to the left) the exposure value (EV).
: The color-picker tool on the right sets the exposure such that the average of the selected region matches the target lightness defined in [spot exposure mapping](#spot-exposure-mapping) options.

clipping threshold (manual mode)
: Define what percentage of bright values are to be clipped in the calculation of the _exposure_ and _black level correction_. Use the color picker to sample a portion of the image to be used for this calcuation.

percentile (automatic mode)
: Define a location in the histogram to use for automatic exposure correction. A percentile of 50% denotes a position in the histogram where 50% of pixel values are above and 50% of pixel values are below that exposure.

target level (automatic mode)
: Define the target level for automatic exposure correction (EV) relative to the white point of the camera.

black level correction (manual and automatic modes)
: Adjust the black level point to unclip negative RGB values.

---

**Note:** Do not use the black level correction to add more density in blacks as this can clip near-black colors out of gamut by generating negative RGB values. This can cause problems with some modules later in the pixelpipe. Instead, use a tone mapping curve to add density to the blacks. For example, you can use the _relative black exposure_ slider on the _scene_ tab of the [filmic rgb](filmic-rgb.md#scene) module, or establish a deeper toe in the [base curve](base-curve.md) module.

---

# spot exposure mapping

The spot mapping feature is designed to help batch-editing series of pictures in an efficient way. In this scenario, you typically develop one reference image for the whole batch and then copy-paste the development stack to all the other pictures in the batch.

Unfortunately, it frequently happens that the light changes slightly between shots, even within the same series captured in the same conditions, which can be the result of a cloud passing by the sun in natural light, or surfaces reflexions having less shine from a different angle, or simply due to unavoidable variability in the mechanical diaphragm aperture. Each image will still need some individual fine-tuning if one wants a perfectly even look over the whole series, and this can be both time-consuming and frustrating.

The spot mapping settings lets you define a target brightness, in terms of exposure, for a particular region of the image (the control sample). Then, you can match the control sample against that target brightness in other images. The control sample can be either a critical part of your subject that needs to have constant brightness, or a non-moving and constantly-lit surface over your series of pictures. Then the mapping process has 2 steps.

## step 1 : set the target

There are 2 ways of setting the target lightness for your control sample :

1. if you know or expect an arbitrary lightness for the control sample (for example, a grey card, a color chart, a product or a logo of a specified color), you can set its L value directly, in CIE Lab 1976 space,
2. if you simply want to match the development of your reference image, set the _spot mode_ to _measure_, then enable the color-picker, on the right of the _exposure_ slider and draw a rectangle over your control sample. The _input_ column will then get updated with the lightness value of the control sample before the exposure correction, and the _target_ column will show the resulting lightness of the control sample after the current _exposure_ setting is applied.

If you reset the lightness value, the default value is 50% (middle-grey), which can be useful to quickly set the average exposure of any image. Note that the target value is not reset when you reset the module itself, but will be stored indefinitely in darktable's configuration and will be available on next reboot as well as for the next picture you develop.

## step 2 : match the target

When you open new images, the _spot mode_ gets automatically reset to _correction_. Using the color picker attached to the exposure slider, you can then directly reselect your control sample in the new image. The proper exposure setting required for the control sample to match the memorized target lightness will be automatically computed, and the setting will be updated in the same operation.

This operation can be repeated as many times as you have images in your series with no further work.


---

**Note 1:**  Trying to match lightness of moving parts of a subject across frames can prove tricky because they can have legitimate changes in their illumination as their orientation compared to the main light changes. For example, a part of the face can be fully lit in some frames or partially in shadows on others. A non-constantly-lit control sample will generally not provide a robust reference for lightness matching across a series and may result in more work than manually matching it with visual feedback.

**Note 2:** The exposure module works by default in the scene-referred, linear, camera RGB part of the pixel pipeline, before the input color profile is applied. However, the conversion from camera RGB to CIE Lab 1976 space relies on the input profile. All the lightness L metrics given in the _spot mapping_ settings will use the input profile defined later in the [_input color profile module_](./input-color-profile.md] to perform the conversion accurately, but the conversion itself assumes a linear (RAW) signal and will not work for JPEG and PNG images (which are non-linearly encoded before the _input color profile_ module). If you need to use this feature on non-RAW images, you need to move the exposure module after _input color profile_ or to use the [_module order_](../utility-modules/darkroom/module-order.md) preset _v3.0 for JPEG/non-RAW input_.

**Note 3:** Perfectly matching your control sample against the target lightness may still not yield a similar perceptual result, even if the numbers are exactly the same. For example, if your subject sits in front of a background made of some bright parts and some dark parts, the ratio of bright areas / dark areas will affect the perception of contrast and brightness. If this ratio changes across your series, the subject brightness will not appear constant even though the lightness value is exactly constant. For more details, see the [checker shadow illusion](https://en.wikipedia.org/wiki/Checker_shadow_illusion) and the [Chubb illusion](https://en.wikipedia.org/wiki/Chubb_illusion).

---
