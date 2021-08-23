---
title: "non-recommended modules"
id: non-recommended-modules
draft: false
weight: 85
author: "people"
---

Since darktable has transitioned to a [_linear scene-referred color pipeline_](./color-pipeline.md) processing model, many of the legacy modules are no longer recommended. In some cases, there is not a good alternative, and so certain legacy modules may still be needed, although they should be used sparingly. The following sections describe modules to be used with case, and modules that should be avoided in favor of more modern reliable alternatives.

# modules to be used with care

There are some modules for which there is not yet an alternative that is well-suited to the scene-referred workflow. If required, these modules should be used sparingly and with care.

[_color zones_](../../module-reference/processing-modules/color-zones.md)
: Transitions may not be graceful. An alternative can be to use [_color balance_](../../module-reference/processing-modules/color-balance.md) with a parameteric mask.

[_vignetting_](../../module-reference/processing-modules/vignetting.md)
: This module can produce unnatural-looking results with too strong a fall-off. You may be better off using the [_exposure_](../../module-reference/processing-modules/exposure.md) module with an elliptical mask with large transition area, and perhaps adding [_color balance_](../../module-reference/processing-modules/color-balance.md) with the same mask to reduce saturation at the edges.

---

**Note:** When using [blend modes](../../darkroom/masking-and-blending/blend-modes.md) on any module, you should be aware that many of the blend modes are optimized for display-referred space and assume a mid-gray value of 50%. For the linear scene-referred space, stick with blend modes based on arithmetic operations (addition, multiplication, division, subtraction, average), on maximum/minimum comparisons (screen) or on channel separations (hue, color, chroma, etc.).

---

# modules to avoid

There are a number of modules that are no longer recommended for use within a scene-referred workflow. This doesn't mean they can't be used, but they can produce undesirable effects when their sliders are pushed too far, and there are better alternatives. In each case, the preferred alternative module is listed along with a brief explanation.

[_local tone mapping (deprecated)_](../../module-reference/processing-modules/tone-mapping.md)
: _prefer [tone equalizer](../../module-reference/processing-modules/tone-equalizer.md)_

: This module applies a bilateral blur over a non-linear (log) mapping that can provoke halos and fringing. This is common issue for modules performing blurs and occlusions that operate over a non-linear encoding.

[_global tonemap (deprecated)_](../../module-reference/processing-modules/global-tonemap.md)
: _prefer [filmic rgb](../../module-reference/processing-modules/filmic-rgb.md)_

: This module tries to deal with HDR images using the Lab color space, which is not well suited for high dynamic ranges. The _filmic rgb_ module operates in a linear space and can easily scale over a wide range of input values from the scene and fit them into the narrower dynamic range demanded by display and printing devices.

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

: Prefer the _color balance_ module, which works in RGB color space and allows easy adjustment of the white balance in shadows (_offset_), mid-tones (_power_) and highlights (_slope_). Note the _offset_, _power_ and _slope_ that we normally use in linear spaces roughly correspond to the _lift_, _gamma_ and _gain_ parameters used in non-linear gamma-encoded spaces.

[_velvia_](../../module-reference/processing-modules/velvia.md)
: _prefer [color balance rgb](../../module-reference/processing-modules/color-balance-rgb.md)_

: The _output saturation_ slider of the _color balance_ module uses similar logic as the _velvia_ module, but without the hue and brightness shifts, which can be difficult to manage.

[_vibrance_](../../module-reference/processing-modules/vibrance.md)
: Tends to darken colors. Prefer [_color balance rgb_](../../module-reference/processing-modules/color-balance-rgb.md).

[_levels_](../../module-reference/processing-modules/levels.md)/[rgb levels](../../module-reference/processing-modules/rgb-levels.md)
: _prefer [color balance](../../module-reference/processing-modules/color-balance.md)_

: These modules basically implement a subset of the functions of the _color balance_ module, which pretty much makes them redundant.

[_tone curve_](../../module-reference/processing-modules/tone-curve.md)/[rgb curve](../../module-reference/processing-modules/rgb-curve.md)
: _prefer [color balance](../../module-reference/processing-modules/color-balance.md)_

: These modules are normally used to adjust contrast. Their user interface assumes the mid-gray level is around 50%, but in linear scene-referred space mid-gray is much lower at around 18%. It is better to adjust the contrast in _color balance_ module, where the mid-gray reference point can be set with the _contrast fulcrum_ slider.

[_contrast brightness saturation_](../../module-reference/processing-modules/contrast-brightness-saturation.md)
: _prefer [color balance](../../module-reference/processing-modules/color-balance.md)_

: This module works in Lab color space (with the limitations that implies) and basically duplicates functions already provided by _color balance_.
