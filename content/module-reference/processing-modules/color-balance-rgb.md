---
title: color balance rgb
id: color-balance
applicable-version: 3.6
tags:
working-color-space: RGB
view: darkroom
masking: true
---

The color balance RGB is an advanced module bringing cinematography color-grading tools into the photo scene-referred pipeline. It is not suited for beginners with no prior knowledge of color theory, who might want to stick to the *global chroma* and *global vibrance* settings until they build an understanding of the [dimensions of color](../../special-topics/color-management/color-dimensions.md).

# introduction

Color-grading is an important part of a picture editing: it can help removing unwanted color casts but can also bring a creative color twist that will create an atmosphere in the frame. In the film days, most of the color ambiance was devoted to the film emulsion and the developing chemicals. Some color timing was also done with color heads, under the enlarger. This consumed expansive ressource and was mostly reserved to the cinema industry, which created the job of colorist.

In the digital age, where raw pictures look flat and even, color-grading assumes the same task as film emulsions used to, by re-introducing color shifts for aesthetic purposes. It can also serve to harmonize the color palette of a series of pictures that may have been shot in different conditions, to achieve a consistent global look. For this task, the vectorscope will be of great help.

Colorists usually split the color-grading into two steps:

1. the primary color-grading, aimed at fixing unwanted color casts and at creating a neutral starting base,
2. the secondary color-grading, aimed at giving the final look and atmosphere to a picture.

The primary color-grading is better left to the *color calibration* module, that operates in a physical framework better suited for illuminant corrections. The *color balance* is mostly about secondary color-grading. Performing a truly neutral primary color-grading will make the secondary color-grading easily transferable to other pictures (through styles, presets or copy-paste) with similar effect.

# general principles

The color balance RGB is an improvement over the [American Society of Cinematographers Color Decision List](https://en.wikipedia.org/wiki/ASC_CDL) (ASC CDL) with alpha masks that allow to really split the effect between shadows and highlights. Otherwise, the classic CDL acts on the whole luminance range, and each of its parameter gets more weight on some part only by a math side-effect.

It works for the most part (*4 ways*, *chroma*, *vibrance*, *contrast*) in a linear RGB space designed specifically for color-grading, that displays an uniform spacing of perceptual hues while retaining a physically-scaled luminance[^1]. The perceptual part (*saturation* and *brilliance*) works in JzAzBz[^2], which gives a perceptual scaling of both lightness and chromaticity suitable for HDR images. Both spaces ensure saturation and chroma changes happen at constant hue, which is not the case for many other saturation operators in darktable (noticeably the older *color balance* module).

[^1]: Richard A. Kirk, Chromaticity coordinates for graphic arts based on CIE 2006 LMS with even spacing of Munsell colours, 2019. <https://doi.org/10.2352/issn.2169-2629.2019.27.38>

[^2]: Safdar & al., Perceptually uniform color space for image signals including high dynamic range and wide gamut, 2017. <https://doi.org/10.1364/OE.25.015131>

The color balance RGB expects a scene-referred linear input and outputs scene-referred RGB that may or may not be linear anymore, depending on the settings (*contrast* and *power* will delinearize it).

At the output, the color balance RGB checks that the graded colors fit inside the pipeline RGB space (Rec 2020 by default) and applies a soft chroma clipping at constant luminance and hue. This prevents out-of-gamut colors that can quickly happen when increasing chroma and saturation.

Notice this module abides by the CIE definitions of chroma and saturation, as explained in the [dimensions of color](../../special-topics/color-management/color-dimensions.md).


# module controls

## master

hue shift
: This setting allows to rotate all colors in the image by an angle over the chromaticity plane, at constant luminance and chroma. It can be used to remove spilled colored light on a subject or to quickly change the color of some object. It is usually better used in a local fashion, with masks.

global vibrance
: The vibrance parameter affects the chroma dimension of color globally in the image. The difference is vibrance targets more heavily colors that have a low chroma, which helps increasing the chroma of neutral colors without exaggerating on already-colorful colors.

contrast
: The contrast setting is applied on the luminance channel at constant hue and chroma. It is fulcrumed to control the neutral point of the contrast curve:
 * at the fulcrum value, the contrast curve leaves the luminance unchanged,
 * below the fulcrum value, the contrast curve decreases the luminance for positive contrast values, or increases it for negative contrast values,
 * above the fulcrum value, the contrast curve increases the luminance for positive contrast values, or decreases it for negative contrast values.

: The fulcrum setting can be found in the *masks* tab, under *contrast grey fulcrum*. The default value of 18.45% is consistent with the current scene-referred workflow and should fit most uses if global brightness has been fixed using the *exposure* module as recommended.

: This contrast algorithm gives natural results that mimic the central part of the film contrast curve. However, it will also increase the image dynamic range which may void *filmic* settings in the pipe. For global contrast adjustments, the *tone equalizer* should be preferred, and the present contrast slider will be best used with masks, for example for selective corrections over the foreground or background.

### linear chroma grading

The linear chroma grading affects the chroma dimension proportionnaly to its input value, at constant hue and luminance. It does so globally, with a flat coefficient (using the *global chroma*), and on each of the *shadows*, *midtones* and *highlights* masks defined in the *masks* tab, under *luminance ranges*.

### perceptual saturation grading

The perceptual chroma grading affects both the luminance and the chroma dimensions, in a perceptual space, proportionnaly to its input value, at constant hue. It does so globally, with a flat coefficient (using the *global saturation*), and on each of the *shadows*, *midtones* and *highlights* masks defined in the *masks* tab, under *luminance ranges*.

### perceptual brilliance grading

The perceptual brilliance grading affects both the luminance and the chroma dimensions, in a perceptual space, proportionnaly to its input value, at constant hue, and in a direction orthogonal to the saturation. Its effect is close to changing exposure, but scaled perceptually. It does so globally, with a flat coefficient (using the *global saturation*), and on each of the *shadows*, *midtones* and *highlights* masks defined in the *masks* tab, under *luminance ranges*.

## 4 ways

Each of the settings is composed of the same 3 components that help defining a color from independent coordinates:

1. *luminance*,
2. *hue*,
3. *chroma*.

The color input like this defines a color shift applied on the image to the specific luminance range or globally.

Each hue slider gets a color-picker, that may be used in the image to compute the opponent color of the selected region. This is useful to revert unwanted color casts (e.g skin redness), since shifting the color to the opponent cast actually neutralizes it.

### global offset

This is equivalent to the ASC CDL offset and falls back to adding a constant RGB value to all pixels, quite like the *black offset* in *exposure* module. This part does not use masking.

### shadows lift

This is conceptually equivalent to the *lift* from *lift/gamma/gain*, although implemented differently, and falls back to multiplying a constant RGB value to the masked pixels. It is applied on the *shadows* mask.

### highlights gain

This is equivalent to the ASC CDL slope, falling back to multiplying a constant RGB value to the masked pixels. It is applied on the *highlights* mask.

### global power

This is equivalent to the ASC CDL power, falling back to applying a constant RGB exponent. It is **not** masked and needs to be normalized, since the power function has a different behaviour below and above 1, and we are in an unbounded pipeline where white is typically greater than 1. The normalization parameter is available in *masks* tab, under *white fulcrum*.

## Masks

The *masks* tab defines auxiliary controls for the previous tabs. Masking controls typically don't need any user modification since the defaults are calibrated to suit most needs and fulfil the scene-referred pixel pipeline expectations. You may change them only in particular situations.

### Luminance ranges

The graphs shows the opacity (on the *y* axis) of the 3 luminance masks relatively to the luminance value (on the *x* axis). The darkest curve represents the *shadows* mask, the brightest represents the *highlights*, and the last one the *midtones*.

Only the *shadows* and *highlights* masks can be controlled directly, the *midtones* one is computed indirectly from the two others and acts as an adjustment variable.

shadows fall-off
: Controls the softness or hardness of the transition from fully opaque (100%) to fully transparent (0%) for the shadows mask.

: The mask button, right to the slider, displays the shadows mask overlaying a checker board, for direct preview.

mask middle-grey fulcrum
: Sets the luminance value where the 3 masks all have 50% opacity. In practice, it is useful to define how the image is split between shadows and highlights.

: The mask button, right to the slider, displays the midtones mask overlaying a checker board, for direct preview.

highlights fall-off
: Controls the softness or hardness of the transition from fully opaque (100%) to fully transparent (0%) for the highlights mask.

: The mask button, right to the slider, displays the highlights mask overlaying a checker board, for direct preview.

All mask previews display the output of the module, including color changes made inside, so you can also use them while editing to see only the affected part.

Luminance masks are computed at the input of the module, meaning they are insensitive to luminance changes made inside the module.

### Thresholds

white fulcrum
: Sets the white point luminance in EV, used to normalized the *power* setting in the *4 ways* tab. Display-referred implementations of power functions assume white at 100% which voids the need for normalization, but for scene-referred purpose, this needs to be taken into account.

: The color-picker on the right of the slider automatically sets the white fulcrum to the maximum luminance found in the selected image region. In most cases, this is enough to setup this value properly.

contrast grey fulcrum
: Sets the fulcrum for the *contrast* setting in *master* tab, which corresponds to the luminance value that will be left unchanged by the contrast adjustment. This setting usually matches the middle-grey linear value. If you followed the scene-referred workflow recommendations and set the global brightness early in the pipeline, using *exposure* module, the right value should usually be around 18-20%.

: The color-picker on the right of the slider automatically sets the contrast grey fulcrum to the average luminance found in the selected image region. This relies on the assumption that the average luminance in a picture is usually close to middle-grey, which is wrong if you have specular highlights or primary light sources in the frame, or for low/high-key pictures.

### Masks preview settings

These settings are used only when masks preview is displayed, from clicking the masks buttons from the *luminance ranges* section. They are saved globally in darktable, so they will be applied to all images the same unless changed.

checker board color 1 and 2
: Sets the two colors for the background checker board mask underlay. You can set them to opponents colors of the current picture to help legibility.

checker board size
: Sets the width of the checker board cells in pixels. The display DPI factor coefficient will be applied on top of the user-input.
# FAQ

## Saturation or Chroma ?

As seen in the [dimensions of color](../../special-topics/color-management/color-dimensions.md), saturation and chroma roam the (lightness, chroma) plane in different directions. In addition, the chroma of *color balance RGB* uses a scene-referred linear space, while the saturation uses a perceptual space, which rescales color for even spacing.

In practice, use the chroma if you want to preserve the scene-linarity of the light emission and/or keep the luminance unchanged. However, these changes might affect some hues more heavily than others, due to the non-fully-perceptual scaling of the color space.

Saturation is closer to the effect of mixing white paint with some base color. Reducing the saturation of red will degrade it to pink, while reducing its chroma will degrade to a grey shade at the same luminance. It is perhaps a more organic way to interact with color, due to its connection with painting.

Choosing one or the other is mostly a matter of deciding where on the (lightness, chroma) graph you want to push your colors, and where they are to begin with. To reach pastel colors, saturation is the way to go. To reach laser-like colors (almost monochromatic), at the risk of looking synthetic, chroma is the way to go.

## What is the connection with lift/gamma/gain ?

The *lift/gamma/gain* algorithm relies on a display-referred space since it assumes a bounded and symmetric dynamic range, with white point at 100% and grey at 50%. As such, it is simply unusable in a scene-referred space. However, the only incompatible part is the lift. The *gamma* is exactly the ASC CDL *power*, and the *gain* is exactly the ASC CDL *slope*.

The *color balance RGB* simply has two slopes instead of one: the gain, applied on highlights extracted from the whole image by a mask, and the lift, applied the same but on shadows.

## Changing contrast

While *color balance RGB* is mostly about color and other modules handle the global contrast in chromaticity-preserving ways, luminance is a part of color as much as hue or chroma, and it needs to be dealt with here too, because the perception of saturation relies on it. If you wish to turn red into pink, for example, reducing its chroma will turn it grey, so you need to increase its luminance too.

There are several ways to change the contrast in *color balance RGB*, either globally (without masks) or locally (using masks):

* in *master* tab, use the *contrast* setting, possibly with the *contrast grey fulcrum* in *masks* tab. Be aware that this will move the white point up and therefore increase the dynamic range of the picture, which may void filmic settings later in the pipeline.
* in *perceptual saturation grading*, desaturating highlights and resaturating shadows will lead to a luminance contrast boost,
* in *perceptual brilliance grading*, adding brilliance in highlights and removing brilliance in shadows will lead to a luminance contrast boost,
* in *4 ways*, setting *shadows lift* luminance to negative values and *highlights gain* to positive values, will asto lead to a luminance contrast boost.

The difference between all these methods is how the effect will be weighted relatively to the input of the module. It is advised to do the luminance contrast heavy-lifting in *filmic* and *tone equalizer* modules, then only finish the result in *color balance RGB* while looking at colors.

## Order of application

Here is the internal order of operations inside the module:

1. Go from pipeline RGB to Kirk/Filmlight Ych space,
2. Apply hue shift at constant chroma and constant luminance,
3. Compute luminance masks with Y,
4. Apply the *linear chroma* and *vibrance* settings at constant hue and luminance,
5. Go to Kirk/Filmlight RGB space,
6. Apply the *4 ways* settings except *luminance power*,
7. Go to Kirk/Filmlight Yrg space,
8. Apply *luminance power* and *contrast* on Y,
9. Go to JzAzBz space,
10. Apply the *perceptual saturation* and *perceptual brilliance* settings,
11. Soft-clip the chroma using pipeline RGB gamut at constant hue and lightness,
12. Go back from JzAzBz to pipeline RGB.

# Caveats

Setting the global chroma to -100% will not produce a real monochrome picture, as it is customary with other algorithms. The reason is the RGB space used has a D65 white point defined in CIE LMS 2006 space, while darktable uses a white point defined in CIE XYZ 1931 space, and there is no exact conversion between both spaces. The result will be a slighly tinted black & white. If your intent is to get a real B&W using the luminance channel, the *color calibration* modules offers a *B&W : luminance-based* preset that does exactly the same thing minus the white point discrepancy.

The module has the gamut-mapping against pipeline RGB always on. It means that if your original picture has some largely out-of-gamut colors to begin with, simply enabling the color balance RGB with no particular setting will sligthly change its colors. This should be for the best, though.
