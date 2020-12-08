---
title: histogram
id: histogram
applicable-verison: 3.2.1
tags: 
view: lighttable, tethering
---

A graphical depiction of the developed image's light levels.

![histogram](./histogram/histogram.png#w33)

Move the mouse over the panel to show buttons to adjust the display. The leftmost button cycles the mode between a "regular" and a waveform-style histogram. The next button controls how the data for the current mode is displayed. The three rightmost colored squares are toggles which enable or disable the display of the red, green and blue color channels.  

When the mouse is over the histogram panel, scrolling with the mouse while holding down the Ctrl key will change the height of the panel. You can show/hide the histogram entirely with a keyboard shortcut (default Ctrl+Shift+H).

For the purposes of speed, the histogram display is calculated from the image preview (the image which is displayed in the [navigation](../darkroom/navigation.md) module) rather than the higher quality image displayed in the center view. The preview is calculated at a lower resolution and may use shortcuts to bypass time-consuming image processing steps. Hence the display may not accurately represent fine detail in the image, and may deviate in other ways from the final developed image.

# the "regular" histogram

![histogram-regular](./histogram/histogram-regular.png#w33)

This shows the distribution of pixels by lightness for each color channel channel. In its default state, data for all three RGB color channels is displayed. The x-axis runs from 0% to 100% lightness for each channel. The y-axis gives the count of pixels with the given lightness.

Click the second-to-leftmost button on the panel to toggle between a logarithmic and a linear rendering of the y-axis data.

# waveform

![histogram-waveform](./histogram/histogram-waveform.png#w33)

The waveform scope includes spatial data about the image. The y-axis represents the distribution of pixels by lightness for each channel. The x-axis represents the distribution of this data across the x-axis of the image. The lightness of each point of the waveform represents the number of pixels at that position.  

The thick dotted horizontal line at the top of the waveform histogram represents 100% lightness. Any channel displayed above that line may be clipped in the resulting image. The thinner dotted horizontal line represents 50% lightness. The bottom of the scope represents 0% lightness.  

As with the "regular" histogram, it is possible to selectively display red, green, and blue channels, or (the default) all three of them.  

See [Of Histograms and Waveforms](https://www.darktable.org/2013/12/of-histograms-and-waveforms/) for more on darktable's waveform scope.

# rgb parade

![histogram-parade](./histogram/histogram-parade.png#w33)

This shows the same data as the waveform, but with the red, green, and blue channels presented side-by-side. When in waveform mode, clicking the second-to-leftmost button on the panel toggles between waveform (overlaid) and RGB parade rendering of the data.  

The RGB parade can be useful for matching the intensities of the red, green, and blue channels. It can also help with understanding the differences between and individual qualities of each channel.

# exposure adjustment

The histogram can be used to directly alter the _exposure_ and _black level_ of the [_exposure_](../../processing-modules/exposure.md) module.

For the regular histogram, click towards the right hand side of the histogram and then drag right to increase or drag left to decrease the exposure. In a similar manner you can control the black level by clicking and dragging in the left hand side.

For waveform-style scopes, dragging the upper portion of the histogram up/down will increase/decrease exposure. Dragging the lower portion up/down will increase/decrease the black level.  

Scrolling in the appropriate area -- rather than dragging -- will also adjust exposure and black point. Double-click in the histogram to reset the exposure module's parameters to their defaults.

# histogram profile

For the regular histogram, the image data is converted to the _histogram profile_ before the histogram is calculated. You can choose this profile by right-clicking on the [soft-proof](../darkroom/soft-proof.md) or [gamut check](../darkroom/gamut.md) icons in the bottom panel and then selecting the profile of interest.  

In the case of the waveform and RGB parade scopes, the colorspace depends on the [preferences > lighttable > color manage cached thumbnails](../../../preferences-settings/lighttable.md) configuration parameter. In its default (true) setting, these scopes are calculated in the “Adobe RGB (compatible)” colorspace. Otherwise, they are calculated in the display colorspace.
