---
title: white balance
id: white-blaance
applicable-verison: 3.4
tags: 
working-color-space: not-applicable (RAW) 
view: darkroom
masking: false
---

Set the white balance of the image by (a) altering the temperature and tint, (b) defining a value of each (RGB) channel, or \(c\) choosing from list of predefined white balances.

The default settings for this module are derived from the image's Exif data.

## Module Controls

### scene illuminant temp

In this section there are scene illuminanant temperature and tint controls which set the white balace of the image. Click on 'scene illuminant temp' to cycle between 3 different slider color modes.

temperature
: Set the color temperature in Kelvin.

tint
: Alter the color tint of the image, from magenta (value `< 1`) to green (value `> 1`)

### white balance presets

setting
: Choose from a predetermined list of white balances. The available selections are dervied from the presets available on the camera that was used to take the photograph. The following options are provided in addition to the camera-defined white balance presets.

: **as shot** (default): The white balance as reported by the camera

: **from image area**: Draw a rectangle over a neutral color in the image from which the white balance will be automatically calculated

: **user modifed**: Most recently modified setting. Adjusting temperature, tint or r/g/b channel coefficients will set any chosen setting to this option. Choosing this setting after trying any other preset will return values to their most recently modified state

: **camera reference**: Set the temperate to camera reference white point, which is assumed to be D65 (or ~6502K). The white balance channel multipliers are calculated so that the pure white in the camera colorspace is converted into pure white in sRGB D65 (where pure white means that each color channel has an equal value). 

: For convenience the final four modes can also be set by clicking on one of the buttons above the **_setting_** drop-down.

finetune
: Finetune specific white balance preset from camera. Only shown if available. Direction of adjustment is dependent on provided presets. If your camera doesn't have white balance presets available, check [this guide](https://github.com/darktable-org/darktable/wiki/White-balance-presets) to see how to submit your own.

### channel coefficients

By default the RGB channel coefficients are hidden. Expand/collapse the channel coefficients section by clicking on either the 'channel coefficients' header or the adjacent "arrow" button.

red/green/blue
: Set the value of each RGB channel from `0` to `8`

## Module reference

### colored sliders

By default the module doesn't enable colored sliders, since that's the way the module used to work. However in order to have better UX, the 2 new modes of colored sliders have been added and can be enabled in `preferences` -> `darkroom` -> `white balance slider colors` or by clicking on `scene illuminant temp` header in the module.

no color
: it's the default mode, meaning background of sliders is not colored at all, retaining clarity of uniform gray

illuminant color
: the slider colors represent the color of the light source, i.e. what you are adjusting to in order to achieve neutral white

efect emulation
: the slider colors represent the effect the adjustment would have had on the scene. this is how most other raw processors show temperature/tint sliders colors.

### button bar

Button bar is simple addition to have one-click access to internal white balance settings. If you believe it clutters the interface you can disable it by editing your `darktablerc` file: find line that says

```
plugins/darkroom/temperature/button_bar=TRUE
```

and change it to:
```
plugins/darkroom/temperature/button_bar=FALSE
```
