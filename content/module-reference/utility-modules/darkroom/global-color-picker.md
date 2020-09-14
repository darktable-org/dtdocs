---
title: Utility Module - Global Color Picker (darkroom)
id: global-color-picker
date: 2020-09-13
draft: false
---

Take color samples from the current darkroom image, display their values in multiple ways and compare colors from different locations. The color picker is activated by pressing the color picker icon. There are multiple parameters for controlling how the color picker works, whose settings remain in effect until you leave the darkroom mode.

Besides the global color picker described here there are also local color pickers in some of the modules (eg. tone curve). Global and local color pickers are different. The global color picker works in monitor color space and takes samples after the complete pixelpipe has been processed. The local color pickers run in the color space of the individual module. They reflect the input and output data of that specific module within the pixelpipe.

# Module Controls

point/area mode
: The global color picker can be run in point or area mode. When in point mode only a small spot under your cursor is taken as a sample. In area mode you can draw a rectangle and darktable samples the area within that rectangle. The combobox to switch between point and area mode can also be used to toggle the mode of local color pickers.

mean/min/max
: If samples are taken in area mode, darktable will calculate mean, min and max color channel values. A combobox allows you to select which of those are displayed. For obvious statistical reasons mean, min and max are identical for the single sample of point mode.

color swatch / color values
: A color swatch representing the sampled point or area is displayed. Numerical values are shown as well. The global color picker works in monitor RGB color space. Select    "Lab" to translate these numerical values into Lab color space. Beware that Lab values are approximated here; depending on the monitor color profile there can be some deviations from the actual values.

restrict histogram to selection
: When this checkbox is ticked, only the values of the selected area or point are taken into account by the main histogram at the top of the right hand panel. This allows you to see what tonal values are present in a specific area.

live samples
: The sampled colors (in either area or point mode) can be “stored” as live samples by pressing the “add” button. A color swatch and numerical values will be shown for each stored sample. You can select which numerical value (mean, min, max) is to be displayed and whether the display should be in RGB or Lab color space.

: Newly created live samples are not locked. If you change your image the changes will be reflected in your live samples. This can be used to show you how changing parameters affects different parts of an image. Clicking on a live sample's color swatch locks it and a lock symbol is displayed. Further image changes will then no longer affect the sample. You can, for example, take two live samples from the same location and lock just one of them to provide a before and after comparison.

: Live sample locations are indicated in your image if you check option “display sample areas on image”. 