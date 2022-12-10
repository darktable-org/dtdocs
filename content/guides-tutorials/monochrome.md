---
title: developing monochrome images
date: 2022-12-04T02:19:02+01:00
id: monochrome-images
draft: false
weight: 10
author: "people"
---

Photography has a long history of producing monochrome images, and many still enjoy this aspect of photography. While there are some specialized/modified cameras with a truly monochrome sensor, most still use a regular camera to capture a color image and transform it into a monochrome image during post-processing.

There are two main approaches to this conversion:

- A _physical approach_, where we attempt to simulate how a silver-based photographic film emulsion would react to the light captured at the scene.

- A _perceptual approach_, where we develop a color image and reduce the color saturation in a perceptual color space such as _CIE Lab_.

These approaches, and other monochrome-related features in Ansel, are discussed in the following sections.

## importing and flagging images as monochrome

When importing an image, there are a number of properties that can be used to indicate that the image requires a monochrome treatment:

- If the image was taken using an achromatic camera, the image will be automatically flagged as monochrome.

- When you capture a scene from which you would like to produce a monochrome image, it can be helpful to put your camera into a "black & white" creative mode. This allows you to visualise what the scene would look like in monochrome through your camera's liveview screen or electronic viewfinder. The camera will still capture the full color data in the raw file, but the embedded JPEG preview image will be monochrome. When you import such an image, Ansel can automatically flag the image as monochrome based on the preview image.

  Checking whether the preview is monochrome slows down the import process, so this is disabled by default. You can enable this check in [preferences > processing > detect monochrome previews](../preferences-settings/processing.md)

- When processing a raw file, one of the first steps is to [_demosaic_](../module-reference/processing-modules/demosaic.md) the image. If you set the _demosaicing method_ to "passthrough (monochrome)", this discards color information during the demosaicing process, and Ansel will flag the image as monochrome.

  **Note:** You should only use this for images taken on a camera where the color filter array has been removed.

- After you have imported the image, you can manually flag an image as monochrome (or not) using the _metadata_ tab on the lighttable's [selected images](../module-reference/utility-modules/lighttable/selected-image.md) module,

If any of the above methods result in an image being flagged as monochrome, Ansel modules can use this information to present the user with some monochrome-specific module controls and/or apply special processing to the image.

The `Ansel|mode|monochrome` tag will be automatically applied to any images flagged as monochrome and, if you have enabled any permanent overlay information on your lighttable thumbnails, such images will be marked with a visual indicator `B&W` next to the file type information. By automatically applying this tag and visual indicator, Ansel makes it easy to set up filters to single out images for monochrome treatment, and to see at a glance which images in the current collection bear the _monochrome_ tag.

If Ansel detects a true monochrome image or one from a monochrome-converted camera (using the "passthrough monochrome" demosaicer) some modules (e.g. demosaic, white balance) are automatically disabled.

## monochrome conversion

### physical approach

This approach tends to work with linear scene-referred data from the sensor, and attempts to mimic the response of a photographic film with a silver emulsion. It consists of three steps:

1. Map the color channels from the sensor into a single monochrome channel. Different types of monochrome photographic film have different levels of sensitivity to various wavelengths of light, and this can be simulated by giving the three color channels different weightings when combining them together into a single monochrome channel. The [_color calibration_](../module-reference/processing-modules/color-calibration.md) module allows the three channels to be mixed into a gray channel by varying amounts, and it includes a number of presets that are designed to emulate the characteristics of some well-known types of photographic film.

2. Apply a luminosity saturation curve. As a piece of photographic film is exposed to more intense light, its response will fall off as the silver emulsion becomes saturated. This saturation curve can be simulated within the [_filmic rgb_](../module-reference/processing-modules/filmic-rgb.md) module.

3. Developing a monochrome film in the darkroom traditionally involves "dodging and burning" to control the level of exposure across different parts of the image. This can be emulated in Ansel by using either the [_exposure_](../module-reference/processing-modules/exposure.md) module with manually created [masks](../darkroom/masking-and-blending/_index.md), or by using the [_tone equalizer_](../module-reference/processing-modules/tone-equalizer.md) module, which generates a mask using a guided filter.
