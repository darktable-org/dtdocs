---
title: color balance rgb
id: color-balance
weight: 10
applicable-version: 4.0
tags:
working-color-space: RGB
view: darkroom
masking: true
---

An advanced module which brings color-grading tools from cinematography into the photographic scene-referred pipeline.

This module is not suitable for beginners with no prior knowledge of color theory, who might want to stick to the _global chroma_ and _global vibrance_ settings until they have a good understanding of the [dimensions of color](../../special-topics/color-management/color-dimensions.md).

# introduction

Color-grading is an important part of image editing. It can help to remove unwanted color casts and can also deliver a creative color twist that will add atmosphere to your images. In the days of film photography, most of the color ambiance was obtained with the film emulsion and the developing chemicals, with some color timing being performed under the enlarger with color heads. This consumed expensive resources and was mostly reserved for the cinema industry, where the job was performed by a colorist.

In the digital age, where raw images look flat and even, color-grading assumes the same role that film emulsions did, by re-introducing color shifts for aesthetic purposes. It can also serve to harmonize the color palette of a series of images (which may have been shot under different conditions) to achieve a consistent global look. For this task, the [vectorscope](../utility-modules/shared/scopes.md#vectorscope) is also extremely useful.

Colorists usually split color-grading into two distinct steps:

1. _Primary color-grading_ aims to fix unwanted color casts and create a neutral starting point,
2. _Secondary color-grading_ gives the image its final look and atmosphere.

Primary color-grading is best left to the [_color calibration_](./color-calibration.md) module, which operates in a physical framework better suited to illuminant correction. _Color balance RGB_, on the other hand, is mostly concerned with secondary color-grading. Performing a truly neutral primary color-grading should make the secondary color-grading easy to transfer between images (via styles, presets or copy & paste) with a similar effect.

# general principles

The _color balance RGB_ module is an improvement over the [American Society of Cinematographers Color Decision List](https://en.wikipedia.org/wiki/ASC_CDL) (ASC CDL), and uses alpha masks to allow the effect to be properly split between shadows and highlights. The classic CDL acts on the entire luminance range, and each of its parameters is given more weight on some parts of the image only as a side-effect of the mathematics.

This module works, for the most part (_4 ways_, _chroma_, _vibrance_, _contrast_), in a linear RGB color space designed specifically for color-grading. This color space exhibits a uniform spacing of perceptual hues while retaining a physically-scaled luminance[^1]. The perceptual part of the module (_saturation_ and _brilliance_) works in the JzAzBz[^2] color space, which provides a perceptual scaling of both lightness and chromaticity suitable for HDR images. Both color spaces ensure that saturation and chroma changes take place at constant hue, which is not the case for most other saturation operators in darktable (notably in the older [_color balance_](./color-balance.md) module).

[^1]: Richard A. Kirk, Chromaticity coordinates for graphic arts based on CIE 2006 LMS with even spacing of Munsell colours, 2019. <https://doi.org/10.2352/issn.2169-2629.2019.27.38>

[^2]: Safdar et al., Perceptually uniform color space for image signals including high dynamic range and wide gamut, 2017. <https://doi.org/10.1364/OE.25.015131>

The _color balance RGB_ module expects a scene-referred linear input and produces a scene-referred RGB output, which may or may not be linear, depending on the module settings (_contrast_ and _power_ will delinearize the output).

At its output, _color balance RGB_ checks that the graded colors fit inside the pipeline RGB color space (Rec. 2020 by default) and applies a soft saturation clipping at constant hue, aiming to retarget out-of-gamut color to the nearest in-gamut color by scaling both chroma and lightness. This prevents the chroma and saturation settings from pushing colors outside of the valid range and allows more drastic adjustments to be safely used.

_Note that this module abides by the CIE definitions of chroma and saturation, as explained in the [dimensions of color](../../special-topics/color-management/color-dimensions.md) section._

# module controls

## master tab

hue shift
: Rotate all colors in the image by an angle over the chromaticity plane, at constant luminance and chroma. You can use this control to remove spilled colored light on a subject or to quickly change the color of some object. This setting is usually best applied locally, using [masks](../../../darkroom/masking-and-blending/masks/_index.md).

global vibrance
: This affects the chroma dimension of color over the entire image, prioritizing those colors with low chroma. This allows the chroma of neutral colors to be increased without exaggerating already-colorful pixels.

contrast
: This setting is applied on the luminance channel at constant hue and chroma. The fulcrum setting (in the [_masks_](#masks-tab) tab, under _contrast gray fulcrum_) allows you to set the neutral point of the contrast curve:
: - at the fulcrum, the contrast curve leaves the luminance unchanged,
: - below the fulcrum, the contrast curve decreases the luminance for positive contrast values, or increases it for negative values,
: - above the fulcrum, the contrast curve increases the luminance for positive contrast values, or decreases it for negative values.

: The fulcrum has a value of 18.45% by default, which is consistent with the current scene-referred workflow and should fit most use cases (assuming that global brightness has been fixed as recommended using the [_exposure_](./exposure.md) module).

: The contrast algorithm gives natural results that mimic the central part of the contrast curve of analog film. However, it will also increase the image's dynamic range, which may void _filmic_ settings in the pipe. For global contrast adjustments, you should normally use the [_tone equalizer_](./tone-equalizer.md) module -- the _color balance RGB_ contrast slider is best used with masks, e.g. for selective corrections over the foreground or background.

### linear chroma grading

Linear chroma grading affects the chroma dimension proportionally to its input value, at constant hue and luminance. It does this globally, with a flat coefficient (using the _global chroma_), as well as on each of the _shadows_, _mid-tones_ and _highlights_ masks (defined in the [_masks_](#masks-tab) tab under _luminance ranges_).

### perceptual saturation grading

Perceptual saturation grading affects both the luminance and the chroma dimensions, in a perceptual space, proportionally to its input value, at constant hue. It does this globally, with a flat coefficient (using the _global saturation_), as well as on each of the _shadows_, _mid-tones_ and _highlights_ masks (defined in the [_masks_](#masks-tab) tab under _luminance ranges_).

### perceptual brilliance grading

Perceptual brilliance grading affects both the luminance and the chroma dimensions, in a perceptual space, proportionally to its input value, at constant hue, and in a direction orthogonal to the saturation. Its effect is close to that of changing exposure, but scaled perceptually. It does this globally, with a flat coefficient (using the _global saturation_), as well as on each of the _shadows_, _mid-tones_ and _highlights_ masks (defined in the [_masks_](#masks-tab) tab under _luminance ranges_).

## 4 ways tab

Each of the settings in the 4 ways tab is composed of the same three components, which define a color using independent coordinates:

1. _luminance_,
2. _hue_,
3. _chroma_.

Color input like this defines a color shift applied to the image globally or over the specified luminance range.

Each hue slider has a [picker](../../darkroom/processing-modules/module-controls.md#pickers), which may be used to select the current or opponent color of the selected region. This is useful to revert unwanted color casts (e.g. skin redness), since shifting the color to its opponent cast neutralizes it. Click the pointer to select the opposite color and ctrl+click to select the current color.

### global offset

This is equivalent to the ASC CDL _offset_ and falls back to adding a constant RGB value to all pixels, quite like the _black offset_ in the _exposure_ module. This control does not use masking.

### shadows lift

This is conceptually equivalent to the _lift_ from _lift/gamma/gain_, although implemented differently, and falls back to multiplying the masked pixels by a constant RGB value. It is applied using the _shadows_ mask.

### highlights gain

This is equivalent to the ASC CDL _slope_, and falls back to multiplying a the masked pixels by a constant RGB value. It is applied using the _highlights_ mask.

### global power

This is equivalent to the ASC CDL _power_, and falls back to applying a constant RGB exponent. It is not masked and needs to be normalized, since the power function has a different behaviour above and below 1, and we are in an unbounded pipeline where white is typically greater than 1. The normalization parameter is available in the [_masks_](#masks-tab) tab under _white fulcrum_.

## masks tab

This tab defines auxiliary controls for the previous tabs. Masking controls typically don't require any user modification since the defaults are calibrated to suit most needs and fulfil the normal scene-referred pixel pipeline expectations. You should only need to change these settings in specific scenarios.

### luminance ranges

The graphs show the opacity (on the _y_ axis) of the 3 luminance masks relative to the pixel luminance (on the _x_ axis). The darkest curve represents the _shadows_ mask, the brightest represents the _highlights_ mask, and the third curve represents the _mid-tones_ mask.

Only the _shadows_ and _highlights_ masks can be controlled directly -- the _mid-tones_ mask is computed indirectly from the others and acts as an adjustment variable.

shadows fall-off
: Control the softness or hardness of the transition from fully opaque (100%) to fully transparent (0%) for the shadows mask.

mask middle-gray fulcrum
: Set the luminance value where all three masks have 50% opacity. In practice, this is used to define how the image is separated into shadows and highlights.

highlights fall-off
: Control the softness or hardness of the transition from fully opaque (100%) to fully transparent (0%) for the highlights mask.

For each of these settings, a mask button, provided to the right of the slider, displays the appropriate mask (shadows, mid-tones, highlights), overlaid as a checker board. The still-visible area of the image (not hidden by the mask) is the area that will be affected by the shadows, mid-tones and highlights sliders in the other tabs.

All mask previews display the output of the module, including any color changes made, so you can also activate them while editing, to see only the affected part of the image.

Luminance masks are computed at the input of the module, which means that they are insensitive to any luminance changes made inside the module.

### thresholds

white fulcrum
: Set the white point luminance in EV. This is used to normalize the _power_ setting in the [_4 ways_](#4-ways-tab) tab. Display-referred implementations of power functions assume that white is at 100%, which removes the need for normalization. For scene-referred purposes this needs to be taken into account.

: The [picker](../../darkroom/processing-modules/module-controls.md#pickers) to the right of the slider automatically sets the white fulcrum to the maximum luminance from the selected region, which should be sufficient in most cases.

contrast gray fulcrum
: Set the fulcrum for the _contrast_ setting in the [_master_](#master-tab) tab. This corresponds to the luminance value that will be left unchanged by the contrast adjustment. This setting usually matches the middle-gray linear value. If you followed the scene-referred workflow recommendations and set the global brightness early in the pipeline, using the _exposure_ module, the correct value should usually be around 18-20%.

: The [picker](../../darkroom/processing-modules/module-controls.md#pickers) to the right of the slider automatically sets the contrast gray fulcrum to the average luminance from the selected region. This relies on the assumption that the average luminance is usually close to middle-gray, which is not true if you have specular highlights or primary light sources in the frame, or for low/high-key images.

### saturation formula

Note that this setting is not really appropriate for the _masks_ tab (since it is not technically related to the masks) but is placed here because it is not meant to be used regularly and in the spirit of saving some display real-estate. Two options are provided:

JzAzBz (2021)
: This mode is the original saturation algorithm. It uses the JzAzBz uniform color space (UCS) to compute the saturation. This color space is not meant for color changes and its lightness does not account for the [Helmholtz-Kohlrausch effect](https://en.wikipedia.org/wiki/Helmholtz%E2%80%93Kohlrausch_effect), which states that colorful colors will look brighter than neutral or near-neutral colors (greys and pastels) having the same luminance. It also suffers from non-smooth behaviour near black, with colors being darkened too much.

darktable UCS (2022)
: The darktable Uniform Color Space has been [designed from the ground up](https://eng.aurelienpierre.com/2022/02/color-saturation-control-for-the-21th-century/), using psychoperceptual measurement datasets, for the sole purpose of the color manipulation (saturation) performed by this module. This color space does account for the [Helmholtz-Kohlrausch effect](https://en.wikipedia.org/wiki/Helmholtz%E2%80%93Kohlrausch_effect) and has a built-in gamut mapping formula that is more accurate and efficient than can be achieved in JzAzBz. It displays a smoother behaviour which makes saturation changes more even across the lightness range.

### mask preview settings

These settings apply to the mask previews, displayed by clicking the mask buttons in the _luminance ranges_ section. These settings are saved globally, so will be applied to all subsequent images unless changed.

checker board color 1 and 2
: Set the two colors for the background checker board mask underlay. You can set them to opponent colors of the current image to aid legibility.

checker board size
: Set the width of the checker board cells in pixels (adjusted according to the display's DPI setting).

# FAQ

## saturation or chroma?

As described in the [dimensions of color](../../special-topics/color-management/color-dimensions.md) section, saturation and chroma roam the (lightness, chroma) plane in different directions. In addition, the chroma of _color balance RGB_ uses a scene-referred linear space, while the saturation uses a perceptual space, which rescales color for even spacing.

In practice, you should use the chroma setting if you want to preserve the scene-linearity of the light emission and/or keep the luminance unchanged. However, these changes might affect some hues more heavily than others, due to the fact that the color space is not fully perceptually-scaled.

Saturation is closer to the effect of mixing white paint with some base color. Reducing the saturation of red will degrade it to pink, while reducing its chroma will degrade to a gray shade at the same luminance. Saturation is perhaps a more intuitive way to interact with color, due to its connection with painting.

Choosing one or the other is mostly a matter of deciding where on the (lightness, chroma) graph you want to push your colors, and where they are to begin with. To reach pastel colors, saturation is the way to go. To reach laser-like colors (almost monochromatic), at the risk of looking synthetic, chroma is the way to go.

## what is the connection with lift/gamma/gain?

The _lift/gamma/gain_ algorithm relies on a display-referred color space, since it assumes a bounded and symmetric dynamic range, with white point at 100% and gray at 50%. As such, it is simply unusable in a scene-referred space. However, the only incompatible part is the _lift_. The _gamma_ is exactly the ASC CDL _power_, and the _gain_ is exactly the ASC CDL _slope_.

The _color balance RGB_ module simply has two slopes instead of one: the _gain_, applied on the highlights extracted from the whole image by a mask, and the _lift_, applied similarly but on the shadows.

## changing contrast

While _color balance RGB_ is mostly about color (other modules handle the global contrast in chromaticity-preserving ways) luminance is as much a part of color as hue or chroma, and it needs to be dealt with here too, because the perception of saturation relies on it. If you wish to turn red into pink, for example, reducing its chroma will turn it gray, so you need to increase its luminance as well.

There are several ways to change the contrast in _color balance RGB_, either locally (with masks) or globally (without):

- in the [_master_](#master-tab) tab, use the _contrast_ setting (possibly alongside the _contrast gray fulcrum_ in the [_masks_](#masks-tab) tab). Be aware that this will raise the white point and therefore increase the dynamic range of the image, which may void filmic settings later in the pipeline.
- in [_perceptual saturation grading_](#perceptual-saturation-grading), desaturate highlights and resaturate shadows to produce a luminance contrast boost,
- in [_perceptual brilliance grading_](#perceptual-brilliance-grading), add brilliance in the highlights and remove brilliance in the shadows to produce to a luminance contrast boost,
- in the [_4 ways_](#4-ways-tab) tab, set the _shadows lift_ luminance to negative values and the _highlights gain_ luminance to positive values, which also produces a luminance contrast boost.

The difference between these methods is how the effect will be weighted relative to the input of the module. You are advised to do the majority of luminance contrast adjustments in the _filmic_ and _tone equalizer_ modules, and then undertake final changes in _color balance RGB_ while examining the colors.

## internal processing

The following is the internal order of operations within the module:

1. Transform from pipeline RGB to Kirk/Filmlight Ych space,
2. Apply hue shift at constant chroma and constant luminance,
3. Compute luminance masks with Y,
4. Apply the _linear chroma_ and _vibrance_ settings at constant hue and luminance,
5. Transform to Kirk/Filmlight RGB space,
6. Apply the _4 ways_ settings (except _luminance power_),
7. Transform to Kirk/Filmlight Yrg space,
8. Apply _luminance power_ and _contrast_ on Y,
9. Transform to JzAzBz space,
10. Apply the _perceptual saturation_ and _perceptual brilliance_ settings,
11. Soft-clip the chroma using pipeline RGB gamut at constant hue and lightness,
12. Transform back to pipeline RGB.

# caveats

Setting the global chroma to -100% will not produce a real monochrome image, as is customary with other algorithms. The reason for this is that the RGB space used has a D65 white point defined in CIE LMS 2006 space, while darktable uses a white point defined in CIE XYZ 1931 space, and there is no exact conversion between these spaces. The result will therefore be a slightly tinted black & white image. If your intent is to get a real black & white image using the luminance channel, the _color calibration_ module offers a _B&W : luminance-based_ preset that does exactly the same thing but without the white-point discrepancy.

This module has its gamut-mapping (against pipeline RGB) permanently enabled. This means that if your original image contains some largely out-of-gamut colors to start with, simply enabling _color balance RGB_ with no particular setting will slightly alter its colors. This is probably for the best.

The maximum saturation allowed in the pipeline working RGB space is recorded for each hue when initializing the module, and is later cached in a LUT (look-up table) to save performance. If the working profile is later changed, _color balance RGB_ is not notified, meaning that it will not update its cached hue/saturation LUT. To force a LUT update, you can simply change any setting in the _color balance RGB_ module, then change it back again. It is not recommended that you change the working RGB space half-way through an editing session, as this could result in unexpected chroma and hue changes.

For performance reasons, the non-linear conversions from and to the working RGB space are bypassed, meaning that the internal colorimetry will be wrong when using non-linear color spaces. Note that there is no reason to use non-linear spaces as working RGB since they make alpha blending more challenging for no benefit.
