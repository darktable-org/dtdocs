---
title: exposure
id: exposure
applicable-verison: 3.2.1
tags: 
working-color-space: RGB 
view: darkroom
masking: true
---

Increase or decrease the overall brightness of an image. The module has two modes of operation:

manual
: Set the _exposure_, _black level_ and _clipping threshold_ manually

automatic (RAW images only)
: Use an analysis of the image's histogram to automatically set the exposure. Darktable automatically selects the exposure compensation that is required to shift the selected _percentile_ to the selected _target level_ (see definitions below). This mode is particularly useful for automatically altering a number of images to have the same exposure. A typical use case of automatic mode is deflickering of time-lapse photographs. 

## Module Controls

mode
: Choose the mode of operation (automatic/manual)

compensate camera exposure (manual mode)
: Automatically remove the camera exposure bias (taken from the image's exif data)

exposure (manual mode)
: Increase (move to the right) or decrease (move to the left) the exposure value (EV)

clipping threshold (manual mode)
: Define what percentage of bright values are to be clipped in the calculation of the Exposure and Black Level Correction. Use the color picker to sample a portion of the image to be used for the calcuation.

percentile (automatic mode)
: Define a location in the histogram to use for automatic exposure correction. A percentile of 50% denotes a position in the histogram where 50% of pixel values are below and 50% of pixel values are above.

target level (automatic mode)
: Define the target level for automatic exposure correction (EV) relative to the white point of the camera.

black level correction (manual and automatic modes)
: Adjust the black level point to unclip negative RGB values. _N.B. Do not use this to add more density in blacks as this can clip near-black colors out of gamut by generating negative RGB values._