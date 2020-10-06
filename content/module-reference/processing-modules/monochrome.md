---
title: monochrome
id: monochrome
applicable-verison: 3.2.1
tags: 
working-color-space: Lab 
view: darkroom
masking: true
---

Quickly convert an image to black & white using a variable color filter.

To use this module, first reduce the filter size (to concentrate its effect) and move it across the hue pallet to find the best filter value for your desired image rendition. Then gradually expand the filter to include more hues and achieve more natural tonality.

---

**Note:** Under certain conditions, especially highly saturated blue light sources in the frame, this module may produce black pixel artifacts. Use the gamut clipping option of the [_input color profile_](./input-color-profile.md) module to mitigate this issue.

---

# module controls

filter size/position
: The default central location of the filter has a neutral effect but dragging it to an alternate position applies a filter analogous to taking a b&w photograph through a conventional color filter.

: A color picker can be activated to automatically set the position and size of the filter based on the selected portion of the image. Scroll the mouse wheel to change the filter size, making the filter's range of hues more or less selective.

highlights
: Control how much to retain highlights.

