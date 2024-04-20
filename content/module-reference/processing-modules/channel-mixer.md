---
title: (deprecated) channel mixer
id: channel-mixer
weight: 20
applicable-version: 3.4
tags: 
working-color-space:  
view: darkroom
masking: 
---

---

**Please note that this module is [deprecated](../../darkroom/processing-modules/deprecated.md) from darktable 3.4 and should no longer be used for new edits. Please use the [_color calibration_](./color-calibration.md) module instead.**

---

A simple yet powerful tool to manage color channels.  

This module accepts red, green and blue channels as an input and provides red, green, blue, gray, hue, saturation and lightness channels as output. It allows you to independently control how much each input channel contributes to each output channel.

# RGB matrix multiplication

You can think of the _channel mixer_ as a type of matrix multiplication between a 3x3 matrix and the input [R G B] values.

```
┌ R_out ┐     ┌ Rr Rg Rb ┐     ┌ R_in ┐
│ G_out │  =  │ Gr Gg Gb │  X  │ G_in │
└ B_out ┘     └ Br Bg Bb ┘     └ B_in ┘
```

If, for example, you've been provided with a matrix to transform from one color space to another, you can enter the matrix coefficients into the _channel mixer_ as follows:

- set the destination to _red_ then set the Rr, Rg & Rb values using the red, green and blue sliders
- set the destination to _green_ then set the Gr, Gg & Gb values using the red, green and blue sliders 
- set the destination to _blue_ then set the Br, Bg & Bb values using the red, green and blue sliders 

By default, _channel mixer_ just copies the input [R G B] channels straight over to the matching output channels. This is equivalent to multiplying by the identity matrix:

```
┌ R_out ┐     ┌ 1  0  0 ┐      ┌ R_in ┐
│ G_out │  =  │ 0  1  0 │   X  │ G_in │
└ B_out ┘     └ 0  0  1 ┘      └ B_in ┘
```

As an example use case, the following matrix is useful for taming ugly out-of-gamut blue LED lights by making them more magenta:

```
┌  1.00  -0.18  0.18 ┐ 
│ -0.20   1.00  0.20 │
└  0.05  -0.05  1.00 ┘ 
```

In this case it is useful to use a [parameteric mask](../../darkroom/masking-and-blending/masks/parametric.md) to limit the effect of the _channel mixer_ to just the problematic colors.

A more intuitive take for what the _channel mixer_ sliders do:

- for the _red_ destination, adjusting sliders to the right will make the R, G or B areas of the image more red. Moving the slider to the left will make those areas more cyan.
- for the _green_ destination, adjusting sliders to the right will make the R, G or B areas of the image more green. Moving the slider to the left will make those areas more magenta.
- for the _blue_ destination, adjusting sliders to the right will make the R, G or B areas of the image more blue. Moving the slider to the left will make those areas more yellow.


# monochrome

Another very useful application of the _channel mixer_ is the ability to mix the channels together to produce a grayscale output -- a monochrome image. Use the _gray_ destination, and set the red, green and blue sliders to control how much each channel contributes to the brightness of the output. This is equivalent to the following matrix multiplication:
```
GRAY_out  =   [ r  g  b ]  X  ┌ R_in ┐
                              │ G_in │
                              └ B_in ┘
```

When dealing with skin tones, the relative weights of the three channels will affect the level of detail in the image. Placing more weight on red (e.g. [0.9, 0.3, -0.3]) will make for smooth skin tones, whereas emphasising green (e.g. [0.4, 0.75, -0.15]) will bring out more detail. In both cases the blue channel is reduced to avoid emphasising unwanted skin texture.

Different types of traditional black and white film have differing sensitivities to red, green and blue colors, and this can be simulated by setting the gray destination coefficients appropriately. The _channel mixer_ module has a number of built-in presets that can be used to achieve this.

# module controls

destination
: Select the destination channel that will be affected by the slider settings immediately below. The red, green and blue destination channels are used for color mixing as described in the _matrix multiplication_ section above. The gray channel is used for making grayscale images as described in the _monochome_ section above. It is also possible to define the R, G & B input channels to produce HSL (hue, saturation and lightness) values on the output, although this is a very specialised application.

red
: Defines how much the red input channel should contribute to the selected destination channel.

green
: Defines how much the green input channel should contribute to the selected destination channel.

blue
: Defines how much the blue input channel should contribute to the selected destination channel.

