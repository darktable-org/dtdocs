---
title: color calibration
id: color-calibration
applicable-verison: 3.4
tags: 
working-color-space:  
view: darkroom
masking: 
---

This module is designed to be a replacement for the old [_channel mixer_](channel-mixer.md) module. Like that previous module, it allows R, G and B channels to be mixed togather, but it has a number of improvements

- The modules normally works in an LMS color space (based around the long, medium and short wavelength cones in the human eye), and this space is well-suited for Chromatic Adaptation Transform (CAT), more generally known to photographers as white balancing. Therefore, the first tab of this module is dedicated to providing white-balancing features that are more accurate than the primitive and inaccurate white balancing methods offered by the [_white balance_](white-balance.md) module. In order to take advantage of these features, the _white balance_ module needs to be set in "camera reference" mode, which applies the camera's basic D65 white balancing parameters to act as a base for the _color correction_ module to work on.

- It provides the complete set of standard CIE illuminants (daylight, incandescent, fluorescent, equi-energy and black body), plus the ability to provide custom white balancing using a color picker or LCh color space hue and chroma (saturation) sliders.

- The _white balance_ module provides a simplistic auto-white balance detection based on the "Grey World" assumption. The _color calibration_ module provides more sophisticated white balance detection techniques which use AI techniques to focus more on the grey surfaces in the image, or to use the "Grey Edge" assumption which assumes that average edge differences in the image are achromatic. It can also read and apply the auto white-balance settings from the camera.

- This module uses linear transforms to move between pipeline RGB -> XYZ -> LMS color spaces, and doesn't clip the R, G and B channels to have a value less than 1.0, which makes it suitable for a linear scene-referred workflow. It does however offer the possibility to clip negative pixels which correspond to imaginary colors (particularly in the blues) that can arise as a result of the white balancing process. It offers a gamut compressiion function that is useful for managing out-of-gamut colors, which is also very useful for scenes lit by blue LED lighting.

- When mixing the R, G and B channels, it offers a "normalisation" option that attempts to maintain a constant average luminance when adjusting the sliders (although it doesn't compensate for the Helmholtz-Kohlrauch effect where hue shifts are percieved as changes in brightness). 

- There are two new tabs which allow "colorfulness" (saturation) and "brightness" to be adjusted based on a mix of the R, G and B channels. This is based on the same color science features in the [_filmic rgb v4_](filmic-rgb.md) module, which preserves color channel ratios using a normalisation function.

- Like the original _channel mixer_, the _color calibration_ module also allows the R, G, B channels to be mixed to produce a greyscale image.

# module controls

## CAT tab

adaptation
: This menu selects the color space in which the module will do its work, for the chromatic adaptation transform as well as any channel mixing. It can work in the linear or non-linear Bradfield LMS color spaces, in the CIECAM16 LMS color space, or it can work directly in the XYZ color space (scaled by luminance Y). It is also possible to disable CAT white balancing altogether, in which case the module works in XYZ space. 

---

**Note:*** If the CAT in this module has not been disabled, then the _white balance_ module should be placed in "camera reference" mode. 
---

color picker icon
: Used to select a region in the image for spot white-balance, or to restrict the region considered by the AI auto-detect algorithms. The color swatch next to this icon shows the color of the illuminant which will be used in the CAT compensation.

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
: these sliders allow the saturation of the red, green and blue channels to be adjusted separately.

normalize channels
: If this checkbox is selected, try to keep the average amount of overall saturation in the image constant between the input and output images.

## brightness tab

input red/green/blue
: these sliders allow the brightness of the red, green and blue channels to be adjusted separately.

normalize channels
: If this checkbox is selected, try to keep the average overall brightness of the image constant between the input and output images.

## grey tab

This tab is useful to convert a color image into a greyscale image. 

input red/green/blue
: these sliders allow a weight to be set for how much each of the R, G and B channels contribute to the grey level of the output. The image will only be converted to monochrome if one of the sliders is moved away from zero. Adding more blue will tend to bring out more details, adding more red will tend to smooth over skin tones.

normalize channels
: If this checkbox is selected, try to keep the overall brightness of the monochrome image constant as you adjust the sliders.

