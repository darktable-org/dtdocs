---
title: color calibration
id: color-calibration
applicable-verison: 3.4
tags: 
working-color-space:  
view: darkroom
masking: 
---

A fully-featured color-space correction, white balance adjustment and channel mixer module. The _color calibration_ module takes Red, Green and Blue color channels as inputs, and uses matrix multiplication to mix those channels together and produce output Red, Green and Blue channels. This simple yet powerful technique can be used in the following ways:

- As a simple channel mixer, adjusting the output R, G and B channels based on the input R, G and B channels.

- To adjust the white balance, working in tandem with the [_white balance_](./white-balance.md) module. In this case, the _white balance_ module performs an initial white balance step (still required in order for the demosac module to work effectively). The _color calibration_ module then calculates a more accurate white balance after the input color profile has been applied, using more sophisticated algorithms than those available in the _white balance_ module.

- To adjust the color saturation and brightness of the image, based on the amounts of the red, green and blue components in each pixel, while preserving the chroma using similar techniques as the [_filmic rgb_](./filmic-rgb.md) module.

- To create a monochrome image by using weightings on the R, G and B channels to produce a grey output.

Note that channel mixing is performed in the color space defined by the _adaptation_ control on the _CAT_ tab. You can disable the module's white balance mode in a given module instance, working instead in the pipeline RGB color space, by setting the _adaptation_ parameter to "none (bypass)". If you wish to work in one of the _adaptation_ color spaces (e.g. XYZ) but don't wish to perform white balancing in the module, choose the desired _adaptation_ color space and set the _illiminant_ to "same as pipeline (D50)".

# Chromatic Adaptation Transformation (white balance)

The _color calibration_ module can be used to perform white balancing using the Chromatic Adaptation Transformation (CAT) tab. When used in this mode the _white balance_ module should be adjusted to perform a simple white balance assuming a D65 illuminant ("camera reference" mode). The remainder of the white balance adaptation is then performed by the _color calibration_ module. 

The _color calibration_ and _white balance_ modules can be automatically applied in this way for new edits by setting the chromatic adaptation workflow option ([`preferences > processing > auto-apply chromatic adaptation defaults`](../../preferences-settings/processing.md)) to "modern". If you prefer to perform all white balancing within the _white balance_ module, a "legacy" option is also available. Neither option precludes the use of other modules such as [_color balance_](color-balance.md) further down the pixel pipeline for creative color grading.

It is also worth noting that, unlike the _white balance_ module, _color calibration_ can be used with [masks](../../darkroom/masking-and-blending/masks/_index.md). This means you can apply CAT using one illuminant to part of the image, and (with a second module instance) apply a CAT with a different iluminant to the rest of the image by inverting that mask (using the [raster mask](../../darkroom/masking-and-blending/masks/raster.md) functionality).

## CAT Warnings

This module relies on a number of assumptions in order to work correctly and it can be easy to inadvertently set modules up in a way that breaks these assumptions in subtle ways. To help you to avoid these kind of mistakes, the _color calibration_ module will show warnings in the following circumstances.

- If the _color calibration_ module is set up to perform white balancing but the _white balance_ module is not set to "camera reference". This error can be resolved either by setting the _white balance_ module to "camera reference" or by disabling CAT in the _color balance_ module. Note that some sensors may require minor corrections within the _white balance_ module and in these cases this warning can be ignored. A similar warning is also displayed in the _white balance_ module.

- If two or more instances of _color calibration_ have been created, each attempting to perform white balancing. The main valid use case for this is where masks have been set up to apply different white balances to different (non-overlapping) areas of the image. For most other cases, CAT should be enabled in only one of the instances to avoid double-corrections.

  By default, if an instance of the _color calibration_ module is already performing white balancing, each new instance you create will automatically have its adaptation set to "none (bypass)" to avoid this "double-correction" error.

# RGB matrix multiplication (channel mixer)

At its most basic level, you can think of the R, G and B tabs of the _color calibration_ module as a type of matrix multiplication between a 3x3 matrix and the input [R G B] values. This is in fact very similar to what a matrix-based ICC color profile does, except that the user can input the matrix coefficients via the darktable GUI rather than reading the coefficients from a file.

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

# brightness and colorfulness adjustments

The brightness and colorfulness (color saturation) of pixels in an image can also be adjusted based on the R, G and B input channels. This uses the same basic algorithm that the [_filmic rgb_](filmic-rgb.md) module uses for tone mapping (which preserves RGB ratios) and for midtones saturation (which massages the RGB ratios). For example, if you want to darken the pixels that have a high blue component and brighten those having a high red component, you can do this by decreasing the blue slider and increasing the red slider on the brightness tab. Similarly, on the colorfulness tab, you can influence the overall color saturation of individual pixels based on how much of one component or another each pixel has.

# monochrome output

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

Control the working color space of the module and optionally perform white balancing.

adaptation
: The working color space in which the module will perform its chromatic adaptation transform and channel mixing. 

: - _Linear Bradford (1985)_: This is more accurate for illuminants close to daylight but produced out-of-gamut colors for more difficult illuminants.
: - _CAT16 (2016)_: This is more robust in avoiding imaginary colors while working with large gamut or saturated cyan an purple.
: - _Non-linear Bradford (1985)_: This can produce better results than the linear version but is unreliable.
: - _XYZ_: A simple scaling space (scaled by luminance Y). This is generally not recommended
: - _none (disable)_: Disable any adaptation and use pipeline working RGB space.

color picker
: Use the color picker to select a region in the image for spot white-balance, or to restrict the region considered by the AI auto-detect algorithms. The color swatch next to this icon shows the color of the calculated illuminant (the color of the light that was used to illuminate the scene) that will be used in the CAT compensation.

illuminant
: The type of illuminant assumed when performing white balancing. These options all make different assumptions about the light that illuminated the scene. Choose from the following:

: - _same as pipeline (D50)_: Do not perform white balancing in this module instance but perform any channel mixing using the selected _adaptation_ color space.
: - _CIE standard illuminant_: Choose from one of the CIE standard illuminants (daylight, incandescent, fluorescent, equi-energy, or black body), or a non-standard "LED light" illuminant. These values are all pre-computed -- as long as your camera sensor is properly profiled, you can just use them as-is. For illuminants that lie near the Planckian locus, an additional "temperature" control is also provided (see below).
: - _custom_: If a neutral grey patch is available in the image, the color of the illuminant can be selected using the color picker, or can be manually specified using hue and saturation sliders (in LCh perceptual color space). Where there is no suitable reference patch, the following two AI methods will likely give a better result, although which method is better will depend on the specifics of the image. These manual methods replace the "temperature" and "tint" controls you may see in other software, since the concept of color temperature is no longer meaningful once we move too far from the Planckian locus. The color picker can also be used to restrict the area used for AI detection (below).
: - _(AI) detect from image surfaces_: This algorithm obtains the average color of image patches that have a high covariance between chroma channels in YUV space and a high intra-channel variance. In other words, it looks for parts of the image that appear as though they should be grey, and discards flat colored surfaces that may be legitimately non-grey. It also discards chroma noise as well as chromatic aberrations.
: - _(AI) detect from image edges_: Unlike the _white balance_ module's auto-white-balancing which relies on the "grey world" assumption, this method auto-detects a suitable illuminant using the "grey edge" assumption, by calculating the Minkowski p-norm (p = 8) of the laplacian and trying to minimize it. That is to say, it assumes that edges should have the same gradient over all channels (grey edges). It is more sensitive to noise than the previous surface-based detection method.
: - _as shot in camera_: Calculate the illuminant based on the white balance settings provided by the camera.

temperature
: Adjust the color temperature of the illuminant. Move the slider to the right to assume a bluer illuminant, which will make the white-balanced picture appear warmer/more red after the white balance compensation is applied. Move the slider to the left to assume a redder illuminant, which makes the image appear cooler/more blue after compensation. 

: This control is only provided for illuminants that lie near the Planckian locus and provides fine-adjustment along that locus. For other illuminants the concept of "color temperature" doesn't make sense, so no temperature slider is provided. 

hue
: For custom white balance, set the _hue_ of the illuminant color in LCh color space.

chroma
: For custom white balance, set the _chroma_ (or saturation) of the illuminant color in LCh color space.

gamut compression
:  When performing a white balance, colors in the image can be pushed out of gamut (that is, it may no longer be possible to represent certain colors as a valid [R,G,B] triplet with positive values in the working color space). By using a combination of _gamut compression_ (which uses XYZ scaling) and _negative RGB vaue clipping_, the colors can be squeezed back into gamut, albeit with some loss of hue accuracy. One example where this feature is very useful is for scenes where there are blue LED lights, which are often quite problematic and result in ugly gamut clipping in the final image.

clip negative RGB from gamut
: Remove any negative RGB values (set them to zero).

## R, G and B tabs

These tabs allow the R, G and B channel outputs for each pixel to be made up of a weighted sum of the R, G and B channel inputs. Each tab has 3 sliders, and there are 3 tabs, so the sliders are effectively setting the coefficients of a 3x3 matrix, as described above.

input red/green/blue
: Choose how much the input R, G and B channels influence the output channel relating to the tab concerned.

normalize channels
: Select this checkbox to normalize the coefficients to try to preserve the overall brightness of this channel in the final image as compared to the input image. 

## colorfulness tab

input red/green/blue
: Adjust the color saturation of pixels, based on the red, green or blue channels of those pixels. For example, adjusting the _input red_ slider will affect the color saturation of pixels containing a lot of red more than colors containing only a small amount of red. 

normalize channels
: Select this checkbox to try to keep the average amount of overall saturation in the image constant between the input and output images.

## brightness tab

input red/green/blue
: Adjust the brightness of certain colors in the image, based on the red, green or blue channels of those colors. For example, adjusting the _input red_ slider will affect the brightness of colors containing a lot of R channel much more than colors containing only a small amount of R channel. When darkening/brightening a pixel, the ratio of the R, G and B channels for that pixel is maintained, in order to preserve the hue.

normalize channels
: Select this checkbox to try to keep the average overall brightness of the image constant between the input and output images.

## grey tab

This tab allows you to convert a color image into a greyscale image. 

input red/green/blue
: Choose how much each of the R, G and B channels contribute to the grey level of the output. The image will only be converted to monochrome if the three sliders add up to some non-zero value. Adding more blue will tend to bring out more details, adding more red will tend to smooth skin tones.

normalize channels
: Select this checkbox to try to keep the overall brightness of the monochrome image constant as you adjust the sliders.

