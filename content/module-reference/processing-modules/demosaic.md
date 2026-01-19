---
title: demosaic
id: demosaic
weight: 10
---

Control how raw files are demosaiced and optionally apply capture sharpening.

# bayer filters

The sensor cells of a digital camera (commonly named "photosites") are not color-sensitive -- they are only able to record different levels of lightness. In order to obtain a color image, each cell is covered by a colored filter (red, green or blue) that primarily passes light of that color. This means that each photosite (and therefore each "pixel" of the raw image) only contains information about a single color channel.

The array of color filters covering the sensor, known as a color filter array (CFA), is commonly arranged in a mosaic pattern known as a Bayer filter (though other patterns are also used). A demosaic algorithm reconstructs the other color channels by interpolation with data from the neighboring photosites. For further reading see the Wikipedia articles on [demosaicing](https://en.wikipedia.org/wiki/Demosaicing) and the [Bayer filter](http://en.wikipedia.org/wiki/Bayer_filter).

Darktable offers several demosaic algorithms, each with its own characteristics. The differences between them are often very subtle and might only be visible while pixel-peeping. However, as the program works on a pixel-by-pixel basis and demosaic generates the base data for the other modules, the choice of the algorithm can have a visually significant effect on the quality of very fine details in the image. This can include the appearance of false maze patterns as well as the rendering quality of colored edges.

Demosaic interpolation algorithms are often prone to produce artifacts, typically visible as [Moiré patterns](https://en.wikipedia.org/wiki/Moire_pattern) when zooming into the image. The chosen algorithm might handle _pre-existing_ Moiré- or Maze-like patterns in the raw data in a better or worse way. In these circumstances _VNG4_ and _LMMSE_ are often more stable.

The following demosaic algorithms are available for sensors with Bayer filters:

-   _PPG_ used to be darktable's default demosaic algorithm. It is fast, but other algorithms generally yield better results.

-   _AMaZE_ and _RCD_ offer better reconstruction of high-frequency content (finer details, edges, stars) but might struggle with color reconstruction overshoots or added noise in areas of low contrast. While _AMaZE_ often retains more high-frequency details it is also more prone to color overshoots than _RCD_. Since _RCD_ now offers similar performance to _PPG_, but with better results, it is now the default algorithm.

-   _LMMSE_ is better suited for use on high ISO and noisy images than _AMaZE_ or _RCD_, both of which tend to generate overshooting artifacts when applied to such images. It can also be useful to manage images that exhibit Moiré patterns with other algorithms.

-   _VNG4_ is better suited for use on images with low-frequency content (e.g. low contrast regions such as sky or snow-fields). Compared to _AMaZE_ and _RCD_, it causes loss of some details but is very stable for maze artifacts. VNG4 is no longer recommended -- for most images, other algorithms provide better results.

---

**Note:** The performance of the demosaic algorithms differs significantly, _AMaZE_ being by far the slowest.

---

# sensors without bayer filters

There are a few cameras whose sensors do not use a Bayer filter. Cameras with an "X-Trans" sensor have their own set of demosaic algorithms. The default algorithm for X-Trans sensors is _Markesteijn 1-pass_, which produces fairly good results. For slightly better quality (at the cost of much slower processing), choose _Markesteijn 3-pass_. Though _VNG_ is faster than _Markesteijn 1-pass_ on some computers, it is prone to artifacts.

Images from monochrome cameras do not require demosaicing, however, since darktable 5.4 they use this module to support [capture sharpening](#capture-sharpen).

# special algorithms

_passthrough (monochrome)_ is only useful for cameras that have had the color filter array physically removed from the sensor (e.g. scratched off). Demosaic algorithms usually reconstruct other color channels by interpolation with data from the neighboring pixels. However, if the color filter array is not present, there is nothing to interpolate, so this algorithm simply sets all the color channels to the same value, resulting in a monochrome image. This method avoids the interpolation artifacts that the standard demosaic algorithms might introduce.

_photosite_color_ is not meant to be used for image processing. It takes the raw photosite data and presents it as red, blue or green pixels. This is designed for debugging purposes in order to see the raw data and can assist with analysis of errors produced by the other demosaic algorithms.

_monochrome_ is only available for monochrome cameras.

# dual demosaic algorithms

Some images have areas best demosaiced using an algorithm that preserves high frequency information (like _AMaZE_ or _RCD_) and other areas that might profit from an algorithm more suited to low frequency content (like _VNG4_).

In dual demosaic algorithms (e.g. _RCD + VNG4_) the sensor data is demosaiced twice, first by _RCD_, _AMaZE_ or _Markesteijn 3-pass_ and then by _VNG4_. Both sets of demosaiced data are retained for subsequent processing.

The data from the high frequency algorithm is then analysed for _local data change_ and, using a threshold (there is a bit more of maths involved here), the output image is written pixel-by-pixel for each color channel using data from each demosaic algorithm weighed by the local data change.

In general, areas with greater detail are demosaiced by the algorithm best suited to that purpose (_RCD, AMaZe, Markesteijn 3-pass_) and any flat areas (like blue sky) are demosaiced using the second algorithm (_VNG4_).

_The 'local data change' is technically implemented as a gaussian-blurred single channel selection mask calculated from a combination of the threshold value and the pixels' luminance._

## selecting the threshold

An automatically-calculated threshold is difficult to implement. Instead, the "display blending mask" button can be used to display the _selection mask_ so you can control the selection of the algorithm manually. The brighter the pixel in the displayed mask, the more the output is taken from the high-frequency algorithm.

# capture sharpen

Capture sharpening recovers details lost due to in-camera or lens blurring, which can be caused by diffraction, the anti-aliasing filter or other sources of gaussian-type blur.

Capture sharpening is performed inside the demosaic module because some parts of the algorithm require raw CFA data. The sharpening itself is performed on demosaiced RGB data and is available for bayer, xtrans and monochrome sensors.

Capture sharpening is not intended to be used as a general sharpening / local contrast enhancing tool. It should instead be understood as a way to increase micro-contrast in structures with lots of detail, and leads to better results for further processing. Excellent examples would be details of surfaces like wood, brick walls, hair etc.

Prerequisites for optimal results are:

-   Decent white balance parameters (same requirement as for [_highlight reconstruction_](./highlight-reconstruction.md) or _demosaic_) -- in very rare cases this could lead to inferior sharpening quality.
-   Low chromatic aberration -- you might want to use the [_raw chromatic aberrations_](./raw-chromatic-aberrations.md) module to reduce problems -- there will still likely be more and stronger halo artifacts.
-   Acceptable sensor noise, as noise will generally be amplified by capture sharpening (see _contrast sensitivity_ below).

Capture sharpening works in an iterative process using specialized gaussian kernels using a different sigma (in the range of 0.0 -> 1.5) for every single pixel location.

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

dual threshold _(dual demosaic modes only)_
: Set the contrast threshold for dual demosaic modes. Lower values favor the high frequency demosaic algorithm and higher values favor the low frequency algorithm.

display blending mask _(dual demosaic modes only)_
: Show the blending mask that is used to differentiate between high and low frequency areas (adjusted by the "switch dual threshold" parameter). For each pixel, the brighter the mask, the more the module's output is taken from the high frequency demosaic algorithm.

capture sharpen
: Enable capture sharpening. Selecting this option will enable additional controls (see below) and attempt to auto-calculate the _radius_ and _contrast sensitivity_ based on the current image's raw sensor data (see below).

iterations (capture sharpen)
: The strength of the effect increases with more iterations. For most images a setting of 8 will be sufficient.

radius (capture sharpen)
: Defines the mathematics used (sigma) for the special gaussian kernels. Analysis of many images (also from the RawTherapee community) show that, on modern sensors, using a good lens and a high quality demosaicer, a typical radius will be between 0.5 and 0.8.
: To auto-calculate the _radius_ for the current image (based on raw sensor data), click the button on the right of the radius slider. The underlying algorithm has been used for some time with reliable results, though it might fail on images with lots of chroma noise. This calculation works better when the image is fully-zoomed out and uncropped in the darkroom view.

---

**Note:** Do not manually increase the radius much further than the auto-calculated value, as this will soon lead to halo artifacts.

---

contrast sensitivity (capture sharpen)
: As sensor noise will typically be amplified by capture sharpening, we try to counter this problem by performing an analysis of local variance, luminance and a user-defined threshold. Sharpening is applied only to regions that are considered by this analysis to be safe. This analysis results in a mask that can be visualised by clicking the button to the right of the contrast sensitivity slider.
: For a good default we check the image ISO and sensor readout precision as a starting point.
: Very noisy images will require larger values than default. For very low sensor noise you can decrease the threshold to also improve capture sharpening in very dark parts of the image.

corner boost / sharp center (capture sharpen)
: Most lenses are sharper in the central part than the corners of the image. Increasing the _corner boost_ parameter causes a larger per-pixel radius to be used in the capture sharpen kernels for the image corners. This extra radius is controlled by the _corner boost_ control. Adjusting the _corner boost_ will cause an additional slider (_sharp center_) to appear. This controls the affected area using the distance from the image center. Again, the mask button to the right of the slider allows you to visualize the effect.

# presets, styles and copy/paste

Defining demosaic [presets](../../darkroom/processing-modules/presets.md) or using demosaic parameters for [styles](../../module-reference/utility-modules/lighttable/styles.md) or copying/pasting [history stacks](../../module-reference/utility-modules/lighttable/history-stack.md) is a bit more tricky than for other modules. Please bear in mind that demosaic works for a range of sensors each offering different algorithms and some specific options. Here are some reminders:

1. It should always be safe to create an automatic preset that only applies to a specific camera.
1. If a preset was defined while working on an image with a different sensor than the current image, darktable translates the algorithm as follows:
    - bayer sensors fall back to _RCD_
    - xtrans sensors fall back to _markjestejn_
    - bayer4 sensors always use _vng4_.
    - dual demosaicing will also be available on bayer and xtrans sensors
1. Extra options like _green equalizing_ will only be applied where they are supported by the current sensor.
1. In auto-applied presets with capture sharpen enabled, you might want to use the auto-calculated radius (or contrast sensitivity) instead of using hard-coded values. To achieve this, you must set the radius (or contrast sensitivity) to zero before saving the preset. If this preset is then applied to another image, darktable accepts this as a request for these values to be automatically recalculated.

Capture sharpening is not enabled by default but you could achieve this by defining an auto-applied preset after setting radius and contrast threshold to zero. You are advised to leave the iterations setting at its default setting of 8, as this leads to good sharpening with very low risk for artifacts when used with an auto-calculated radius.

It is generally safe to auto-apply capture sharpening to images with ISO values below 1000. If you have a good sensor, with low noise even on high ISO values, you might be able to use it for ISOs as high as 3200.
