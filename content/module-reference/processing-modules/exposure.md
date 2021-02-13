---
title: exposure
id: exposure
applicable-version: 3.2.1
tags: 
working-color-space: RGB 
view: darkroom
masking: true
---

Increase or decrease the overall brightness of an image. 

This module has two modes of operation:

manual
: Set the _exposure_, _black level_ and _clipping threshold_ manually

automatic (RAW images only)
: Use an analysis of the image's histogram to automatically set the exposure. Darktable automatically selects the exposure compensation that is required to shift the selected _percentile_ to the selected _target level_ (see definitions below). This mode is particularly useful for automatically altering a large number of images to have the same exposure. A typical use case of automatic mode is deflickering of time-lapse photographs. 

# module controls

mode
: Choose the mode of operation (automatic/manual)

compensate camera exposure (manual mode)
: Automatically remove the camera exposure bias (taken from the image's Exif data)

exposure (manual mode)
: Increase (move to the right) or decrease (move to the left) the exposure value (EV)

clipping threshold (manual mode)
: Define what percentage of bright values are to be clipped in the calculation of the _exposure_ and _black level correction_. Use the color picker to sample a portion of the image to be used for this calcuation.

percentile (automatic mode)
: Define a location in the histogram to use for automatic exposure correction. A percentile of 50% denotes a position in the histogram where 50% of pixel values are above and 50% of pixel values are below that exposure.

target level (automatic mode)
: Define the target level for automatic exposure correction (EV) relative to the white point of the camera.

black level correction (manual and automatic modes)
: Adjust the black level point to unclip negative RGB values. 

---

**Note:** Do not use the black level correction to add more density in blacks as this can clip near-black colors out of gamut by generating negative RGB values. This can cause problems with some modules later in the pixelpipe. Instead, use a tone mapping curve to add density to the blacks (e.g. use the _relative black exposure_ slider on the _scene_ tab of [filmic rgb](filmic-rgb.md), or establish a deeper toe in [base curve](base-curve.md)).

---
