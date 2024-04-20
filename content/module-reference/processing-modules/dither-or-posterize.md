---
title: dither or posterize
id: dither-or-posterize
weight: 10
applicable-version: 4.4
tags: 
working-color-space: RGB
view: darkroom
masking: false
---

This module eliminates some of the banding artifacts that can result when darktable's internal 32-bit floating point data is transferred into discrete 8-bit or 16-bit integer output format for display or export. It can also be used for creative posterization effects.

Although not an inherent problem in any of darktable's modules, some operations may provoke banding if they produce a lightness gradient in the image. To mitigate possible artifacts you should consider activating dithering when using the [_vignetting_](./vignetting.md) or [_graduated density_](./graduated-density.md) modules. This is especially relevant for images with extended homogeneous areas such as cloudless sky. Also watch out for banding artifacts when using a gradient [drawn mask](../../darkroom/masking-and-blending/masks/drawn).

Viewing an image dithered into a very low bit depth from some distance (e.g. “Floyd-Steinberg 1-bit b&w”) will give the impression of a homogeneous grayscale image. darktable attempts to mimic this impression when rendering zoomed-out images in the center view, the navigation window and thumbnails. This is accomplished by dithering those images into a higher number of grayscale levels. Note that, as a consequence, the [scopes](../utility-modules/shared/scopes.md) module -- the data for which is derived from the navigation window -- will show this increased number of levels and is therefore not a full match to the output image.

# module controls

method
: Choose the dithering method to use. 

: _Floyd-Steinberg_ (default): Systematically distribute quantization errors over neighboring pixels. This method can be selected with some typical output bit depths. Alternatively, you can select _Floyd-Steinberg auto_, which automatically adapts to the desired output format.

: _random dithering_: This method just adds some level of randomness to break sharp tonal value bands. 

: _posterization_: This method quantizes the pixel values into the indicated number of distinct levels per color channel (similar to Floyd-Steinberg) but does not redistribute the quantization errors, producing a [posterization](https://en.wikipedia.org/wiki/Posterization) effect. Selecting two levels per channel produces eight possible output colors, three levels produces 27 colors (3x3x3), and so on. Use other modules affecting colors or tone curves (such as [_tone equalizer_](tone-equalizer.md) or [_color balance rgb_](color-balance-rgb.md)) to fine-tune which pixels produce which posterized colors. You can also use various [blending modes](../../darkroom/masking-and-blending/blend-modes.md) to control the colors of the result.

damping ("random" method only)
: Controls the level of added random noise expressed as a damping factor in a 10\*log 2 basis. A value of -80 is a good fit for 8-bit output formats as it corresponds to a maximum change of one of the 256 possible levels; -160 is a good fit for for 16-bit output.
