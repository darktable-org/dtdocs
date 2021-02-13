---
title: demosaic
id: demoasic
applicable-version: 3.6.0
tags: 
working-color-space: Not Applicable (RAW) 
view: darkroom
masking: false
---

Control how raw files are demosaiced.

# bayer filters
The sensor cells of a digital camera are not color-sensitive -- they are only able to record different levels of lightness. In order to obtain a color image, each cell is covered by a color filter
(red, green or blue) that primarily passes light of that color.
This means that each pixel of the raw image only contains information about a single color channel. 

These color filters are commonly arranged in a mosaic pattern known as a Bayer filter array. The demosaic algorithm reconstructs the missing color channels by interpolation with data of the neighboring pixels.
For further reading see the Wikipedia articles on the [Bayer filter](http://en.wikipedia.org/wiki/Bayer_filter) and [Demosaicing](https://en.wikipedia.org/wiki/Demosaicing).

Darktable offers several demosaicing algorithms, each with it's own characteristics. The differences between them are often very subtle and might only be visible while pixel peeping.
But as the program works on a pixel-by-pixel basis and demosaicing generates the data for the other modules, the choice of the demosaicer can have a visually significant effect on
the quality of very fine details in the image, whether false maze patterns will appear and and decides how well colored edges are rendered.

Please note that the performance of the demosaicing algorithms differ significantly, _AMaZE_ is by far the slowest.

Some demosaicers offer better reconstruction of high-frequency content (finer details, edges, stars) but might struggle with color reconstruction overshoots or added noise in areas of low contrast.
Darktable offers two demosaicers in this category _AMaZE_ and _RCD_, AMaZE_ might give more details but is more prone to color overshoots than _RCD_.

_VNG4_ is better suited for images with low_frequency content (low contrast regions like the sky would be one example), but compared to _AMaZE_ and _RCD_ it often lacks some details.

_PPG_ has been darktable's default demosaicer for long, it is a fast option but generally the other demosaicers give better results.
  
Demosaic interpolation algorithms are often prone to produce artifacts, which are typically visible as [Moiré-like patterns](https://en.wikipedia.org/wiki/Moir%C3%A9_pattern) when zooming into the image.
Also the chosen algorithm might handle [Moiré-like] or [Maze] patterns existing in the raw data in a better or worse way, _VNG4_ is often more stable in these circumstances. 

# sensors without bayer filters
There are a few cameras whose sensors do not use a Bayer filter. Cameras with an "X-Trans" sensor have their own set of demosaic algorithms. The default algorithm for X-Trans sensors is _Markesteijn 1-pass_, which produces fairly good results.
For slightly better quality (at the cost of much slower processing), choose _Markesteijn 3-pass_. Though _VNG_ is faster than _Markesteijn 1-pass_ on certain computers, it is more prone to artifacts.

# special algorithms.

_passthrough (monochrome)_ is only useful for cameras which have had the color filter array physically removed from the sensor (e.g. scratched off).
Normally, demosaic algorithms reconstruct the missing color channels by interpolation with data of the neighboring pixels.
However, if the color filter array is not present, there is nothing to interpolate, so this algorithm simply sets all the color channels to the same value, resulting in a monochrome image.
This method therefore avoids the interpolation artifacts that the standard demosaic algorithms might produce.

_photosite_color_ is not meant to be used for production. It takes the raw photosite data and presents them as red, blue or green pixels. This is meant for debugging if you want to see what
data pre-exist for the demosaices like inspecting maze-like patterns. 

# double demosaicers
In some images we have areas that would be best demosaiced with an algorithm preserving high frequency information (like _AMaZE_ or _RCD_)
and other areas that might profit from another demosaicer better suited for low frequency content like _VNG4_.

How does _double demosaicing_ work?

The sensor data is demosaiced twice, first by _RCD_, _AMaZE_ or _Markesteijn 3-pass_ and in a second step by _VNG4_, both demosaiced data are kept for further processing.

The data from the high frequency demosaicer is then analysed for **local data change**, and by using a threshold (there is a bit more of maths involved) the ouput image is written pixel by pixel
for each color channel using both demosaiced data weighed on the local data change. (The 'local data change' is technically implemented as a gaussian blurred single channel **selection mask** calculated from
the threshold value and the pixels luminance)

In overall, the areas with lots of deatail have been demosaiced by the demosaicer suited for that purpose and the flat areas (like the blue sky) have the data resulting from the second demosaicer. 

How to select the threshold?
A calculated automatic threshold is difficult to implement in darktable, instead there is a button activating the display of the **selection mask** instead of the image so you control the selection
of the demosaicer manually. (The brighter the pixel in the mask is, the more the output is taken from the hight frequency demosaicer.)


# module controls

method
: The demosaic algorithm to use (see above).

edge threshold (_PPG_ only)
: The threshold for an additional median pass. Defaults to “0” which disables median filtering.

color smoothing
: Activate a number of additional color smoothing passes. Defaults to “off”.

match greens
: In some cameras the green filters have slightly varying properties. This parameter adds an additional equalization step to suppress artifacts. Available options are “disabled”, “local average”, “full average” and “full and local average”. This option is not shown for X-Trans sensors.
