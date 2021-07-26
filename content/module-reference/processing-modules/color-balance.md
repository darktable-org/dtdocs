---
title: color balance
id: color-balance
applicable-version: 3.2.1
tags: 
working-color-space: Lab 
view: darkroom
masking: true
---

A versatile tool for adjusting the image's color balance. 

This module can be used to revert parasitic color casts or to enhance the visual atmosphere of an image using color grading, a popular technique in the cinema industry. For scene-referred workflow, you should consider using the improved [_color balance rgb_](./color-balance-rgb.md) module instead.

# overview
The _color balance_ module allows you to shift colors selectively by luminance range (shadows, mid-tones, and highlights). It can do this using two different methods:

lift, gamma, gain
: The classic method, which allows a more separated control of shadows versus highlights.

slope, offset, power
: The new standard defined by the American Society of Cinematographers Color Decision List (ASC CDL) and more suited to scene-referred editing.

The _master_ settings affect the whole image. They are not available in _lift, gamma, gain (sRGB)_ mode. The slider ranges are limited to usual values ([50%; 150%] for saturation, [-50%; 50%] for contrast), but higher and lower values can be defined via keyboard input after right-clicking on the corresponding slider.

For better efficiency, in _slope, offset, power_ mode it is recommended that you set the slope first, then the offset, and finally the power, in that order. The name of the mode can be use as a mnemonic to remember the order. 

The shadows parameter has a far heavier effect in _slope, offset, power_ mode than in _lift, gamma, gain_ mode. When switching from the former to the latter, you should adapt the saturation in shadows, dividing by around 10.

---

**Note:** Although this module acts on RGB colors its location in the pixelpipe puts it into the Lab color space. Accordingly the module converts from Lab to RGB, performs its color adjustments, and then converts back to Lab.

---

# presets

Several presets are provided in this module to help you to better understand how it can best be used. The "teal/orange color-grading" preset is a very popular look in cinema and is a good showcase model. It is meant to be used with two instances combined with [masks](../../darkroom/masking-and-blending/masks/_index.md). The first instance will exclude skin tones and will shift neutral colors toward teal blue. The second will partially revert the first one and add more vibrance to skin tones only. Together they will create separation between subject and background. The masking and blending parameters will need to be tweaked to suit every image.

Other presets provide Kodak film emulations. In this way you can recreate any film look you like using _color balance_.

# module controls

mode
: _lift, gamma, gain (sRGB)_ is the legacy mode from darktable 2.4 and earlier. In this mode, the color transformations are applied in sRGB color space encoded with the sRGB gamma (average gamma of 2.2).

: _lift, gamma, gain (ProPhoto RGB)_ is the same as the previous mode but works in ProPhoto RGB space, encoded linearly. In this mode, the RGB parameters are corrected in XYZ luminance (Y channel) internally so they affect only the color, and only the “factors” adjust the luminance.

: _slope, offset, power (ProPhoto RGB)_ applies the ASC CDL in ProPhoto RGB space, encoded linearly. As with the previous mode, the RGB parameters are corrected in XYZ luminance internally. In this mode, the slope parameter acts as an exposure compensation, the offset acts as a black level correction, and the power acts as a gamma correction. All parameters will have some impact on the whole luminance range but the slope will mostly affect the highlights, the offset will mostly affect the shadows, and the power will mostly affect the mid-tones.

color control sliders
: This combobox selection affects the user interface used for the shadows, mid-tones and highlights controls. 

: _RGBL_ controls allow direct access to the RGB parameters that will be sent to the algorithm and internally adjusted in XYZ luminance, depending on the mode used. They are the only ones stored in darktable's development history.

: _HSL_ controls are more intuitive, but are only an interface: the hues and saturations are computed dynamically from and to the RGB parameters and never stored. During the HSL to RGB conversion, the HSL lightness is always assumed to be 50%, so the RGB parameters are always balanced to avoid lightness changes. However, during the RGB to HSL conversion, the HSL lightness is not corrected.

: As a consequence, editing in RGB, then in HSL, then again in RGB will not retain the original RGB parameters, but will normalize them so their HSL lightness is 50%. The difference is barely noticeable in most cases, especially using the modes that already correct the RGB parameters internally in XYZ luminance.

: In both modes, additional “factor” sliders act on all RGB channels at once. Their effect is similar to the controls of the [_levels_](./levels.md) module and affect only the luminance.

input saturation
: A saturation correction applied before the color balance. This can be used to dampen colors before adjusting the balance, to make difficult images easier to process. When you entirely desaturate the image, this creates a luminance-based monochrome image that can be used as a luminance mask, to create color filters with the _color balance_ settings, like a split-toning or sepia effect (when used with blending modes).

output saturation
: A saturation correction applied after the color balance. This is useful once you have found a proper hue balance but find the effect too heavy, so you can adjust the global saturation at once instead of editing each channel saturation separately at the expense of possibly messing up the colors.

contrast / contrast fulcrum
: The contrast slider allows the luminance separation to be increased. The fulcrum value defines the luminance value that will not be affected by the contrast correction, so the contrast will roll over the fulcrum. Luminance values above the fulcrum will be amplified almost linearly. Luminance values below the fulcrum value will be compressed with a power function (creating a toe). This correction comes after the output saturation and is applied on all RGB channels separately, so hues and saturations might not be preserved in case of dramatic settings (shadows might be resaturated, highlights might be desaturated, and some color shift is to be expected).

shadows, mid-tones, highlights
: Depending on the mode used, the shadows settings will control either the lift or the offset, the mid-tones settings will control either the gamma or the power, and the highlights settings will control either the gain or the slope. Parameters are transferred unaltered when you change the mode.

: In _RGBL_ mode, the RGB sliders' range is limited to \[-0.5; 0.5\]. In _HSL_ mode, the saturation sliders range is limited to \[0%; 25%\]. Values outside of these bounds can be defined with keyboard input by right-clicking on the slider.

---

**Note:** The shadows, mid-tones and highlights sliders can take up a great deal of space in the _color balance_ module. The overall layout of these sliders can therefore be cycled through three different layouts by clicking on the _shadows, mid-tones, highlights_ heading. You can also set the default layout with [preferences > darkroom > colorbalance slider block layout](../../preferences-settings/darkroom.md).

---

optimize luma
: The color-picker beside the optimize luma label will select the whole image and optimize the factors for shadows, mid-tones and highlights so that the average luminance of the image is 50% Lab, the maximum is 100% and the minimum is 0%, at the output of this module. This is essentially histogram normalization, similar to that performed by the [_levels_](./levels.md) module. The optimizer is only really accurate when used in _slope, offset, power_ mode.

: If you want more control, you can define three control patches by using the color pickers beside each factor slider to sample luminance in selected areas. The _shadows_ color picker samples the minimum luminance, the _mid-tones_ color picker samples the average luminance, and the _highlights_ color picker samples the maximum luminance. The most sensitive parameter is the mid-tones factor, since selecting a slightly different area can lead to dramatic parameter changes. Using the factors color pickers alone, without triggering the luma optimization, will allow you to perform adjustments without general optimization, but each parameter is always computed taking the other two into account. Once patches are selected, the label changes to read “optimize luma from patches”. To reset one patch, you can just redo the selection. Patches are not saved in the parameters and are retained only during the current session.

: It is important to note that the luminance adjustment targets only the output of the _color balance_ module and does not account for adjustments performed in other modules later in the pixelpipe (e.g. [_filmic rgb_](./filmic-rgb.md), [_tone curve_](./tone-curve.md), [_color zones_](./color-zones.md), [_levels_](./levels.md)). Using the _color balance_ module to remap the luminance globally on the image is not recommended because it does not preserve the original colors -- modules such as [_tone curve_](./tone-curve.md) or [_filmic rgb_](./filmic-rgb.md) are better suited for this purpose. Luminance adjustments in _color balance_ are better performed, in combination with color adjustments, using masks.

neutralize colors
: In an image where some areas are exposed to direct sunlight and some areas are exposed to reflected light (shadows), or where several artificial light sources are present simultaneously, shadows and highlights often have different color temperatures. These images are particularly difficult to correct since no general white balance will match all the colors at once. The color neutralization optimizer aims at helping you find the complementary color for shadows, midtones, and highlights so that all the color casts are reverted, and the average color of the image is a neutral gray.

: As with the luma optimization, the color picker beside the neutralize colors label will trigger a general optimization over the whole image. This works fairly well in landscape photography, or for any photograph with a full spectrum of colors and luminances. 

: For night and events photography, this will most likely fail and you will need to manually input the sampling areas with the color-pickers beside each hue slider. For the highlights sample, use a color exposed to spotlights that should be neutral white or light gray. For the shadows sample, use a color exposed to ambient light that should be neutral black or dark gray. For the mid-tones sample, use a color exposed by both ambient and spotlights.

: The success of the optimization depends on the quality of the samples. Not every set of samples will converge to a good solution and you need to ensure that the color patches you choose are really a neutral color in real life. In many cases the optimizer will output the correct hue but an excessive saturation that will need some extra tweaking. In some cases, no valid optimization will be delivered and you will need to reset the saturation parameters and start over, or simply stop after the patches selection. Note that in the auto-optimization, the maximum saturation is 25%, which might not be enough in very few cases but will avoid inconsistent results in most.

: If you select color patches from the hue color pickers without triggering the optimization, the software will only perform one round of optimization and then stop. This allows you to control each luminance range separately and avoid divergence of the solution in corner cases. The hue and saturation corrections are computed taking into account the two other luminance ranges and three factors, and will always output the complementary color of the selected area. If you want to reinforce the color of the area instead, you can then add 180° to the computed hue. Once patches are selected, the label changes to read “neutralize colors from patches”. To reset one patch you can just redo the selection. Patches are not saved in the parameters and are retained only during the current session. The parameters found by the automatic neutralization are accurate only in _slope, offset, power_ mode, but can work to some extent in _lift, gamma, gain_ mode too.
