---
title: developing monochrome images
id: monochrome-images
draft: false
weight: 10
author: "people"
---

Photography has a long history of producing black-and-white images, and many still enjoy this aspect of photography even today. While there are specialised/modified cameras around with a true monochrome sensor, many will use a regular camera to capture a color image, and turn it into a monochrome image during the post-processing.

There are number of features in darktable that are helpful in singling out images for special monochrome treatment, and for converting from a color image to a monochrome. There are two main approaches to converting a color image to a monochrome image:

- a physical approach, where we attempt to simulate how a silver-based photographic film emulsion would react to the light captured at the scene.

- a perceptual approach, where we develop a color image and reduce the color saturation in a perceptual color space such as _CIE Lab_.

These approaches and other monochrome-related features in darktable are discussed in the following sections.

# importing and flagging images for monochrome treatment

When importing an image, there are a number of flags that can be set to indicate that the image should be singled out for monochrome treatment.

- If the image was taken using an achromatic camera, the image will be flagged as monochrome.

- When you capture a scene from which you would like to produce a monochrome image, it can be helpful to put your camera into a "back-and-white" creative mode. This allows you to visualise what the scene would look like in black-and-white through your camera's liveview screen or electronic viewfinder. The camera will still capture the full color data in the raw file, but the embedded jpeg preview image will in black-and-white. When you import such an image, darktable can check if the embedded preview is in black and white or not, and if so, flag the image as an image requiring monochrome treatment.

  Checking whether the preview is back-and-white or not slows down the import process, so this checking is disabled by default. You can enable this check in [`preferences` -> `processing` -> `detect monochrome previews`](../preferences-settings/processing.md)  

- When processing a raw file, one of the steps is to [_demosaic_](../module-reference/processing-modules/demosaic.md) the image. If you set the _demosaicing method_ to be _passthrough (monochrome)_, then this will discard color information during the demosaicing process, and darktable will flag the image as requiring monochrome treatment.

- After you have imported the image, you can manually flag an image as requiring monochrome treatment (or not) using the _metadata_ tab on the lighttable [_selected images_](../module-references/utility-modules/lighttable/selected-files.md) module,

If any of the above methods result in an image being flagged as "monochrome", darktable modules can use this information to present the user with some monochrome-specific module controls and/or apply special processing to thw image, compared with regular color images.

The `darktable|mode|monochrome` tag will be automatically applied to any images flagged as monochrome, and if you have enabled any permanent overlay information on your lighttable, such images will be marked with a visual indicator `B&W` next to the file type information. By automatically applying this tag and visual indicator, darktable makes it easy to set up filters to single out any images for monochrome treatment, and to see at a glance which images in the current collection are bearing a _monochrome_ flag.

# physical approach

This style of approach tends to work with linear scene-referred data from the sendor, and it tries to mimic the response that you would see from using photographic film with a silver emulsion. It consists of three steps:

1. Map the color channels from the sensor into a single monochrome channel. Different types of black-and-white photographic film will have different levels of sensitivity to various wavelengths of light, and so this can be simulated by giving the three color channels different weightings when combining them together into a single monochrome channel. The [_channel mixer_](../module-reference/processing-modules/channel-mixer.md) allows the three channels to be mixed into a grey channel by varying amounts, and it includes a number of presets that are designed to emulate the characteristics of some well-known types of photographic film. This _channel mixer_ will come after the [_input color profile_](../module-reference/processing-modules/input-color-profile.md) module, and the _channel mixer_ presets assume that a _linear Rec709 RGB_ working profile was applied. If another linear working profile is used, the weights of the _RGB_ channels will need to be adjusted accordingly.

2. Apply a luminosity saturation curve. As a piece of photographic film is exposed to more intense light, its repsonse will fall off as the silver emulsion becomes saturated. This saturation curve is simulated by the [_filmic rgb_](../module-reference/processing-modules/filmic-rgb.md) module.

3. Developing a black-and-white film in the darkroom traditionally involved "dodging and burning" to control the level of exposure across different parts of the image. This can be emulated in darktable by using either the [_exposure_](../module-reference/processing-modules/exposure.md) module with manually created [_masks_](../darkroom/masking-and-blending/overview.md), or by using the [_tone equalizer_}(../module-reference/processing-modules/tone-equalizer.md) module which will automatically generate a mask for you using a guided filter.

As previously mentioned, it is possible to produce a monochrome image by using a pass-through mode on the _demosaic_ module, however this works by discarding some of the channels from the sensor, and the _channel mixer_ provides a more flexible approach.

# perceptual approach

The other option for producing a monochrome image is to reduce the color saturation in the image, which can be done in a linear colorspace, or in a color space oriented towards modelling human perception.

- The [_color balance_](../module-reference/processing-modules/color-balance.md) module operates in linear RGB, and allows you to reduce the color saturation in the image using either the inout or output color saturation slider (which you choose depends on whether you want to make any other adjustments to either the color or monochrome image in the color balance module. The color balance module will tend to give a predicable result.

- The [_monochrome_](../module-reference/processing-modules/monochrome.md) module works in Lab color space, and it allows the user to graphically define a weighted combination of colors to determine the density of the blacks in the monochrome image. The interface can be somewhat sensitive to the settings, with small changes producing large effects, and you may experiences problems with the global contrast and/or black pixel artifacts.

- Other modules such as [_color zones_](../module-reference/processing-modules/color-zones.md) can be used to remove color saturation from the image, but these don't offer any real advantage over the simplicity of the _color balance_ module's saturation sliders.

