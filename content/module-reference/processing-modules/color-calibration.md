---
title: color calibration
id: color-calibration
applicable-verison: 3.4
tags:
working-color-space: RGB
view: darkroom
masking: true
---

A fully-featured color-space correction, white balance adjustment and channel mixer. This simple yet powerful module can be used in the following ways:

- To adjust the white balance (chromatic adaptation), working in tandem with the [_white balance_](./white-balance.md) module. In this case, the _white balance_ module performs an initial white balance step (which is still required in order for the demosac module to work effectively). The _color calibration_ module then calculates a more perceptually-accurate white balance after the input color profile has been applied.

- As a simple RGB channel mixer, adjusting the output R, G and B channels based on the R, G and B input channels, to perform cross-talk color-grading.

- To adjust the color saturation and brightness of the pixels, based on the relative strength of the R, G and B channels of each pixel.

- To produce a greyscale output based on the relative strengths of the R, G and B channels, in a way similar to the response of black and white film to a light spectrum.

# Chromatic Adaptation Transformation (white balance)

Chromatic adaptation aims to predict how all surfaces in the scene would look if they had been lit by another illuminant. What we actually want to predict, though, is how those surfaces would have looked if they had been lit by the same illuminant as your monitor. White balance, on the other hand, aims only at ensuring that whites are really whites (R = G = B) and doesn’t really care about the rest of the color range.

Chromatic adaptation is controlled within the Chromatic Adaptation Transformation (CAT) tab of the _color calibration_ module. When used in this way the _white balance_ module only needs to perform a basic white balance operation assuming a D65 illuminant ("camera reference" mode), which is expected by input color profiles. The remainder of the white balance (chromatic adaptation) is then performed by the _color calibration_ module, on top of the _white balance_ and _input color profile_ corrections. The use of custom matrices, in _input color profile_ is therefore discouraged, and the coefficients in _white balance_ need to be accurate.

The _color calibration_ and _white balance_ modules can be automatically applied to achieve this for new edits by setting the chromatic adaptation workflow option ([`preferences > processing > auto-apply chromatic adaptation defaults`](../../preferences-settings/processing.md)) to "modern". If you prefer to perform all white balancing within the _white balance_ module, a "legacy" option is also available. Neither option precludes the use of other modules such as [_color balance_](./color-balance.md) further down the pixel pipeline for creative color grading.

By default, _color calibration_ will perform chromatic adaptation by:

- reading the raw EXIF to fetch the scene white balance set by the camera,
- adjusting this setting with the camera reference white balance used in the _white balance_ module,
- further adjusting this setting with the input color profile in use (only the standard matrix).

Personal presets or settings used in _white balance_ or in _input color profile_ are ignored when building _color calibration_ default settings, since the program cannot trace what they do. DNG raw files are also ignored since they can (but not have to) interpolate between 2 embedded DNG profiles to perform white balance, which can lead to different settings scenarios. For these cases, users will have to configure the settings themselves and use their camera manufacturer's documentation to take the appropriate color correction steps.

It is also worth noting that, unlike the _white balance_ module, _color calibration_ can be used with [masks](../../darkroom/masking-and-blending/masks/_index.md). This means that you can selectively correct different parts of the image to account for differing light sources.

To achieve this, create an instance of the _color calibration_ module to perform global adjustments using a mask to exclude those parts of the image that you wish to handle differently. Then create a second instance of the module reusing the mask from the first instance (inverted) using a [raster mask](../../darkroom/masking-and-blending/masks/raster.md).

## CAT settings

The default illuminant and the space used by the CAT (chromatic adaptation transform) are initialised from the raw file EXIF metadata. There are 4 options to set them in-software:

- Using the color-picker, right of the color patch, to select a neutral color on the picture or the whole image. In this case, the algorithm finds the average color in the color-picker area and sets it as the illuminant. This relies on the "grey-world" assumption, which predicts the average color of a natural scene is neutral, and does not work for artificial scenes, with painted surfaces for example.

- Using the _(AI) detect from edges_ method, which relies on a machine-learning detection over the whole image. It finds the average gradient color over edges found in the image and sets it as the illuminant. It relies on the "grey-edge" assumption, which may fail if large chromatic aberrations are present. As any edge-detection method, it is sensible to noise and poorly suited for high-ISO images, but it is very well suited for artificial scenes where no neutral colors are available.

- Using the _(AI) detect from surfaces_ method, which is a combination of the two previous ones, performed on the whole image. It finds the average color on the picture but weighs more heavily and areas where sharp details are found and colors are strongly correlated. This makes it more immune to noise than the _edge_ variant and more immune to legitimate non-neutral surfaces than the naive average, but sharp colored textures (like green grass) are likely to make it fail.

- Using the _as shot in camera_ method allows you to restore the camera defaults and re-reads the raw EXIF.

At any time, a color patch shows the color of the current illuminant projected to sRGB space. The CAT aims at turning this color into pure white, which does not necessarily means shifting the image toward its *perceptual* opponent color. If the illuminant is properly set, by turning off the _color calibration_ module, you should see in the image the same tint as the color patch.

Left of the color patch is the _CCT_ approximation (correlated color temperature). This is the closest temperature, in kelvin, from the current illuminant in use. Setting white balance as a combination of temperature and tint is customary in image processing software, however when the illuminant is far from daylight, the CCT becomes inaccurate and irrelevant, and the CIE (International Commission on Illumination) discourages its use in such conditions. The CCT reading informs you of the closest CCT match found:

- when the CCT is followed by _(daylight)_, it means the current illuminant is close to an ideal daylight spectrum ± 0.5 %, therefore the number is meaningful.
- when the CCT is followed by _(black  body)_, it means the current illuminant is close to an ideal black body (planckian) spectrum ± 0.5 %, therfore the number is meaningful.
- when the CCT is followed by _(invalid)_, it means the CCT figure is meaningless and most likely wrong, because we are too far from either a daylight or a black body light spectrum.

When any of the 4 above illuminant detection methods is used, the program checks where the found illuminant sits from the 2 idealized spectra we can use and sets the most accurate spectrum model to use in the _illuminant_ parameter. The user-interface will change accordingly: a temperature slider is available for _D (daylight)_ and _Planckian (black body)_, for which the CCT is meaningful, otherwise general hue and chroma sliders in CIE Luv space are offered for the _custom_ illuminant.

When you switch from a _custom_ illuminant to, for example, a _D (daylight)_, the closest CCT from your custom illuminant gets transfered and used by the daylight model. This conversion is almost non-destructive (± 0.5 %) if the _(daylight)_ tag was displayed in the CCT reading when using the _custom_ illuminant. The same applies to _Planckian (black body)_ illuminant. Switching from any illuminant to _custom_ is 100% non-destructive regarding the original setting. Switching from _custom_ to any other illuminant is destructive and most likely innacurate if the CCT reading is tagged _(invalid)_.

Other hard-set _illuminants_ are available (_A_, _E_, _F_, _LED_) through a list. Their values come from standard CIE illuminants and are absolute. You can use them directly if you know exactly what kind of light bulb was used to lit the scene and if you trust your camera input profile and its reference D65 coefficients to be accurate.

The illuminant detection modes also set the best suited CAT space. The _linear Bradford_ CAT is known to be more perceptually accurate for daylight and black body illuminants between 2800 K and 6500 K. The _CAT 16_ is known to hold the gamut better for difficult illuminants such as blue lights.

## CAT warnings

The chromatic adaptation in this module relies on a number of assumptions, about earlier steps in the pipeline, in order to work correctly and it can be easy to inadvertently break these assumptions in subtle ways. To help you to avoid these kind of mistakes, the _color calibration_ module will show warnings in the following circumstances.

- If the _color calibration_ module is set up to perform chromatic adaptation but the _white balance_ module is not set to "camera reference", warnings will be shown in both modules. These errors can be resolved either by setting the _white balance_ module to "camera reference" or by disabling chromatic adaptation in the _color calibration_ module. Note that some sensors may require minor corrections within the _white balance_ module in which case these warnings can be ignored.

- If two or more instances of _color calibration_ have been created, each attempting to perform chromatic adaptation, an error will be shown on the second instance. This could be a valid use case (for instance where masks have been set up to apply different white balances to different non-overlapping areas of the image) in which case the warnings can be ignored. For most other cases, chromatic adaptation should be disabled in one of the instances to avoid double-corrections.

  By default, if an instance of the _color calibration_ module is already performing chromatic adaptation, each new instance you create will automatically have its adaptation set to "none (bypass)" to avoid this "double-correction" error.

The chromatic adaptation modes in _color calibration_ can be disabled by either setting the _adaptation_ to "none (bypass)" or setting the _illuminant_ to "same as pipeline (D50)" in the CAT tab.

Warnings are meant to prevent common and easy mistakes while using the automatic default presets in the module in a typical raw photographs editing workflow. When using custom presets or particular workflows, such as editing film scans or JPEGs, these warnings can and should be ignored.

# channel mixing

The remainder of this module is a standard channel mixer, allowing you to adjust the output R, G, B, colorfulness, brightness and grey of the module based on the relative strengths of the R, G and B input channels.

Channel mixing is performed in the color space defined by the _adaptation_ control on the CAT tab. To all pratical ends, these CAT spaces are particular RGB spaces tied to human physiology and proportional to the scene light emissions, but they still behave as any RGB space. The use of any of the CAT spaces can make the channel mixer tuning process easier, due to their connection with physiology, but it is also possible to mix channels in the RGB working space of the pipeline by setting the _adaptation_ to "none (bypass)". To perform channel mixing in one of the _adaptation_ color spaces without chromatic adaptation, set the _illuminant_ to "same as pipeline (D50)".

---

**Note: ** the actual colors of the CAT or RGB primaries used for the channel mixing, projected to sRGB display space, are painted in the background of the RGB sliders, so you can get a sense of the color shift resulting of your settings change.

---

## RGB matrix multiplication

At its most basic level, you can think of the R, G and B tabs of the _color calibration_ module as a type of matrix multiplication between a 3x3 matrix and the input [R G B] values. This is in fact very similar to what a matrix-based ICC color profile does, except that the user can input the matrix coefficients via the darktable GUI rather than reading the coefficients from an ICC profile file.

```
┌ R_out ┐     ┌ Rr Rg Rb ┐     ┌ R_in ┐
│ G_out │  =  │ Gr Gg Gb │  X  │ G_in │
└ B_out ┘     └ Br Bg Bb ┘     └ B_in ┘
```

If, for example, you've been provided with a matrix to transform from one color space to another, you can enter the matrix coefficients into the _channel mixer_ as follows:

- select the _red_ tab and then set the Rr, Rg & Rb values using the red, green and blue input sliders
- select the _green_ tab and then set the Gr, Gg & Gb values using the red, green and blue input sliders
- select the _blue_ tab and then set the Br, Bg & Bb values using the red, green and blue input sliders

By default, the mixing function in _color calibration_ just copies the input [R G B] channels straight over to the matching output channels. This is equivalent to multiplying by the identify matrix:

```
┌ R_out ┐     ┌ 1  0  0 ┐      ┌ R_in ┐
│ G_out │  =  │ 0  1  0 │   X  │ G_in │
└ B_out ┘     └ 0  0  1 ┘      └ B_in ┘
```

To get an intuitive understanding of how the mixing sliders on the red, greeen and blue tabs behave:

- for the _red_ destination, adjusting sliders to the right will make the R, G or B areas of the image more red. Moving the slider to the left will make those areas more cyan.
- for the _green_ destination, adjusting sliders to the right will make the R, G or B areas of the image more green. Moving the slider to the left will make those areas more magenta.
- for the _blue_ destination, adjusting sliders to the right will make the R, G or B areas of the image more blue. Moving the slider to the left will make those areas more yellow.

## brightness and colorfulness adjustments

The brightness and colorfulness (color saturation) of pixels in an image can also be adjusted based on the R, G and B input channels. This uses the same basic algorithm that the [_filmic rgb_](filmic-rgb.md) module uses for tone mapping (which preserves RGB ratios) and for midtones saturation (which massages them).

For example, if you want to darken the pixels that have a high blue component and brighten those having a high red component, you can do this by decreasing the blue slider and increasing the red slider on the brightness tab. Similarly, on the colorfulness tab, you can influence the overall color saturation of individual pixels based on how much of one component or another each pixel has.

## monochrome output

Another very useful application of _color calibration_ is the ability to mix the channels together to produce a greyscale output -- a monochrome image. Select the _grey_ tab, and set the red, green and blue sliders to control how much each
channel contributes to the brightness of the output. This is equivalent to the following matrix multiplication:
```
GRAY_out  =   [ r  g  b ]  X  ┌ R_in ┐
                              │ G_in │
                              └ B_in ┘
```

When dealing with skin tones, the relative weights of the three channels will affect the level of detail in the image. Placing more weight on red (e.g. `[0.9, 0.3, -0.3]`) will make for smooth skin tones, whereas emphasising green (e.g. `[0.4, 0
.75, -0.15]`) will bring out more detail. In both cases the blue channel is reduced to avoid emphasising unwanted skin texture.

# module controls

## CAT tab

Control the working color space of the module and optionally perform chromatic adaptation.

adaptation
: The working color space in which the module will perform its chromatic adaptation transform and channel mixing. The following options are provided:

: - _Linear Bradford (1985)_: This is more accurate for illuminants close to daylight but produces out-of-gamut colors for more difficult illuminants.
: - _CAT16 (2016)_: This is more robust in avoiding imaginary colors while working with large gamut or saturated cyan and purple.
: - _Non-linear Bradford (1985)_: This can produce better results than the linear version but is unreliable.
: - _XYZ_: A simple scaling space (scaled by luminance Y). This is generally not recommended except for testing and debugging purposes.
: - _none (disable)_: Disable any adaptation and use the pipeline working RGB space.

illuminant
: The type of illuminant assumed to have lit the scene. Choose from the following:

: - _same as pipeline (D50)_: Do not perform chromatic adaptation in this module instance but perform channel mixing using the selected _adaptation_ color space.
: - _CIE standard illuminant_: Choose from one of the CIE standard illuminants (daylight, incandescent, fluorescent, equi-energy, or black body), or a non-standard "LED light" illuminant. These values are all pre-computed -- as long as your camera sensor is properly profiled, you can just use them as-is. For illuminants that lie near the Planckian locus, an additional "temperature" control is also provided (see below).
: - _custom_: If a neutral grey patch is available in the image, the color of the illuminant can be selected using the color picker, or can be manually specified using hue and saturation sliders (in LCh perceptual color space). The color swatch next to the color picker shows the color of the calculated illuminant used in the CAT compensation. The color picker can also be used to restrict the area used for AI detection (below).
: - _(AI) detect from image surfaces_: This algorithm obtains the average color of image patches that have a high covariance between chroma channels in YUV space and a high intra-channel variance. In other words, it looks for parts of the image that appear as though they should be grey, and discards flat colored surfaces that may be legitimately non-grey. It also discards chroma noise as well as chromatic aberrations.
: - _(AI) detect from image edges_: Unlike the _white balance_ module's auto-white-balancing which relies on the "grey world" assumption, this method auto-detects a suitable illuminant using the "grey edge" assumption, by calculating the Minkowski p-norm (p = 8) of the laplacian and trying to minimize it. That is to say, it assumes that edges should have the same gradient over all channels (grey edges). It is more sensitive to noise than the previous surface-based detection method.
: - _as shot in camera_: Calculate the illuminant based on the white balance settings provided by the camera.

temperature
: Adjust the color temperature of the illuminant. Move the slider to the right to assume a more blue illuminant, which will make the white-balanced picture appear warmer/more red. Move the slider to the left to assume a more red illuminant, which makes the image appear cooler/more blue after compensation.

: This control is only provided for illuminants that lie near the Planckian locus and provides fine-adjustment along that locus. For other illuminants the concept of "color temperature" doesn't make sense, so no temperature slider is provided.

hue
: For custom white balance, set the _hue_ of the illuminant color in LCh color space derivated from CIE Luv space.

chroma
: For custom white balance, set the _chroma_ (or saturation) of the illuminant color in LCh color space derivated from CIE Luv space.

gamut compression
:  Most camera sensors are slightly sensible to invisible wavelengths in UV, which get recorded on the blue channel and produce imaginary colors. Once corrected by the input color profile, they will end out of gamut and produce visual artifacts in gradients. Then, the chromatic adaptation may, once again, push valid colors out of gamut, and the out-of-gamut colors even further away (that is, it may no longer be possible to represent certain colors as a valid [R,G,B] triplet with positive values in the working color space). _Gamut compression_ uses a perceptual, non-destructive method, that tries to compress the saturation while preserving the luminance as-is and hue as close as possible, in order to fit the whole image into the pipeline working space gamut. One example where this feature is very useful is for scenes where there are blue LED lights, which are often quite problematic and result in ugly gamut clipping in the final image.

clip negative RGB from gamut
: Remove any negative RGB values (set them to zero). This helps dealing with bad black level as well as blue channel clipping issues, with blue LED lights.

## R, G and B tabs

These tabs allow the R, G and B output channels for each pixel to be calculated using a weighted sum of the R, G and B input channels. Each tab has 3 sliders, and there are 3 tabs, so the sliders are effectively setting the coefficients of a 3x3 matrix, as described above.

input red/green/blue
: Choose how much the input R, G and B channels influence the output channel relating to the tab concerned.

normalize channels
: Select this checkbox to normalize the coefficients to try to preserve the overall brightness of this channel in the final image as compared to the input image.

## colorfulness tab

input red/green/blue
: Adjust the color saturation of pixels, based on the R, G and B channels of those pixels. For example, adjusting the _input red_ slider will affect the color saturation of pixels containing a lot of red more than colors containing only a small amount of red.

normalize channels
: Select this checkbox to try to keep the overall saturation constant between the input and output images.

## brightness tab

input red/green/blue
: Adjust the brightness of certain colors in the image, based on the R, G and B channels of those colors. For example, adjusting the _input red_ slider will affect the brightness of colors containing a lot of R channel much more than colors containing only a small amount of R channel. When darkening/brightening a pixel, the ratio of the R, G and B channels for that pixel is maintained, in order to preserve the hue.

normalize channels
: Select this checkbox to try to keep the overall brightness constant between the input and output images.

## grey tab

This tab allows you to convert a color image into a greyscale image using the relative strengths of the R, G and B channels.

input red/green/blue
: Choose how much each of the R, G and B channels contribute to the grey level of the output. The image will only be converted to monochrome if the three sliders add up to some non-zero value. Adding more blue will tend to bring out more details, adding more red will tend to smooth skin tones.

normalize channels
: Select this checkbox to try to keep the overall brightness constant as the sliders are adjusted.
