---
title: input color profile
id: input-color-profile
weight: 10
applicable-version: 4.4
tags: 
working-color-space: RGB 
view: darkroom
masking: true
---

Define how darktable will interpret the colors of the image. 

This module takes the color space used by the image source (e.g. camera, scanner) and converts the pixel encodings to a standardized working color space. This means that subsequent modules in the pipeline don't need to be concerned with the specifics of the input device, and can work with and convert to/from a common working color space.

Where an image has been captured in a raw file, the input color profile module will normally apply either a standard or enhanced color matrix specific for that camera model, which will be used to map the colors into the working profile color space. If color space information is embedded in the image, the _input color profile_ module will use this information when mapping the colors to the working profile color space. The user can also explicitly specify a color space for the incoming image, and can even supply a custom ICC color profile specifically made for the input device.

As part of the mapping from the input color space to the working profile space, the colors can be confined to a certain gamut using the _gamut clipping_ options, which can help to mitigate some (infrequent) color artifacts. This is also influenced by the chosen [rendering intent](../../special-topics/color-management/rendering-intent.md).

Note that the final color profile that will be used when exporting the image is controlled by the [_output color profile_](output-color-profile.md) module.

# module controls

input profile
: The profile or color matrix to apply. A number of matrices are provided along with an enhanced color matrix for some camera models. The enhanced matrices are designed to provide a look that is closer to that of the camera manufacturer.

: You can also supply your own input ICC profiles and put them into `$DARKTABLE/share/darktable/color/in` or `$HOME/.config/darktable/color/in` (where `$DARKTABLE` is the darktable installation directory and `$HOME` is your home directory). Note that these `color/in` directories are not created by the darktable install; if you need to use one, you must create it yourself. One common source of ICC profiles is the software that is shipped with your camera, which often contains profiles specific to your camera model. You may need to activate the [_unbreak input profile_](./unbreak-input-profile.md) module to use your own profiles.

: If your input image is a low dynamic range file like JPEG, or a raw file in DNG format, it might already contain an embedded ICC profile, which darktable will use by default. You can restore this default by selecting “embedded icc profile”. If you hover your mouse over the input profile combobox on such an image, details of the embedded profile will be shown in a tooltip.

working profile
: The working profile used by darktable's processing modules. Each module can specify an alternative space that it will work in, and this will trigger a conversion. By default darktable will use "linear Rec. 2020 RGB", which is a good choice in most cases.

gamut clipping
: Activate a color clipping mechanism. In most cases you can leave this control in its default “off” state. However, if your image shows some specific features such as highly saturated blue light sources, gamut clipping might be useful to avoid black pixel artifacts. See [possible color artifacts](../../special-topics/color-management/color-artifacts.md) for more information.

: Choose from a list of RGB profiles. Input colors with a saturation that exceeds the permissible range of the selected profile are automatically clipped to a maximum value. “linear Rec. 2020 RGB” and “Adobe RGB (compatible)” allow for a broader range of unclipped colors, while “sRGB” and “linear Rec. 709 RGB” produce a tighter clipping. Select the profile that prevents artifacts while still maintaining the highest color dynamics. 
