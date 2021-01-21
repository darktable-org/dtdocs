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

- To adjust the white balance (chromatic adaptation), working in tandem with the [_white balance_](./white-balance.md) module. In this case, the _white balance_ module performs an initial white balance step (which is still required in order for the [_demosaic_](./demosaic.md) module to work effectively). The _color calibration_ module then calculates a more perceptually-accurate white balance after the input color profile has been applied.

- As a simple RGB channel mixer, adjusting the output R, G and B channels based on the R, G and B input channels, to perform cross-talk color-grading.

- To adjust the color saturation and brightness of the pixels, based on the relative strength of the R, G and B channels of each pixel.

- To produce a greyscale output based on the relative strengths of the R, G and B channels, in a way similar to the response of black and white film to a light spectrum.

# White Balance in the Chromatic Adaptation Transformation (CAT) tab

Chromatic adaptation aims to predict how all surfaces in the scene would look if they had been lit by another illuminant. What we actually want to predict, though, is how those surfaces would have looked if they had been lit by the same illuminant as your monitor, in order to make all colors in the scene match the change of illuminant. White balance, on the other hand, aims only at ensuring that whites and greys are really neutral (R = G = B) and doesn’t really care about the rest of the color range. White balance is therefore only a partial chromatic adaptation.

Chromatic adaptation is controlled within the Chromatic Adaptation Transformation (CAT) tab of the _color calibration_ module. When used in this way the _white balance_ module is still required as it needs to perform a basic white balance operation (connected to the input color profile values). This technical white balancing ("camera reference" mode) is a flat setting that makes greys lit by a standard D65 illuminant look achromatic, and makes the demosaicing process more accurate, but does not perform any perceptual adaptation according to the scene. The actual chromatic adaptation is then performed by the _color calibration_ module, on top of those corrections performed by the _white balance_ and _input color profile_ modules. The use of custom matrices in the _input color profile_ module is therefore discouraged. Additionally, the RGB coefficients in the _white balance_ module need to be accurate in order for this module to work in a predictable way.

The _color calibration_ and _white balance_ modules can be automatically applied to perform chromatic adaptation for new edits by setting the chromatic adaptation workflow option ([preferences > processing > auto-apply chromatic adaptation defaults](../../preferences-settings/processing.md)) to "modern". If you prefer to perform all white balancing within the _white balance_ module, a "legacy" option is also available. Neither option precludes the use of other modules such as [_color balance_](./color-balance.md) further down the pixel pipeline for creative color grading.

By default, _color calibration_ performs chromatic adaptation by:

- reading the RAW file's Exif data to fetch the scene white balance set by the camera,
- adjusting this setting using the camera reference white balance from the _white balance_ module,
- further adjusting this setting with the input color profile in use (standard matrix only).

For consistency, the _color calibration_ module's default settings always assume that the standard matrix is used in the _input color profile_ module -- any non-standard settings in this module are ignored. However, _color calibration_'s defaults can read any auto-applied preset in the _white balance_ module.

It is also worth noting that, unlike the _white balance_ module, _color calibration_ can be used with [masks](../../darkroom/masking-and-blending/masks/_index.md). This means that you can selectively correct different parts of the image to account for differing light sources.

To achieve this, create an instance of the _color calibration_ module to perform global adjustments using a mask to exclude those parts of the image that you wish to handle differently. Then create a second instance of the module reusing the mask from the first instance (inverted) using a [raster mask](../../darkroom/masking-and-blending/masks/raster.md).

## CAT tab workflow

The default illuminant and color space used by the chromatic adaptation are initialised from the Exif metadata of the RAW file. There are 4 options available in the CAT tab to set these parameters manually:

- Use the color-picker (to the right of the color patch) to select a neutral color from the image or, if one is unavailable, select the entire image. In this case, the algorithm finds the average color within the chosen area and sets that color as the illuminant. This method relies on the "grey-world" assumption, which predicts that the average color of a natural scene will be neutral. This method does not work for artificial scenes, for example those with painted surfaces.

- Select _(AI) detect from edges_, which uses a machine-learning technique to detect the illuminant using the entire image. This algorithm finds the average gradient color over the edges found in the image and sets that color as the illuminant. This method relies on the "grey-edge" assumption, which may fail if large chromatic aberrations are present. As with any edge-detection method, it is sensitive to noise and poorly suited to high-ISO images, but it is very well suited for artificial scenes where no neutral colors are available.

- Select _(AI) detect from surfaces_, which combines the two previous methods also using the entire image. This algorithm finds the average color within the image, giving greater weight to areas where sharp details are found and colors are strongly correlated. This makes it more immune to noise than the _edge_ variant and more immune to legitimate non-neutral surfaces than the naïve average, but sharp colored textures (like green grass) are likely to make it fail.

- Select _as shot in camera_ to restore the camera defaults and re-read the RAW Exif.

The color patch shows the color of the currently calculated illuminant projected into sRGB space. The aim of the chromatic adaptation algorithm is to turn this color into pure white, which does not necessarily means shifting the image toward its *perceptual* opponent color. If the illuminant is properly set, the image will be given the same tint as shown in the color patch when the module is disabled.

To the left of the color patch is the _CCT_ (correlated color temperature) approximation. This is the closest temperature, in kelvin, to the illuminant currently in use. In most image processing software it is customary to set the white balance using a combination of temperature and tint. However, when the illuminant is far from daylight, the CCT becomes inaccurate and irrelevant, and the CIE (International Commission on Illumination) discourages its use in such conditions. The CCT reading informs you of the closest CCT match found:

- When the CCT is followed by _(daylight)_, this means that the current illuminant is close to an ideal daylight spectrum ± 0.5 %, and the CCT figure is therefore meaningful. In this case, you are advised to use the _D (daylight)_ illuminant.
- When the CCT is followed by _(black  body)_, this means that the current illuminant is close to an ideal black body (Planckian) spectrum ± 0.5 %, and the CCT figure is therfore meaningful. In this case, you are advised to use the _Planckian (black body)_ illuminant.
- When the CCT is followed by _(invalid)_, this means that the CCT figure is meaningless and wrong, because we are too far from either a daylight or a black body light spectrum. In this case, you are advised to use the _custom_ illuminant. The chromatic adaptation will still perform as expected (see the note below), so the _(invalid)_ tag only means that the current illuminant color is not accurately tied to the displayed CCT. This tag is nothing to be concerned about -- it is merely there to tell you to stay away from the daylight and planckian illuminants because they will not behave as you might expect.

When one of the above illuminant detection methods is used, the program checks where the calculated illuminant sits using the 2 idealized spectra (daylight and black body) and chooses the most accurate spectrum model to use in the _illuminant_ parameter. The user-interface will change accordingly:

- A temperature slider will be provided if the detected illuminant is close to a _D (daylight)_ or _Planckian (black body)_, for which the CCT is meaningful.
- Hue and chroma sliders in CIE 1976 Luv space are offered for the _custom_ illuminant, which allows direct selection of the illuminant color in a perceptual framework without any intermediate assumption.

---

**Note:** Internally, the illuminant is represented by its absolute chromaticity coordinates in CIE xyY color space. The illuminant selection options in the module are merely interfaces to set up this chromaticity from real-world relationships and are intended to make this process faster. It does not matter to the actual algorithm if the CCT is tagged "invalid" -- this just means that the relationship between the CCT and the corresponding xyY coordinates is not physically accurate. Regardless, the color set for the illuminant, as displayed in the patch, will always be honored by the algorithm.

---

When switching from one illuminant to another, the module attempts to translate the previous settings to the new illumninant as accurately as possible. Switching from any illuminant to _custom_ preserves your settings entirely, since the _custom_ illuminant is a general case. Switching between other modes, or from _custom_ to any other mode, will not precisely preserve your settings from the previous mode due to rounding errors.

Other hard-coded _illuminants_ are available (see below). Their values come from standard CIE illuminants and are absolute. You can use them directly if you know exactly what kind of light bulb was used to illuminate the scene and if you trust your camera's input profile and reference (D65) coefficients to be accurate (otherwise, see _caveats_ below).

## CAT tab controls

adaptation
: The working color space in which the module will perform its chromatic adaptation transform and channel mixing. The following options are provided:

: - _Linear Bradford (1985)_: This is accurate for illuminants close to daylight and is compatible with the ICC v4 standard, but produces out-of-gamut colors for more difficult illuminants.
: - _CAT16 (2016)_: This is more robust in avoiding imaginary colors while working with large gamut or saturated cyan and purple, and is more accurate than the Bradform CAT in general.
: - _Non-linear Bradford (1985)_: This can produce better results than the linear version but is unreliable.
: - _XYZ_: This is the least accurate method and is generally not recommended except for testing and debugging purposes.
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
: Adjust the color temperature of the illuminant. Move the slider to the right to assume a more blue illuminant, which will make the white-balanced image appear warmer/more red. Move the slider to the left to assume a more red illuminant, which makes the image appear cooler/more blue after compensation.

: This control is only provided for illuminants that lie near the Planckian locus and provides fine-adjustment along that locus. For other illuminants the concept of "color temperature" doesn't make sense, so no temperature slider is provided.

hue
: For custom white balance, set the _hue_ of the illuminant color in LCh color space, derived from CIE Luv space.

chroma
: For custom white balance, set the _chroma_ (or saturation) of the illuminant color in LCh color space, derived from CIE Luv space.

gamut compression
:  Most camera sensors are slightly sensitive to invisible UV wavelengths, which are recorded on the blue channel and produce "imaginary" colors. Once corrected by the input color profile, these colors will end up out of gamut (that is, it may no longer be possible to represent certain colors as a valid [R,G,B] triplet with positive values in the working color space) and produce visual artifacts in gradients. The chromatic adaptation may also push other valid colors out of gamut, at the same time pushing any already out-of-gamut colors even further out of gamut. _Gamut compression_ uses a perceptual, non-destructive, method to attempt to compress the saturation while preserving the luminance as-is and the hue as close as possible, in order to fit the whole image into the gamut of the pipeline working color space. One example where this feature is very useful is for scenes containing blue LED lights, which are often quite problematic and can result in ugly gamut clipping in the final image.

clip negative RGB from gamut
: Remove any negative RGB values (set them to zero). This helps to deal with bad black level as well as the blue channel clipping issues that may occur with blue LED lights.

## CAT warnings

The chromatic adaptation in this module relies on a number of assumptions about the earlier processing steps in the pipeline in order to work correctly, and it can be easy to inadvertently break these assumptions in subtle ways. To help you to avoid these kind of mistakes, the _color calibration_ module will show warnings in the following circumstances.

- If the _color calibration_ module is set up to perform chromatic adaptation but the _white balance_ module is not set to "camera reference", warnings will be shown in both modules. These errors can be resolved either by setting the _white balance_ module to "camera reference" or by disabling chromatic adaptation in the _color calibration_ module. Note that some sensors may require minor corrections within the _white balance_ module in which case these warnings can be ignored.

- If two or more instances of _color calibration_ have been created, each attempting to perform chromatic adaptation, an error will be shown on the second instance. This could be a valid use case (for instance where masks have been set up to apply different white balances to different non-overlapping areas of the image) in which case the warnings can be ignored. For most other cases, chromatic adaptation should be disabled in one of the instances to avoid double-corrections.

  By default, if an instance of the _color calibration_ module is already performing chromatic adaptation, each new instance you create will automatically have its adaptation set to "none (bypass)" to avoid this "double-correction" error.

The chromatic adaptation modes in _color calibration_ can be disabled by either setting the _adaptation_ to "none (bypass)" or setting the _illuminant_ to "same as pipeline (D50)" in the CAT tab.

These warnings are intended to prevent common and easy mistakes while using the automatic default presets in the module in a typical RAW editing workflow. When using custom presets and some specific workflows, such as editing film scans or JPEGs, these warnings can and should be ignored.

# channel mixing

The remainder of this module is a standard channel mixer, allowing you to adjust the output R, G, B, colorfulness, brightness and grey of the module based on the relative strengths of the R, G and B input channels.

Channel mixing is performed in the color space defined by the _adaptation_ control on the CAT tab. For all practical purposes, these CAT spaces are particular RGB spaces tied to human physiology and proportional to the light emissions in the scene, but they still behave in the same way as any other RGB space. The use of any of the CAT spaces can make the channel mixer tuning process easier, due to their connection with human physiology, but it is also possible to mix channels in the RGB working space of the pipeline by setting the _adaptation_ to "none (bypass)". To perform channel mixing in one of the _adaptation_ color spaces without chromatic adaptation, set the _illuminant_ to "same as pipeline (D50)".

---

**Note**: The actual colors of the CAT or RGB primaries used for the channel mixing, projected to sRGB display space, are painted in the background of the RGB sliders, so you can get a sense of the color shift that will result from your altered settings.

---

Channel mixing is a process that defines a boosting/muting factor for each channel as a ratio of all the original channels. Instead of entering a single flat correction that ties the output value of a channel to its input value (for example, `R_output = R_input × correction`), the correction to each channel is dependent on the input of _all_ of the channels for each pixel (for example, `R_output = R_input × R_correction + G_input × G_correction + B_input × B_correction`). Thus a pixel's channels contribute to each other (a process known as "cross-talk") which is equivalent to rotating the primary colors of the color space in 3D. This is, in effect, digital simulation of physical color filters.

Although rotating primary colors in 3D is ultimately equivalent to applying a general hue rotation, the connection between the RGB corrections and the resulting perceptual hue rotation is not directly predictable, which makes the process non-intuitive. "R", "G" and "B" should be taken as a mixture of 3 lights that we dial up and down, not as a set of colors or hues. Also, since RGB tristimulus does not decouple luminance and chrominance, but is an additive lighting setup, the "G" channel is more strongly tied to human luminance perception than the "R" and "B" ones; All pixels have a non-zero G channel, which implies that any correction to the G channel will likely affect all pixels.

The channel mixing process is therefore tied to a physical interpretation of the RGB tristimulus (as additive lights) that makes it well-suited for primary color grading and illuminant corrections, and blends the color changes smoothly. However, trying to understand and predict it from a perceptual point of view (luminance, hue and saturation) is going to fail and is discouraged.

---

**Note**: The "R", "G" and "B" labels on the channels of the color spaces in this module are merely conventions formed out of habit. These channels do not necessarily look "red", "green" and "blue", and users are advised against trying to make sense out of them based on their names. This is a general principle that applies to _any_ RGB space used in any application.

---

# R, G and B tabs

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

## R, G, B tab controls

The following controls are shown for each of the R, G and B tabs:

input red/green/blue
: Choose how much the input R, G and B channels influence the output channel relating to the tab concerned.

normalize channels
: Select this checkbox to normalize the coefficients to try to preserve the overall brightness of this channel in the final image as compared to the input image.

# brightness and colorfulness tabs

The brightness and colorfulness (color saturation) of pixels in an image can also be adjusted based on the R, G and B input channels. This uses the same basic algorithm that the [_filmic rgb_](filmic-rgb.md) module uses for tone mapping (which preserves RGB ratios) and for midtones saturation (which massages them).

## colorfulness tab controls

input red/green/blue
: Adjust the color saturation of pixels, based on the R, G and B channels of those pixels. For example, adjusting the _input red_ slider will affect the color saturation of pixels containing a lot of red more than colors containing only a small amount of red.

normalize channels
: Select this checkbox to try to keep the overall saturation constant between the input and output images.

## brightness tab controls

input red/green/blue
: Adjust the brightness of certain colors in the image, based on the R, G and B channels of those colors. For example, adjusting the _input red_ slider will affect the brightness of colors containing a lot of R channel much more than colors containing only a small amount of R channel. When darkening/brightening a pixel, the ratio of the R, G and B channels for that pixel is maintained, in order to preserve the hue.

normalize channels
: Select this checkbox to try to keep the overall brightness constant between the input and output images.

# grey tab

Another very useful application of _color calibration_ is the ability to mix the channels together to produce a greyscale output -- a monochrome image. Select the _grey_ tab, and set the red, green and blue sliders to control how much each channel contributes to the brightness of the output. This is equivalent to the following matrix multiplication:
```
GRAY_out  =   [ r  g  b ]  X  ┌ R_in ┐
                              │ G_in │
                              └ B_in ┘
```

When dealing with skin tones, the relative weights of the three channels will affect the level of detail in the image. Placing more weight on red (e.g. [0.9, 0.3, -0.3]) will make for smooth skin tones, whereas emphasising green (e.g. [0.4, 0.75, -0.15]) will bring out more detail. In both cases the blue channel is reduced to avoid emphasising unwanted skin texture.

## grey tab controls

input red/green/blue
: Choose how much each of the R, G and B channels contribute to the grey level of the output. The image will only be converted to monochrome if the three sliders add up to some non-zero value. Adding more blue will tend to bring out more details, adding more red will tend to smooth skin tones.

normalize channels
: Select this checkbox to try to keep the overall brightness constant as the sliders are adjusted.

# Caveats

The ability to use standard CIE illuminants and CCT-based interfaces to define the illuminant color depends on sound default values for the standard matrix in the _input color profile_ module as well as reasonable RGB coefficients in the _white balance_ module.

Some cameras, most notably those from Olympus and Sony, have unexpected white balance coefficients that will always make the detected CCT invalid even for legitimate daylight scene illuminants. This error most likely comes from issues with the standard input matrix, which is taken from the Adobe DNG Converter.

It is possible to alleviate this issue, if you have a computer screen calibrated for D65 illuminant, using the following process:

1. Display a white surface on your screen, for example by opening a blank canvas in any photo editing software you like
2. Take a blurry (out of focus) picture of that surface with your camera, ensuring that you don't have any "parasite" light in the frame, you have no clipping, and using an aperture between f/5.6 and f/8,
3. Open the picture in darktable and extract the white balance by using the spot tool in the _white balance_ module on the center area of the image (non-central regions might be subject to chromatic aberrations). This will generate a set of 3 RGB coefficients.
4. [Save a preset](../darkroom/interacting-with-modules/presets/#creating-and-editing-presets) for the _white balance_ module with these coefficients and auto-apply it to any color RAW image created by the same camera.
