---
title: "editing an image: scene-referred workflow"
id: edit-scene-referred
draft: false
weight: 30
author: "people"
---

The _scene-referred_ workflow places an emphasis on performing image processing in the linear scene-referred part of the pixelpipe. This helps to reduce artifacts and color shifts that can result from processing non-linear pixel values and, by decoupling the image processing from the characteristics of a specific display, it makes it easier to adapt your work in the future to new display media, such as high dynamic range displays.

This being the recommended way to process images in versions 3.0 and above, this section will provide a much more comprehensive overview than the next section on the _display-referred_ workflow.

# basic steps
Basic image processing in scene-referred workflow requires you, as a minimum, to consider the following steps in order to render a reasonable image on your display:

capture an image
: Use your camera to take a properly exposed image. Normally you can rely on the camera's metering and automatic exposure features. However, for some scenes you may need to use the camera's exposure compensation dial or manual settings to get an optimal exposure. In general, you want to make the exposure in camera as bright as possible without clipping the highlights. This is known as "exposing to the right" (ETTR), and it ensures you take best advantage of the sensor's dynamic range. Many cameras have features like "zebras" or "blinkies" to warn you when you are in danger of clipping.

[_exposure_](../../module-reference/processing-modules/exposure.md)
: This module is enabled by default, and it will include an initial exposure boost of +0.5EV to mimic the standard processing of most in-camera JPEGs. The metering systems in cameras vary, and some camera models might need a slightly larger exposure boost (eg. +0.8EV ~ 1.5EV), in which case you can create an auto-apply [preset](../../darkroom/interacting-with-modules/presets.md) as required. The exposure module will detect if the camera's exposure compensation dial was used (see above remarks about ETTR), and will re-adjust the exposure accordingly. 

: Use the exposure slider to adjust the midtones in the image to an appropriate brightness level. At this stage, don't worry about highlights and shadows -- these will be handled later. 

: You can also `click+drag` on the histogram to change the exposure, but this gives less control than using the _exposure_ module slider. While you can use the _exposure_ module to tweak the black level to supply more contrast, you need to be very careful doing this as you can end up with negative RGB values.

[_white balance_](../../module-reference/processing-modules/white-balance.md)
: It is important that the white balance is set correctly to form a solid basis for subsequent processing. The camera will normally store the selected white balance setting inside the raw file's metadata, and darktable will use this as a starting point. To get a more accurate white balance, you can either use the color picker to select a neutral grey tone in the image, or you can switch to a different white balance preset from your camera, where available. Fine adjustments to the global white balance are made using the _temperature_ slider and, less often, the _tint_ slider. Moving the _temperature_ slider to the left makes the image cooler (more blue), and moving it to the right makes it warmer (more orange).

: The _white balance_ module is only able to make _global_ adjustments to the white balance of the image. The [_color balance_](../../module-reference/processing-modules/color-balance.md) module, among other things, gives you even more control in cases where a scene was illuminated by multiple light sources at different color temperatures.

[_filmic rgb_](../../module-reference/processing-modules/filmic-rgb.md)
: This module performs tone mapping compression from the high-dynamic-range of the captured image, to the lower dynamic range of the display medium. The mid-grey tone level has already been set (above) with the _exposure_ module. Filmic will propose, on its _scene_ tab, an appropriate white point and black point for the image -- you may need to adjust these for a particular scene. On the _look_ tab you can adjust the midtone contrast and saturation settings if required.


# other recommended modules
In addition to the basic modules described above, you may want to consider using the following modules to make your image look even prettier. These modules are known to work well with the scene-referred workflow:

[_crop and rotate_](../../module-reference/processing-modules/crop-rotate.md) / [_perspective correction_](../../module-reference/processing-modules/perspective-correction.md)
: Quite frequently you want to only show part of the captured scene in your image, e.g. to take away some disturbing feature close to the frame. In other cases, the horizon in the image may need levelling, or there may be perspective distortions. All of this can be corrected with full manual control in the _crop and rotate_ module. For a fully automatic correction of perspective distortions you may alternatively visit the _perspective correction_ module. 

[_retouch_](../../module-reference/processing-modules/retouch.md) / [_spot removal_](../../module-reference/processing-modules/spot-removal.md) / [_hot pixels_](../../module-reference/processing-modules/hot-pixels.md)
: Sometimes you will need to remove spots caused by sensor dirt. The new _retouch_ and the older _spot removal_ modules are at hand for this and can also correct other disturbing elements like skin blemishes. If your camera has stuck pixels or tends to produce hot pixels at high ISO values or longer exposure times, take a look at the _hot pixels_ module for automatic correction.

[_color balance_](../../module-reference/processing-modules/color-balance.md)
: This is a versatile module that can be used to further adjust the contrast and saturation of an image, and can also be used to perform color grading (e.g. emulate "orange and teal" grading used in hollywood films, remove redness in skin tones, adjust for uneven color balance in shadows/midtones/highlights, etc.). The [_color zones_](../../module-reference/processing-modules/color-zones.md) module can also be helpful in some cases where you are unable to achieve the desired effect using the _color balance_ module.

[_tone equalizer_](../../module-reference/processing-modules/tone-equalizer.md)
: Use this module to perform "dodging and burning" operations and recover detail in the shadows and highlights. This module generates a mask to average out the luminance in different parts of the image, and the equalizer allows you to selectively increase and decrease luminance levels using that mask. It is recommended that you first check the mask is set up appropriately, then you can use the sliders or the spline curve to adjust the various brightness levels. You can also place the mouse cursor over different parts of the image to see the EV level of the mask at that point, and then use the mouse wheel to adjust the brightness of that EV level accordingly.

[_local contrast_](../../module-reference/processing-modules/local-contrast.md)
: This module can emphasise detail and improve clarity, and is a good way to improve the general sharpness of an image. It is recommended that you use this module in _local lapacian_ mode.

: A more versatile but also more complex technique is to use the [_contrast equalizer_](../../module-reference/processing-modules/contrast-equalizer.md) module, which is very useful for making adjustments where spatial dimension plays a role. It has a number of pre-defined presets that may be helpful as a starting point in understanding this module.

[_denoise (profiled)_](../../module-reference/processing-modules/denoise-profiled.md)
: The _denoise (profiled)_ module is usually your best option for reducing noise in an image. This module offers an almost “single-click” solution to remove noise. From a user perspective the effect only depends on camera type and ISO value, both derived from Exif data. All other settings are taken from a database of noise profiles that the darktable team has collected -- now covering well above 300 popular camera models. The simplest way to use this module is _non-local means (auto)_ mode. The wavelet feature of this module is also quite effective against color noise. It is recommended that you use this module at 100% zoom so that you can accurately see the effects of your changes. 

: Other modules that allow for image denoising include [_raw denoise_](../../module-reference/processing-modules/raw-denoise.mf), [_surface blur_](../../module-reference/processing-modules/surface-blur.md), [_astrophoto denoise_](../../module-reference/processing-modules/astrophoto-denoise.md), and the [_contrast equalizer_](../../module-reference/processing-modules/contrast-equalizer.md) module, which is based on wavelets. If your camera is not yet supported by _denoise (profiled)_, _astrophoto denoise_ is probably the most convenient alternative, as it allows you to treat color and luminance noise separately.

[_haze removal_](../../module-reference/processing-modules/haze-removal.md)
: Does what is says on the tin -- removes atmospheric haze.

[_color calibration_](../../module-reference/processing-modules/color-calibration.md)
: This module offers a range of presets for making black and white images emulating classic film. It can also be used to tweak your color profile matrices, for example, to deal with color gamut issues.

[_lens correction_](../../module-reference/processing-modules/lens-correction.md)
: If your camera/lens combination is supported, use this module to correct for standard lens distortions, where corrections have not already been performed in-camera. The [_crop and rotate_](../../module-reference/processing-modules/crop-rotate.md) or [_perspective correction_](../../module-reference/processing-modules/perspective-correction.md) modules can also be used to simulate the effects of a tilt-shift lens.

# modules to be used with care

There are some modules for which there is not yet an alternative that is well-suited to the scene-referred workflow. If required, these modules should be used sparingly and with care.

[_vibrance_](../../module-reference/processing-modules/vibrance.md)
: Tends to darken colors. Consider using using [_color zones_](../../module-reference/processing-modules/color-zones.md) with a saturation parametric mask to give more control.

[_color zones_](../../module-reference/processing-modules/color-zones.md)
: Transitions may not be graceful. An alternative can be to use [_color balance_](../../module-reference/processing-modules/color-balance.md) with a parameteric mask.

[_vignetting_](../../module-reference/processing-modules/vignetting.md)
: This module can produce unnatural-looking results with too strong a fall-off. You may be better off using the [_exposure_](../../module-reference/processing-modules/exposure.md) module with an elliptical mask with large transition area, and perhaps adding [_color balance_](../../module-reference/processing-modules/color-balance.md) with the same mask to reduce saturation at the edges.

---

**Note:** When using [blend modes](../../darkroom/masking-and-blending/blend-modes.md) on any module, you should be aware that many of the blend modes are optimized for display-referred space and assume a mid-gray value of 50%. For the linear scene-referred space, stick with blend modes based on arithmetic operations (addition, multiplication, division, subtraction, average), on maximum/minimum comparisons (screen) or on channel separations (hue, color, chroma, etc.).

---

# other artistic effects

There are also a number of artistic effect modules available in darktable. To name just a few: 

- Use the [_watermark_](../../module-reference/processing-modules/watermark.md) module to add an individual watermark to your image. 
- Use the [_grain_](../../module-reference/processing-modules/grain.md) module to simulate the typical noise of classical analogue photos. 
- Use the [_color mapping_](../../module-reference/processing-modules/color-mapping.md) module to transfer the look and feel of one color image onto another. 
- Use the [_lowlight vision_](../../module-reference/processing-modules/lowlight-vision.md) module to simulate human vision making low light pictures look closer to reality. 
- Use the [_graduated density_](../../module-reference/processing-modules/graduated-density.md) filter to add a neutral or colored gradient to your image for exposure and color correction. 

Please see the [processing module reference](../../module-reference/processing-modules/_index.md) for a list of the available modules.

# modules to avoid

There are a number of modules which are no longer recommended for use within a scene-referred workflow. This doesn't mean they can't be used, but they can produce undesirable effects when their sliders are pushed too far, and there are better alternatives. In each case, the preferred alternative module is listed along with a brief explanation.

[_local tone mapping_](../../module-reference/processing-modules/tone-mapping.md)
: _prefer [tone equalizer](../../module-reference/processing-modules/tone-equalizer.md)_

: This module applies a bilateral blur over a non-linear (log) mapping that can provoke halos and fringing. This is common issue for modules performing blurs and occlusions that operate over a non-linear encoding.

[_global tonemap (deprecated)_](../../module-reference/processing-modules/global-tonemap.md)
: _prefer [filmic rgb](../../module-reference/processing-modules/filmic-rgb.md)_

: This module tries to deal with HDR images using the Lab color space, which is not well suited for high dyanamic ranges. The _filmic rgb_ module operates in a linear space and can easily scale over a wide range of input values from the scene and fit them into the narrower dynamic range demanded by display and printing devices.

[_shadows and highlights_](../../module-reference/processing-modules/shadows-and-highlights.md)
: _prefer [tone equalizer](../../module-reference/processing-modules/tone-equalizer.md)_

: This module works with blurs in Lab color space, resulting in problems including halos, high local contrast in highlights and hue shifts towards blue in the shadows.

[_lowpass_](../../module-reference/processing-modules/lowpass.md)
: _prefer [contrast equalizer](../../module-reference/processing-modules/contrast-equalizer.md) or [tone equalizer](../../module-reference/processing-modules/tone-equalizer.md)_

: Another module doing blurs in Lab space. Prefer the _contrast equalizer_ for blurring, or the _tone equalizer_ if local dynamic range compression is needed.

[_highpass_](../../module-reference/processing-modules/highpass.md)
: _prefer [contrast equalizer](../../module-reference/processing-modules/contrast-equalizer.md) or [local contrast](../../module-reference/processing-modules/local-contrast.md)_

: Uses a blur performed in Lab space, so has the same problems as with the [_lowpass_](../../module-reference/processing-modules/lowpass.md) module. Use _contrast equalizer_ for fine sharpness, or _local contrast_ for general sharpness.

[_sharpen_](../../module-reference/processing-modules/sharpen.md)
: _prefer [contrast equalizer](../../module-reference/processing-modules/contrast-equalizer.md) or [local contrast](../../module-reference/processing-modules/local-contrast.md)_

: The USM algorithm used in the _sharpen_ module suffers from same issues as the _highpass_ module, and can easily cause artifacts. Use the presets offered by the _contrast equalizer_ for de-blurring, or _local contrast_ for general sharpness.

[_monochrome_](../../module-reference/processing-modules/monochrome.md)
: _prefer [color calibration](../../module-reference/processing-modules/color-calibration.md) (or [color balance](../../module-reference/processing-modules/color-balance.md))_

: The _monochrome_ module can be quite fiddly to use. The _color calibration_ presets better emulate what physically happens with film, or you can set the _output saturation_ slider in the _color balance_ module to 0% for a more perceptual approach.

[_fill light (deprecated)_](../../module-reference/processing-modules/fill-light.md)
: _prefer [tone equalizer](../../module-reference/processing-modules/tone-equalizer.md) (or [exposure](../../module-reference/processing-modules/exposure.md))_

: Used to add light to a scene, this module again uses blurs in Lab space. The _tone equalizer_ works in linear space, or you can also achieve a similar effect by using the _exposure_ module with a [drawn mask](../../darkroom/masking-and-blending/masks/drawn.md).

[_bloom_](../../module-reference/processing-modules/bloom.md)
: _prefer [tone equalizer](../../module-reference/processing-modules/tone-equalizer.md) (or [exposure](../../module-reference/processing-modules/exposure.md))_

: Again, this module uses blurs in Lab space. Either use the _tone equalizer_ module or the _exposure_ module with a [parametric mask](../../darkroom/masking-and-blending/masks/parametric.md), both of which operate with linear encodings.

[_zone system (deprecated)_](../../module-reference/processing-modules/zone-system.md)
: _prefer [tone equalizer](../../module-reference/processing-modules/tone-equalizer.md) (or [exposure](../../module-reference/processing-modules/exposure.md))_

: This module again operates in Lab space, and becomes problematic if you push it too far. It is better to use the _tone equalizer_ or multiple instances of the _exposure_ module with parametric masks to narrow down on a zone.

[_color correction_](../../module-reference/processing-modules/color-correction.md)
: _prefer [color balance](../../module-reference/processing-modules/color-balance.md)_

: Prefer the _color balance_ module, which works in RGB color space and allows easy adjustment of the white balance in shadows (_offset_), midtones (_power_) and highlights (_slope_). Note the _offset_, _power_ and _slope_ that we normally use in linear spaces roughly correspond to the _lift_, _gamma_ and _gain_ parameters used in non-linear gamma-encoded spaces.

[_velvia_](../../module-reference/processing-modules/velvia.md)
: _prefer [color balance](../../module-reference/processing-modules/color-balance.md)_

: The _output saturation_ slider of the _color balance_ module uses similar logic as the _velvia_ module, but without the hue and brightness shifts, which can be difficult to manage.

[_levels_](../../module-reference/processing-modules/levels.md)/[rgb levels](../../module-reference/processing-modules/rgb-levels.md)
: _prefer [color balance](../../module-reference/processing-modules/color-balance.md)_

: These modules basically implement a subset of the functions of the _color balance_ module, which pretty much makes them redundant.

[_tone curve_](../../module-reference/processing-modules/tone-curve.md)/[rgb curve](../../module-reference/processing-modules/rgb-curve.md)
: _prefer [color balance](../../module-reference/processing-modules/color-balance.md)_

: These modules are normally used to adjust contrast. Their user interface assumes the mid-grey level is around 50%, but in linear scene-referred space mid-grey is much lower at around 18%. It is better to adjust the contrast in _color balance_ module, where the mid-grey reference point can be set with the _contrast fulcrum_ slider.

[_contrast brightness saturation_](../../module-reference/processing-modules/contrast-brightness-saturation.md)
: _prefer [color balance](../../module-reference/processing-modules/color-balance.md)_

: This module works in Lab color space (with the limitations that implies) and basically duplicates functions already provided by _color balance_.

