---
title: color recostruction
id: color-reconstruction
applicable-verison: 3.2.1
tags: 
working-color-space: Lab 
view: darkroom
masking: true
---

Recover color information in blown-out highlights.

Due to the nature of digital sensors, overexposed highlights are lacking valid color information. Most frequently they appear neutral white or exhibit some color cast – depending on what other image processing steps are involved. This module can “heal” overexposed highlights by replacing their colors with better fitting ones. The module acts on highlight pixels whose luminance values exceed a user defined threshold. Replacement colors are taken from neighboring pixels. Both the spatial distance and the luminance distance (range) are taken into account for color selection.

Due to a limitation of the underlying algorithm reconstructed colors may sometimes be displayed incorrectly if you zoom into the image in the darkroom view. If this happens you might observe a magenta shift in highlight areas close to high contrast edges, or you might see colorless highlight areas when used alongside the “reconstruct color” method of the _highlight reconstruction_ module. These artifacts only influence on-screen image display – the final output remains unaffected. It is recommended that you finetune the parameters of this module only when viewing the fully zoomed-out image.

## Module Controls

threshold
: The color reconstruction module replaces the color of all target pixels having luminance values above this threshold. Only pixels with luminance values below this threshold are taken as valid source pixels for replacement colors. Setting this parameter too high will cause the module to have no effect on any pixels. Setting it too low will minimize the “pool” of replacement colors – if no suitable colors are available the original colors are maintained. Therefore, this parameter exhibits a “sweet spot” characteristic with an optimum setting depending on the individual image.

spatial extent
: The spatial distance that source pixels may have from target pixels in order for them to contribute to color replacement. Higher values cause ever more distant pixels to contribute. This increases the chance of finding a replacement color but makes that color more undefined and less clear.

range extent
: The range distance (difference in luminance values) that source pixels may have from target pixels in order for them to contribute to color replacement. Higher values cause more pixels to contribute even if their luminance differs more strongly from the target pixels. This again increases the chance of finding a replacement color but at the same time increases the risk of unfitting colors creeping in.

precedence
: This combobox defines if certain replacement colors shall take precedence over others as follows:

: **off** (default): all pixels contribute equally
: **saturated colors**: pixels contribute according to their chromaticity – the higher saturated a color the more it contributes
: **hue**: give precedence to a specific hue (see below)

hue
: This slider is only visible if you set the _precedence_ to “hue”. It allows you to select a preferred hue of replacement colors. This only has an effect if the preferred hue is actually present within the selected spatial and range distance of the target pixels (see above). A typical use case is repairing highlights on human skin in situations where diverging colors are in close proximity (e.g. textiles or hair with a luminance close to skin). Setting a hue preference on skin tones avoids these other colors from creeping in.