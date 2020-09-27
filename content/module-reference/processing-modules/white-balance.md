---
title: white balance
id: white-blaance
applicable-verison: 3.4
tags: 
working-color-space: not-applicable (RAW) 
view: darkroom
masking: false
---

Set the white balance of the image by 

- altering the temperature and tint
- defining a value for each (RGB) channel, or 
- choosing from list of predefined white balances

The default settings for this module are derived from the image's Exif data.

# module controls

## scene illuminant temp

In this section there are scene illuminanant temperature and tint controls which set the white balace of the image. Click on the 'scene illuminant temp' label to cycle between 3 different slider color modes. See the _colored sliders_ section below for more information.

temperature
: Set the color temperature in Kelvin.

tint
: Alter the color tint of the image, from magenta (value `< 1`) to green (value `> 1`)

## white balance presets

setting
: Choose from a predetermined list of white balances. The available selections are dervied from the presets available on the camera that was used to take the photograph. The following options are provided in addition to the camera-defined white balance presets.

: _as shot_ (default): The white balance as reported by the camera

: _from image area_: Draw a rectangle over a neutral color in the image from which the white balance will be automatically calculated

: _user modifed_: The most recently modified setting. Adjusting temperature, tint or r/g/b channel coefficients will set any chosen setting to this option. Choosing this setting after trying any other preset will return values to their most recently modified state

: _camera reference_: Set the temperate to camera reference white point, which is assumed to be D65 (or ~6502K). The white balance channel multipliers are calculated so that the pure white in the camera colorspace is converted into pure white in sRGB D65 (where pure white means that each color channel has an equal value). 

_For convenience the final four modes can also be set by clicking on one of the buttons above the_ setting _drop-down._

finetune
: Finetune a specific white balance preset from camera. This is only shown if it is available for the camera in question. The direction of adjustment is dependent on the provided presets. If your camera doesn't have white balance presets available, check [this guide](https://github.com/darktable-org/darktable/wiki/White-balance-presets) to see how you can submit your own.

## channel coefficients

By default the RGB channel coefficients are hidden. Expand/collapse the channel coefficients section by clicking on either the 'channel coefficients' label or the adjacent "arrow" button.

red/green/blue
: Set the value of each RGB channel from `0` to `8`

# additional functionality

## colored sliders

By default the module's sliders are monochrome. However two flavors of colored sliders can be enabled in [`preferences` -> `darkroom` -> `white balance slider colors`](../../preferences-settings/darkroom.md) or by clicking on the 'scene illuminant temp' label in the module.

no color
: This is the default mode, meaning that background of the sliders is not colored at all.

illuminant color
: The slider colors represent the color of the light source, i.e. the color you are adjusting to in order to achieve neutral white

efect emulation
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

White balance is not a "creative" module, but technical module, meaning that the goal of the module's operation is to technically correct the white balance of the image making sure that neutral colors are really neutral. For creative color operations, please use other modules such as the [_channel mixer_](./channel-mixer.md) or the [_color balance_](./color-balance.md) module.

The only parameters from this module that are stored in the XMP sidecar and database are the channel coefficients. The temperature and tint are merely more user-friendly methods of setting those channel coefficients. The relationship between these two sets of values (channel coefficients and temperature/tint) depends on camera characteristics. Therefore applying white balance from a style made with one camera model to another camera model will, in general, not give consistent results.

The mathematical relationship between the two sets of values is not straightforward. It is possible to set the channel coefficients such that there is no valid equivalent setting in terms of temperature and tint (mainly where very high temperature values are calculated from the slider values). Editing white balance using temperature and tint on an image previously saved using channel coefficients may therefore give odd results, at least if high temperature values are involved.

