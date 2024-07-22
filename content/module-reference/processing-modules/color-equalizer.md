---
title: color equalizer
id: color-equalizer
weight: 10
applicable-version: 4.8
tags: color color-processing
working-color-space: UCS
view: darkroom
masking: true
include_toc: true
---

Selectively adjust the hue, saturation, and brightness of pixels based on the color.

Color Equalizer is essentially an implementation of the Color Zones module, but works in the scene referred part of darktable's pixelpipe.

This module works in darktable's UCS 22 color space.

he entire hue range is represented as a curve with eight overlapping sections divided by eight fixed nodes. Choose whether you wish to adjust (select) pixels based on their hue, saturation, and brightness. You can then use the equalizer interface nodes, on their respective tabs, to adjust the hue, saturation, and brightness of ranges of pixels selected via this method.

The distances between nodes cannot be changed but all nodes together can be moved by +/- 23 degrees along the color wheel using the node placement slider.

---

**Note**: Because all processing in color  equalizer is based on the hue data of each pixel, it can result in increased chroma noise or even increased luma noise if a lot of brightness changes are applied.

---

# module controls

## hue tab

Click+drag the control points on the curve to change the color of all pixels where the mask includes the given color.

## saturation tab

Click+drag the control points on the curve to change the saturation of all pixels where the mask includes the given color.

## brightness tab

Click+drag the control points on the curve to change the lightness of all pixels where the mask includes the given color.

## node placement

node placement
: Move the position of the nodes horizontally.

-   By moving the node with the left mouse button pressed.
-   Clicking on the node with the right mouse button opens a multi-functional pop-up window where the numerical values can be entered or manipulated by using the arrow keys on the keyboard:

![ce_pop_up](https://github.com/user-attachments/assets/7a967e81-be82-4100-b60c-c76841256add)


- When hovering the mouse cursor over the node  (the node turns white) and scrolling the mouse wheel while holding down the ctrl+shift keys. Finer steps can be achieved by holding down only the ctrl key.


: Use the color picker to show a color from the photo on the equalizer interface.

## options

white level
: Set the upper bound for the brightness correction via the slider or picker.

hue curve
: Control how the curve is interpolated between control points. Move the slider to the right to make the transitions between the control points more gradual. Move the slider to the left for a sharper transition, but beware that this can result in harsher transitions.
## guided filter
Guided filter can help to prevent or at least reduce the harsh overlap between manipulated and non-manipulated areas. It is particularly useful for noisy photos or areas with strong local color variations that could lead to strong local color contrasts or steep color gradations.

Here is a piece of meadow with darkened green grass without…

![ce_guided_off](https://github.com/user-attachments/assets/6b598b31-f285-4202-ba24-257f886fd804)
...and with the guided filter switched on. With the guided filter the texture of the grass looks much softer and calmer:

![ce_guided_on](https://github.com/user-attachments/assets/cd0960ee-aa76-486e-bcf0-67827cb9ba83)


use guided filter
: Enable or disable the use of the guided filter to separate each color node.

hue analysis radius

Guided filter that is used for the chroma analysis which pixels should be considered for manipulation. 

The point here is to take into account not only the pixels themselves, but also the _area around them defined by the radius of guided filter_, which ensures that, for example, in the case of very noisy photos or photos with Moiré stripes, the areas between pixels are also taken into account which, in those cases, ensures a more “homogeneous” selection.

Here is an example with a noisy photo of the clothing with Moiré stripes. Hue analysis radius is in its default position (1.5. px):

![ce_moire_1](https://github.com/user-attachments/assets/4538532c-a646-4543-8359-0e4dc51335ce)

With hue analysis radius of 10 px. The Moiré effect is now much less pronounced:
![ce_moire_3](https://github.com/user-attachments/assets/9c7a2c64-52f1-4444-a96c-228ce1482cf1)

With additional denoising it disappears completely:
![ce_moire_2](https://github.com/user-attachments/assets/7bf83652-d970-43f9-addc-05b51fe3074c)

Note: High values can lead to haloing at the edges!


saturation threshold
: Set the upper bound for the guided filter's saturation threshold. Decrase the value to allow changes to areas with low chromaticity. Increase the value to restrict changes to areas of high chromaticity.

contrast
: Set the color contrast for the guided filter. Incrase th value to favor sharp transitions between colors and increase color contrast. Decrease the value for smoother color transition.

effect radius
: Set the radius for the guided filter.
