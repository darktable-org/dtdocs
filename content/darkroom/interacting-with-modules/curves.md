---
title: curves
id: curves
weight: 50
draft: false
---

Three image processing modules ([base curve](../../module-reference/processing-modules/base-curve.md), [tone curve](../../module-reference/processing-modules/tone-curve.md) and [rgb curve](../../module-reference/processing-modules/rgb-curve.md)) use curves to control the tones in the image. These modules have some common features that deserve separate discussion.

![curve](./curves/curve.png#w50)

# nodes

In their default state, curves are straight lines, defined by two anchor nodes at the top-right and bottom-left of the curve graph. You can move the nodes to modify the curve or generate new nodes by clicking on the curve. With `Ctrl+click` you can generate a new node at the x-location of the mouse pointer and the corresponding y-location of the current curve -- this adds a node without the risk of accidentally modifying the curve. Up to 20 nodes can be defined per curve. To remove a node, click on it and drag it out of the widget area.

# curve controls

The following controls are common to two or more of the above image processing modules and are therefore discussed separately here. Please see the individual module documentation for discussion of any additional module-specific controls.

interpolation method 
: _tone curve and rgb curve modules only_

: Interpolation is the process by which a continuous curve is derived from a few nodes. As this process is never perfect, several methods are offered that can alleviate some of the issues you may encounter.

: - Arguably, the most visually pleasing method is the “cubic spline” -- since it gives smooth curves, the contrast in the image is better enhanced. However, this method is very sensitive to the nodes' position, and can produce cusps and oscillations when the nodes are too close to each other, or when there are too many of them. This method works best when there are only 4 to 5 nodes, evenly spaced.

: - The “centripetal spline” method is designed specifically to avoid cusps and oscillations, but as a drawback it will follow the nodes more loosely. It is very robust, no matter the number of nodes and their spacing, but will produce a more faded and dull contrast.

: - The “monotonic spline” method is designed specifically to give a monotonic interpolation, meaning that there will be none of the oscillations the cubic spline may produce. This method is most suitable when you are trying to build an analytical function from a node interpolation (for example: exponential, logarithm, power, etc.). Such functions are provided as presets. It is a good trade-off between the two aforementioned methods.

preserve colors
: If a non-linear tone curve is applied to each of the RGB channels individually, then the amount of tone adjustment applied to each color channel may be different, and this can cause hue shifts. Therefore, the _preserve colors_ combobox provides different methods of calculating the "luminance level" of a pixel. The amount of tone adjustment is calculated based on this luminance value, and then this same adjustment is applied to all three of the RGB channels. Different luminance estimators can affect the contrast in different parts of the image, depending on the specific characteristics of that image. The user can therefore choose a particular estimator that provides the best results for the given image. Some of these methods are discussed in detail in the **preserve chrominance** control in the [_filmic rgb_](../../module-reference/processing-modules/filmic-rgb.md) module. The following options are available:

: - _none_
: - _luminance_
: - _max RGB_
: - _average RGB_
: - _sum RGB_
: - _norm RGB_
: - _basic power_

scale for graph 
: _tone curve and base curve modules only_

: The scale allows you to distort the graph display so that certain graphical properties emerge to help you draw more useful curves. Note that the scaling option only affects the curve display, not the actual parameters stored by the module.

: By default, a “linear” scale is used (defined by a scale factor of 0). This scale uses evenly spaced abscissa and ordinates axes.

: A logarithmic scale will compress the high values and dilate the low values, on both the abcissa and the axis of ordinates, so that the nodes in lowlights get more space on the graph and can be controlled more clearly.

: Increase the 'scale for graph' slider to set the base of the logarithm used to scale the axes. This allows you to control the amount of compression/dilatation operated by the scale. If you draw purely exponential or logarithmic functions from identity lines, setting this value defines the base of such functions.
