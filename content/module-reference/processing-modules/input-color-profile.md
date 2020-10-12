---
title: input color profile
id: input-color-profile
applicable-verison: 3.2.1
tags: 
working-color-space: RGB 
view: darkroom
masking: true
---

The input color profile defines how darktable will interpret the colors of the image. It will take the color space used by the source of the image (eg. camera, scanner) and convert the pixel encodings to a standardised working color space. In this way, any subsequent modules don't need to be concerned with the specifics of the input device, and can work with and convert to/from the standardised working color space.

Where an image has been captured in a camera raw file, the input color profile module will normally apply either a standard or enhanced color matrix specific for that model camera, in order to map the colors into the CIE XYZ transitional color space. If the image was obtained from elsewhere, and there is color space information embedded in the image, the _input color profile_ module will use this information to map the colors to the CIE XYZ transitional color space. The user can also specify explicitly which input color space should be assumed for the incoming image, and can even supply a custom ICC color profile specifically made for the input device.

Once the colors are available in the intermediate CIE XYZ space, they can then be transformed into the final working color space that will be used for any subsequent processing in the pixel pipe. When mapping from the CIE XYZ intermediate color space, the colors can be confined to a certain gamut using the _intent_ options, and this can help mitigate some (infrequent) color artifacts.

Note that the final color profile that will be used when exporting the image is controlled by the [_output color profile_](output-color-profile.md) module.

# module controls

profile
: The profile or color matrix to apply. A number of matrices are provided along with an enhanced color matrix for some camera models. The enhanced matrices are designed to provide a look that is closer to that of the the camera manufacturer.

: You can also supply your own input ICC profiles and put them into `$DARKTABLE/share/darktable/color/in` or `$HOME/.config/darktable/color/in` (where `$DARKTABLE` is the darktable installation directory and `$HOME` is your home directory). One common source of ICC profiles is the software that is shipped with your camera, which often contains profiles specific to your camera model. You may need to activate the [_unbreak input profile_](./unbreak-input-profile.md) module to use your own profiles.

: If your input image is a low dynamic range file like JPEG, or a raw in DNG format, it might already contain an embedded ICC profile which darktable will use by default. You can restore this default by selecting “embedded icc profile”.

working profile
: You can select from a list of RGB profiles. Input colors with a saturation that exceeds the permissible range of the selected profile are automatically clipped to a maximum value. “linear Rec2020RGB” and “Adobe RGB (compatible)” allow for a broader range of unclipped colors, while “sRGB” and “linear Rec709 RGB” produce a tighter clipping. Select the profile that prevents artifacts while still maintaining the highest color dynamics. By default darktable will use "linear Rec2020 RGB", which is a good choice in most cases.

gamut clipping
: Activate a color clipping mechanism. In most cases you can leave this control in its default “off” state. However, if your image shows some specific features such as highly saturated blue light sources, gamut clipping might be useful to avoid black pixel artifacts. See [possible color artifacts](../../special-topics/color-management/color-artifacts.md) for more information.

