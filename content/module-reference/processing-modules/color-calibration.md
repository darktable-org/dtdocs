---
title: color calibration
id: color-calibration
applicable-verison: 3.4
tags: 
working-color-space:  
view: darkroom
masking: 
---

The _color calibration_ module takes Red, Green and Blue color channels as inputs, and uses matrix multiplication to mix those channels together and produce output Red, Green and Blue channels. This simple yet powerful technique can be used to achive a number of things:

- It can be used as a simple channel mixer, similar to the [_channel mixer_](channel-mixer.md) module. One difference is that it doesn't clip the channels exceeding a value of 1.0, meaning it is well suited for use as part of a linear scene-referred pipeline. Another difference is that the _color calibration_ module offers a "normalisation" feature to make it easier to adjust the mixer coefficients while minimising the imapact on other image attributes such as overall brightness.

- It can be used to white balance an image. In this case, it needs to work in tandem with the [_white balance](white-balance.md) module, The _white balance_ module does an initial rough white balance (assuming a D65 illuminant was used to light the scene), as this is required for the demosac module to work effectively. The _color calibration_ will then perfom a more accurate white balance after the input color profile has been applied, using more sophisticated algorithms than those available in the _white balance_ module_. To ensure that the two modules work together properly and don't conflict, [`preferences > processing > auto-apply chromatic adaptation defaults`](../../preferences-settings/processing.md) controls whether the tehincal white balancing is shared between the _color calibration_ and _white balance_ module, or whether the _white balance_ module will be soley responsible for technical white balancing. Neither option precludes the use of other modules such as [_color balance_](color-balance.md) further down the pixel pipeline for creative color grading.

- As well as mixing the R, G & B channels directly, the _color calibration_ module can make adjustments to color saturation and brightness of the image, based on the amounts of the red, green and blue components in each pixel.

- Like the _channel mixer_ module, the _color calibration_ module can be used to combine the R, G & B channels by different weightings in order to produce a monochrome image.

# Chromatic Adaptation Transformation (white balancing)

If the white balancing (Chromatic Adaptation Transformation, or CAT) capabilities have been enabled by setting [`preferences > processing > auto-apply chromatic adaptation defaults`](../../preferences-settings/processing.md) to _modern_, then the _white balance_ module is set up to do a simple white balance assuming a D65 illuminant, based on the standard matrix coefficients of the camera concerned, so that the demosaicing of the raw image can be performed. The rest of the white balancing is deferred to the _color calibration_ module. When using _color calibration_, the white balancing is done in a specially designed RGB space known as a _CAT space_. The CAT space could be CAT16 from the CIECAM 2016 color model, Bradfield linear from the ICC v4 standard, Bradfield non-linear, or even XYZ (this last one is mainly for testing and debugging). 

Once the CAT space is chosen, the white balancing method used within that space can be:

- Standardised CIE illuminants (by _illuminant_ we mean what was the color of the light that was used to illuminate the scene). These include daylight, incandescent, fluorescent, equi-energy and black-body illuminants, as well as LED lighting. These values are all pre-computed, so as long as your camera sensor is properly profiled, you can just use them as-is.

- For the Daylight and Planckian Black Body illuminants, because they lie near the Planckian locus, it makes sense to talk about "color temperature", and so a slider is provided to allow some fine adjustment along that locus. For other illuminants, the concept of "color temperature" doesn't make sense, and so there is no color temperature slider presented. If an illuminant that does not fall near the Planckian locus, then adjustments can be made manually us mentioned below.

- Manual color picker: if there is a neutral grey patch available in the image, that the color of the illuminant can be selected manually selected using the color picker, or can be manual specified using hue and saturation sliders. In cases wherre there is no suitable reference patch, the following two AI methods will likely give a better result, although which method is better will depend on the specifics of the image. These manual methods replace the "temperature" and "tint" sliders you may see in other software, since the concept of color temperature is no longer meaningful once we move too far off the Planckian locus.

- AI Auto-detection based on image surfaces: this gets the average color of image patches that have a high covariance between chroma channels in Yuv space and a high intra-channel variance. In other words, it looks for parts of the image that appear as though they should be grey, and discards flat colored surfaces that may be legitimately non-grey. It also discards chroma noise as well as chromatic aberrations.

- AI Auto-detection based on edges in the image: unlike the _white balance_ module auto-white balcing which relies on the "Grey World" assumption, this method of auto-detecting a suitable illuminant uses the "Grey Edge" assumption by calculating this gets the Minkowski p-norm (p = 8) of the laplacian and trying to minimize it. That is to say, it assumes that edges between objects should have the same gradient over all channels (grey edges). It is more sensitive to noise than the previous surface-based detection method.

Another important CAT-related feature _gamut handling_. When performing a white balance, colors in the image can get pushed out of gamut (that is, it may no longer be possible to represent certain colors as a valid [R,G,B] triplet with positive values in the working color space). By using a combination of _gamut compression_ (which uses XYZ scaling) and _negative RGB vaue clipping_, the colors can be squeezed back into gamut, albeit with some loss of hue accuracy. One example where this feature is very useful is for scenes where there are blue LED lights, which are often quite problematic and result in ugly gamut clipping in the final image.

It is also worth noting that, unlike the _white balance_ module,  _color calibration_ module works with masks. This means you can set up parametric and drawn masks to single out and apply CAT one one part of the image, and then create a second instance of the module to apply a CAT for a different iluminant on the rest of the image by inverting the mask.

# RGB matrix multiplication

At its most basic level, you can think of the _color calibration_ module as a type of matrix multiplication between a 3x3 matrix and the input [R G B] values. This is in fact very similar to what a matrix-based ICC color profile does, except that the user can input the matrix coefficients via the darktable GUI rather than reading the coefficients from a file.

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

# brightness and colorfulness

The brightness and colorfulness (color saturation) of pixels in an image can also be adjusted. This uses the same basic algorithm as what the [_filmic rgb_](filmic-rgb.md) module uses for tone mapping (which preserved RGB ratios) and for midtones saturation (which massages the RGB ratios). For example, if you want to darken the pixels which have a high blue component and brighten the ones having a high red component, you can do this by decreasing the blue slider and increasing the red slider on the brightness tab. Similarly, on the colorfulness tab, you can influence the overall color saturation of individual pixels based on how much of one component or another each pixel has.

# monochrome

Another very useful application of _color calibration_ is the ability to mix the channels together to produce a grayscale output -- a monochrome image. Select the _gray_ tab, and set the red, green and blue sliders to control how much each 
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

This tab will only be available if [`preferences > processing > auto-apply chromatic adaptation defaults`](../../preferences-settings/processing.md) is set to _modern_. In that case, the _white balance_ module will be forced into _camera reference_ (D65 illuminant) mode.

adaptation
: This menu selects the color space in which the module will do its work, for the chromatic adaptation transform as well as any channel mixing. It can work in the linear or non-linear Bradfield LMS color spaces, in the CIECAM16 LMS color space, or it can work directly in the XYZ color space (scaled by luminance Y). It is also possible to disable CAT white balancing altogether, in which case the module works in XYZ space. 

color picker icon
: Used to select a region in the image for spot white-balance, or to restrict the region considered by the AI auto-detect algorithms. The color swatch next to this icon shows the color of the illuminant (ie. the color of the light that was used to light up the scene) which will be used in the CAT compensation.

illuminant
: This menu selects the type of illuminant what should be assumed when doing the white balancing. It can be set to:

 - _same as pipeline (D50)_, where the D65 illuminant white balance parameters for the camera that was set by the _white balance_ module is adjusted to a D50 illuminant
 -  one of the CIE standard illuminants (daylight, incandescent, fluorescent, equi-energy, or black body), or a non-standard _LED light_ illuminant.
 - _custom_, in which case the illuminant color can be set using the color picker icon, or by setting the hue and chroma (saturation) in LCh perceptual color space using the sliders
 - _(AI) detect from image surfaces_, where the white balance is auto-detected, placing a greater weighting on colors in the image close to grey
 - _(AI) detect from image edges_, where the auto-balance is auto-detected, assuming the average differences across edges in the image are achromatic.
 - _as shot in camera_, in which case the illuminant will be calculated based on the white balance settings provided by the camera.

temperature
: For the standard illuminants, the _temperature_ slider allows you to adjust the color temperature of the illuminant. Moving the slider to the right means the illuminant is assumed to have been more blue, which will make the white-balanced picture appear warmer/more red after the white balance compensation in applied. Moving the slider to the left sets the illuminant to a more red color, which makes the image appear cooler/mor blue after compensation.

hue
: For custom white balance, the _hue_ slider allows the hue of illuminant color in LCh color space to be manually set.

chroma
: For custom white balance, the _chroma_ slider allows the Chroma (or saturation) of illuminant color in LCh color space to be manually set.

gamut compression
: Allows the color gamut to be compressed in order to bring out-of-gamut colors back into gamut, and avoid nasty "color clipping".

## R, G and B tabs

These tabs allow the red, green and blue channel outputs for each pixel to be make up of a weighted sum of the red, green and blue channel inputs. Each tab has 3 sliders, and there are 3 tabs, so the sliders are effectively setting the coefficients of a 3x3 matrix, just like in the _channel mixer_ module

input red/green/blue
: These sliders set the mix of how heavily the input R, G and B channels influence the output channel relating to the tab concerned.

normalize channels
: If this checkbox is selected, then the coefficients set on the sliders for this tab are normalised to try to preserve the overall brightness of this channel in the final image as compared to the input image. 

## colorfulness tab

input red/green/blue
: these sliders allow the color saturation of pixels in the image to be adjusted, depending on how much red, green or blue components those pixels contain. For example, adjusting the _input red_ slider will affect the color saturation of pixels containing a lot of red much more than colors containing only a small amount of red. 

normalize channels
: If this checkbox is selected, try to keep the average amount of overall saturation in the image constant between the input and output images.

## brightness tab

input red/green/blue
: these sliders allow the brightness of certain colors in the image to be adjusted, depending on how much red, green or blue components those colors contain. For example, adjusting the _input red_ slider will affect the brightness of colors containing a lot of red much more than colors containing only a small amount of red. When darkening/brightening a pixel, the ratio of the R, G and B channels for that pixel is maintained, in order to preserve the hue.

normalize channels
: If this checkbox is selected, try to keep the average overall brightness of the image constant between the input and output images.

## grey tab

This tab is useful to convert a color image into a greyscale image. 

input red/green/blue
: these sliders allow a weight to be set for how much each of the R, G and B channels contribute to the grey level of the output. The image will only be converted to monochrome if one of the sliders is moved away from zero. Adding more blue will tend to bring out more details, adding more red will tend to smooth over skin tones.

normalize channels
: If this checkbox is selected, try to keep the overall brightness of the monochrome image constant as you adjust the sliders.

