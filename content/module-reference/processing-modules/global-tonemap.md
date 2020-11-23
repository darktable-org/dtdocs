---
title: global tonemap (deprecated)
id: global-tonemap
applicable-verison: 3.4
tags: 
working-color-space: Lab 
view: darkroom
masking: true
---

---

**Please note that this module is deprecated in darktable 3.4 and should no longer be used for new edits. Please use the [_filmic rgb_](./filmic-rgb.md) module instead.**

---

Compress the tonal range of an HDR image into the limited tonal range of a typical LDR output file. 

Global tonemap processes each pixel of an HDR image, without taking the local surrounding into account. This is generally faster than local [_tone mapping (deprecated)_](./tone-mapping.md), but might lead to less convincing results with very high-dynamic-range scenes.

# module controls

operator
: The operator to use. _Reinhard_, _Filmic_ and _Drago_ global tonemap operators are available. Depending on the selected operator, different parameters can be adjusted. 

: Some operators are fully self-adjusting, and do not require specific controls.

bias (_Drago_ operator only)
: This parameter influences the contrast of the output image. It is an essential parameter for adjusting the compression of high values and the visibility of details in dark areas. A value of 0.85 is recommended as a starting point.

target (_Drago_ operator only)
: A scale factor to adjust the global image brightness to the brightness of the intended display. It is measured in cd/m, and should match the brightness of your output device. Higher values lead to a brighter image, while lower values lead to a darker image.

detail (all operators)
: This parameter controls how much detail is preserved from the original input image and transferred back into the output image after tonemapping.
