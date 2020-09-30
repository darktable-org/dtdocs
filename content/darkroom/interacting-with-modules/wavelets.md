---
title: wavelets
id: wavelets
weight: 70
draft: false
---

Wavelets are a technique we can use in image processing to decompose an image into different levels of detail, known as _layers_, then we can apply the image processing to one or more layers, and put the picture back together again. This allows us to be surgical about which features in the image we wish to impact. Some of the operations we might perform on the separate layers before sticking them together might be:

- remove noise (like in the [_denoise (profiled)_](../../module-reference/processing-modules/denoise-profiled.md) and [_contrast equalizer_](../../module-reference/processing-modules/contrast-equalizer.md) modules) 
- adjust local contrast (like in the [_contrast equalizer_](../../module-reference/processing-modules/contrast-equalizer.md) module)
- blur unwanted detail (like in the [_retouch_](../../module-reference/processing-modules/retouch.md) module)
- lossy compression (like when we save _JPEG2000_ images using the [_export_](../../module-reference/processing-modules/export-selected.md) module)

# theory

So, what is a wavelet, and how does it work?

A wavelet is a mathematical function that starts off at zero, oscillates up and down and then settles back to zero. The following diagram shows some simple wavelets of different sizes.

![wavelets-overview](wavelets-overview.png) 

The wavelet functions are used to scan across and down the image using a mathematical operation called _convolution_. This picks out details from the image that are on a similar scale to the size of the wavelet, and from that we build different layers of detail corresponding to the different sizes wavelets.

Below are some examples of some layers where the details at various scales have been extracted out of the image shown in the first diagram. They were obtained by using the layer visualisation tool in the [_retouch_](../../module-reference/processing-modules/retouch.md) module):

At scale #2, we can see in the image below just the very fine detail, which includes eyebrows, eye lashes and pores of the skin. It doesn't include the coarser details of the image, because those coarse details are covered by other layers.

![wavelets-layer-scale-2](wavelets-layer-scale-2.png)

At scale #5 and #6, we can see in the two images below that the detail becomes less about the pores of the skin, and more about the blotchiness of the skin. 

![wavelets-layer-scale-5](wavelets-layer-scale-5.png)
![wavelets-layer-scale-6](wavelets-layer-scale-6.png)

At scale #8, in the image below we are only seeing very high-level features such as the nose, the eye and the cheek.

![wavelets-layer-scale-8](wavelets-layer-scale-8.png)

# application: smooth out blotchy skin

So, let's say we wanted to smooth out blotches on the skin of our model. Here is the full size original image:

![wavelets-original](wavelets-original.png)

A first naïve attempt at smoothing the skin might be to apply a blur on the image to cover up the ugly detail. Here is an example where a patch guassian blur has been applied to the cheek, blended with the original image in a 50-50 ratio:

![wavelets-blur-direct](wavelets-blur-direct.png)

You can see it has smoothed out the skin a bit, but it has made a bit of a mess and doesn't look too natural, and some effort would be needed to make it look better.

Now let's see what we can do with wavelets. As mentioned before, the layers at scale 5 & 6 were covering the skin blotches without picking up the pores so much, so let's try applying the same shape of guassian blur patch to layers 5 & 6 only, and then put the picture back together. This is the result:


![wavelets-blur-layered](wavelets-blur-layered.png)

You can see this gives a much more natural result, and it has cleaned up the coarse skin blotches while retaining the fine detail of the pores in the skin. Note that this example is not meant to be a lesson in how to do (or perhaps how not to do) retouching; it is just a very rough exaggerated example attempting to illustrate the principles behind what wavelets are doing and how they can be helpful in image processing.)

One useful trick when using modules that support wavelets -- you can get some clearer idea of what effect the module is having and which levels of detail it is impacting by selecting the uniform mask at the bottom of the module and then choosing the "difference" [blend mode](../masking-and-blending/blend-modes.md) -- this will show you what is the difference between the input and output of the module, and help you to better understand what effect it is having at which levels of detail.

