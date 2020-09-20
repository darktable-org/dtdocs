---
title: editing an image - scene referred workflow
id: edit-scene-referred
draft: false
weight: 30
author: "people"
---

The _scene-referred_ workflow places an emphasis on performing image processing in the linear scene-referred part of the pixel pipe. This helps to reduce artifacts and color shifts that can result from working in non-linear display-referred space and, by decoupling the image processing from the characteristics of a specific display, it makes it easier to adapt your work in the future to new display types, such as high dynamic range displays.

# base modules
Basic image processing in scene-referred workflow requires you, as a minimum, to consider the following modules in order to render a reasonable image on your display:

capture an image
: Use your camera to take a properly exposed image. Normally you can rely on the camera's metering and automatic exposure features. However, for some scenes you may need to use the camera's exposure compensation dial to get an optimal exposure. In general, you want to make the exposure in camera as bright as possible without clipping the highlights. This is known as "exposing to the right" (ETTR), and it ensures you take best advantage of the sensor's dynamic range. Many cameras have features like "zebras" or "blinkies" to warn you when you are in danger of clipping.

[exposure](../../module-reference/processing-modules/exposure.md)
: This module is enabled by default, and it will have an initial value of +0.5EV. The metering systems in cameras vary, and for some camera models you might want a bit more initial exposure (eg. +0.8EV ~ 1.5EV) -- you can create an auto-apply [preset](../../darkroom/interacting-with-modules/presets.md) as required. The exposure module will detect if the camera's exposure compensation dial was used (see above remarks about ETTR), and will re-adjust the exposure accordingly. 

: Use the exposure slider to adjust the midtones in the image to an appropriate brightness level. At this stage, don't worry about highlights and shadows -- this will be dealt with later. 

[white balance](../../module-reference/processing-modules/white-balance.md)
: It is important that the white balance is set correctly to form a solid basis for subsequent processing. The camera will normally propose some white balance setting inside the raw file's metadata, and darktable will use this as a starting point. To get a more accurate white balance, you can either use the color picker to select a neutral grey tone in the image, or you can use the white balance presets for your camera, where available. Fine adjustments to the global white balance are made using the _temperature_ slider and, less often, the _tint_ slider. Moving the _temperature_ slider to the left makes the image cooler (more blue), and moving it to the right makes it warmer (more orange).
: The [_color balance_](../../module-reference/processing-modules/color-balance.md) module, among other things, gives you even more control in cases where a scene was illuminated by multiple light sources at different color temperatures.

[filmic rgb](../../module-reference/processing-modules/filmic-rgb.md)
: The mid-grey tone level has already been set (above) with the _exposure_ module. Filmic will propose, on its _scene_ tab, a white point and black point for the image, but you may need to adjust these for a particular scene. On the _look_ tab you can adjust the midtone contrast and saturation settings if required.


# other recommended modules
In addition to the basic modules described above, you may want to consider using the following modules to make your image look even prettier:

[color balance](../../module-reference/processing-modules/color-balance.md)
: This is a versatile module that can be used to further adjust the contrast and saturation of an image, and can also be used to do color grading (e.g. emulate "orange and teal" grading used in hollywood films, remove redness in skin tones, adjust for uneven color balance in shadows/midtones/highlights, etc.). The [_color zones_](../../module-reference/processing-modules/color-zones.md) module can also be helpful in some cases where you are unable to achieve the desired effect using the _color balance_ module.

[tone equalizer](../../module-reference/processing-modules/tone-equalizer.md)
: Use this to bring back detail in the shadows and highlights. This module generates a mask to average out the luminance in different parts of the image, and the equalizer allows you to selectively increase and decrease luminance levels using that mask. It is recommended that you first check the mask is set up appropriately, then you can use the sliders or the spline curve to adjust the various brightness levels. You can also place the mouse cursor over different parts of the image to see the EV level of the mask at that point, and then use the mouse wheel to adjust the brightness of that EV level up and down accordingly.

[local contrast](../../module-reference/processing-modules/local-contrast.md)
: This module can emphasise the detail and clarity in an image, and is a good way to improve the general sharpness of an image. It is recommended to use this module in _local lapacian_ mode.
: A more vertatile but also more complex technique is to use the [_contrast equalizer_](../../module-reference/processing-modules/contrast-equalizer.md) module, which is very useful for making adjustments where a spatial dimension plays a role. It has a number of presets defined that may be helpful as a starting point in understanding this module.

[denoise (profiled)](../../module-reference/processing-modules/denoise-profiled.md)
: This module is normally your best option for reducing noise in an image. The simplest way is to use it in _non-local means auto_ mode to reduce noise in an image. You should use a 1:1 zoom on the image when doing denoising. The wavelet feature of this module is also quite effective against color noise. 

[haze removal](../../module-reference/processing-modules/haze-removal.md)
: Does what is says on the tin: Remove atmospheric haze.

[channel mixer](../../module-reference/processing-modules/channel-mixer.md)
: This module offers a range of presets for making black and white images. It can also be used to tweak your color profile matrices e.g. to deal with color gamut issues.

[lens correction](../../module-reference/processing-modules/lens-correction.md)
: If your camera/lens combination is supported, use this module to correct for standard lens distortions, if corrections have not already been performed in-camera. The [_perspective correction_](../../module-reference/processing-modules/perspective-correction.md) module can also be helpful for simulating the effects of a tilt-shift lens.

# non-recommended modules

There are a number of modules in darktable which are not really recommended for which a linear scene-referred workflow. This doesn't mean these modules can't be used, it's just that they can produce undesirable effects when their sliders are pushed too far, and there are better alternatives in a linear workflow.

[local tone mapping](../../module-reference/processing-modules/tone-mapping.md)
: _prefer [tone equalizer](../../module-reference/processing-modules/tone-equalizer.md) instead_
: This module applies a bileteral blur over a non-linear (log) mapping that can provoke halos and fringing. This is common issue for modules doing blurs and occlusions that operate over a non-linear encoding.

[global tonemap](../../module-reference/processing-modules/global-tonemap.md)
: _prefer [filmic rgb](../../module-reference/processing-modules/filmic-rgb.md) instead_
: This module tries to deal with HDR images using the Lab color space, but unfortunately the Lab encoding is not well suited for high dyanamic ranges. The _filmic rgb_ module operates in a linear space and can easily scale over a wide range of input values from the scene and fit them into the narrower dynamic range demanded by display and printing devices.

[shadows and highlights](../../module-reference/processing-modules/shadows-and-highlights.md)
: _prefer [tone equalizer](../../module-reference/processing-modules/tone-equalizer.md) instead_
: This module works with blurs in a Lab space, resulting problems here can include halos, high local contrast in highlights, hue shifts towards blue in shadows.

[lowpass](../../module-reference/processing-modules/lowpass.md)
: _prefer [contrast equalizer](../../module-reference/processing-modules/contrast-equalizer.md) or [tone equalizer](../../module-reference/processing-modules/tone-equalizer.md) instead_
: Another module doing blurs in Lab space. Use the _contrast equalizer_ for blurring, or use the _tone equalizer_ if local dynamic range compression is needed.

[highpass](../../module-reference/processing-modules/highpass.md)
: _prefer [contrast equalizer](../../module-reference/processing-modules/contrast-equalizer.md) or [local contrast](../../module-reference/processing-modules/local-contrast.md) instead_
: Subtracts out from the image a blur done in Lab space, so same problems as with the [_lowpass_](../../module-reference/processing-modules/lowpass.md) module. Use _contrast equalizer_ for fine sharpness, or _local contrast_ for general sharpness.

[sharpen](../../module-reference/processing-modules/sharpen.md)
: _prefer [contrast equalizer](../../module-reference/processing-modules/contrast-equalizer.md) or [local contrast](../../module-reference/processing-modules/local-contrast.md) instead_
: The USM algorithm used in the _sharpen_ module suffers from same issues as the _highpass_ module, and can easily cause artifacts; use the presets offered by _contrast equalizer_ for de-blurring, or _local contrast_ for general sharpness.

[monochrome](../../module-reference/processing-modules/monochrome.md)
: _prefer [channel mixer](../../module-reference/processing-modules/channel-mixer.md) (or [color balance](../../module-reference/processing-modules/color-balance.md)) instead_
: The _monochrome_ module can be quite fiddly; the _channel mixer_ presets better emulate what physically happens with film, or you can set the _output saturation_ slider in the _color balance_ module to 0% for a more perceptual approach.

[fill light](../../module-reference/processing-modules/fill-light.md)
: _prefer [tone equalizer](../../module-reference/processing-modules/tone-equalizer.md) (or [exposure](../../module-reference/processing-modules/exposure.md)) instead_
: For adding light to a scene, it uses blurs in Lab space. The _tone equalizer_ works in linear space, or you can also achieve this effect by using the _exposure_ module with a drawn mask.

[bloom](../../module-reference/processing-modules/bloom.md)
: _prefer [tone equalizer](../../module-reference/processing-modules/tone-equalizer.md) (or [exposure](../../module-reference/processing-modules/exposure.md)) instead_
: Blurs again in Lab space, either use _tone equalizer_ or _exposure_ module with a [parametric mask](../../darkroom/masking-and-blending/masks/parametric.md), both of which operate with linear encodings.

[zone system](../../module-reference/processing-modules/zone-system.md)
: _prefer [tone equalizer](../../module-reference/processing-modules/tone-equalizer.md) (or [exposure](../../module-reference/processing-modules/exposure.md)) instead_
: This module again operates in Lab space, and is problematic if you push it too far. Better to use _tone equalizer_ or use multiple instances of the _exposure_ module with parametric masks to narrow down on a zone.

[color correction](../../module-reference/processing-modules/color-correction.md)
: _prefer [color balance](../../module-reference/processing-modules/color-balance.md) instead_
: The _color balance_ module does its work in RGB and allows easy adjustment of white balance in shadows (_offset_), midtones (_power_) and highlights (_slope_). Note the _offset_, _power_ and _slope_ that we normally use in linear spaces roughly correspond to the _lift_, _gamma_ and _gain_ parameters used in non-linear gamma-encoded spaces.

[velvia](../../module-reference/processing-modules/velvia.md)
: _prefer [color balance](../../module-reference/processing-modules/color-balance.md) instead_
: The _output saturation_ slider of the _color balance_ module uses similar logic as the _velvia_ module, but without the hue and brightness shifts that can be difficult to manage.

[levels](../../module-reference/processing-modules/levels.md)/[rgb levels](../../module-reference/processing-modules/rgb-levels.md)
: _prefer [color balance](../../module-reference/processing-modules/color-balance.md) instead_
: These modules are basically implementing a subset of the _color balance_ module functions, which pretty much makes them redundant.

[tone curve](../../module-reference/processing-modules/tone-curve.md)/[rgb curve](../../module-reference/processing-modules/rgb-curve.md)
: _prefer [color balance](../../module-reference/processing-modules/color-balance.md) instead_
: These modules are normally used to adjust contrast. Their user interface assumes the mid-grey level is around 50%, but in linear scene-referred space mid-grey is much lower at around 18%. Better to adjust the contrast in _color balance_ module, where the mid-grey reference point can be set with the _contrast fulcrum_ slider.

[contrast brightness saturation](../../module-reference/processing-modules/contrast-brightness-saturation.md)
: _prefer [color balance](../../module-reference/processing-modules/color-balance.md) instead_
: Working in Lab space (with the limitations that implies) and basically duplicating functions already provided by _color balance_.

# modules to be used with care

Finally, there are some modules where there is not yet an alternative well suited to the scene-referred workflow. If they are required, they should be used sparingly and with care.

[vibrance](../../module-reference/processing-modules/vibrance.md)
: Tends to darken colors. Consider using using [_color zones_](../../module-reference/processing-modules/color-zones.md) with a saturation parametric mask to give more control.

[color zones](../../module-reference/processing-modules/color-zones.md)
: Transitions may not be graceful. An alternative can be to use [_color balance_](../../module-reference/processing-modules/color-balance.md) with parameteric mask.

[vignetting](../../module-reference/processing-modules/vignetting.md)
: This can look unnatural with too strong a fall-off. You may be better off using [_exposure_](../../module-reference/processing-modules/exposure.md) with an elliptical mask with large transition area, and perhaps adding [_color balance_](../../module-reference/processing-modules/color-balance.md) with the same mask to reduce saturation at the edges.

**Note:** When using [blend modes](../../darkroom/masking-and-blending/blend-modes.md) on any module, you should be aware that many of the blend modes are optimized for display-referred space. For the linear scene-referred space, stick with blend modes based on arithmetic operations (addition, multiplication, division, subtraction, average), on maximum/minimum comparisons (screen) or on channel separations (hue, color, chroma, etc.).

# other artistic effects

There are also a number of artistic effect modules available in darktable. To name just a few: 

- With the [_watermark_](../../module-reference/processing-modules/watermark.md) module you can add an individual watermark to your image. 
- The [_grain_](../../module-reference/processing-modules/grain.md) module simulates the typical noise of classical analogue photos. 
- Use the [_color mapping_](../../module-reference/processing-modules/color-mapping.md) module to transfer the look and feel of one color image onto another. 
- The [_lowlight vision_](../../module-reference/processing-modules/lowlight-vision.md) module allows to simulate human vision to make low light pictures look closer to reality. 
- The [_graduated density_](../../module-reference/processing-modules/graduated-density.md) filter adds a neutral or colored gradient to your image for exposure and color correction. 

We suggest you puruse the [module reference](../../module-reference/processing-modules/_index.md) section to see what else is available.

