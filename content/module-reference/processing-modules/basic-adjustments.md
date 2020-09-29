---
title: basic adjustments
id: basic-adjustments
applicable-verison: 3.2.1
tags: 
working-color-space:  
view: darkroom
masking: 
---

The basic adjustments module is an alternative to using the [_base curve_](base-curve.md) module, and it combines exposure, highlight recovery, contrast, brightness, saturation and vibrance into one single module. This can provide a quick and convenient way to make simple adjustments to an image.

Normally in the pixel pipe, exposure adjustments should come before the input color profile, and color adjustments should come after. Because the basic adjustments module combines all this functions in a single place in the pixel pipe, it may not play nicely with other modules. Therefore, if you plan to combine the use of basic adjustments together with other modules, please consider using instead the [_exposure_](exposure.md) + [_base curve_](base-curve.md) / [_tone curve_](tone-curve.md) / [filmic rgb](filmic-rgb.md) + [_color balance_](color-balance.md) modules so that these operations occur in the correct places in the pixel pipe.

# module controls

black level correction
: this slider is the same as the black level correction slider in the [_exposure_](exposure.md) module. It defines the threshold at which dark gray values are cut off to pure black. Reducing this can bring some dark colours back into gamut. Increading this slider may appear to increase the contrast and pop of an image, but it can push dark colors out of gamut, and clipped data cannot be recovered further down the pixel pipe. To control the contrast in the shadows, it is better to use other modules such as [_tone curve_](tone-curve.md) or [_levels_](levels.md), which mitigate these negative impacts further down the pixel pipeline.

exposure
: this sider adjusts exposure compensation. In terms of brightness of the image, adding 1 EV of exposure compensation is equivalent to doubling the exposure time in camera, opening the aperture by 1 stop, or doubling the ISO setting. 

: Positive exposure corrections will make the image brighter. As a side effect noise level gets higher. Depending on the basic noise level of your camera and the ISO value of your image, positive exposure compensations with up to 1EV or 2EV should still give reasonable results.

: Negative exposure corrections will make the image darker. Given the nature of digital images this can not correct for fully blown out highlights but allows to reconstruct data in case that only some of the RGB channels are clipped (see the [_highlight reconstruction_](highlight-reconstruction.md) module for information on how to deal with clipped pixels).

highlight compression
: this slider compresses the highlights of the image in order to recover some of the detail in those highlights, at the cost of reducing contrast in the highlights to make room for the extra detail.

contrast
: this is equivalent to the _contrast_ slider on the [_color balance_](color-balance.md) module, and is used to increase the separation of luminance values around a fulcrum point, in effect making the tone curve steeper. The _middle grey_ slider sets the fulcrum point for the contrast, and any pixels whose luminance matches this middle grey point will be unaffected. Pixels brighter than the middle grey point will become even brighter, and pixels darker that the middle grey point will become even darker.

preserve colors
: If a non-linear tone curve is applied to each of the RGB channels individually, then the amount of tone adjustment applied to each colour channel may be different, and this can cause hue shifts. Therefore, the _preserve colors_ menu provides different methods of calculating the "luminance level" of a pixel. The amount of tone adjustment is calculated based on this luminance value, and then this same adjustment is applied to all three of the RGB channels. Different luminance estimators can affect the contrast in different parts of the image, depending on the specific characteristics of that image. The user can therefore choose a particular estimator that provides the best results for the given image.

middle grey
: this slider sets the fulcrum point for the _contrast_ slider; it is equivalent to the _contrast fulcrum_ slider on the [_color balance_](color-balance.md) module. If the contrast slider is set to `0` then this slider will not appear to have any effect.

brightness
: this slider is effectively a gamma control, and is equivalent to increaseing the _gamma factor_ slider in the [_color balance_](color-balance.md) module. Moving the slider to the right will increase the brightness of the image, with an emphasis on brightening the mid-tones of the image.

saturation
: this slider is equivalent to the _output saturation_ slider on the [_color balance_](color-balance.md) module, and affects the saturation, or brilliance and intensity of the colors. Moving the slider to the right will increase the amount of color in the image; moving the slider to the left will reduce the amount of color in the image.

vibrance
: The vibrance allows to accentuate the colors of the image without adding unnatural colors, as it's often the case of the Saturation slider. It works by bringing down the lightness of already saturated pixels to make the colors more vivid. You can also achieve some interesting effects by combining it with the saturation slider to target more or less saturationed areas of the image.

auto
: Automatically adjust the exposure of an image, taking into acount the entire image.

eyedropper
: By enabling the eye-dropper button, you can then drag out a rectangular region in the image, and the exposure of the image will be automatically adjusted based on the selected region in the image. This allows you to prioritise which parts of the image should be well-exposed.

clip
: this affects the number of pixels that will be clipped to back or white during the auto-exposure calculation. Moving this slider to the right will allow more pixels to be clipped and increase the contrast; moving this slider to the left will compress the image more and lower the contrast.

