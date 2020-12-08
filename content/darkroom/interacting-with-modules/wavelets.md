---
title: wavelets
id: wavelets
weight: 55
draft: false
---

Wavelets are a technique used in image processing to separate (or _decompose_) an image into a number of distinct _layers_, each containing a different level of detail. After decomposing an image in this way, a module can limit its processing to one or more of these detail layers, and then piece the layers back together again at the end to form its output image. This allows us to be surgical about which features in the image we wish to impact when working with a module. 

Some of the operations darktable can perform in this way are:

- noise removal (in the [_denoise (profiled)_](../../module-reference/processing-modules/denoise-profiled.md), [_raw denoise_](../../module-reference/processing-modules/raw-denoise.md) and [_contrast equalizer_](../../module-reference/processing-modules/contrast-equalizer.md) modules) 
- contrast adjustment (in the [_contrast equalizer_](../../module-reference/processing-modules/contrast-equalizer.md) module)
- blurring or removal of unwanted detail (in the [_retouch_](../../module-reference/processing-modules/retouch.md) module)

# theory

A wavelet is a mathematical function that starts off at zero, oscillates up and down and then settles back to zero. The following diagram shows some simple wavelets of differing sizes.

![wavelets-overview](./wavelets/wavelets-overview.png#w50) 

These wavelet functions are used to scan across and down the image using a mathematical operation called _convolution_. This picks out details from the image that are on a similar scale to the size of a given wavelet, and builds a number of detail layers each corresponding to a different wavelet scale.

Below is an example where detail layers have been extracted from the image shown above. In this case, the images were produced using the [_retouch_](../../module-reference/processing-modules/retouch.md) module, splitting the image into 8 different layers, and using the module's controls to visualise the details present at each of these wavelet scales:

![wavelets-retouch-gui](./wavelets/clean-retouch.png#w33)

The bars in the _wavelet decompose_ section indicate the layers that have been extracted at different wavelet scales. The darkest rectangle at the left represents the entire image (before decomposition) and the grey boxes represent each of the decomposed layers. Clicking on the staircase icon below the bar graph enables the layer visualisation overlay so that you can see what the currently selected layer looks like. 

Let's take a look at some of the layers generated for the above image.

At scale #2, the image contains only very fine details, including the model's eyebrows, eye lashes and the pores of his skin. It doesn't include the coarser details of the image, because those details have been extracted to other layers:

![wavelets-layer-scale-2](./wavelets/wavelets-layer-scale-2.png#w50)

At scales #5 and #6 we begin to see larger and larger features:

![wavelets-layer-scale-5](./wavelets/wavelets-layer-scale-5.png#w50) 

![wavelets-layer-scale-6](./wavelets/wavelets-layer-scale-6.png#w50)

By scale #8 we only see very high-level features such as the overall shape of the model's nose, eye and the cheek:

![wavelets-layer-scale-8](./wavelets/wavelets-layer-scale-8.png#w50)

# why use wavelets?

Suppose, in the above example, that we wanted to smooth out some of the blotchiness in the model's skin, without losing any of the underlying skin texture. Wavelet decomposition makes this a trivial operation - we can simply use the retouch module to apply a Gaussian blur to only the 'blotchy' detail layer(s), leaving all other detail layers untouched. Once the adjustment is complete, the retouch module simply recombines that adjusted layer with the remaining untouched layers to produce the final image.

The sequence of images below shows (1) The original image; (2) The layer (scale 5) that we wish to blur; and (3) The final image after the scale 5 layer has been blurred and the layers recombined:

![wavelets-original](./wavelets/wavelets-original.png#w50) 

![wavelets-layer-scale-5](./wavelets/wavelets-layer-scale-5.png#w50) 

![wavelets-blur-layered](./wavelets/wavelets-blur-layered.png#w50)

As you can see, the large-scale skin blotches have been removed, but the smaller-scale details remain untouched.

# interacting with wavelet scales

There are two methods by which processing modules allow you to modify their operation using wavelet scales

## wavelet decomposition

As discussed above, the _retouch_ module allows you to choose how many detail levels to split your image into. It decomposes the image into separate layers and allows you to perform operations selectively on each individual layer or on the image as a whole:

![wavelets-retouch-gui](./wavelets/clean-retouch.png#w33)

See the [_retouch_](../../../module-reference/processing-modules/retouch.md) module documentation for more details.

## spline controls

The [_denoise (profiled)_](../../module-reference/processing-modules/denoise-profiled.md), [_raw denoise_](../../module-reference/processing-modules/raw-denoise.md) and [_contrast equalizer_](../../module-reference/processing-modules/contrast-equalizer.md) modules allow their effects to be applied more or less to different wavelet scales using _splines_.

![spline](./wavelets/clean-spline.png#w33)

Here, each node in the graph represents a different level of detail in the image, from coarse detail on the left to fine detail on the right. You can raise or lower each of these nodes with your mouse to increase or decrease the module's effect, respectively, on that wavelet scale. 

To modify the curve, click slightly above or below the line near to a node and drag up or down. You can change the width of your modification by scrolling with your mouse wheel, which increases or reduces the size of the circle displayed under your mouse pointer. A small circle indicates that the effect of dragging the curve up or down will be isolated mostly to the node being adjusted. A larger circle indicates that the effect will be more broad and will increasingly impact adjacent nodes. When you hover your mouse over the graph, shaded areas indicate the parts of the spline that will be impacted when you attempt to modify the curve.
