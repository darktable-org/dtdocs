---
title: demosaic
id: demoasic
applicable-version: 3.8
tags: 
working-color-space: Not Applicable (RAW) 
view: darkroom
masking: false
---

Control how raw files are demosaiced.

# bayer filters

The sensor cells of a digital camera are not color-sensitive -- they are only able to record different levels of lightness. In order to obtain a color image, each cell is covered by a color filter (red, green or blue) that primarily passes light of that color. This means that each pixel of the raw image only contains information about a single color channel. 

Color filters are commonly arranged in a mosaic pattern known as a Bayer filter array. A demosaic algorithm reconstructs the missing color channels by interpolation with data from the neighboring pixels. For further reading see the Wikipedia articles on [demosaicing](https://en.wikipedia.org/wiki/Demosaicing) and the [Bayer filter](http://en.wikipedia.org/wiki/Bayer_filter).

Darktable offers several demosaic algorithms, each with it's own characteristics. The differences between them are often very subtle and might only be visible while pixel-peeping. However, as the program works on a pixel-by-pixel basis and demosaic generates the base data for the other modules, the choice of the algorithm can have a visually significant effect on the quality of very fine details in the image. This can include the appearance of false maze patterns as well as the rendering quality of colored edges.

Demosaic interpolation algorithms are often prone to produce artifacts, typically visible as [Moiré patterns](https://en.wikipedia.org/wiki/Moire_pattern) when zooming into the image. The chosen algorithm might handle _pre-existing_ Moiré- or Maze-like patterns in the raw data in a better or worse way. In these circumstances _VNG4_ and _LMMSE_ are often more stable.

The following demosaic algorithms are avaliable for sensors with Bayer filters:

- _PPG_ used to be darktable's default demosaic algorithm. It is fast, but other algorithms generally yield better results.

- _AMaZE_ and _RCD_ offer better reconstruction of high-frequency content (finer details, edges, stars) but might struggle with color reconstruction overshoots or added noise in areas of low contrast. While _AMaZE_ often retains more high-frequency details it is also more prone to color overshoots than _RCD_. Since _RCD_ now offers similar performance to _PPG_, but with better results, it is now the default algorithm.

- _LMMSE_ is better suited for use on low ISO and noisy images than _AMaZE_ or _RCD_, both of which tend to generate overshooting artefacts when applied to such images. It can also be useful to manage images that exhibit Moiré patterns with other algorithms. Use with care on Raw images with heavy chroma noise.

- _VNG4_ is better suited for use on images with low-frequency content (e.g. low contrast regions such as sky) but, compared to _AMaZE_ and _RCD_, it often causes loss of some high-frequency details.

---

**Note:** The performance of the demosaic algorithms differs significantly, _AMaZE_ being by far the slowest.
  
---

# sensors without bayer filters

There are a few cameras whose sensors do not use a Bayer filter. Cameras with an "X-Trans" sensor have their own set of demosaic algorithms. The default algorithm for X-Trans sensors is _Markesteijn 1-pass_, which produces fairly good results. For slightly better quality (at the cost of much slower processing), choose _Markesteijn 3-pass_. Though _VNG_ is faster than _Markesteijn 1-pass_ on some computers, it is more prone to artifacts.

# special algorithms

_passthrough (monochrome)_ is only useful for cameras that have had the color filter array physically removed from the sensor (e.g. scratched off). Demosaic algorithms usually reconstruct missing color channels by interpolation with data from the neighboring pixels. However, if the color filter array is not present, there is nothing to interpolate, so this algorithm simply sets all the color channels to the same value, resulting in a monochrome image. This method avoids the interpolation artifacts that the standard demosaic algorithms might introduce.

_photosite_color_ is not meant to be used for image processing. It takes the raw photosite data and presents it as red, blue or green pixels. This is designed for debugging purposes in order to see the raw data and can assist with analysis of errors produced by the other demosaic algorithms.

# dual demosaic algorithms

Some images have areas best demosaiced using an algorithm that preserves high frequency information (like _AMaZE_ or _RCD_) and other areas that might profit from an algorithm more suited to low frequency content (like _VNG4_).

In dual demosaic algorithms (e.g. _RCD + VNG4_) the sensor data is demosaiced twice, first by _RCD_, _AMaZE_ or _Markesteijn 3-pass_ and then by _VNG4_. Both sets of demosaiced data are retained for subsequent processing.

The data from the high frequency algorithm is then analysed for _local data change_ and, using a threshold (there is a bit more of maths involved here), the ouput image is written pixel-by-pixel for each color channel using data from each demosaic algorithm weighed by the local data change. 

In general, areas with greater detail are demosaiced by the algorithm best suited to that purpose (_RCD, AMaZe, Markesteijn 3-pass_) and any flat areas (like blue sky) are demosaiced using the second algorithm (_VNG4_). 

_The 'local data change' is technically implemented as a gaussian-blurred single channel selection mask calculated from a combination of the threshold value and the pixels' luminance._

## selecting the threshold

An automatically-calculated threshold is difficult to implement. Instead, the "display blending mask" button can be used to display the _selection mask_ so you can control the selection of the algorithm manually. The brighter the pixel in the displayed mask, the more the output is taken from the high-frequency algorithm.

# module controls

method
: The demosaic algorithm to use (see above).

edge threshold (_PPG_ only)
: The threshold for an additional median pass. Defaults to “0” which disables median filtering.

lmmse refine (_LMMSE_ only)
: Refinement steps for use with the LMMSE demosaic algorithm. Median steps average the output. Refinement steps add some recalculation of red and blue channels.

color smoothing
: Activate a number of additional color smoothing passes. Defaults to “off”.

match greens
: In some cameras the green filters have slightly varying properties. This parameter adds an additional equalization step to suppress artifacts. Available options are “disabled”, “local average”, “full average” and “full and local average”. This option is not shown for X-Trans sensors.

switch dual threshold _(dual demosaic modes only)_
: Set the contrast threshold for dual demosaic modes. Lower values favor the high frequency demosaic algorithm and higher values favor the low frequency algorithm.

display blending mask _(dual demosaic modes only)_
: Show the blending mask that is used to differentiate between high and low frequency areas (adjusted by the "switch dual threshold" parameter). For each pixel, the brighter the mask, the more the module's output is taken from the high frequency demosaic algorithm.
