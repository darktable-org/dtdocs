---
title: input color profile
id: input-color-profile
applicable-verison: 3.2.1
tags: 
working-color-space: RGB 
view: darkroom
masking: true
---

The input color profile defines how darktable will interpret the colors of the image. 

You can alter darktable's auto-allocated input color profile if there is an alternative that more closely matches the original image's color space. This module also allows colors to be confined to a certain gamut to mitigate some (infrequent) color artifacts.

# module controls

profile
: The profile or color matrix to apply. A number of matrices are provided along with an enhanced color matrix for some camera models. The enhanced matrices are designed to provide a look that is closer to that of the the camera manufacturer.

: You can also supply your own input ICC profiles and put them into `$DARKTABLE/share/darktable/color/in` or `$HOME/.config/darktable/color/in` (where `$DARKTABLE` is the darktable installation directory and `$HOME` is your home directory). One common source of ICC profiles is the software that is shipped with your camera, which often contains profiles specific to your camera model. You may need to activate the [_unbreak input profile_](./unbreak-input-profile.md) module to use your own profiles.

: If your input image is a low dynamic range file like JPEG, or a raw in DNG format, it might already contain an embedded ICC profile which darktable will use by default. You can restore this default by selecting “embedded icc profile”.

gamut clipping
: Activate a color clipping mechanism. In most cases you can leave this control in its default “off” state. However, if your image shows some specific features such as highly saturated blue light sources, gamut clipping might be useful to avoid black pixel artifacts. See [possible color artifacts](../../special-topics/color-management/color-artifacts.md) for more information.

: You can select from a list of RGB profiles. Input colors with a saturation that exceeds the permissible range of the selected profile are automatically clipped to a maximum value. “linear Rec2020RGB” and “Adobe RGB (compatible)” allow for a broader range of unclipped colors, while “sRGB” and “linear Rec709 RGB” produce a tighter clipping. Select the profile that prevents artifacts while still maintaining the highest color dynamics.
