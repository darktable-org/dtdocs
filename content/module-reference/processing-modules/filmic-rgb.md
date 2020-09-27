---
title: filmic rgb
id: filmic-rgb
applicable-verison: 3.0
tags: 
working-color-space: RGB
view: darkroom
masking: true
---
Compress the tonal range of an image by reproducing the tone and color response of classic film. 

This module protects the colors and the contrast in mid-tones, recovers the shadows, and compresses bright highlights. It is particularly suited for portrait photography, especially in back-lighting situations, but needs extra care when details need to be preserved in highlights (e.g. clouds).

![filmic-rgb-zones](filmic-rgb-zones.png)

The module is derived from the same named module in Blender 3D modeller by T. J. Sobotka. While it is primarily intended to recover high-dynamic range from raw sensor data, it can be used with any image place of the base curve module. The developer has provided a detailed explanation of the module in a video ([Filmic RGB: remap any dynamic range in darktable 3](https://www.youtube.com/watch?v=zbPj_TqTF880)).

Filmic rgb is the successor of the _filmic_ module provided in darktable 2.6.x. While the underlying principles have not changed much, users of the previous version should not expect a 1:1 translation of their workflow.

# prerequisites

In order to get the best from this module, your images need some preparation:

- In-camera, expose the shot “to the right” - i.e. under-expose the shot so that the highlights are at the right of the histogram, just on the verge of clipping, but not clipped. It does not matter if the preview image is very dark on your camera screen. As long as highlights are unclipped, filmic rgb should be able to recover details from the raw data. Beware that clipped data is not recoverable. Some cameras have a clipping alert preview to help you diagnose this, and some even have an highlight-priority exposure mode.

- In the [_exposure_](./exposure.md) module, push the exposure until the midtones are clear enough. Do not worry about losing the highlights - they will be recovered as part of filmic rgb processing. However, it is important to avoid negative pixels in black areas else the computations performed by filmic rgb will result in unpredictable results. For some camera models (Canon, mainly), rawspeed (the raw decoding library of darktable), may set an exaggerated black level, resulting in crushed blacks and negative values. If so, brighten the blacks by setting a negative black level value in the [_exposure_](./exposure.md) module.

- If you plan on using filmic rgb's auto-tuners, use the white balance module first to correct any color casts and obtain neutral colors. In RGB color spaces, luminance and chrominance are linked, and filmic rgb's luminance detection relies on accurate measurements of both. If your image is very noisy, add an initial step of denoising to improve the black exposure readings, and use a high quality demosaicing method.

- If you plan to use one of filmic rgb's chrominance preservation modes, avoid using [_base curve_](base-curve.md) and the various tone mapping modules. These may produce unpredictable color shifts that would make the chrominance preservation useless. None of these modules should be required when using filmic rgb.

# usage

The filmic rgb module aims at mapping dynamic range of the photographed scene (RAW image) to the (smaller) dynamic range of the display. 

This mapping is defined in three steps, each handled in a separate tab in the interface:

 - The _scene_ tab contains the “input” settings of the scene: what constitutes middle grey, white and black in the photographed scene.

 - The _look_ tab contains the parameters of the mapping applied to the input parameters defined in the scene tab. Notably, this part of the module applies an S-shaped parametric curve to enhance the contrast and remap the grey value to the middle grey of the display. 

   This is similar to what the base curve or tone curve modules do.

 - The _display_ tab defines the output settings to map the transformed image to the display. In typical use cases, the parameters in this tab will rarely require adjustment.

The ranges of filmic rgb's sliders are limited to usual and safe values, but you can enter values outside of these limits by right-clicking and entering values with the keyboard. 

The curves at the top of the module are read-only and serve as a guide to the operations being performed on the sliders. The bright curve is the tone mapping curve, where the abscissa represents the scene exposure, and the ordinate represents the display exposure. The dark curve is the desaturation curve, representing the percentage of saturation as a function of the scene exposure.

_Note: Filmic rgb cannot be set with entirely neutral parameters (resulting in a no-operation) - as soon as the module is enabled, the image is always at least slightly affected._

# graph display

The graphic display of the _filmic rgb_ module now offers multiple views. You can cycle through the different views using the curly arrow icon to the right of the graph display. You can also toggle the labels on the axes on and off using the icon underneath the curly arrow icon. The displays that are available are:

look only
: this is the traditional graph provided by filmic, and the main bright curve shows how the dynamic range of the EV values from the scene is compressed down into the display-referred output range. It also shows the edtreme luminance desaturation curve in a darker colour.

look + mapping (linear)
: this view shows the mapping of input values from [0,1] to output values in linear space, including the dynamic range mapping and the output transfer function. Note that in a scene-referred workflow, input values are allowed to exceed 1, however the graph only shows inout values in the ibterval [0,1] in order to make the shape of the graph comparable to other tone curve mapping tools such as _base curve_ or _tone curve_. The actual value of the scene white point is shown in brackets on the _X axis_ (expressed as a percentage of an input value of 1).

look + mapping (log)
: same as the previous view, but plotted in log space.

dynamic range mapping
: this view is inspired by the Ansel Adams Zone System, showing how the EV zones in the input scene are mapped to the filmic output. Middle grey from the scene is always mapped to 18% in the output (linear) space, and it can be seen how the tone ranges towards the ends of the scene exposure range get compressed into a smaller number of zones in the display space, leaving more room for the mid-tones to be spread out over the available display zones.

# module controls

## scene

middle-grey luminance
: *Note:* This control is hidden by default -- it is not recommended to use this control, but instead use the _exposure_ module to set the mid-grey level. However, to make this slider visible, enable the checkbox _use custom mid-grey values_ in the _options_ tab.

: The luminance in RGB space of the scene-referred 18% grey. Use the color picker tool to read the average luminance over the drawn area. If you have a photograph of a grey card or a color chart (IT8 chart or colorchecker) shot in the scene lighting conditions, then the grey color picker tool can be used to quickly sample the luminance of the grey patch on that image. In other situations, the color picker can be used to sample the average luminance of the subject.

: This setting has an effect on the picture that is analogous to a lightness correction. Values close to 100% do not compress the highlights but fail to recover shadows. Values close to 0% greatly recover the shadows but compress the highlights more harshly and result in local-contrast losses. The standard middle-grey value for linearly encoded camera RGB is 18%. Good grey values are usually the average luminance of the whole picture or of the subject. In studio and indoor lighting (low dynamic range scenes), proper grey values are found between 15-18%. In high dynamic range scenes (landscapes, back-lit portraits), proper grey values lie between 1.25 and 9%.

: When modifying the middle-grey luminance, the white and black exposures are automatically adjusted accordingly, to prevent the dynamic range from clipping and to help you set the right parameter faster. If you are not happy with the auto adjustment performed by the grey slider, you can correct the white and black exposure parameters afterwards.

white relative exposure
: The number of stops (EV) between pure white and middle grey. This is the right bound of the dynamic range and should be adjusted to avoid highlight clipping. The color picker tool reads the maximum luminance in RGB space over the drawn area, assumes it is pure white, and sets the white exposure parameter to remap the reading to 100% luminance.

: When the grey is set at 18%, the white exposure will always be around 2.45EV. When the grey is set at 100%, the white exposure should be set at 0EV.

black relative exposure
: The number of stops (EV) between pure black and middle grey. This is the left bound of the dynamic range. The color picker tool reads the minimum luminance in RGB space over the drawn area, assumes it is pure black, and sets the black exposure parameter to remap the minimum reading to 0% luminance. The black color picker measurement is very sensitive to noise, and cannot identify whether the minimum luminance is pure black (actual data) or just noise. It works better on low ISO pictures and with high quality demosaicing. When the color picker puts the black exposure at -16EV, it is a sign that the measurement has failed and you will need to adjust it manually.

: The black relative exposure allows you to choose how far you want to recover lowlights. In contrast to the white exposure, it is not always possible to completely avoid clipping blacks. Every camera sensor has a maximum physical dynamic range for each ISO value (you can find them measured on DXOmark or DPreview). The software dynamic range in filmic rgb (dynamic range = white exposure - black exposure) should generally not be greater than the physical dynamic range of the sensor (10-14EV in most cases). Note that the dynamic range of the scene can be lower than that of the camera, especially indoors.

dynamic range scaling and auto-tune
: The auto-tune color picker combines all three color pickers above, and allows you to set the grey, white and black exposures all at once, using the average of the drawn region as the grey estimation, the maximum as the white, and the minimum as the black. This gives good results in landscape photography but usually fails for portraits and indoor scenes.

: When no true white and no true black are available on the scene, the maximum and minimum RGB values read on the image are not valid assumptions anymore, so the dynamic range scaling symmetrically shrinks or enlarges the detected dynamic range and the current parameters. This works with all color pickers, and adjusts the current values of white and black relative exposures.

## reconstruct

This tab provides controls that will help to blend transisitons between unclipped and clipped areas within an image. Firstly, a mask needs to be set up to identify the areas of the image that will be affected by the highlights reconstruction. Next, there are some controls to fine-tune some of the tradeoffs make by the reconstruction algorithm.

### _highlights clipping_

threshold
: use this control to select which pixels will be impacted by the reconstructrion algorithm. Any pixels brighter than this threshold will be affected by the reconstruction algorithm. The units are in EV, and are relative to white point set in _scene_ tab. By default, this control is set to +3 EV, meaning that pixels need to be at least +3 EV brighter than the white point set in the scene tab in order for the highlight reconstruction to have any effect. In practise, this means that highlight reconstruction is effectively disabled by default. Therefore, to use the filmic highlights reconstruction feature, turn on the display highlight reconstruction mask using the toggle mentioned below, and lower this threshold until the highlight areas you want reconstruct are selected in white by the mask. It may also be useful to first review the image using the _raw over-exposed indicator_ that you can get an overview as to which pixels in the raw file have been clipped, and whether it is just one channel or all channels that have been clipped.

transition
: use this control to soften the transition between clipped pixels and valid pixels. Moving this control to the right will increase the amount of blur in the mask, so that the transition between clipped and non-clipped areas is softer. This will allow for a smoother blending between the clipped and non-clipped regions. Moving this control to the left will reduce the blurr in the mask, making the transition in the mask much sharper and therefore reducing the amount of feathering between clipped and non-clipped areas.

display highlight reconstruction mask
: click on the icon to the right of this label to toggle the dislaying of the reconstruction mask. It is recommended to turn this on while adjsuting the two controls mentioned above.

### _balance_

structure
: use this control to influence whether the reconstrutrion algorithm should favour painting in a smooth colour gradient, or trying to reconstruct the texture. By default, the control is in the middle at 0%, which favours both strategies equally. If you have lots of areas where all three channels are clipped, there is no texture detail available in those clipped areas, so it is better to move the slider to the left to favour the colour reconstruction. If you have lots of areas where only one or two channels are clipped, then there will be some texture detail in the unclipped channel(s), and moving the slider to the right will place more emphasis on trying to reconstruct the texture using this unclipped data. 

bloom/reconstruct
: Use this control to control whether the algorithm tries to reconstruct sharp detail in the clipped areas, or whether it should apply a blur that approximates the blooming effect you get with traditional film. By default, this is set to 100% which tries to maximise the sharpness of the detail in the clipped areas. Move this slider to the right if you want to introduce more blur in thiese clipped areas.

grey/colorful details
: use this control to influence whether the algorithm favours the recovery of monochromatic highlights or colourful highlights. Move the slider to the right if you want more colour in the highlights. Move the slider to the left if you want to reduce the saturation of the clipped highlights. It can be helpful to reduce the saturation in the highlights if you see start seeing magenta or out-of-gamut colours in the highlights.

## look

contrast
: The filmic rgb S-curve is created, from the user parameters, by computing the position of virtual nodes and interpolating them, similarly to the tone curve module (but here, the nodes cannot be moved manually). The filmic rgb S-curve is split into three parts: a middle linear part, and two extremities that transition smoothly from the slope of the middle part to the ends of the exposure range.

: The contrast slider controls the slope of the middle part of the curve, as illustrated in the graph display. The larger the dynamic range is, the greater the contrast should be set. This parameter mostly affects mid-tones.

: When the contrast is set to 1, this disables the S-curve.

hardness
target power factor function
: Previously as the _target power factor function_ slider in older versions of filmic RGB, this slider is hidden by default, and is automatically based on other values provided in the _scene_ tab. To make this slider visibile, you need to uncheck the _auto adjust hardness_ option on the _options_ tab.

: This parameter is the power function applied to the output transfer function, and it is often improperly called the _gamma_ (because only screens have a "gamma"). It is used to raise or compress the mid-tones to account for the display non-linearities or to avoid quantization artifacts when encoding in 8 bits file formats. This is a common operation when applying ICC color profiles (except for linear RGB spaces, like REC 709 or REC 2020, which have a linear “gamma” of 1.0). However, at the output of filmic rgb, the signal is logarithmically encoded, which is not something ICC color profiles know to handle. As a consequence, if we let them apply a gamma 1/2.2 on top, it will result in a double up, which would result inthe middle-grey being remapped to 76% instead of 45% as it should in display-referred space.

latitude
: The latitude is the range between the 2 nodes enclosing the central linear portion of the curve, expressed as a percentage of the dynamic range defined in the scene tab (white-relative exposure minus black-relative-exposure). It is the luminance range that is remapped in priority, and it is remapped to the luminance interval defined by the contrast parameter. It is usually advisable to keep the latitude as large as possible, while avoiding clipping. If clipping is observed, you can compensate for this effect by either decreasing the latitude, shifting the latitude interval with the shadow/highlights balance parameter, or decreasing the contrast.

: The latitude also defines the range of luminances that is not desaturated at the extremities of the luminance range (See _extreme luminance saturation_).

shadows/highlight balance
: By default, the latitude is centered in the middle of the dynamic range. If this produces clipping in one part of the other of the curve, the balance parameter allows you to slide the latitude along the slope, towards the shadows or towards the highlights. This allows more room to be given to one extremity of the dynamic range than to the other, if the properties of the image demand it.

extreme luminance saturation
middle tones saturation
: At extreme luminances, the pixels will tend towards either white or black. Because neither white nor black have colour associated with them, the saturation of these pixels must be 0%. In order to gracefullly transition towards this 0% point, pixels outside the midtone latitude range are progressively desaturated as they approach those extremes. The darker curve in the filmic RGB graph indicates the amount of desaturation being applied to pixels falling outside the latitude range. Moving the slider to the right pushes out towards the extremes the point where desaturation will start to be applied, resulting in a steeper desaturation curve (if pushed too far, this can result in fringing around the highlights). Moving the slider to the right brings closer to the center the point at which color desaturation will start to be applied, resulting in a gentler desaturation curve. If you would like to see more colour saturation in the highlights, and you have checked that the white relative exposure in the _scene_ tab is not yet clipping those highlights, move the middle tones saturation slider to the right to increase the saturation.

: Please note that this desaturation strategy has changed compared to previous versions of _filmic rgb_ which provided a different slider control labelled _extreme luminance saturation_. You can revert to the previous desaturation behaviour by selecting "v3 (2019)" on the _color science_ setting on the _options_ tab.

## display

target black luminance
: The destination parameters set the target luminance values used to remap the tones through filmic rgb. The default parameters will work 99% of the time, the remaining 1% being when you output in linear RGB space (REC709, REC2020) for media handling log-encoded data. These settings are then to be used with caution because darktable does not allow separate pipelines for display preview and for file output.

: The target black luminance parameter allows to set the ground-level black of the target medium. Set it greater than 0% if you want raised, faded blacks to achieve a retro look.

target middle-grey
: This is the middle-grey of the output medium, that is used as a target for the filmic rgb S curve central node. On gamma corrected media, the actual grey is computed with the gamma correction (middle-grey^(1/gamma)), so a middle-grey parameter of 18% with a gamma of 2.2 gives an actual middle-grey target of 45.87%.

target white luminance
: This parameter allows you to set the ceiling level white of the target medium. Set it lower than 100% if you want dampened, muted whites to achieve a retro look.

: To avoid double ups and washed pictures, filmic rgb applies a “gamma” compression reverting the output ICC gamma correction, so the middle-grey is correctly remapped at the end. To remove this compression, set the destination power factor to 1.0 and the middle-grey destination to 45%.

## options

color science
: this setting defaults to _v4 (2020)_ for new images, and defines the algorithms used by the filmic rgb module, such as the extreme luminance desaturation strategy. To revert to the behaviour of previous versions of filmic, set this parmaeter to _v3 (2019)_. If you have previosuly made edits to an image using older versions of filmic, this setting will be set to _v3 (2019)_ in order to provide backward compatibility for those edits.

preserve chrominance
: Define how the chrominance should be handled by filmic rgb: either not at all, or using one of the provided three norms.

: When applying the S-curve transformation independently on each color, the proportions of the colors get modified, which modifies the properties of the underlying spectrum, and ultimately the chrominance of the image. This is what happens if you choose "no" in the preserve chrominance parameter. This value may yield seemingly “better” results than the other values, but it may negatively impact later parts of the pipeline, when it comes to global saturation, for example.

: The other values of this parameter all work in a similar way. Instead of applying the S-curve to the channels R, G and B independently, filmic rgb uses a norm (N), divides all the three components by that norm, and applies the S-curve to N. This way, the relationship between the channels is preserved.

: The different values of the preserve chrominance parameter indicate which norm is used (the value used for N):

: _max RGB_ is the maximum value of the three channels R, G and B. This is the same behaviour as the previous version of the filmic module. It tends to darken the blues, especially skies, and to yield halos/fringes, especially if some channels are clipped.

: _luminance Y_ is a linear combination of the three channels R, G and B. It tends to darkens the reds, and to increase the local contrast in reds.

: _RGB power norm_ is the sum of the cubes of the three channels R, G, and B, divided by the sum of their squares - that is to say, (R³ + G³ + B³)/(R² + G² + B²). It is usally a good compromise between the max RGB and the luminance Y values.

: There is no "right" choice for the norm, depending on the picture to which it applies - you should experiment and decide for yourself on case by case basis.

contrast in highlights
: This control selects the desired curvature at the highlights end of the filmic spline curve. Selecting _hard_ (default) places a tighter constraint on the slope of the spline, which makes the curve sharper and hence introduces more tonal compression in the highlights. Selecting _soft_ loosens this constraint, resulting in a gentler curve with less tonal compression in the highlights.

contrast in shadows
: This control selects the desired curvature at the shadows end of the filmic spline curve. Selecting _hard_ (default) places a tighter constraint on the slope of the spline, which makes the curve sharper and hence introduces more tonal compression in the shadows. Selecting _soft_ loosens this constraint, resulting in a gentler curve with less tonal compression in the shadows.

use custom middle-grey values
: enabling this setting makes the middle-grey luminance slider visible on the _scene_ tab. With this new edition of _filmic rgb_, it is recommended to use the exposure module instead of that slider to set the middle-grey level, so this setting is disabled by default to hide the middle-grey slider on the scene tab (which is practice is doing the exactly the same thing as the exposure module).

auto-adjust hardness
: by default, this setting is enabled, and _filmic rgb_ will automatically calculate the power function (aka "gamma") to be applied on the output transfer curve. If this setting is disabled, a _hardness_ slider will appear on the _look_ tab so that value can be manually set.

iterations of high-quality reconstruction
: Use this setting to increase the number of passes of the filmic highlight reconstruction algorithm. More iterations mean more color propagation into clipped areas from pixels in the surrounding neighbourhood. This can produce more neutral highlights, but it also costs more in terms of processing power. It can be useful in difficult cases where there are magenta highlights due to channel clipping.

add noise in highlights
: this artificially introduces noise into the reconstructed  highlights to prevent them from looking too smooth compared to surrounding areas that may already contain noise. This can help blend more naturally the reconstructed areas with the surrounding non-clipped areas.

type of noise
: this specifies the statistical distribution of the noise. It can be helpful to match the look of the artificially generated noise with the naturally occurring noise in the surrounding areas from the camera's sensor.

# workflow

The filmic rgb module can seem pretty complex. The following is a proposed workflow for processing an image with filmic rgb to obtain a well-exposed picture from a RAW file.

- Modify the exposure in the [_exposure_](./exposure.md) module so that the midtones are clear enough. Do not worry about losing details in the highlights: they will be recovered by the next steps of the processing.

- In filmic rgb, start with “neutral” parameters: set the the middle grey luminance to 18.45% in the scene tab, and set the contrast to 1 in the look tab.

- Adjust the white-relative and black-relative exposures in the scene tab; set the middle grey luminance as well.

- In the look tab, experiment with the contrast parameter. Increase the latitude as much as you can without clipping the curve, slide it with the shadows/highlights balance parameter.

- filmic rgb tends to compress the local contrast - you can compensate for that using the [_local contrast_](./local-contrast.md) module.

- You may also want to increase the saturation in the [_color balance_](./color-balance.md) module, and adjust settings in the tone equalizer module.

- Do the final adjustments in filmic rgb, and your picture is now ready for creative processing.

# filmic rgb for darktable 2.6 filmic users

Filmic rgb is a reimplementation of the original _filmic_ module, and some adjustments are necessary to switch from one version to the other. This section underlines the most important differences; a more comprehensive overview is available as a video ([darktable 3.0 filmic explained to users of darktable 2.6](https://www.youtube.com/watch?v=9awBFYcPgGU)). 

The major differences in usage are as follows:

- The default parameters of the two modules are not comparable: activating the _filmic rgb_ module with default parameters does not yield the same results as the previous _filmic_ module with default parameters.

- The latitude is now expressed in percentage of the dynamic range instead of absolute EV values.

- The saturation slider that was present in the previous version of filmic (to avoid oversaturation) is no longer necessary since filmic rgb does a much better job at preserving colors.

- The previous version of _filmic_ always used the prophoto RGB profile; _filmic rgb_ respects the working color profile defined in the input color profile module. To keep the same behaviour, you can set the working profile to linear prophoto RGB.

To achieve similar results between the previous version of _filmic_ and _filmic rgb_, the following steps are suggested:

- Transfer the parameters from _filmic_ to _filmic rgb_. The latitude parameter is now given in percentage of the input dynamic range: compute that percentage from your _filmic_ input values.

- Lower the contrast.

- Set the extreme luminance saturation to 50%, unless you are using chrominance preservation.

- Adjust the shadows/highlights balance to avoid clipping of the curve

- Raise the middle grey luminance a bit (using either the exposure module, or if active, the middle-grey luminance slider on the _scene_ tab), and set the dynamic range scaling to approximately 6%.

- The old preserve chrominance setting corresponds to the max RGB mode; in that case, do not modify the extreme luminance saturation.

- If you experience unexpected color shifts, change the working color space to prophoto RGB in the [_input color profile_](./input-color-profile.md) module.
