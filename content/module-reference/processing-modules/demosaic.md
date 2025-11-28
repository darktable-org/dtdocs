---
title: demosaic
id: demosaic
weight: 10
applicable-version: 5.4
tags:
working-color-space: Not Applicable (RAW)
view: darkroom
masking: false
---

Control how raw files are demosaiced.

# bayer filters

The sensor cells of a digital camera are not color-sensitive -- they are only able to record different levels of lightness. In order to obtain a color image, each cell is covered by a color filter (red, green or blue) that primarily passes light of that color. This means that each pixel of the raw image only contains information about a single color channel.

Color filters are commonly arranged in a mosaic pattern known as a Bayer filter array. A demosaic algorithm reconstructs the missing color channels by interpolation with data from the neighboring pixels. For further reading see the Wikipedia articles on [demosaicing](https://en.wikipedia.org/wiki/Demosaicing) and the [Bayer filter](http://en.wikipedia.org/wiki/Bayer_filter).

Darktable offers several demosaic algorithms, each with its own characteristics. The differences between them are often very subtle and might only be visible while pixel-peeping. However, as the program works on a pixel-by-pixel basis and demosaic generates the base data for the other modules, the choice of the algorithm can have a visually significant effect on the quality of very fine details in the image. This can include the appearance of false maze patterns as well as the rendering quality of colored edges.

Demosaic interpolation algorithms are often prone to produce artifacts, typically visible as [Moiré patterns](https://en.wikipedia.org/wiki/Moire_pattern) when zooming into the image. The chosen algorithm might handle _pre-existing_ Moiré- or Maze-like patterns in the raw data in a better or worse way. In these circumstances _VNG4_ and _LMMSE_ are often more stable.

The following demosaic algorithms are available for sensors with Bayer filters:

-   _PPG_ used to be darktable's default demosaic algorithm. It is fast, but other algorithms generally yield better results.

-   _AMaZE_ and _RCD_ offer better reconstruction of high-frequency content (finer details, edges, stars) but might struggle with color reconstruction overshoots or added noise in areas of low contrast. While _AMaZE_ often retains more high-frequency details it is also more prone to color overshoots than _RCD_. Since _RCD_ now offers similar performance to _PPG_, but with better results, it is now the default algorithm.

-   _LMMSE_ is better suited for use on high ISO and noisy images than _AMaZE_ or _RCD_, both of which tend to generate overshooting artefacts when applied to such images. It can also be useful to manage images that exhibit Moiré patterns with other algorithms.

-   _VNG4_ is better suited for use on images with low-frequency content (e.g. low contrast regions such as sky) but, compared to _AMaZE_ and _RCD_, it causes loss of some high-frequency details and can sometimes add local color shifts. VNG4 is no longer recommended -- for most images, other available algorithms provide better results.

---

**Note:** The performance of the demosaic algorithms differs significantly, _AMaZE_ being by far the slowest.

---

# sensors without bayer filters

There are a few cameras whose sensors do not use a Bayer filter. Cameras with an "X-Trans" sensor have their own set of demosaic algorithms. The default algorithm for X-Trans sensors is _Markesteijn 1-pass_, which produces fairly good results. For slightly better quality (at the cost of much slower processing), choose _Markesteijn 3-pass_. Though _VNG_ is faster than _Markesteijn 1-pass_ on some computers, it is more prone to artifacts.

Images from monochrome cameras do not require demosaicing, since darktable 5.4 they use this module to for _capture sharpen_ support.

# special algorithms

_passthrough (monochrome)_ is only useful for cameras that have had the color filter array physically removed from the sensor (e.g. scratched off). Demosaic algorithms usually reconstruct missing color channels by interpolation with data from the neighboring pixels. However, if the color filter array is not present, there is nothing to interpolate, so this algorithm simply sets all the color channels to the same value, resulting in a monochrome image. This method avoids the interpolation artifacts that the standard demosaic algorithms might introduce.

_photosite_color_ is not meant to be used for image processing. It takes the raw photosite data and presents it as red, blue or green pixels. This is designed for debugging purposes in order to see the raw data and can assist with analysis of errors produced by the other demosaic algorithms.

_monochrome_ is only available for monochrome cameras.

# capture sharpen
Capture sharpening (CS) recovers details lost due to in-camera or lens blurring which can be caused by diffraction, the anti-aliasing filter or other sources of gaussian-type blur.
CS is done inside the demosaic module as some parts of the algorithm require raw cfa data, the sharpening itself is done on demosaiced RGB data. It is available for bayer, xtrans and monochrome sensors.

CS is not intended to be used as a general sharpening / local contrast enhancing tool, it should be understood as a way to increase micro-contrast in structures with lots of detail and leads to better results for further processing. Excellent examples would be details of surfaces like wood, brick walls, hair ...

Prerequisites for optimal results are
- decent white balance parameters (same requirement as for highlights reconstruction or demosaic), in very rare cases this could lead to inferiour sharpening quality.
- low chromatic aberration, you might want to add the [_raw chromatic aberration_](./raw-chromatic-aberrations.md) module to reduce problems, there will still likely be more and stronger halo artefacts. 
- acceptable sensor noise as that will generally be amplified by CS. (See _contrast sensitivity_).

CS works in an iterative process using specialized gaussian kernels using a different sigma in the range of 0.0 -> 1.5 for every single pixel location.

It's main parameters are

_Iterations_
: The strenght of effect increases with more iterations, for most images a setting of 8 will be fully sufficient.

_Radius_
: defines the maths (sigma) for the special gaussian kernels.
Analysis of many images (also from the RT community) show, on modern sensors using a good lens and a high quality demosaicer the radius will be in the 0.5 -> 0.8 range.
Please note the autocalculate button on the right of the radius, a click will enforce a calculation of the radius based on raw sensor data, the underlying algorithm has been used for some time with reliable results - it might fail on images with lots of chroma noise.
Note: Do not manually increase the radius much further as that will soon lead to halo artefacts.

_Edge sensitivity_
: As sensor noise principally will be amplified by CS we take care about this problem by doing an analysis of local variance, luminance and an interactive user provided threshold.
The sharpening is applied only to regions that are concidered to be safe in the analysis, the mask providing this information can be inspected by a click on the button as usual.

   For a good default we check the image ISO and sensor readout precision as a starting point.
   Very noisy images will require larger values than default, for very low sensor noise you can decrease the threshold to improve capture sharpening also in very dark parts of the image.

_Corner boost/Sharp center_
: Most lenses are sharper in the central part than the corners of the image, increasing the corner boost results in a larger per-pixel radius to be used for the CS kernels for the image corners. The extra radius is controlled by _corner boost_, the affected area follwows a very simple model using the distance from the image center and is controlled by _sharp center_. Again - the mask button visualizes the effect.

# dual demosaic algorithms

Some images have areas best demosaiced using an algorithm that preserves high frequency information (like _AMaZE_ or _RCD_) and other areas that might profit from an algorithm more suited to low frequency content (like _VNG4_).

In dual demosaic algorithms (e.g. _RCD + VNG4_) the sensor data is demosaiced twice, first by _RCD_, _AMaZE_ or _Markesteijn 3-pass_ and then by _VNG4_. Both sets of demosaiced data are retained for subsequent processing.

The data from the high frequency algorithm is then analysed for _local data change_ and, using a threshold (there is a bit more of maths involved here), the output image is written pixel-by-pixel for each color channel using data from each demosaic algorithm weighed by the local data change.

In general, areas with greater detail are demosaiced by the algorithm best suited to that purpose (_RCD, AMaZe, Markesteijn 3-pass_) and any flat areas (like blue sky) are demosaiced using the second algorithm (_VNG4_).

_The 'local data change' is technically implemented as a gaussian-blurred single channel selection mask calculated from a combination of the threshold value and the pixels' luminance._

## selecting the threshold

An automatically-calculated threshold is difficult to implement. Instead, the "display blending mask" button can be used to display the _selection mask_ so you can control the selection of the algorithm manually. The brighter the pixel in the displayed mask, the more the output is taken from the high-frequency algorithm.

# module controls

method
: The demosaic algorithm to use (see above).

edge threshold (_PPG_ only)
: The threshold for an additional median pass. Defaults to “0” which disables median filtering.

LMMSE refine (_LMMSE_ only)
: Refinement steps for use with the LMMSE demosaic algorithm. Median steps average the output. Refinement steps add some recalculation of red and blue channels. While the refinement options work well for luma noise, they may decrease quality on images with heavy chroma noise.

color smoothing
: Activate a number of additional color smoothing passes. Defaults to “off”.

match greens
: In some cameras the green filters have slightly varying properties. This parameter adds an additional equalization step to suppress artifacts. Available options are “disabled”, “local average”, “full average” and “full and local average”. This option is not shown for X-Trans sensors.

switch dual threshold _(dual demosaic modes only)_
: Set the contrast threshold for dual demosaic modes. Lower values favor the high frequency demosaic algorithm and higher values favor the low frequency algorithm.

display blending mask _(dual demosaic modes only)_
: Show the blending mask that is used to differentiate between high and low frequency areas (adjusted by the "switch dual threshold" parameter). For each pixel, the brighter the mask, the more the module's output is taken from the high frequency demosaic algorithm.

# Notes about presets

Defining demosaic presets or using demosaic parameters for styles or copy of history is a bit more tricky than for other modules. Please bear in mind that demosaic works for a range of sensors each offering certain algorithms and some specific options. Here are some reminders
1. You are safe when using a preset for a specified camera of course.
2. If a preset was defined while working on an image with a different sensor than the current one, darktable translates the algorithm as follows:
   - bayer sensors fall back to _RCD_
   - xtrans sensors fall back to _markjestejn_
   - bayer4 sensors always use _vng4_.
   - dual demosaicing will also be available on bayer and xtrans sensors
3. Extra options like _green equalizing_ will only be done if supported by the current sensor.
4. Some special care has been done for capture sharpening radius and edge sensitivity parameters.
   In auto-applied presets you might want to use the auto-calculated radius (or eddge sensitivity) for CS instead of a specified value.
   To achieve this, you must set the radius to zero before saving the preset. If this preset is applied, dt accepts this as a request for autocalculation of the radius.

We don't have CS enabled by default but you could define an auto-applied preset after setting radius and edge threshold to zero. For iterations a setting of 8 is recommended, this leads to good sharpening with very low risk for artefacts if used with auto-radius.

For the auto-apply rules it is also safe for ISO values below 1000. If you have a good sensor with low noise even on high ISO you might go for ISO below 3200.

