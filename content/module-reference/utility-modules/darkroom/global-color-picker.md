---
title: global color picker
id: global-color-picker
applicable-verison: 3.2.1
tags: 
view: darkroom
---

Take color samples from the current darkroom image, display their values in multiple ways and compare colors from different locations. 

The color picker is activated by pressing the color picker icon. The module's parameters will remain in effect until you leave the darkroom mode.

Besides the global color picker described here, many darktable modules (e.g. [_tone curve_](../../processing-modules/tone-curve.md)) also contain local color pickers which are used to set individual module parameters. You should be aware that these two forms of color picker do not always work in the same color space. The global color picker works in monitor color space and takes its samples after the complete pixelpipe has been processed. Local color pickers run in the color space of the module in which they are activated and reflect the input or output data of that module within the pixelpipe.

# module controls

point/area mode
: The global color picker can be run in point or area mode by `clicking` or `Ctrl+clicking` on the color picker icon, respectively. When in point mode only a small spot under your cursor is taken as a sample. In area mode you can draw a rectangle and darktable samples the area within that rectangle.

mean/min/max
: If samples are taken in area mode, darktable will calculate mean, minimum and maximum color channel values. This combobox allows you to select which of those are displayed. For obvious statistical reasons mean, min and max are identical for the single sample of point mode.

color swatch / color values
: A color swatch representing the sampled point or area is displayed alongside numerical values. Clicking on the swatch will toggle on/off a much larger swatch for easier viewing.

: The global color picker works in monitor RGB color space. Select "Lab" to translate these numerical values into Lab color space. Beware that Lab values are approximated here. Depending on the monitor color profile there may be some deviations from the actual values.

live samples
: The sampled colors (in either area or point mode) can be stored as live samples by pressing the “add” button. A color swatch and numerical values will be shown for each stored sample. You can select which numerical value (mean, min, max) is to be displayed and whether the display should be in RGB or Lab color space.

: Newly created live samples are not locked. If you change your image those changes will be reflected in your live samples. This can be used to show you how changing a parameter affects different parts of an image. Clicking on a live sample's color swatch locks it and a lock symbol is displayed. Further image changes will then no longer affect the sample. You can use this to compare two live samples by locking just one of them, providing a before and after comparison.

: If you hover the mouse over the "delete" button of one of the live sample entries, the selected region for that sample will be highlighted in the image preview.

display sample areas on image
: When this checkbox is ticked, live sample locations are visually indicated on your image. 

restrict histogram to selection
: When this checkbox is ticked, only the values of the selected area or point are taken into account by the main histogram at the top of the right hand panel. This allows you to see what tonal values are present in a specific area.

