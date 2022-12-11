---
title: process
date: 2022-12-04T02:19:02+01:00
id: process
draft: false
weight: 30
author: "people"
---

This section is intended to get you comfortable processing images in the darkroom view using a _scene-referred_ workflow. You are advised to follow the guidelines provided below, up to the end of the [_image processing in 3 modules_](#image-processing-in-3-modules) section and then choose other areas to learn as-and-when you need to use those techniques in your images.

## getting started

### take a well-exposed photograph

Good image processing techniques start in the camera -- a well-exposed image (without blown highlights or heavily crushed blacks) will always make post-processing much more straightforward. Under- or over-exposure can be "fixed" by Ansel to some extent but no software can recover information that is not present in the Raw image. Where possible, you are advised to use [exposure to-the-right (ETTR)](https://en.wikipedia.org/wiki/Exposing_to_the_right) techniques to maximize the amount of data available for processing. As a general rule of thumb, it is safe to under-expose all images by 0.5 to 1 EV (by reducing the ISO sensitivity if possible) even if the in-camera preview looks darker than expected (the preview is not the raw data).

### scene-referred workflow: a new approach

If you have used other Raw software in the past (or Ansel prior to version 3.0) you may notice some significant differences from what you are used to -- Ansel now uses a _scene-referred_ approach for most of its processing modules. This approach is used extensively in cinematography and is known to be much more robust than the traditional _display-referred_ approach.

In _display-referred processing_ the data from your Raw file is initially compressed into a range that represents pure black as 0 and pure white as 1, fixing mid-gray at 0.5. A tone curve is automatically (and irreversably) applied to this data to make the image look "good" on your display and subsequent edits are carried out on top of this already highly-modified image data. The cost of _display-referred_ is an early loss of the relationship between pixel luminosity and saturation (usually also involving hue shifts), which is responsible for the infamous "HDR look" when the dynamic range increases.

In the real world, "pure black" does not really exist (there is always _some_ light) and there is no limit to how bright things can be (so no "pure white" either). _Scene-referred processing_ attempts to retain the physical properties of the scene for as long as possible by placing the Raw data on an unbounded linear scale and only compressing the data to the dynamic range of your display after image processing is complete.

In a scene-referred workflow many common tools (tone curves and levels, for example) are no longer useful ways to manipulate the image, since they rely on now-invalid definitions of black, white and gray. Experienced users may need to learn new techniques and discard old ones, but will be rewarded with much more robust and predictable outputs.

The scene-referred workflow in Ansel enables the [filmic rgb](../../module-reference/processing-modules/filmic-rgb.md) and [exposure](../../module-reference/processing-modules/exposure.md) modules by default when you open new images in the darkroom view.

---
Set [preferences > processing > auto-apply pixel workflow defaults](../../preferences-settings/processing.md) to "scene-referred" now.

---

_Enter preferences by clicking on the gear icon in the [top panel](../user-interface/top-panel.md)_.

### white balance and color calibration

Most processing software uses a traditional temperature/tint model for adjusting the white balance of an image. In Ansel, the [color calibration module](../../module-reference/processing-modules/color-calibration.md) provides a much more robust and flexible approach, allowing you to explicitly define the color of the light source. This is particularly useful for scenes illuminated by artificial lighting.

Please note that the [white balance](../../module-reference/processing-modules/white-balance.md) module is still enabled in this approach, but its settings normally should not be altered.

---
Set [preferences > processing > auto-apply chromatic adaptation defaults](../../preferences-settings/processing.md) to "modern" now.

---
### edit in a controlled environment

Image processing should be performed in a controlled environment, lit by a white light source against a background approximating mid-gray, and on a monitor that has been properly calibrated.

While this may not be practical in many home editing environments you _can_ control the background colors on your monitor's display. You should set the Ansel color scheme to use one of the "grey" themes and use the [color assessment mode](../../module-reference/utility-modules/darkroom/color-assessment.md) when altering tones and colors in your image. Dark themes might look good but, unless you are processing images to be viewed on a cinema screen in a darkened room, they should not be used for photo processing.

---
Set [preferences > general > theme](../../preferences-settings/general.md) to "Ansel-elegant-grey" or "Ansel-icons-grey" now.

---
### enter the darkroom

Choose an image to edit from the lighttable view and double-click to load that image into the darkroom view. For now try to choose an image that is well exposed -- we will discuss some techniques to recover badly-exposed images later.

In the darkroom view, you will see a list of [processing modules](../../views/darkroom/processing-modules/_index.md) to the right of your image. Each module performs its own processing on the image, in the order shown in the module list, starting at the bottom of the list and moving up to the top. You can think of this like a stack of building blocks where each block builds on the processing performed by the modules below it.

On the left hand side is the [history stack](../../module-reference/utility-modules/darkroom/history-stack.md) (you may need to expand the module), which shows the order in which adjustments were made to the controls of the various modules. This allows you to undo changes by reverting to an earlier step in the history stack. You will see that a number of modules are applied automatically -- these are needed in order to generate a legible image from the Raw data.

It is important to understand the distinction between the order of the modules on the right-hand-side of the screen (which represents the order in which modules are _executed_) and the order of the modules in the history stack (which represents the order in which modules were _modified_).

To the top right is the [scopes](../../module-reference/utility-modules/shared/scopes.md) module, which shows the spread of tones/colors in your image.

---
If you have previously viewed or edited the image in the darkroom view, start by _discarding history_ (click the _reset_ button in the [_history stack_](../../module-reference/utility-modules/darkroom/history-stack.md)). This will reapply defaults using your new settings and provide a clean starting point for editing.

---
### why doesn't the raw image look like the JPEG?

_...because you haven't processed it yet_

One of the first things people notice when switching from lighttable to darkroom view is that the image looks different -- often flatter and less saturated than that shown in the lighttable view. This is because the darkroom view displays the (mostly unprocessed) Raw image, but the lighttable view initially displays the (in-camera) JPEG preview. Now that you have opened the image in the darkroom view, the lighttable view will update to show the edited version.

Most Raw software goes to great lengths to reproduce the look of standard camera JPEGs out of the box. While this can be useful (if you only want to make very minor adjustments to the camera's rendition of an image) we assume that you are using a Raw editor to make the image your own, and that the camera does not know how to do this. Certainly, if you are using the ETTR techniques mentioned above, the camera JPEG will rarely be close to how you want the final image to look.

The default settings in Ansel are therefore intended to provide you with a neutral _starting point_ for further editing and nothing more. _We do not intend to change this_.

### module groups

Below the scopes module, at the top right of the screen, is a set of tabs into which Ansel's modules are [grouped](../../views/darkroom/organization/module-groups.md). If you cannot find a module in one of the tabs you can use the search feature to locate it.

---
For the purposes of this guide, click on the hamburger icon (to the right of the tabs) and select the "workflow: scene-referred" preset now.

---

## image processing in 3 modules

The following basic adjustments are fundamental to scene-referred editing and will be required, to some extent, on the majority of images. You can usually produce a good-looking image with these steps alone.

As you will be adjusting the tones and colors of the image, start by enabling [color assessment mode](../../module-reference/utility-modules/darkroom/color-assessment.md) (press Ctrl+B) and perform the following edits on the zoomed-out image while in this mode.

1. **Set overall image brightness**: First, set the overall (average) brightness of the image (the mid-gray point) by adjusting the _exposure_ slider in the [_exposure_](../../module-reference/processing-modules/exposure.md) module. This is a purely artistic setting and should be defined based on your intent -- for example, for a high-key image you will set the average brightness to be lighter than for a low-key image. The color assessment mode provides you with two reference points to assist with this by surrounding the image with a white frame against a middle-gray background.

   At this point, don't worry if the brightest parts of your image lose detail -- this can be recovered in the next step.

   ---

   _**Note:** The [lens correction](#correct-lens-distortions) module can also affect the image brightness so you may want to consider enabling it before adjusting exposure._

   ---

2. **Set white and black points**: The next two steps use the [_filmic rgb_](../../module-reference/processing-modules/filmic-rgb.md) module to define how the tones in your image will be mapped to the dynamic range of your display. Start by setting the _white_ and _black_ relative exposure sliders in the [_scene tab_](../../module-reference/processing-modules/filmic-rgb.md#scene). These are purely technical settings, defining white and black relative to the mid-gray point you set in the previous step. If your image contains tones you want to treat as pure white or pure black you can use the color pickers beside the sliders to set these values (using the maximum and minimum brightness of the image). Otherwise set the values manually using the color assessment frames as a reference.

3. **Adjust the contrast**: Now move to the [_look tab_](../../module-reference/processing-modules/filmic-rgb.md#look) in _filmic rgb_ (for now we will skip the [_reconstruct tab_](../../module-reference/processing-modules/filmic-rgb#reconstruct)). Enable the [_look only_ view](../../module-reference/processing-modules/filmic-rgb.md#graphic-display) at the top of the module to see a representation of the filmic tone curve, which consists of a straight section in the middle (used to set the contrast of the mid-tones) and curved sections at the top and bottom (where the shadows and highlights are compressed to fit the dynamic range of the display).

   The _contrast_ slider changes the slope of the straight section (the mid-tone image contrast), the _latitude_ slider changes its length and the _shadows/highlights balance_ slider changes its position. There is a lot of give-and-take involved here -- if you want to increase the contrast of the mid-tones, you must sacrifice contrast in the shadows/highlights and vice versa. The default settings of this module are tuned to work for the majority of images but you should experiment with these sliders to understand how they affect the image.

   ---

   _**Note:** The highlight compression in the filmic rgb module can cause detail to be lost in the highlights. You can mitigate this to some extent by reducing the _white relative exposure_, adjusting the _shadows/highlights balance_ or changing the _contrast in highlights_ setting in the [options tab](../../module-reference/processing-modules/filmic-rgb.md#options). The [tone equalizer](../../module-reference/processing-modules/tone-equalizer.md) module can also be used to reduce the relative brightness of the sky._

   ---

4. **Color preservation**: The tone mapping in the filmic rgb module attempts to redistribute the tones in your image without affecting color reproduction. While the default color preservation algorithm works for most images, you are encouraged to experiment by changing the _preserve chrominance_ setting in the [_options tab_](../../module-reference/processing-modules/filmic-rgb.md#options) if you do not like how the colors appear.

5. **Saturation**: Your image will probably not look very colorful at this point. You can adjust the global saturation of the image using the [color balance rgb](../../module-reference/processing-modules/color-balance-rgb.md) module. The "basic colorfulness" [preset](../../views/darkroom/processing-modules/presets.md) should provide you with generally-reasonable defaults, but you are encouraged to experiment further with these settings as required.

   ---

   _**Note:** This guide assumes that the white balance of the image has been correctly captured by your camera. If this is not the case, you may need to make some corrections in the [color calibration](#color-calibration) module first._

   ---

You can now switch off _color assessment mode_ by pressing Ctrl+B again.

## other processing techniques

With practice the above workflow can quickly provide you with a reasonable-looking image, though most will need some additional work before they are ready for export. The following sections are intended to provide a brief outline of some more image processing techniques in Ansel, with links to the relevant reference sections for more information.

As a general rule, you should begin with the basic steps outlined in the previous section, then perform [_corrections_](#corrections) and finish with [_creative adjustments_](#creative-adjustments).

### corrections

#### color calibration

Traditional white balance correction attempts to ensure that whites and grays are really neutral (R = G = B) and doesn’t really try to manage the impact on other colors. The [_CAT tab of the color calibration module_](../../module-reference/processing-modules/color-calibration.md#white-balance-in-the-chromatic-adaptation-transformation-cat-tab) extends this treatment to handle the remainder of the color range and works in a color space designed specifically for chromatic (color) adaptation. As with traditional white balance controls you can select a patch of neutral gray in your image to calculate the white balance, or use a selection of other automatic and manual methods. The default settings use the white balance from the image's Exif data and are usually sufficient.

If you need to make adjustments in the _color calibration_ module, you may want to also revisit any saturation corrections you made earlier in the _color balance rgb_ module.

#### correct lens distortions

All lenses introduce some artifacts (distortion, chromatic aberrations, vignetting) to the image. The [_lens correction_](../../module-reference/processing-modules/lens-correction.md) module can correct many of these issues for a wide variety of lenses. The [_chromatic aberrations_](../../module-reference/processing-modules/chromatic-aberrations.md) and [_raw chromatic aberrations_](../../module-reference/processing-modules/raw-chromatic-aberrations.md) modules can also be used to handle chromatic aberrations for lenses that are not (or only partially) supported by _lens correction_. In most cases simply enabling the _lens correction_ module will auto-detect your lens and auto-apply all available corrections.

If you decide to use the _lens correction_ module, it should be enabled at the start of your edit, before you adjust exposure, since vignetting correction can alter the overall brightness of your image.

#### reduce noise / retain detail

At a pixel level there is a trade-off to be made between the retention of fine details and the reduction/removal of sensor noise. In most situations, a small amount of noise is perfectly acceptable and will not be noticeable except when you zoom in to 100%. At this scale you are not viewing the image at a realistic size -- even when represented on a large monitor or print, noise that is obvious at high zoom factors will be virtually invisible on the final image. However, some modules further along the image pipeline (especially those that increase local contrast) may end up exaggerating any noise that is present so, again, there are trade-offs to be made.

The first module you can use to manage this is [_demosaic_](../../module-reference/processing-modules/demosaic.md), which controls how the single-color (R, G or B) pixels in your Raw file are converted to image pixels combining all three colors. Each demosaic algorithm has its own trade-offs between retaining fine detail and reducing noise. The default demosaic algorithm (RCD) usually provides a reasonable compromise.

Demosaic algorithms can only do so much to manage noise in your image. The [_denoise (profiled)_](../../module-reference/processing-modules/denoise-profiled.md) module is individually tuned for a number of common camera sensors and can be used to reduce or remove pixel noise. As with demosaic you should alter the settings until you are happy with the balance of denoising vs fine-detail reproduction. The default settings are usually sufficient.

#### sharpness and local contrast

A number of modules can be used to adjust the local contrast and sharpness of your image. Most of these modules aim to enhance the apparent contrast of edges and do not add "real" sharpness (they are not the same as lens deconvolution). You should take care when using these modules as most of them can introduce artifacts (such as halos) when settings are pushed too far:

- the [_contrast equalizer_](../../module-reference/processing-modules/contrast-equalizer.md) module allows you to adjust contrast, limiting the effect to certain feature sizes. For example you can use it to increase the contrast of fine details without impacting larger-scale objects, or vice versa
- the [_diffuse or sharpen_](../../module-reference/processing-modules/diffuse.md) module offers a number of presets for sharpening, lens deblurring and the addition of local contrast
- the [_local contrast_](../../module-reference/processing-modules/local-contrast.md) module provides a simpler interface for quickly adding local contrast to your images -- just enabling the module or selecting one of the presets is often all that is required
- the [_sharpen_](../../module-reference/processing-modules/sharpen.md) module is intended to re-introduce sharpness that was removed by your camera's anti-alias filter (if present) and can be enabled by default in [preferences > processing](../../preferences-settings/processing.md). The methods listed above are usually preferred to this legacy module.

As with the modules mentioned in the previous section, you should take care when adding contrast to small-scale objects -- an image viewed at 100% is not a realistic representation of your final edit and local contrast adjustments are usually better judged when zoomed out.

#### reconstruct blown highlights

While a well-exposed image will make post-processing much easier, Ansel provides some tools handle blown highlights, in some cases even reconstructing lost colors or structure.

The [_highlight reconstruction_](../../module-reference/processing-modules/highlight-reconstruction.md) module provides a very basic attempt to manage blown highlights. By default, if any color channel is clipped, this module will clip the other channels, making the pixel white -- this prevents Ansel from showing unnatural colors in the highlights. However it can be altered to attempt to reconstruct the lightness or color using any un-clipped channels. While this can re-introduce some detail, beware of the unrealistic colors that can result.

A better alternative is to disable _highlight reconstruction_ and instead use the [_reconstruct tab on the filmic rgb module_](../../module-reference/processing-modules/filmic-rgb.md#reconstruct). As with the _highlight reconstruction_ module, filmic is able to reconstruct detail based on unclipped channels. Where this is not possible, it can also blend blown highlights smoothly with the rest of the image or pull colors from adjacent pixels. When incorporating this step into your workflow, you should do it at the same time as other _filmic rgb_ edits, performing adjustments in each tab of the module in turn, from left to right.

#### adjust angle and perspective

The [_rotate and perspective_](../../module-reference/processing-modules/rotate-perspective.md) module can be used to adjust the angle of the image or to simulate the functionality of a tilt/shift lens by altering the perspective, making converging horizontal and/or vertical lines parallel (keystone correction). This latter technique is most commonly used for architectural photography. If you just want to correct the angle of the horizon you can do this by right-clicking and dragging along the horizon line.

#### remove spots and unwanted objects

Use the [_retouch_](../../module-reference/processing-modules/retouch.md) module to remove unwanted objects by replacing pixels with detail from elsewhere in the image. This module also offers powerful techniques for removing large-scale objects (such as spots or blemishes) while leaving fine-scale details (like hairs and follicles) intact. The most common use for this module is to remove dust spots from images or blemishes from skin.

#### remove atmospheric haze

There are two methods for removing atmospheric haze in Ansel. The [haze removal](../../module-reference/processing-modules/haze-removal.md) module provides a much simpler interface, but the "dehaze" preset in the [_diffuse or sharpen_](../../module-reference/processing-modules/diffuse.md) module can provide more flexibility when needed.

### creative adjustments

#### crop and frame

Use the [_crop_](../../module-reference/processing-modules/crop.md) module to crop your image and the [_framing_](../../module-reference/processing-modules/framing.md) module to surround your image with a colored frame. Both modules can be set to use a predefined or custom aspect ratio -- for example, you could place a square-cropped image into a 3:2 frame.

#### dodge and burn

Dodging and burning is a traditional darkroom technique to add and remove brightness from an image. There are two recommended ways to achieve this

- If you want to selectively dodge or burn only certain objects you can apply a [new instance](../../views/darkroom/processing-modules/multiple-instances.md) of the [_exposure_](../../module-reference/processing-modules/exposure.md) module using a [drawn mask](../../views/darkroom/masking-and-blending/masks/drawn.md) to isolate the effect to the required area of the image (see also the [mask refinement](../../views/darkroom/masking-and-blending/masks/refinement-controls.md) section for more information). Move the exposure slider to alter the brightness of the masked area.
- If you wish to dodge or burn areas with a similar brightness (for example, to brighten the shadows or darken the highlights) you should use the [_tone equalizer_](../../module-reference/processing-modules/tone-equalizer.md) module.

#### convert to monochrome

Ansel provides a number of ways to remove the color from your image. The most flexible method is to use the [_gray tab of the color calibration module_](../../module-reference/processing-modules/color-calibration.md#gray-tab). A number of film emulation presets are available in this module to provide you with a starting point.

#### color grading

The [_color balance rgb_](../../module-reference/processing-modules/color-balance-rgb.md) module is your one-stop-shop for controlling the colors in your image. Adjustments can be isolated to the shadows, highlights and mid-tones, or applied at a global level.

## other important topics

### reuse common module settings

If you find yourself using the same module parameters repeatedly, you can create [presets](../../views/darkroom/processing-modules/presets.md) containing your favorite settings. If you use the same settings on every image, you can also make presets apply automatically to new images. For example, you may find yourself adding the same exposure settings to every image taken by a certain camera -- in this case you can create a preset that automatically applies those corrections only to images from that camera.

You may also have groups of module settings that you commonly apply only to certain types of image. You can use [styles](../../module-reference/utility-modules/lighttable/styles.md) to apply multiple module settings at once to a selection of images.

### perform adjustments locally

Most Ansel modules can either be applied to the whole image, or restricted to parts of the image using [drawn and parametric masks](../../views/darkroom/masking-and-blending/masks/_index.md).

### control Ansel with other input methods

You don't need to use the Ansel UI to make adjustments to your images. Most of the functionality in Ansel can also be controlled using shortcuts defined with your keyboard/mouse and even with other input devices such as game controllers and MIDI devices. See the [shortcuts](../../preferences-settings/shortcuts.md) section for details.
