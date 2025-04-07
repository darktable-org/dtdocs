---
title: color assessment
id: color assessment
applicable-version: 4.4
tags: 
view: darkroom
---

Assess colors and brightness in your image under neutral viewing conditions to avoid perceptual issues.

When developing an image, the way we perceive brightness, contrast and saturation is influenced by the surrounding ambient conditions. If an image is displayed against a dark background, this can have a number of adverse effects on our perception of that image:

- Exaggeration of the perceived exposure makes the image seems brighter than it really is. This is nicely illustrated by the [Adelson checkerboard shadow effect](https://en.wikipedia.org/wiki/Checker_shadow_illusion).
- A decrease in the perceived saturation in the image makes the colors seem less rich than they really are (the Hunt effect).
- A decrease in the perceived contrast in the image makes the tones seem flatter than they really are (Bartleson-Breneman effect 3)

The end result is that the final image can end up being too dark and overly-processed in terms of contrast and color saturation. To avoid this, the _color assessment_ module in the _darkroom_ places a grey and white border around the image to help the user better assess the colors in the image

![color-assessment-overview](./color-assessment/color-assessment-overview.png#w75)

When the color assessment button ![bulb-icon](./color-assessment/bulb-icon.png#icon) is selected in the bottom panel, the image is zoomed out so that a thick mid-gray border appears around the image to act as a reference against which to compare the image's tones. A thinner white border is placed immediately around the image to give the eyes a basis for comparison when looking at parts of the image that are meant to be a bright white.

Although the color assessment mode provides a mid-gray surrounding to the image, it is recommended that you also set your user interface (in [preferences > general](../../../preferences-settings/general.md)) to one of the "grey" themes. These themes are designed to provide a user interface that is close to middle gray (it is actually slightly darker to allow better contrast with the text in the user interface). When one of these themes is used together with the color assessment mode, this will help to avoid the above perception issues.

Color assessment mode can also be toggled by pressing Ctrl+B.

The size of the grey and white border and the relative size of the white frame may be adjusted by right-clicking ![bulb-icon](./color-assessment/bulb-icon.png#icon) This will call up the following panel:

![color assessment control](./color-assessment/color-assessment-control.png#w50)


Decreasing the top slider will reduce the size of the combined grey and white border and will enlarge the size of the image. Increasing this control has the opposite effect.

Increasing the lower slider will enlarge the size of the white border and will maintain the image size, while decreasing the control will have the opposite effect.

Double-clicking each slider restores the controls to their default values
