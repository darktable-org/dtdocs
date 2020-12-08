---
title: filmic rgb
id: filmic-rgb
applicable-verison: 3.2.1
tags:
working-color-space: RGB
view: darkroom
masking: true
---
Remap the tonal range of an image by reproducing the tone and color response of classic film.  This module can be used either to expand or to contract the dynamic range of the scene into the dynamic range of the display.

This module protects colors and contrast in the mid-tones, recovers the shadows, and compresses bright highlights and dark shadows. Highlights will need extra care when details need to be preserved (e.g. clouds).

The module is derived from a module of the same name in Blender 3D modeller by T. J. Sobotka. While it is primarily intended to recover high-dynamic-range images from raw sensor data it can be used with any image in place of the [_base curve_](./base-curve.md) module. The developer has provided a detailed explanation of the module in a video: [filmic rgb: remap any dynamic range in darktable 3](https://www.youtube.com/watch?v=zbPj_TqTF880).

_filmic rgb_ is the successor to the _filmic_ module from darktable 2.6.x. While the underlying principles have not changed much, the default settings and their assumptions have, so users of the previous version should not expect a 1:1 translation of their workflow to the new version.

---

**Note**: Despite the technical look of this module, the best way to set it up is to assess the quality of the visual result. Do not overthink the numbers that are put in the GUI to quantify the strength of the effects.

---

# prerequisites

In order to get the best from this module, your images need some preparation:

capturing (ETTR)
: In-camera, it is recommended that you use a technique known as "Expose To The Right" (ETTR). This means exposing the shot so that the exposure is as bright as possible without clipping the highlights. It is called "exposing to the right" because the in-camera histogram should be touching all the way up to the right hand side without peaking at the right hand side (which could indicate clipping). This technique ensures you make maximum use of the dynamic range of your camera's sensor.

: The default auto-exposure metering mode in your camera will normally expose the image so that the average brightness in the image tends towards middle grey. Sometimes, for scenes dominated by light tones (e.g. snowy scenes), the camera will underexpose the image to bring those light tones more towards middle grey. For scenes dominated by dark tones, it may over-expose the image and end up clipping the highlights. In such cases you can use the exposure compensation dial in your camera to raise or lower the exposure -- the darktable exposure module can take this into account when processing your image.

: In some cases, such as for specular highlights reflecting off shiny objects, it may be acceptable to have some clipping, but be aware that any clipped data in your image is irrevocably lost. Where data has been clipped, _filmic rgb_ offers a "highlight reconstruction" feature to help mitigate the effects of the clipping and blend it smoothly with the rest of the image. The settings for this feature are on the _reconstruct_ tab. It is also helpful to know that some cameras offer a "highlight priority" exposure metering mode that can help to maximise exposure while protecting the highlights, and many offer features such as "zebras" or "blinkies" to help alert the photographer when parts of the image are being clipped.

adjust for the mid-tones
: In the [_exposure_](./exposure.md) module, adjust the exposure until the midtones are clear enough. Do not worry about losing the highlights when setting exposure - they will be recovered as part of the filmic processing. However, it is important to avoid negative pixels in black areas else the computations performed by _filmic rgb_ will result in unpredictable results. For some camera models (Canon, mainly), rawspeed (the raw decoding library of darktable) may set an exaggerated black level, resulting in crushed blacks and negative pixel values. If so, brighten the blacks by setting a negative black level correction value in the [_exposure_](./exposure.md) module.

white balance, denoise, demosaic
: If you plan on using _filmic rgb_'s auto-tuners, use the [_white balance_](./white-balance.md) module to first correct any color casts and obtain neutral colors. In RGB color spaces, luminance and chrominance are linked, and _filmic rgb_'s luminance detection relies on accurate measurements of both. If your image is very noisy, add an initial step of denoising to improve the black exposure readings, and use a high quality [_demosaicing_](./demosaic.md) method. You do not need to worry about noise if you are planning to set up filmic manually, without using the auto-tuners.

disable tone mapping modules
: If you plan to use one of _filmic rgb_'s chrominance preservation modes, avoid using [_base curve_](base-curve.md) and the various tone mapping modules. These may produce unpredictable color shifts that would make the chrominance preservation useless. None of these modules should be required when using _filmic rgb_.

# usage

The _filmic rgb_ module aims at mapping the dynamic range of the photographed scene (RAW image) to the dynamic range of the display.

This mapping is defined in three steps, each handled in a separate tab in the interface:

 - The _scene_ tab contains the “input” settings of the scene, defining what constitutes middle grey, white and black in the photographed scene.

 - The _reconstruct_ tab offers some tools to handle blown highlights in the image.

 - The _look_ tab contains the artistic intent of the mapping that is applied to the input parameters (defined in the scene tab). Notably, this part of the module applies an S-shaped parametric curve to enhance the contrast of the mid-tones and remap the grey value to the middle grey of the display. This is similar to what the [_base curve_](./base-curve.md) and [_tone curve_](./tone-curve.md) modules do. As a general guideline, you want to increase the latitude as much as possible without clipping the extremes of the curve.

 - The _display_ tab defines the output settings required to map the transformed image to the display. In typical use cases, the parameters in this tab will rarely require adjustment.

 - The _options_ tab includes some optional advanced settings and parameters.

 - _filmic rgb_ tends tends to compress local contrast, so after you have set up _filmic rgb_ you may want to compensate for this using the [_local contrast_](local-contrast.md) module. You may also want to increase the saturation in the [_color balance_](color-balance.md) module, and maybe further adjusts the tones using [_tone equalizer_](tone-equalizer.md).

The ranges of _filmic rgb_'s sliders are limited to usual and safe values, but you can enter values outside of these limits by right-clicking and entering values with the keyboard.

---

**Note**: _filmic rgb_ cannot be set with entirely neutral parameters (resulting in a "no-operation") -- as soon as the module is enabled, the image is always at least slightly affected. You can, however, come close to neutral with the following settings:

- in the _look_ tab, set contrast to 1.0, latitude to 99 % and middle tones saturation to 0 %,
- in the _options_ tab, set contrast in shadows and in highlights to _soft_.

In this configuration, filmic will only perform a logarithmic tone mapping between the bounds set in the _scene_ tab.

---

# graphic display

The graphic display of the _filmic rgb_ module now offers multiple views. You can cycle through the different views using the ![view-icon](./filmic-rgb/view-icon.png#icon) icon to the right of the graph display. You can also toggle the labels on the axes on and off using the ![legend-icon](./filmic-rgb/legend-icon.png#icon) icon. The available displays are:

look only
: This is the traditional graph provided by _filmic rgb_. The main bright curve shows how the dynamic range of scene (in EV) is compressed into the display-referred output range. The orange dot shows the middle grey point, the white dots either side mark out the latitude range, and the organge part of the curve at the bottom indicates an overshoot problem with the spline (the _look_ tab in the _module controls_ section has some controls to deal with this).  The darker curve shows how the color saturation is rolled off in the highlights and shadows extremes.

: ![filmic-rgb-look-only](./filmic-rgb/filmic-look-only.png#w50)

look + mapping (linear)
: This view shows the mapping of input values [0,1] to output values in linear space, including the dynamic range mapping and the output transfer function. Note that in a scene-referred workflow, input values are allowed to exceed 1, however the graph only shows in/out values in the interval [0,1] in order to make the shape of the graph comparable to other tone curve mapping tools such as _base curve_ or _tone curve_. The actual value of the scene white point is shown in brackets on the _X axis_ (expressed as a percentage of an input value of 1).

: ![filmic-rgb-look-mapping-lin](./filmic-rgb/filmic-look-mapping-lin.png#w50)

look + mapping (log)
: The same as the previous view, but plotted in log space.

: ![filmic-rgb-look-mapping-lin](./filmic-rgb/filmic-look-mapping-log.png#w50)

dynamic range mapping
: This view is inspired by the Ansel Adams Zone System, showing how the EV zones in the input scene are mapped to the output. Middle grey from the scene is always mapped to 18% in the output (linear) space, and it shows how the tonal ranges towards the extremes of the scene exposure range are compressed into a smaller number of zones in the display space, leaving more room for the mid-tones to be spread out over the remaining zones. The latitude range is represented by the darker grey portion in the middle.

: ![filmic-rgb-look-mapping-lin](./filmic-rgb/filmic-dynamic-range-map.png#w50)

# module controls

## scene

The controls of the _scene_ tab are similar in principle to those of the _levels_ module (black, grey, white). The difference is that _levels_ assume display-referred pixels values (between 0 and 100%), while _filmic_ allows you to work on scene-referred pixels (between -infinity EV and + infinity EV), which forces the use of a different interface.

middle-grey luminance (hidden by default)
: It is not recommended that you use this control, hence it is now hidden by default. You should instead use the _exposure_ module to set the mid-grey level (see _usage_, above). However, if you want to make this slider visible, enable the _use custom mid-grey values_ checkbox in the _options_ tab.

: This setting lets you decide what luminance in the scene should be considered the reference middle grey, which will be remapped to 18% in display. Use the color picker tool to read the average luminance over the drawn area. If you have a photograph of a grey card or a color chart (IT8 chart or colorchecker) shot in the scene lighting conditions, then the grey color picker tool can be used to quickly sample the luminance of the grey patch on that image. In other situations, the color picker can be used to sample the average luminance of the subject.

: It has an effect on the picture that is analogous to a brightness correction. Values close to 100% do not compress the highlights but fail to recover shadows. Values close to 0% greatly recover the shadows but compress the highlights more harshly and result in local-contrast losses.

: When modifying the middle-grey luminance, the white and black exposures are automatically adjusted accordingly, to prevent the dynamic range from clipping and to help you set the right parameter faster. If you are not happy with the auto adjustment performed by the grey slider, you can correct the white and black exposure parameters afterwards.

white relative exposure
: The number of stops (EV) between the scene middle grey luminance and the scene luminance that is to be remapped to display pure white (peak-white). This is the right bound of the scene dynamic range that will be represented on the display -- everything brighter than this value on the scene will be clipped on the display. The color picker tool reads the maximum luminance in RGB space over the drawn area, assumes it is pure white, and sets the white exposure parameter to remap the reading to 100% luminance.

black relative exposure
: The number of stops (EV) between middle grey luminance and the scene luminance that is to be remapped to display pure black (maximum density). This is the left bound of the scene dynamic range that wll be represented on the display -- everything darker than this value on the scene will be clipped on display. The color picker tool reads the minimum luminance in RGB space over the drawn area, assumes it is pure black, and sets the black exposure parameter to remap the minimum reading to 0% luminance. The black color picker measurement is very sensitive to noise, and cannot identify whether the minimum luminance is pure black (actual data) or just noise. It works better on low ISO pictures and with high quality demosaicing. When the color picker puts the black exposure at -16EV, it is a sign that the measurement has failed and you will need to adjust it manually.

: The black relative exposure allows you to choose how far you want to recover lowlights.

dynamic range scaling and auto-tune
: The auto-tune color picker combines all three color pickers above, and allows you to set the grey, white and black exposures all at once, using the average of the drawn region as the grey estimation, the maximum as the white, and the minimum as the black. This gives good results in landscape photography but usually fails for portraits and indoor scenes.

: When no true white and no true black are available on the scene, the maximum and minimum RGB values read on the image are not valid assumptions any more, so the dynamic range scaling symmetrically shrinks or enlarges the detected dynamic range and the current parameters. This works with all color pickers, and adjusts the current values of white and black relative exposures.

---

**Note**: There is no direct relationship between your camera sensor's dynamic range (to be found in DxoMark.com or PhotonsToPhotos.org measurements) and the dynamic range in filmic (scene white EV - scene black EV). Many things happen before _filmic_ in the pipeline, amongst them a black raw offset that could map black to 0, such that _filmic_ sees a theoretically infinite dynamic range at its input (which has to do only with pixel encoding manipulation in software, not actual sensor capabilities).

The _scene-referred_ workflow forces a black level correction of -0.0002, in the _exposure_ module, which ensures that the dynamic range seen by _filmic's_ input is around 12.3 EV most of the time. Decrease this value even more if setting the black relative exposure in _filmic_ to -16 EV fails to unclip blacks.

---

## reconstruct

This tab provides controls that will help to blend transisitons between unclipped and clipped areas within an image and can also help to reconstruct colors from adjacent pixels. It is designed to deal with spotlights that could not possibly be unclipped when taking the shot (such as naked light bulbs or the sun disc when they are in the frame) and aims at diffusing their edges as film would do. It is not designed to recover large areas of clipped pixels or in-paint missing parts of the image.

Firstly, a mask needs to be set up to identify the areas of the image that will be affected by the highlights reconstruction. Then there are some controls to fine-tune some of the tradeoffs made by the reconstruction algorithm.

### _highlights clipping_

These controls allow you to choose which areas of the image are impacted by the highlight reconstruction algorithms.

threshold
: Any pixels brighter than this threshold will be affected by the reconstruction algorithm. The units are in EV, and are relative to the white point set in the _scene_ tab. By default, this control is set to +3 EV, meaning that pixels need to be at least +3 EV brighter than the white point set in the scene tab in order for the highlight reconstruction to have any effect. In practise, this means that highlight reconstruction is effectively disabled by default (for performance reasons it should only be enabled when required). Therefore, to use the _filmic rgb_ _highlights reconstruction_ feature, first click the _display highlight reconstruction mask_ icon to show the mask, and lower this threshold until the highlight areas you want to reconstruct are selected in white by the mask. It may be useful to first review the image using the [raw overexposed warning](../utility-modules/darkroom/raw-overexposed.md) to show you which pixels in the raw file have been clipped, and whether those pixels are clipped on just one RGB channel or all of them.

transition
: Use this control to soften the transition between clipped and valid pixels. Moving this control to the right will increase the amount of blur in the mask, so that the transition between clipped and non-clipped areas is softer. This will allow for a smoother blending between the clipped and non-clipped regions. Moving this control to the left will reduce the blur in the mask, making the transition in the mask much sharper and therefore reducing the amount of feathering between clipped and non-clipped areas.

display highlight reconstruction mask
: Click on the icon to the right of this label to toggle the display of the highlight reconstruction mask. It is recommended that you turn this on while adjusting the above controls.

### _balance_

These controls allow you to balance the trade-offs between the various reconstruction algorithms.

structure/texture
: Use this to control whether the reconstruction algorithm should favor painting in a smooth color gradient (structure), or trying to reconstruct the texture using sharp details extracted from unclipped pixel data. By default, the control is in the middle at 0%, which favors both strategies equally. If you have lots of areas where all three channels are clipped, there is no texture detail available to reconstruct in those clipped areas, so it is better to move the slider to the left to favor color reconstruction. If you have lots of areas where only one or two channels are clipped, then there may be some texture detail in the unclipped channel(s), and moving the slider to the right will place more emphasis on trying to reconstruct texture using this unclipped data.

bloom/reconstruct
: Use this to control whether the algorithm tries to reconstruct sharp detail in the clipped areas, or whether it should apply a blur that approximates the blooming effect you get with traditional film. By default, this is set to 100% which tries to maximise the sharpness of the detail in the clipped areas. Move this slider to the left if you want to introduce more blur in these areas. Introducing more blur will usually tend to darken the highlights as a by-product, which may lead to a more colorful reconstruction.

grey/colorful details
: Use this to control whether the algorithm favors the recovery of monochromatic highlights or colorful highlights. Move the slider to the right if you want more color in the highlights. Move the slider to the left if you want to reduce the saturation of the highlights. It can be helpful to reduce the saturation in the highlights if you see start seeing magenta or out-of-gamut colors.

## look

When working on the _look_ tab, it is recommended that you monitor the S-curve spline on the _look only_ graph. This curve starts from the scene/display black levels at the bottom left of the graph, and should smoothly increase up to the scene/display white levels at the top right. Sometimes, if the constraints on the S-curve are too tight, the splines in the shadows and/or highlights regions can "overshoot" the limits of the display, and an orange warning is shown on those parts of the spline.

If you see the orange warning indicator at either end of the S-curve, corrective actions should be performed to bring the S-curve back to a smooth monotonically increasing curve. This may involve:

- reducing the latitude and/or contrast,

- adjusting the shadows/highlights slider to shift the latitude and allow more room for the spline,

- ensuring that the scene-referred black and white relative exposure sliders on the _scene_ tab have been properly set for the characteristics of the scene,

- setting one or both of the contrast settings on the _filmic rgb_ _options_ tab to _hard_.

If the _target black luminence_ setting on the _display_ tab is non-zero, this can also make it difficult for _filmic rgb_ to find a smooth monotonic spline, and reducing this can also help to relax the constraints. See the _display_ section to understand the implications of this.

contrast
: The _filmic rgb_ S-curve is created, from the user parameters, by computing the position of virtual nodes and interpolating them. This is similar to how the tone curve module operates, but here, the nodes cannot be moved manually. The curve is split into three parts -- a middle linear part, and two extremities that transition smoothly from the slope of the middle part to the ends of the exposure range.

: The contrast slider controls the slope of the middle part of the curve, as illustrated in the graph display. The larger the dynamic range is, the greater the contrast should be set to, in order preserve a natural-looking image. This parameter mostly affects mid-tones. Note here that global contrast has an impact on the acutance, which is the perceived sharpness. A low-contrast image will look unsharp even though it is optically sharp in the sense of the [MTF](https://en.wikipedia.org/wiki/Optical_transfer_function).

: Setting the contrast to 1 almost completely disables the S-curve, though there will be a very small residual effect from the splines in the highlights and shadows.

hardness (previously _target power factor function_)
: Previously the _target power factor function_ slider in older versions of _filmic rgb_, this slider is hidden by default, and is set automatically based on other values provided in the _scene_ tab. To make this slider visibile, you need to uncheck _auto adjust hardness_ in the _options_ tab.

: This parameter is the power function applied to the output transfer function, and it is often improperly called the _gamma_ (which can mean too many things in imaging applications, so we should stop using that term). It is used to raise or compress the mid-tones to account for display non-linearities or to avoid quantization artifacts when encoding in 8 bit file formats. This is a common operation when applying ICC color profiles (except for linear RGB spaces, like REC 709 or REC 2020, which have a linear “gamma” of 1.0). However, at the output of _filmic rgb_, the signal is logarithmically encoded, which is not something ICC color profiles know to handle. As a consequence, if we let them apply a gamma of 1/2.2 on top, it will result in a double-up, which would cause the middle-grey to be remapped to 76% instead of 45% as it should in display-referred space.

latitude
: The latitude is the range between the two nodes enclosing the central linear portion of the curve, expressed as a percentage of the dynamic range defined in the scene tab (white-relative-exposure minus black-relative-exposure). It is the luminance range that is remapped in priority, and it is remapped to the luminance interval defined by the contrast parameter. It is usually advisable to keep the latitude as large as possible, while avoiding clipping. If clipping is observed, you can compensate for this effect by either decreasing the latitude, shifting the latitude interval with the _shadow/highlights balance_ parameter, or decreasing the contrast.

: The latitude also defines the range of luminances that are not desaturated at the extremities of the luminance range (See _extreme luminance saturation_).

shadows/highlight balance
: By default, the latitude is centered in the middle of the dynamic range. If this produces clipping in one part of the other of the curve, the balance parameter allows you to slide the latitude along the slope, towards the shadows or towards the highlights. This allows more room to be given to one extremity of the dynamic range than to the other, if the properties of the image demand it.

middle tones saturation (previously _extreme luminance saturation_)
: At extreme luminances, the pixels will tend towards either white or black. Because neither white nor black have color associated with them, the saturation of these pixels must be 0%. In order to gracefullly transition towards this 0% point, pixels outside the midtone latitude range are progressively desaturated as they approach those extremes. The darker curve in the _filmic rgb_ graph indicates the amount of desaturation being applied to pixels falling outside the latitude range. Moving the slider to the right pushes the point where desaturation will start to be applied towards the extremes, resulting in a steeper desaturation curve (if pushed too far, this can result in fringing around the highlights). Moving the slider to the left brings the point at which color desaturation will start to be applied closer to the center, resulting in a gentler desaturation curve. If you would like to see more color saturation in the highlights, and you have checked that the white relative exposure in the _scene_ tab is not yet clipping those highlights, move the middle tones saturation slider to the right to increase the saturation.

: Please note that this desaturation strategy has changed compared to previous versions of _filmic rgb_ which provided a different slider control labelled _extreme luminance saturation_. You can revert to the previous desaturation behaviour by selecting "v3 (2019)" in the _color science_ setting on the _options_ tab.

## display

The parameters in this tab will only rarely require adjustment.

target black luminance
: The destination parameters set the target luminance values used to remap the tones through _filmic rgb_. The default parameters will work 99% of the time, the remaining 1% being when you output in linear RGB space (REC709, REC2020) for media handling log-encoded data. These settings should therefore be used with caution because darktable does not allow separate pipelines for display preview and file output.

: The target black luminance parameter sets the ground-level black of the target medium. By default it is set to the minimum non-zero value that can be encoded by the available number of bits in the ouput color space. Reducing it to zero means that some non-zero luminences will be mapped to 0 in the output, potentially losing some detail in the very darkest parts of the shadows. Increasing this slider will produce raised, faded blacks that can provide something of a "retro" look.

target middle-grey
: This is the middle-grey of the output medium that is used as a target for the _filmic rgb_ S curve central node. On gamma corrected media, the actual grey is computed with the gamma correction (middle-grey^(1/gamma)), so a middle-grey parameter of 18% with a gamma of 2.2 gives an actual middle-grey target of 45.87%.

target white luminance
: This parameter allows you to set the ceiling level white of the target medium. Set it lower than 100% if you want dampened, muted whites to achieve a retro look.

: To avoid double-ups and washed pictures, _filmic rgb_ applies a “gamma” compression reverting the output ICC gamma correction, so the middle-grey is correctly remapped at the end. To remove this compression, set the destination power factor to 1.0 and the middle-grey destination to 45%.

## options

color science
: This setting defaults to _v4 (2020)_ for new images, and defines the algorithms used by the _filmic rgb_ module (such as the extreme luminance desaturation strategy). To revert to the behaviour of previous versions of _filmic rgb_, set this parmaeter to _v3 (2019)_. If you have previously made edits to an image using older versions of _filmic rgb_, this will already be set to _v3 (2019)_ in order to provide backward compatibility for those edits.

preserve chrominance
: Define how the chrominance should be handled by _filmic rgb_ -- either not at all, or using one of the three provided norms.

: When applying the S-curve transformation independently on each color, the proportions of the colors are modified, which modifies the properties of the underlying spectrum, and ultimately the chrominance of the image. This is what happens if you choose "no" in the preserve chrominance parameter. This value may yield seemingly “better” results than the other values, but it may negatively impact later parts of the pipeline, when it comes to global saturation, for example.

: The other values of this parameter all work in a similar way. Instead of applying the S-curve to the channels R, G and B independently, _filmic rgb_ uses a norm (N), divides all the three components by that norm, and applies the S-curve to N. This way, the relationship between the channels is preserved.

: The different values of the preserve chrominance parameter indicate which norm is used (the value used for N):

: - _no_ means that the ratios between the RGB channels are not preserved. It will tend to saturate the shadows and desaturate the highlights. It can be helpful when there are out-of-gamut blues or reds.

: - _max RGB_ is the maximum value of the three channels R, G and B. This is the same behaviour as the previous version of the _filmic rgb_ module. It tends to darken the blues, especially skies, and to yield halos/fringes, especially if some channels are clipped. It can also flatten the local contrast somewhat.

: - _luminance Y_ is a linear combination of the three channels R, G and B. It tends to darken and increase local contrast in the reds, and tends not to behave so well with saturated and out-of-gamut blues.

: - _RGB power norm_ is the sum of the cubes of the three channels R, G, and B, divided by the sum of their squares - that is to say, (R³ + G³ + B³)/(R² + G² + B²). It is usally a good compromise between the max RGB and the luminance Y values.

: - _RGB euclidean norm_ has the property of being RGB-space-agnostic, so it will yeild the same results regardless which working color profile is used. It weighs more heavily on highlights than the power norm and gives more highlights desaturation, and is probably the closest to color film look.

: There is no "right" choice for the norm, and the appropriate choice depends strongly on the image to which it is applied - you should experiment and decide for yourself which setting gives the most pleasing result with the fewest artifacts.

contrast in highlights
: This control selects the desired curvature at the highlights end of the _filmic rgb_ spline curve. Selecting _hard_ (default) places a tighter constraint on the slope of the spline, which makes the curve sharper and hence introduces more tonal compression in the highlights. Selecting _soft_ loosens this constraint, resulting in a gentler curve with less tonal compression in the highlights.

contrast in shadows
: This control selects the desired curvature at the shadows end of the _filmic rgb_ spline curve. Selecting _hard_ (default) places a tighter constraint on the slope of the spline, which makes the curve sharper and hence introduces more tonal compression in the shadows. Selecting _soft_ loosens this constraint, resulting in a gentler curve with less tonal compression in the shadows.

use custom middle-grey values
: Enabling this setting makes the _middle-grey luminance_ slider visible on the _scene_ tab. With this new edition of _filmic rgb_, it is now recommended to use the _exposure_ module to set the middle-grey level, so this setting is disabled by default (and the _middle-grey luminance slider_ is hidden).

auto-adjust hardness
: By default, this setting is enabled, and _filmic rgb_ will automatically calculate the power function (aka "gamma") to be applied on the output transfer curve. If this setting is disabled, a _hardness_ slider will appear on the _look_ tab so that value can be manually set.

iterations of high-quality reconstruction
: Use this setting to increase the number of passes of the _filmic rgb_ highlight reconstruction algorithm. More iterations means more color propagation into clipped areas from pixels in the surrounding neighbourhood. This can produce more neutral highlights, but it also costs more in terms of processing power. It can be useful in difficult cases where there are magenta highlights due to channel clipping. 

: The default reconstruction works on separate RGB channels and has only one iteration applied, whereas the _high quality_ reconstruction uses a different algorithm that works on RGB ratios (which is a way of breaking down chromaticity from luminance) and can use several iterations to graduately propagate colors from neighbouring pixels in clipped areas. However, if too many iterations are used, the reconstruction can denegenerate, which will result in far colors being improperly inpainted into clipped objects (color bleeding), such as white clouds being inpainted with blue sky, or the sun disc shot through trees being inpainted with leaf green.

add noise in highlights
: This artificially introduces noise into the reconstructed  highlights to prevent them from looking too smooth compared to surrounding areas that may already contain noise. This can help to blend the reconstructed areas more naturally with the surrounding non-clipped areas.

type of noise
: This specifies the statistical distribution of the noise. It can be helpful to match the look of the artificially generated noise with the naturally occurring noise in the surrounding areas from the camera's sensor. The _poissonian_ noise is the closest to natural sensor noise but is less visually pleasing than _gaussian_, which is probably closer to film grain. Also note that most denoising modules will turn the sensor noise from poissonian to slightly gaussian, so you should pick the variant that blends better into the actual noise in your image.
