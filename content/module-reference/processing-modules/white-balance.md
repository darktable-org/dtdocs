---
title: white balance
id: white-blaance
applicable-verison: 3.4
tags: 
working-color-space: not-applicable (RAW) 
view: darkroom
masking: false
---

Adjust the white balance of the image by altering the temperature and tint, defining a coefficient for each (RGB) channel, or choosing from list of predefined white balance settings.

The default settings for this module are derived from the camera white balance stored in the image's Exif data.

White balance is not intended as a "creative" module -- its primary goal is is to technically correct the white balance of the image ensuring that neutral colored objects in the scene are rendered as neutral colors in the image. For creative color operations, it is usually better to use other modules such as the [_color calibration_](./color-calibration.md) or the [_color balance_](./color-balance.md) module.

# module controls

## scene illuminant temp

This section provides scene-illuminanant _temperature_ and _tint_ controls to adjust the white balace of the image. Click on the 'scene illuminant temp' label to cycle between 3 different slider color modes. See the _colored sliders_ section below for more information.

temperature
: Set the color temperature in Kelvin.

tint
: Alter the color tint of the image, from magenta (value < 1) to green (value > 1)

## white balance presets

setting
: Choose from a predetermined list of white balances. The available selections are dervied from the presets available in the camera that was used to take the photograph. The following options are provided in addition to any camera-defined white balance presets.

: - _as shot_ (default): The white balance as reported by the camera

: - _from image area_: Draw a rectangle over a neutral color in the image from which the white balance will be automatically calculated

: - _user modifed_: The most recently modified setting. Manual adjustment of temperature, tint or r/g/b channel coefficients will automatically select this option. Choosing this setting after selecting any other preset will return parameters to the most recent user-modified state

: - _camera reference_: Set the temperate to the camera reference white point, which is assumed to be D65 (or ~6502K). The white balance channel multipliers are calculated such that pure white in the camera colorspace is converted into pure white in sRGB D65 (where pure white means that each color channel has an equal value). 

For convenience the final four modes can also be set by clicking on one of the buttons above the _setting_ drop-down.

finetune
: Finetune a camera-specific white balance preset. This is only shown if it is available for the camera in question. The direction of adjustment is dependent on the provided presets. If your camera doesn't have white balance presets available, check [this guide](https://github.com/darktable-org/darktable/wiki/White-balance-presets) to see how you can submit your own.

## channel coefficients

By default the RGB channel coefficients are hidden. You can expand/collapse the channel coefficients section by clicking on either the 'channel coefficients' label or the adjacent triangular button.

red/green/blue
: Set the value of each RGB channel from 0 to 8

# additional functionality

## colored sliders

By default the module's sliders are monochrome. However two flavors of colored sliders can be enabled in [preferences > darkroom > white balance slider colors](../../preferences-settings/darkroom.md) or by clicking on the 'scene illuminant temp' label in the module.

no color
: This is the default mode, meaning that background of the sliders is not colored at all.

illuminant color
: The slider colors represent the color of the light source (the color you are adjusting to in order to achieve neutral white).

effect emulation
: The slider colors represent the effect the adjustment would have had on the scene. This is how most other raw processors show temperature/tint sliders colors.

## button bar

The button bar is simple addition to allow one-click access to the internal white balance settings. If desired, you can disable this by editing your `darktablerc` file. Find line that says

```
plugins/darkroom/temperature/button_bar=TRUE
```

and change it to:

```
plugins/darkroom/temperature/button_bar=FALSE
```

# usage warning

The only parameters that are used internally by this module's operation are the _rgb channel coefficients_, with the _temperature_ and _tint_ sliders provided merely as more user-friendly ways to adjust those parameters. The relationship between the channel coefficients and temperature/tint sliders depends on camera-specific characteristics. This means that applying the white balance settings from an image made with one camera model to an image made with another model will, in general, not give consistent results.

The mathematical relationship between the two sets of values is not straightforward. It is possible to set the channel coefficients such that there is no valid equivalent setting in terms of temperature and tint (mainly where very high temperature values are calculated from the slider values). Editing white balance using temperature and tint on an image previously edited using channel coefficients may therefore give odd results, at least where high temperature values are involved.
