---
title: scopes
id: scopes
applicable-version: 3.8
tags:
view: lighttable, tethering
---

This module provides various graphical depictions of the developed image's light levels or [chromaticity](../../../special-topics/color-management/color-dimensions/#definitions).

![scopes module](./scopes/scopes.png#w50)

Move the mouse over the panel to show buttons that allow you to adjust the display. The leftmost button cycles the mode between histogram, waveform scope, RGB parade scope, and vectorscope. The remaining buttons control how the plot for the current scope is drawn.

When the mouse is over the scopes panel, scroll with the mouse while holding down the Ctrl key to change the height of the panel. You can show/hide the scopes module entirely with a keyboard shortcut (default Ctrl+Shift+H).

You can move the scopes module to the left-hand panel in [preferences > miscellaneous > position of the scopes module](../../../preferences-settings/miscellaneous.md).

For performance reasons, scopes are calculated from the image preview (the image displayed in the [navigation](../darkroom/navigation.md) module) rather than the higher quality image displayed in the center view. The preview is calculated at a lower resolution and may use shortcuts to bypass more time-consuming image processing steps. Hence the display may not accurately represent fine detail in the image, and may deviate in other ways from the final developed image.

## histogram

![histogram](./scopes/histogram.png#w50)

The histogram shows the distribution of pixels by lightness for each color channel.

In its default state, data for all three RGB color channels is displayed. The x-axis runs from 0% to 100% lightness for each channel. The y-axis gives the count of pixels with the given lightness.

Click the second-to-leftmost button on the panel to toggle between a logarithmic and a linear rendering of the y-axis data.

The three rightmost colored buttons toggle the display of the red, green and blue color channels.

## waveform

![waveform scope (horizontal)](./scopes/waveform.png#w50)

The waveform scope shows similar data to the histogram, but allows you to view that data in a spatial context.

In the "standard" horizontal waveform, the x-axis of the waveform represents the x-axis of the image -- the right-hand side of the waveform represents the right-hand side of the image and the left-hand side of the waveform represents the left-hand side of the image.

The y-axis represents the distribution of pixels by lightness for each channel -- the dotted line at the top represents 100% lightness (values above this may be clipped), the dotted line in the middle represents 50% lightness, and the bottom of the waveform represents 0% lightness.

The brightness of each point on the waveform represents the number of pixels at the given position (the x-axis) having the given lightness (the y-axis).

![waveform scope (vertical)](./scopes/waveform-vertical.png#w50)

Clicking the second-to-leftmost button on the panel toggles between a horizontal and a vertical waveform. In the vertical waveform, the y-axis of the plot represents the y-axis of the image, and the x-axis represents the distribution of pixels by lightness. The vertical waveform can be useful for portrait-format images, or simply to understand an image in a different way.

As with the histogram, you can selectively display each of the red, green, and blue channels, by clicking on the appropriate buttons.

See [Of Histograms and Waveforms](https://www.ansel.photos/2013/12/of-histograms-and-waveforms/) for more on Ansel's waveform scope.

## rgb parade

![rgb parade (horizontal)](./scopes/parade.png#w50)

The RGB parade scope shows the same data as the waveform, but with the red, green, and blue channels presented side-by-side.

![rgb parade (vertical)](./scopes/parade-vertical.png#w50)

As with the waveform, clicking the second-to-leftmost button on the panel toggles between horizontal and vertical processing of the image data.

The RGB parade can be useful for matching the intensities of the red, green, and blue channels. It can also help with understanding the differences between and individual qualities of each channel.

## vectorscope

![vectorscope](./scopes/vectorscope.png#w50)

The vectorscope shows [chromaticity](https://en.wikipedia.org/wiki/Chromaticity) without regard to either lightness or spatial data.

The distance from the center of the graph represents chroma and the angle represents hue. Areas of the graph are colored depending on the chromaticity of the color to which they correspond in the image. The graph represents color "volume" by rendering the more frequently used colors in the image in lighter tones.

The vectorscope chroma scale can either be linear or logarithmic. Click the second-to-leftmost button on the panel to toggle this.

The vectorscope can describe the image in the [CIELUV](https://en.wikipedia.org/wiki/CIELUV), [JzAzBz](https://www.osapublishing.org/oe/fulltext.cfm?uri=oe-25-13-15131&id=368272) or [RYB](https://en.wikipedia.org/wiki/RYB_color_model) colorspace. Clicking the third-to-leftmost button on the panel cycles between u\*v\*, AzBz and RYB. The CIELUV graph will be faster to calculate, and is a well-known standard. JzAzBz may be more perceptually accurate.

The graph includes a "hue ring" representing the maximum chroma of each hue (in bounded RGB) of the current histogram profile. The RGB primaries/secondaries are marked by circles.

### caveats

- The hue ring is not a [gamut check](../darkroom/gamut/), as a color can be within the hue ring, yet out of gamut due to its darkness/lightness.
- When adjusting an image based upon a color checker, faster and more accurate results will come from using [calibrate with a color checker](../../processing-modules/color-calibration/#extracting-settings-using-a-color-checker) in the _color calibration_ module.
- The vectorscope does not have a "skin tone line", which is a flawed generalization rather than a universal standard.
- The vectorscope represents a colorimetric encoding of an image, which inevitably diverges from a viewer's perception of the image.

## exposure adjustment

The histogram, waveform, and RGB parade scopes can be used to directly alter the _exposure_ and _black level_ of the [_exposure_](../../processing-modules/exposure.md) module.

For the histogram, click towards the right-hand side of the histogram and then drag right to increase or drag left to decrease the exposure. In a similar manner you can control the black level by clicking and dragging in the left-hand side.

For horizontal waveform and RGB parade, drag the upper portion of the scope up/down to increase/decrease exposure. Drag the lower portion up/down to increase/decrease the black level.

For vertical waveform and RGB parade scopes, the corresponding regions are to the right (exposure) and left (black level).

You can also scroll in the appropriate area -- rather than dragging -- to adjust exposure and black point. Double-click in the scope to reset the exposure module's parameters to their defaults.

## histogram profile

Image data is converted to the _histogram profile_ before the scope data is calculated. You can choose this profile by right-clicking on the [soft-proof](../darkroom/soft-proof.md) or [gamut check](../darkroom/gamut.md) icons in the bottom panel and then selecting the profile of interest. When soft-proof or gamut check is enabled, the scope is shown in the soft proof profile.

As the scopes module runs at the end of the preview pixelpipe, it receives data in display color space. If you are using a display color space that is not "well behaved" (this is common for a device profile), then colors that are outside of the gamut of the display profile may be clipped or distorted.
