---
title: Default Module Order
id: module-order
weight: 70
draft: false
author: "people"
---

The following sections describe the default module order in the new scene-referred workflow and the legacy display-referred workflow.

# Scene-referred default module order

The default ordering of modules when using the new scene-referred workflow is as follows:

1. **raw black/white point**
2. invert
2. **white balance**
2. **highlight reconstruction**
2. chromatic aberrations
2. hot pixels
2. *raw denoise*
2. demosaic
2. denoise (profiled)
2. *denoise (bilateral filter)*
2. *rotate pixels*
2. *scale pixels*
2. lens correction
2. haze removal
2. perspective correction
2. **orientation**
2. crop and rotate
2. liquify
2. spot removal
2. retouch
2. **exposure**
2. mask manager
2. tone mapping
2. tone equalizer
2. graduated density
2. unbreak_input_profile
2. *legacy equalizer*
2. **input color profile**
2. negadoctor
2. *denoise (non-local means)*
2. color look up table
2. defringe
2. contrast equalizer
2. lowpass
2. highpass
2. sharpen
2. lut 3D
2. color transfer
2. color mapping
2. channel mixer
2. basic adjustments
2. color balance
2. *rgb curve*
2. *rgb levels*
2. *basecurve*
2. *filmic (legacy)*
2. **FILMIC RGB** -- transition from scene-referred to display-referred space
2. *contrast brightness saturation*
2. *tone curve*
2. *levels*
2. *shadows and highlights*
2. *zone system*
2. *global tonemap*
2. *fill light*
2. local contrast
2. *color correction*
2. *color contrast*
2. velvia
2. vibrance
2. color zones
2. *bloom*
2. colorize
2. lowlight vision
2. *monochrome*
2. grain
2. soften
2. split-toning
2. vignetting
2. color reconstruction
2. **output color profile**
2. dithering
2. framing
2. watermark

**Key:**
* _italic_: not recommended for scene-referred workflow
* **bold**: module on by default

# Legacy/display-referred default module order

The default ordering of modules when using the legacy display-referred workflow is as follows:

1. **raw black/white point**
2. invert
2. **white balance**
2. **highlight reconstruction**
2. chromatic aberrations
2. hot pixels
2. raw denoise
2. demosaic
2. mask manager
2. denoise (profiled)
2. tone mapping
2. exposure
2. spot removal
2. retouch
2. lens correction
2. perspective correction
2. liquify
2. rotate pixels
2. scale pixels
2. orientation
2. crop and rotate
2. tone equalizer
2. graduated density
2. **BASE CURVE**  -- default transition between scene-referred and diaplay-refered space
2. denoise (bilateral filter)
2. unbreak input profile
2. haze removal
2. **input color profile**
2. negadoctor
2. basic adjustments
2. color reconstruction
2. color look up table
2. defringe
2. legacy equalizer
2. vibrance
2. color balance
2. colorize
2. color transfer
2. color mapping
2. bloom
2. denoise (non-local means)
2. global tonemap
2. shadows and highlights
2. contrast equalizer
2. local contrast
2. color zones
2. lowlight vision
2. monochrome
2. filmic (legacy)
2. filmic rgb
2. contrast brightness saturation
2. zone system
2. tone curve
2. levels
2. rgb levels
2. rgb curve
2. fill light
2. color correction
2. **sharpen**
2. lowpass
2. highpass
2. grain
2. lut 3D
2. color contrast
2. **output color profile**
2. channel mixer
2. soften
2. vignetting
2. split-toning
2. velvia
2. dithering
2. framing
2. watermark
