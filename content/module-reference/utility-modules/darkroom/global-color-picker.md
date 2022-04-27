---
title: global color picker
id: global-color-picker
applicable-version: 4.0
tags: 
view: darkroom
---

Take color samples from the current darkroom image, display their values in multiple ways and compare colors from different locations. 

The color picker is activated by pressing the color picker icon. The module's parameters will remain in effect until you leave the darkroom mode.

Besides the global color picker described here, many darktable modules (e.g. [_tone curve_](../../processing-modules/tone-curve.md)) also contain local color pickers which are used to set individual module parameters. You should be aware that these two forms of color picker do not always work in the same color space. The global color picker works in the histogram color space and takes its samples after the complete pixelpipe has been processed. Local color pickers run in the color space of the module in which they are activated and reflect the input or output data of that module within the pixelpipe.

You can right-click on the sampled color values to copy them to the clipboard.

As the global color picker runs at the end of the preview pixelpipe, it receives data in display color space then converts it to histogram color space. If you are using a display color space which is not "well behaved" (this is common for a device profile), then colors that are outside of the gamut of the display profile will clip or distort.

Hover over any of the color values to show a tooltip containing more detailed information about the picked color or live color sample. This information includes RGB and Lab values as well as an approximate color name. An attempt is also made to detect skin tones and provide an appropriate description. Skin tone detection needs proper Lightness scaling (44 to 48% for African and 58 to 64% for all others) and neutral white balance.

# module controls

point/area mode
: The global color picker can be activated in point or area mode by clicking or Ctrl+clicking on the color picker icon, respectively (you can also right-click to enable area mode). In point mode only a small spot under your cursor is taken as a sample. In area mode darktable samples the area within a drawn rectangle.

mean/min/max
: If samples are taken in area mode, darktable will calculate mean, minimum and maximum color channel values. This combobox allows you to select which of those are displayed. For obvious statistical reasons mean, min and max are identical for the single sample of point mode.

color swatch / color values
: A color swatch representing the sampled point or area is displayed alongside numerical values. Clicking on the swatch will toggle on/off a much larger swatch for easier viewing.

: The global color picker works in display RGB color space, though you may choose (by selecting from the drop-down) to translate these numerical values into another color space. Beware that values in other color spaces are approximated here -- depending on the display color profile there may be some deviations from the actual values.

live samples
: The sampled colors (in either area or point mode) can be stored as live samples by pressing the "add" button. A color swatch and numerical values will be shown for each stored sample. You can change the numerical value (mean, min, max) and color space to display.

: Newly created live samples are not locked. If you change your image processing those changes will be reflected in the live samples. This can be used to see how an altered parameter affects different parts of the image. Clicking on a live sample's color swatch locks it and a lock symbol is displayed. Further image changes will then no longer affect the sample. You can use this to compare two live samples by locking just one of them, thus providing a before and after comparison.

: If you hover the mouse over the "delete" button of one of the live sample entries, the selected region for that sample will be highlighted in the image preview.

display samples on image/vectorscope
: When this checkbox is ticked, live sample locations are visually indicated on the image and the vectorscope view of the [scopes](../shared/scopes.md#vectorscope) module.

restrict scope to selection
: When this checkbox is ticked, only the values of the selected area or point are taken into account by the regular and waveform views of the [scopes](../shared/scopes.md) module. This allows you to see what tonal values are present in the selected area. When using a color picker in a processing module, this option restricts the scope to the picked area from the processing module instead of the global color picker.

