---
title: white balance
id: white-blaance
weight: 10
applicable-version: 3.4
tags: 
working-color-space: not-applicable (RAW) 
view: darkroom
masking: false
---

Adjust the white balance of the image by altering the temperature and tint, defining a coefficient for each RGB channel, or choosing from list of predefined white balance settings.

The default settings for this module are derived from the camera white balance stored in the image's Exif data.

White balance is not intended as a "creative" module -- its primary goal is to technically correct the white balance of the image ensuring that neutral colored objects in the scene are rendered with neutral colors in the image. For creative color operations, it is usually better to use other modules such as [_color calibration_](./color-calibration.md) or [_color balance rgb_](./color-balance-rgb.md).

---

**Note:** The [_color calibration_](./color-calibration.md) module now provides a more modern and flexible method of controlling white balance. The _color calibration_ module can be enabled by default for new images by selecting "scene-referred" (filmic or sigmoid) in [preferences > processing > auto-apply pixel workflow defaults](../../../preferences-settings/processing.md). Some basic settings are still required (and applied automatically) in the _white balance_ module, so that [_demosaic_](./demosaic.md) works correctly.

---

# module controls

## scene illuminant temp

This section provides scene-illuminant _temperature_ and _tint_ controls to adjust the white balance of the image. Click on the 'scene illuminant temp' section label to cycle between 3 different [color modes](#colored-sliders) for the temperature/tint sliders. 

temperature
: Set the color temperature in kelvin.

tint
: Alter the color tint of the image, from magenta (tint < 1) to green (tint > 1).

## white balance presets

setting
: Choose from a predetermined list of white balances. The available settings are derived from the presets available in the camera used to take the photograph. The following options are provided in addition to any camera-defined white balance presets.

: - _as shot_ (default): The white balance as reported by the camera

: - _from image area_: Draw a rectangle over a neutral color in the image to calculate white balance from that area.

: - _user modified_: The most recently modified setting. Manual adjustment of temperature, tint or r/g/b channel coefficients will automatically select this option. Choose this setting after selecting any other preset to return parameters to the most recent user-modified state

: - _camera reference_: Set the temperature to the camera reference white point, which is assumed to be D65 (or ~6502K). The white balance channel multipliers are calculated such that pure white in the camera colorspace is converted into pure white in sRGB D65 (where pure white means that each color channel has an equal value). 

For convenience the final four modes can also be set by clicking on one of the buttons in the [button bar](#button-bar) above the _setting_ drop-down.

finetune
: Finetune a camera-specific white balance preset. This is only shown if it is available for the camera in question. The direction of adjustment is dependent on the provided presets. If your camera doesn't have white balance presets available, check [this guide](https://github.com/darktable-org/darktable/wiki/White-balance-presets) to see how you can submit your own.

## channel coefficients

The RGB channel coefficients are automatically calculated from the above parameters and, as such, are hidden by default. You can expand/collapse the channel coefficients section by clicking on either the 'channel coefficients' label or the adjacent triangular button.

red/green/blue
: Set the value of each RGB channel coefficient from 0 to 8

# additional functionality

## colored sliders

By default the module's sliders are monochrome. However, two flavors of colored sliders can be enabled in [preferences > darkroom > white balance slider colors](../../preferences-settings/darkroom.md) or by clicking on the 'scene illuminant temp' section label in the module.

no color (default)
: The background of the sliders is not colored.

illuminant color
: The slider colors represent the color of the light source (the color you are adjusting to in order to achieve neutral white).

effect emulation
: The slider colors represent the effect the adjustment would have had on the scene. This is how most other raw processors show temperature/tint sliders colors.

## button bar

The button bar is simple addition that allows one-click access to the internal white balance settings. You can disable this by editing your `darktablerc` file. Find the line that says

```
plugins/darkroom/temperature/button_bar=TRUE
```

and change `TRUE` to `FALSE`.

# usage warning

The only parameters that are used internally by this module's operation are the _rgb channel coefficients_. The _temperature_ and _tint_ sliders are provided as a more user-friendly way to adjust those parameters. The relationship between the channel coefficients and temperature/tint sliders depends on characteristics specific to the camera used to take the photograph. This means that applying white balance settings from an image made with one camera to an image made with another will, in general, not give consistent results.

The mathematical relationship between the two sets of values is not straightforward. It is possible to set the channel coefficients such that there is no valid equivalent temperature and tint setting (mainly where very high temperature values are calculated from the sliders). Editing white balance using temperature and tint on an image previously edited using channel coefficients may therefore give odd results, at least where high temperature values are involved.
