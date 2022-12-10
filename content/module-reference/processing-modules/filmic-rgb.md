---
title: filmic rgb
date: 2022-12-04T02:19:02+01:00
id: filmic-rgb
applicable-version: 4.0
tags:
working-color-space: RGB
view: darkroom
masking: true
include_toc: true
---
Remap the tonal range of an image by reproducing the tone and color response of classic film.

This module can be used either to expand or to contract the dynamic range of the scene to fit the dynamic range of the display. It protects colors and contrast in the mid-tones, recovers the shadows, and compresses bright highlights and dark shadows. Highlights will need extra care when details need to be preserved (e.g. clouds).

The module is derived from another module of the same name in [Blender 3D modeller](https://www.blender.org/) by T. J. Sobotka. While it is primarily intended to recover high-dynamic-range images from raw sensor data it can be used with any image. The following video (by the developer of this module) provides a useful introduction: [filmic rgb: remap any dynamic range in Ansel 3](https://www.youtube.com/watch?v=zbPj_TqTF880).

_filmic rgb_ is the successor to the _filmic_ module from Ansel 2.6. While the underlying principles have not changed much, the default settings and their assumptions have, so users of the previous version should not expect a 1:1 translation of their workflow to the new version.

---

**Note**: Despite the technical look of this module, the best way to set it up is to assess the quality of the visual result. Do not overthink the numbers that are presented in the GUI to quantify the strength of the effects.

---

## prerequisites

In order to get the best from this module, your images need some preparation:

capturing (ETTR)
: In-camera, it is recommended that you use a technique known as "Expose To The Right" (ETTR). This means exposing the shot so that the exposure is as bright as possible without clipping the highlights. It is called "exposing to the right" because the in-camera histogram should be touching all the way up to the right hand side without peaking at the right hand side (which could indicate clipping). This technique ensures you make maximum use of the dynamic range of your camera's sensor.

: The default auto-exposure metering mode in your camera will normally expose the image so that the average brightness in the image tends towards middle-gray. Sometimes, for scenes dominated by light tones, the camera will underexpose the image to bring those light tones more towards middle-gray. For scenes dominated by dark tones, it may over-expose the image and end up clipping the highlights. In such cases you can use the exposure compensation dial in your camera to raise or lower the exposure -- the Ansel exposure module can automatically take this into account when processing your image.

: In some cases (e.g. specular highlights reflecting off shiny objects) it may be acceptable to have some clipping, but be aware that any clipped data in your image is irrevocably lost. Where data has been clipped, _filmic rgb_ offers a "highlight reconstruction" feature to help mitigate the effects of the clipping and blend it smoothly with the rest of the image. The settings for this feature are on the [_reconstruct_](#reconstruct) tab. Some cameras also offer a "highlight priority" exposure metering mode that can help to maximise exposure while protecting the highlights, and many offer features such as "zebras" or "blinkies" in the live view to alert the photographer when parts of the image are being clipped.

adjust for the mid-tones
: In the [_exposure_](./exposure.md) module, adjust the exposure until the mid-tones are clear enough. Don't worry about losing the highlights at this point -- they will be recovered as part of the filmic processing. However, it is important to avoid negative pixels in black areas else the computations performed by _filmic rgb_ may produce unpredictable results. For some camera models (Canon, mainly), rawspeed (the raw decoding library of Ansel) may set an exaggerated black level, resulting in crushed blacks and negative pixel values. If so, brighten the blacks by setting a negative black level correction value in the [_exposure_](./exposure.md) module.

white balance, denoise, demosaic
: If you plan on using _filmic rgb_'s auto-tuners, use the [_white balance_](./white-balance.md) module to first correct any color casts and obtain neutral colors. In RGB color spaces, luminance and chrominance are linked, and _filmic rgb_'s luminance detection relies on accurate measurements of both. If your image is very noisy, add an initial step of denoising to improve the black exposure readings, and use a high quality [_demosaic_](./demosaic.md) algorithm. You don't need to worry about noise if you are planning to set up filmic manually, without using the auto-tuners.

## usage

The _filmic rgb_ module is designed to map the dynamic range of the photographed scene (RAW image) to the dynamic range of the display.

This mapping is defined in three steps, each handled in a separate tab in the interface:

 - The [_scene_](#scene) tab contains the “input” settings of the scene, defining what constitutes white and black in the photographed scene.

 - The [_reconstruct_](#reconstruct) tab offers tools to handle blown highlights.

 - The [_look_](#look) tab contains the artistic intent of the mapping that is applied to the input parameters (as defined in the scene tab). This part of the module applies an S-shaped parametric curve to enhance the contrast of the mid-tones and remap the gray value to the middle-gray of the display. As a general guideline, you should aim to increase the latitude as much as possible without clipping the extremes of the curve.

 - The [_display_](#display) tab defines the output settings required to map the transformed image to the display. In typical use cases, the parameters in this tab rarely require adjustment.

 - The [_options_](#options) tab includes some optional advanced settings and parameters.

_filmic rgb_ tends to compress local contrast, so after you have finished adjusting settings here, you may wish to compensate for this using the [_local contrast_](local-contrast.md) module. You may also want to increase the saturation in the [_color balance rgb_](color-balance-rgb.md) module, and perhaps to further adjust the tones using the [_tone equalizer_](tone-equalizer.md).

The ranges of _filmic rgb_'s sliders are limited to typical and safe values, but you can enter values outside of these limits by right-clicking and entering values with the keyboard.

---

**Note**: _filmic rgb_ cannot be set with entirely neutral parameters (resulting in a "no-operation") -- as soon as the module is enabled, the image is always at least slightly affected. You can, however, come close to neutral with the following settings:

- in the [_look_](#look) tab, set contrast to 1.0, latitude to 99 % and mid-tones saturation to 0 %,
- in the [_options_](#options) tab, set contrast in shadows and in highlights to _soft_.

In this configuration, filmic will only perform a logarithmic tone mapping between the bounds set in the [_scene_](#scene) tab.

---

## graphic display

The graphic display at the top of the _filmic rgb_ module offers multiple views to help you to understand its functionality. You can cycle through these views using the ![view-icon](./filmic-rgb/view-icon.png#icon) icon to the right of the graph display. You can also toggle the labels on the axes on and off using the ![legend-icon](./filmic-rgb/legend-icon.png#icon) icon.

The following views are available:

look only
: This is the default view. The main bright curve shows how the dynamic range of the scene (in EV) is compressed into the display-referred output range. The orange dot shows the middle-gray point, the white dots either side mark out the latitude range, and the orange part of the curve at the bottom and top indicates an overshoot problem with the spline (the [_look_](#look) tab has some controls to deal with this).

: ![filmic-rgb-look-only](./filmic-rgb/filmic-look-only.png#w50)

look + mapping (linear)
: This view shows the mapping of input values [0,1] to output values in linear space, including the dynamic range mapping and the output transfer function. Note that in a scene-referred workflow, input values are allowed to exceed 1, however the graph only shows in/out values in the interval [0,1] in order to make the shape of the graph comparable to other tone curve mapping tools such as _base curve_ or _tone curve_. The actual value of the scene white point is shown in brackets on the _X axis_ (expressed as a percentage of an input value of 1).

: ![filmic-rgb-look-mapping-lin](./filmic-rgb/filmic-look-mapping-lin.png#w50)

look + mapping (log)
: The same as the previous view, but plotted in log space.

: ![filmic-rgb-look-mapping-lin](./filmic-rgb/filmic-look-mapping-log.png#w50)

dynamic range mapping
: This view is inspired by the Ansel Adams Zone System, showing how the zones in the input scene (EV) are mapped to the output. Middle gray from the scene is always mapped to 18% in the output (linear) space, and the view shows how the tonal ranges towards the extremes of the scene exposure range are compressed into a smaller number of zones in the display space, leaving more room for the mid-tones to be spread out over the remaining zones. The latitude range is represented by the darker gray portion in the middle.

: ![filmic-rgb-look-mapping-lin](./filmic-rgb/filmic-dynamic-range-map.png#w50)

---

**Note:** When some parameters are too extreme, resulting in an unfeasible curve, _filmic rgb_ will sanitize them internally. Sanitizing is illustrated in two ways on the look views:

- A dot becoming red indicates that the linear part of the curve is pushed too far towards the top or the bottom. In the [_look_](#look) tab, reduce the _latitude_ or recenter the linear part using the _shadows ↔ highlights balance_ parameter.
- A dot becoming a half circle indicates that contrast is too low given the dynamic range of the image. Increase _contrast_ in the [_look_](#look) tab, or the _dynamic range_ in the [_scene_](#scene) tab.

---

## module controls

### scene

The controls in the _scene_ tab are similar in principle to those of the [_levels_](./levels.md) module (black, gray, white). The difference is that _levels_ assumes display-referred pixels values (between 0 and 100%), whereas _filmic_ allows you to work on scene-referred pixels (between --infinity EV and +infinity EV), which forces the use of a different interface.

middle-gray luminance (hidden by default)
: This setting allows you to decide what luminance in the scene should be considered the reference middle-gray (which will be remapped to 18% in display). Use the color picker tool to read the average luminance over the drawn area. If you have a photograph of a gray card or a color chart (IT8 chart or colorchecker) shot in the scene lighting conditions, then the gray color picker tool can be used to quickly sample the luminance of the gray patch on that image. In other situations, the color picker can be used to sample the average luminance of the subject.

: This has an effect on the picture that is analogous to a brightness correction. Values close to 100% do not compress the highlights but fail to recover shadows. Values close to 0% greatly recover the shadows but compress the highlights more harshly and result in local-contrast losses.

: When modifying the middle-gray luminance, the white and black exposures are automatically adjusted accordingly, to prevent the dynamic range from clipping and to help you set the right parameter faster. If you are not happy with the auto adjustment performed by the gray slider, you can correct the white and black exposure parameters afterwards.

---

**Note:** You are not advised to use this control to set middle-gray, hence it is now hidden by default. You should instead use the _exposure_ module to set the middle-gray level (see [_usage_](#usage), above). However, if you wish to make this slider visible, you can enable it with the _use custom mid-gray values_ checkbox in the [_options_](#options) tab.

---

white relative exposure
: The number of stops (EV) between the scene middle-gray luminance and the scene luminance to be remapped to display white (peak-white). This is the right bound of the scene dynamic range that will be represented on the display -- everything brighter than this value on the scene will be clipped (pure white) on the display. The color picker tool reads the maximum luminance in RGB space over the drawn area, assumes it is pure white, and sets the white exposure parameter to remap the maximum to 100% luminance.

black relative exposure
: The number of stops (EV) between the scene middle-gray luminance and the scene luminance to be remapped to display black (maximum density). This is the left bound of the scene dynamic range that wll be represented on the display -- everything darker than this value on the scene will be clipped (pure black) on the display. The color picker tool reads the minimum luminance in RGB space over the drawn area, assumes it is pure black, and sets the black exposure parameter to remap the minimum to 0% luminance. The black color picker measurement is very sensitive to noise, and cannot identify whether the minimum luminance is pure black (actual data) or just noise. It works better on low ISO pictures and with high quality demosaicing. When the color picker puts the black exposure at --16 EV, this is a sign that the measurement has failed and you will need to adjust it manually.

: The black relative exposure allows you to choose how far you want to recover lowlights.

dynamic range scaling and auto-tune
: The auto-tune color picker combines the above color pickers, and allows you to set the white and black exposures at the same time, using the maximum of the drawn region as the white and the minimum as the black. This gives good results in landscape photography but usually fails for portraits and indoor scenes.

: When no true white and black are available on the scene, the maximum and minimum RGB values read on the image are not valid assumptions any more. Dynamic range scaling symmetrically shrinks or enlarges the detected dynamic range and the current parameters. This works with both color pickers, and adjusts the current values of white and black relative exposures.

---

**Note**: There is no direct relationship between your camera sensor's dynamic range (to be found in DxoMark.com or PhotonsToPhotos.org measurements) and the dynamic range in filmic (scene white EV -- scene black EV). Many things happen before _filmic_ in the pipeline (for example a black raw offset that could map black to 0) such that _filmic_ sees a theoretically infinite dynamic range at its input. This has to do only with pixel encoding manipulation in software, not actual sensor capabilities.

The _scene-referred_ workflow forces a black level correction of --0.0002, in the _exposure_ module, which ensures that the dynamic range seen by _filmic's_ input is around 12.3 EV most of the time. Decrease this value even more if setting the black relative exposure in _filmic_ to --16 EV fails to unclip blacks.

---

### reconstruct

This tab provides controls that blend transitions between unclipped and clipped areas within an image and can also help to reconstruct colors from adjacent pixels. It is designed to handle spotlights that could not possibly be unclipped when taking the shot (such as naked light bulbs or the sun disc in the frame) and aims at diffusing their edges as film would do. It is not designed to recover large areas of clipped pixels or in-paint missing parts of the image.

It can sometimes be useful to disable the [_highlight reconstruction_](./highlight-reconstruction.md) module in order to provide additional data to the reconstruction algorithm (_highlight reconstruction_ clips highlight data by default). You should note that this can lead to magenta highlights, which will need to be handled with the _gray/colorful details_ slider.

Firstly, a mask needs to be set up to identify the parts of the image that will be affected by the highlights reconstruction. There are then some additional controls to fine-tune some of the trade-offs made by the reconstruction algorithm.

#### _highlights clipping_

These controls allow you to choose which areas of the image are impacted by the highlight reconstruction algorithms.

threshold
: Any pixels brighter than this threshold will be affected by the reconstruction algorithm. The units are in EV, relative to the white point set in the _scene_ tab. By default, this control is set to +3 EV, meaning that pixels need to be at least +3 EV brighter than the white point set in the [_scene tab_](#scene) in order for the highlight reconstruction to have any effect. In practise, this means that highlight reconstruction is effectively disabled by default (for performance reasons -- it should only be enabled when required). Therefore, to use the _highlights reconstruction_ feature, first click the _display highlight reconstruction mask_ icon to show the mask, and lower this threshold until the highlight areas you want to reconstruct are selected in white by the mask. It may be useful to first review the image using the [raw overexposed warning](../utility-modules/darkroom/raw-overexposed.md) to show you which pixels in the raw file have been clipped, and whether those pixels are clipped on just one RGB channel or all of them.

transition
: Use this control to soften the transition between clipped and valid pixels. Moving this control to the right will increase the amount of blur in the mask, so that the transition between clipped and non-clipped areas is softer. This allows for a smoother blending between the clipped and non-clipped regions. Moving this control to the left will reduce the blur in the mask, making the transition in the mask much sharper and therefore reducing the amount of feathering between clipped and non-clipped areas.

display highlight reconstruction mask
: Click on the icon to the right of this label to toggle the display of the highlight reconstruction mask. It is recommended that you turn this on while adjusting the above controls.

#### _balance_

These controls allow you to balance the trade-offs between the various reconstruction algorithms.

structure ↔ texture
: Use this to control whether the reconstruction algorithm should favor painting in a smooth color gradient (structure), or trying to reconstruct the texture using sharp details extracted from unclipped pixel data (texture). By default, the control is in the middle at 0%, which favors both strategies equally. If you have lots of areas where all three channels are clipped, there is no texture detail available to reconstruct, so it is better to move the slider to the left to favor color reconstruction. If you have lots of areas where only one or two channels are clipped, then there may be some texture detail in the unclipped channel(s), and moving the slider to the right will place more emphasis on trying to reconstruct texture using this unclipped data.

bloom ↔ reconstruct
: Use this to control whether the algorithm tries to reconstruct sharp detail in the clipped areas (reconstruct), or apply a blur that approximates the blooming effect you get with traditional film (bloom). By default, this is set to 100%, which tries to maximise the sharpness of the detail in the clipped areas. Move this slider to the left if you want to introduce more blur in these areas. Introducing more blur will usually tend to darken the highlights as a by-product, which may lead to a more colorful reconstruction.

gray ↔ colorful details
: Use this to control whether the algorithm favors the recovery of monochromatic highlights (gray) or colorful details. Move the slider to the right if you want more color in the highlights. Move the slider to the left if you want to reduce the saturation of the highlights. It can be helpful to reduce the saturation in the highlights if you start seeing magenta or out-of-gamut colors.

### look

When working on the _look_ tab, it is recommended that you monitor the S-curve spline on the _look only_ graph. This curve starts from the scene/display black levels at the bottom left of the graph, and should smoothly increase up to the scene/display white levels at the top right. Sometimes, if the constraints on the S-curve are too tight, the splines in the shadows and/or highlights regions can "overshoot" the limits of the display, and an orange warning is shown on those parts of the spline.

If you see the orange warning indicator at either end of the S-curve, corrective actions should be performed to bring the S-curve back to a smooth monotonically increasing curve. This may involve:

- reducing the latitude and/or contrast,

- adjusting the shadows/highlights slider to shift the latitude and allow more room for the spline,

- ensuring that the scene-referred black and white relative exposure sliders on the _scene_ tab have been properly set for the characteristics of the scene,

- setting one or both of the contrast settings on the [_options_](#options) tab to _safe_ or _hard_.

If the _target black luminance_ setting on the [_display_](#display) tab is non-zero, this can also make it difficult for _filmic rgb_ to find a smooth monotonic spline, and reducing this can also help to relax the constraints. See the [_display_](#display) section to understand the implications of this.

contrast
: The _filmic_ S-curve is created by computing the position of virtual nodes from the module parameters and interpolating them. This is similar to how the tone curve module operates, but here, the nodes cannot be moved manually. The curve is split into three parts -- a middle linear part, and two extremities that transition smoothly from the slope of the middle part to the ends of the exposure range.

: The contrast slider controls the slope of the middle part of the curve, as illustrated in the graph display. The larger the dynamic range, the greater the contrast should be set to, in order preserve a natural-looking image. This parameter mostly affects the mid-tones. Note that global contrast has an impact on the acutance (perceived sharpness) -- a low-contrast image will look unsharp even though it is optically sharp in the sense of the [Optical Transfer Function (OTF)](https://en.wikipedia.org/wiki/Optical_transfer_function).

: Setting the contrast to 1 almost completely disables the S-curve, though there will be a very small residual effect from the splines in the highlights and shadows.

hardness (previously _target power factor function_)
: Known as the _target power factor function_ slider in older versions of _filmic rgb_, this slider is hidden by default, and is adjusted automatically based on values in the [_scene_](#scene) tab. To make this slider visibile, you need to uncheck _auto adjust hardness_ in the [_options_](#options) tab.

: This parameter is the power function applied to the output transfer function, and it is often improperly called the _gamma_ (which can mean too many things in imaging applications, so we should stop using that term). It is used to raise or compress the mid-tones to account for display non-linearities or to avoid quantization artifacts when encoding in 8 bit file formats. This is a common operation when applying ICC color profiles (except for linear RGB spaces, like REC 709 or REC 2020, which have a linear “gamma” of 1.0). However, at the output of _filmic rgb_, the signal is logarithmically encoded, which is not something ICC color profiles know to handle. As a consequence, if we let them apply a gamma of 1/2.2 on top, it will result in a double-up, which would cause the middle-gray to be remapped to 76% instead of 45% as it should in display-referred space.

latitude
: The latitude is the range between the two nodes enclosing the central linear portion of the curve, expressed as a percentage of the dynamic range defined in the [_scene_](#scene) tab (white relative exposure minus black relative exposure). It is the luminance range that is remapped in priority, and it is remapped to the luminance interval defined by the contrast parameter. It is usually advisable to keep the latitude as large as possible, while avoiding clipping. If clipping is observed, you can compensate by either decreasing the latitude, shifting the latitude interval with the _shadow ↔ highlights balance_ parameter, or decreasing the contrast.

: The latitude also defines the range of luminances that are not desaturated at the extremities of the luminance range (See _mid-tones saturation_).

shadows ↔ highlights balance
: By default, the latitude is centered in the middle of the dynamic range. If this produces clipping at one end of the curve, the balance parameter allows you to slide the latitude along the slope, towards the shadows or towards the highlights. This allows more room to be given to one extremity of the dynamic range than to the other, if the properties of the image demand it.

mid-tones saturation / extreme luminance saturation
: At extreme luminances, the pixels will tend towards either white or black. Because neither white nor black have color associated with them, the saturation of these pixels must be 0%. In order to gracefully transition towards this 0% saturation point, pixels outside the mid-tone latitude range are progressively desaturated as they approach the extremes. The darker curve in the _filmic rgb_ graph indicates the amount of desaturation that is applied to pixels outside the latitude range. Moving the slider to the right pushes the point where desaturation will start to be applied towards the extremes, resulting in a steeper desaturation curve. If pushed too far, this can result in fringing around the highlights. Moving the slider to the left brings the point at which color desaturation will start to be applied closer to the center, resulting in a gentler desaturation curve. If you would like to see more color saturation in the highlights, and you have checked that the white relative exposure in the [_scene_](#scene) tab is not yet clipping those highlights, move the mid-tones saturation slider to the right to increase the saturation.

: Please note that this desaturation strategy has changed compared to previous versions of _filmic rgb_ (which provided a different slider control labelled _extreme luminance saturation_). You can revert to the previous desaturation behaviour by selecting "v3 (2019)" in the _color science_ setting on the [_options_](#options) tab.

: This control is set to 0 by default and it is now recommended that saturation is handled earlier in the pipeline. A preset "add basic colorfulness" has been added to the [_color balance rgb_](./color-balance-rgb.md) module for this purpose.

### display

The parameters in this tab should rarely require adjustment.

target black luminance
: The destination parameters set the target luminance values used to remap the tones. The default parameters should work 99% of the time, the remaining 1% being when you output in linear RGB space (REC709, REC2020) for media handling log-encoded data. These settings should therefore be used with caution because Ansel does not allow separate pipelines for display preview and file output.

: The target black luminance parameter sets the ground-level black of the target medium. By default it is set to the minimum non-zero value that can be encoded by the available number of bits in the output color space. Reducing it to zero means that some non-zero luminances will be mapped to 0 in the output, potentially losing some detail in the very darkest parts of the shadows. Increasing this slider will produce raised, faded blacks that can provide something of a "retro" look.

target middle-gray
: This is the middle-gray of the output medium that is used as a target for the S-curve's central node. On gamma-corrected media, the actual gray is computed with the gamma correction (middle-gray^(1/gamma)), so a middle-gray parameter of 18% with a gamma of 2.2 gives an actual middle-gray target of 45.87%.

target white luminance
: This parameter allows you to set the ceiling level white of the target medium. Set it lower than 100% if you want dampened, muted whites to achieve a retro look.

: To avoid double-ups and washed-out images, _filmic rgb_ applies a “gamma” compression reverting the output ICC gamma correction, so the middle-gray is correctly remapped at the end. To remove this compression, set the destination power factor to 1.0 and the middle-gray destination to 45%.

### options

color science
: This setting defaults to _v6 (2022)_ for new images, and defines the algorithms used by the _filmic rgb_ module (e.g. the extreme luminance desaturation strategy). To revert to the behavior of previous versions of _filmic rgb_, set this parameter to _v3 (2019)_, _v4 (2020)_ or _v5 (2021)_. The difference between these methods lies in the way in which they handle desaturation close to pure black and pure white (see the [background](#background) section for details). If you have previously edited an image using older versions of _filmic rgb_, the color science setting will be kept at the earlier version number in order to provide backward compatibility for those edits.

preserve chrominance
: Define how the chrominance should be handled by _filmic rgb_ -- either not at all, or using one of the three provided norms.

: When applying the S-curve transformation independently on each color, the proportions of the colors are modified, which modifies the properties of the underlying spectrum, and ultimately the chrominance of the image. This is what happens if you choose "no" in the preserve chrominance parameter. This value may yield seemingly “better” results than the other values, but it may negatively impact later parts of the pipeline, for example, when it comes to global saturation.

: The other values of this parameter all work in a similar way. Instead of applying the S-curve to the R, G and B channels independently, _filmic rgb_, divides all the three components by a norm (N), and applies the S-curve to N. This way, the relationship between the channels is preserved.

: The value of the preserve chrominance parameter indicates which norm is used (the value used for N):

: - _no_ means that the ratios between the RGB channels are not preserved. This will tend to saturate the shadows and desaturate the highlights, and can be helpful when there are out-of-gamut blues or reds.

: - _max RGB_ is the maximum value of the R, G and B channels. This is the same behaviour as the original version of the _filmic rgb_ module. It tends to darken the blues, especially skies, and to yield halos or fringes, especially if some channels are clipped. It can also flatten the local contrast somewhat.

: - _luminance Y_ is a linear combination of the R, G and B channels. It tends to darken and increase local contrast in the reds, and tends not to behave so well with saturated and out-of-gamut blues.

: - _RGB power norm_ is the sum of the cubes of the R, G, and B channels, divided by the sum of their squares (R³ + G³ + B³)/(R² + G² + B²). It is usally a good compromise between the max RGB and the luminance Y values.

: - _RGB euclidean norm_ has the property of being RGB-space-agnostic, so it will yeild the same results regardless of which working color profile is used. It weighs more heavily on highlights than the power norm and gives more highlights desaturation, and is probably the closest to a color film look.

: There is no "right" choice for the norm, and the appropriate choice depends strongly on the image to which it is applied. You are advised to experiment and decide for yourself which setting gives the most pleasing result with the fewest artifacts.

contrast in highlights
: This control selects the desired curvature at the highlights end of the _filmic rgb_ spline curve. The default setting (_safe_) is guaranteed not to over- or under-shoot but has quite muted contrast near white. Selecting _hard_ places a tighter constraint on the slope of the spline, which makes the curve sharper and hence introduces more tonal compression in the highlights. Selecting _soft_ loosens this constraint, resulting in a gentler curve with less tonal compression in the highlights.

contrast in shadows
: This control selects the desired curvature at the shadows end of the _filmic rgb_ spline curve. The default setting (_safe_) is guaranteed not to over- or under-shoot but has quite muted contrast near black. Selecting _hard_ places a tighter constraint on the slope of the spline, which makes the curve sharper and hence introduces more tonal compression in the shadows. Selecting _soft_ loosens this constraint, resulting in a gentler curve with less tonal compression in the shadows.

use custom middle-gray values
: Enabling this setting makes the _middle-gray luminance_ slider visible on the [_scene_](#scene) tab. With the current version of _filmic rgb_, you are advised to use the _exposure_ module to set the middle-gray level, so this setting is disabled by default (and the _middle-gray luminance slider_ is hidden).

auto-adjust hardness
: By default, this setting is enabled, and _filmic rgb_ will automatically calculate the power function (aka "gamma") to be applied on the output transfer curve. If this setting is disabled, a _hardness_ slider will appear on the [_look_](#look) tab so that value can be manually set.

iterations of high-quality reconstruction
: Use this setting to increase the number of passes of the highlight reconstruction algorithm. More iterations means more color propagation into clipped areas from pixels in the surrounding neighbourhood. This can produce more neutral highlights, but it also costs more in terms of processing power. It can be useful in difficult cases where there are magenta highlights due to channel clipping.

: The default reconstruction works on separate RGB channels and has only one iteration applied, whereas the _high quality_ reconstruction uses a different algorithm that works on RGB ratios (which is a way of breaking down chromaticity from luminance) and can use several iterations to graduately propagate colors from neighbouring pixels into clipped areas. However, if too many iterations are used, the reconstruction can denegenerate, which will result in far colors being improperly inpainted into clipped objects (color bleeding) -- for example white clouds being inpainted with blue sky, or the sun disc shot through trees being inpainted with leaf-green.

add noise in highlights
: This artificially introduces noise into the reconstructed  highlights to prevent them from looking too smooth compared to surrounding areas that may already contain noise. This can help to blend the reconstructed areas more naturally with the surrounding non-clipped areas.

type of noise
: This specifies the statistical distribution of the added noise. It can be helpful to match the look of the artificially generated noise with the naturally occurring noise in the surrounding areas from the camera's sensor. The _poissonian_ noise is the closest to natural sensor noise but is less visually pleasing than _gaussian_, which is probably closer to film grain. Also note that most denoising modules will turn the sensor noise from poissonian to slightly gaussian, so you should pick the variant that blends better into the actual noise in your image.

### background

The _color science_ parameter (in the _options_ tab) defines the strategy that is used to desaturate colors near pure white (maximum display emission) and pure black (minimum display emission). The problem can be explained with the graph below, which represents the gamut of the sRGB color space at the constant hue of its green primary, with varying lightness (vertical axis) and chroma (horizontal axis):

![Gamut cone](./filmic-rgb/sRGB-green.png)

As we approach pure black and pure white, the chroma available in gamut shrinks considerably until it reaches zero for lightness = 0 and lightness = 100% of the medium emission. This means that very bright (or very dark) colors cannot be very saturated at the same time if we want them to fit in gamut, with the gamut being imposed by the printing or displaying device we use.

If colors are left unmanaged and are allowed to escape gamut, they will be clipped to valid values at the time of conversion to display color space. The problem is that this clipping is generally not hue-preserving and definitely not luminance-preserving, so highlights will typically shift to yellow and appear darker than they should, when evaluated against their neighborhood.

To overcome this, filmic has used various strategies over the years (the so-called _color sciences_) to desaturate extreme luminances, forcing a zero saturation at minimum and maximum lightness and a smooth desaturation gradient. These strategies were all intended to minimize the hue shifts that come with gamut clipping.

Since all of these strategies were approximations (and often over-conservative ones) _v6 (2022)_ introduces a more accurate and measured approach. It performs a test-conversion to display color space, checks if the resulting color fits within the [0; 100]% range, and if it doesn't, computes the maximum saturation available in gamut at this luminance and hue, finally clipping the color to this value. This ensures a minimal color distortion, allowing for more saturated colors and better use of the available gamut, but also enforces a constant hue throughout the whole tone mapping **and** gamut mapping operation.

This gamut mapping uses the output color profile as a definition of the display color space and automatically adjusts to any output space. However, only _matrix_ or _matrix + curve(s)_ ICC profiles are supported. _LUT_ ICC profiles are not supported and, if used, will make the gamut mapping default to the pipeline working space (Rec 2020 by default).

Note that the hue used as a reference for the gamut mapping is the hue before any tone mapping, sampled at the input of filmic. This means that even the _none_ chrominance preservation mode (applied on individual RGB channels regardless of their ratios) preserves hue in _v6_. This mode will only desaturate highlights more than the other modes, and a mechanism is in place to prevent it from resaturating shadows -- this behaviour can be bypassed by increasing the _extreme luminance saturation_ setting.

### caveats

#### color artifacts

As filmic v6 is so far the best version to retain saturated colors at constant hue, it gets also much less forgiving to __invalid__ colors like chromatic aberrations and clipped magenta highlights, that are much better hidden (albeit __not solved__) by simple curves applied on individual channels (no chrominance preservation) with no care given to their ratios.

It is not the purpose of a tone mapping and gamut mapping operators to reconstruct damaged signals, and these flaws need to be corrected earlier in the pipeline with the specialized modules provided. However, there is a mechanism in filmic v6 that ensures that any color brighter than the _white relative exposure_ degrades to pure white, so a quick workaround is to simply set the _white relative exposure_ to a value slightly lower than the exposure of the clipped parts. In other words: if it is clipped at the input, let it be clipped at the output. Chrominance preservation options that work the best for this purpose are the _luminance_ and _euclidean_ norms, or simply _none_.

#### inconsistent output

With filmic v6, if you export the same image to sRGB and Adobe RGB color spaces, and then compare both images side by side on a large-gamut screen (that can cover Adobe RGB), the sRGB export _should_ have more desaturated highlights than the Adobe RGB version. Since the sRGB color space is shorter than Adobe RGB, its gamut boundary is closer to the neutral grey axis, and therefore the maximum allowed chroma is lower for any given luminance. This is by no means a bug but rather is proof that the gamut mapping is actually doing its job.
