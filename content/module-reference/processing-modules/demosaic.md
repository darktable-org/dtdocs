---
title: demosaic
id: demoasic
applicable-verison: 3.6.0
tags: 
working-color-space: Not Applicable (RAW) 
view: darkroom
masking: false
---

Control how raw files are demosaiced.

# bayer filters
The sensor cells of a digital camera are not color-sensitive -- they are only able to record different levels of lightness. In order to obtain a color image, each cell is covered by a color filter (red, green or blue) that primarily passes light of that color. This means that each pixel of the raw image only contains information about a single color channel. 

These color filters are commonly arranged in a mosaic pattern known as a Bayer filter array. The demosaic algorithm reconstructs the missing color channels by interpolation with data of the neighboring pixels. For further reading see the Wikipedia articles on the [Bayer filter](http://en.wikipedia.org/wiki/Bayer_filter) and [Demosaicing](https://en.wikipedia.org/wiki/Demosaicing).

Demosaic interpolation algorithms are often prone to produce artifacts, which are typically visible as [Moiré-like patterns](https://en.wikipedia.org/wiki/Moir%C3%A9_pattern) when zooming into the image. Various demosaic algorithms have been developed in an attempt to overcome these artifacts. Currently darktable supports _PPG_, _AMaZE_, _RCD_ and _VNG4_ demosaic algorithms for Bayer filters. _AMaZE_ is reported to sometimes give slightly better results. However, since _AMaZE_ is significantly slower, darktable uses _PPG_ by default. _RCD_ gives results as good as _AMaZE_ at a better performance. _VNG4_ produces the softest results of the three algorithms, but if you see "maze" artifacts with the other algorithms, try using _VNG4_ to eliminate them.

# sensors without bayer filters
There are a few cameras whose sensors do not use a Bayer filter. Cameras with an "X-Trans" sensor have their own set of demosaic algorithms. The default algorithm for X-Trans sensors is _Markesteijn 1-pass_, which produces fairly good results. For slightly better quality (at the cost of much slower processing), choose _Markesteijn 3-pass_. Though _VNG_ is faster than _Markesteijn 1-pass_ on certain computers, it is more prone to artifacts.

Additionally, darktable supports a special _passthrough (monochrome)_ demosaic algorithm. This algorithm is only useful for cameras which have had the color filter array physically removed from the sensor (e.g. scratched off). Normally, demosaic algorithms reconstruct the missing color channels by interpolation with data of the neighboring pixels. However, if the color filter array is not present, there is nothing to interpolate, so this algorithm simply sets all the color channels to the same value, resulting in a monochrome image. This method therefore avoids the interpolation artifacts that the standard demosaic algorithms might produce.

# module controls

method
: The demosaic algorithm to use (see above).

edge threshold (_PPG_ only)
: The threshold for an additional median pass. Defaults to “0” which disables median filtering.

color smoothing
: Activate a number of additional color smoothing passes. Defaults to “off”.

match greens
: In some cameras the green filters have slightly varying properties. This parameter adds an additional equalization step to suppress artifacts. Available options are “disabled”, “local average”, “full average” and “full and local average”. This option is not shown for X-Trans sensors.
