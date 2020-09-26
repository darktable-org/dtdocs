---
title: tone equalizer
id: tone-equalizer
applicable-verison: 3.2.1
tags: 
working-color-space: 
view: darkroom
masking: 
---

The _tone equalizer_ module is a tool for doing dodging and burning in your image. It is designed to be used together with filmic, where it can selectively brighten or darken up to 9 different ranges of luminosity. When used together with filmic, it replaces the need for other tone-mapping modules such as the Base Curve, Shadows/Highlights, Tone Curve and the Zone System modules. It works in linear RGB space, and it uses a mask to guide the dodging and burning adjustments, which helps to preserve local contrast within the image.

In order to understand how the tone equaliser works, please refer to the following image:

![tone-equalizer-mask](tone-equalizer-overview.png)

From the input image (A), a monochrome mask (B) is produced, based on the intensities in that mask, the tone equaliser can selectively adjust the exposure of different parts of the input image (A) to produce the final output image (C). The steps used to achieve this "dogging and burning" effect are as follows:

1. A black-and-white mask of the image is produced. Ideally the mask should blur out any detail in the image, and just provide an indication of the general luminosity level of various parts of the image. In the input image, we select a pixel that we want to copy over to the out image, and find the corresponding position of that pixel in the mask.

2. We look at the luminosity level of the mask at that point, then we go over to the tone equaliser curve and look for that mask intensity level on the horizontal axis.

3. We then take a look at the curve to see where on the vertical axis it falls, and this will determine how much we want to adjust the luminosity of the pixel. All pixels which are mapped to this same mask intentisy level will be brightned or darkened by this same amount. If this point of the curve lies above the horizontal axis, parts of the image mapping to this mask intensity level will all be brightened, and if this point of the curve lies below the horizontal axis, the corresponding pixels will be darkened. The exposure adjustment value we read off the vertical axis is fed into tone equalizer's exposure adjustment algorithm for that pixel.

4. We now take the original pixel from the input image, adjust its luminosity by the exposure level adjustment we identified in step 3, and then copy the ajusted pixel to the output image.

This whole procedure is repeated for every pixel in the input image, until we have finished building up the output image. The end result is a copy of the input image, but with certain areas brightened or darkened in accordance to the mask and the associated tone equalizer adjustment curve. It is therefore important when using the tone equalizer that the mask divides your image up into different regions, and that it applies a suitable amout of blur within those regions so that all the pixels in that region will get a similar adjustment amount of adjustment to their exposure.

# module controls

The controls of the _tone equalizer_ module are spread across 3 different tabs, and it is also possible to adjust the exposure levels when hovering the mouse cursor over different parts of the preview image.

## simple tab

This provides a set of sliders that affect the pixels falling under 9 different mask intentiy levels.

![tone-equalizer-simple](tone-equalizer-simple.png)

`-8 EV` through to `0 EV`
: Each of these sliders will adjust the brightness of all pixels that are classified under that particular intentisy level of the mask. Sliders towards the top will generally affect the shadows of the image, whereas sliders towards the bottom will generally affect the highlights of the image, assuming you have a nice spread of the mask's histogram. You can check this by referring to the histogram image on the _advanced_ tab. Note that each one of the sliders corresponds to a control point of the curve on the _advanced_ tab.

display exposure mask
: clicking on the icon to the right of this label will toggle the displaying of the mask.

## advanced tab

This allows you to control the same 9 control points as in the basic tab, but it represents the amounts of exposure adjustment as a graph, just like the tone equalizer curve shown in the tone equalizer overview diagram. Underneath the curve, you see a histogram. It it important to understand that this histogram represents the intensity levels in your _mask_, not in your input or output image. If the histogram is too bunched up, it means your mask doesn't have a good spread of intensity levels, which means you aren't able to independently control the brightness of different parts of your image. Therefore, you want the histogram to extend from the left side to the right side to cover as many of your control points as possible, in order to give you maximum flexibility in adjusting different parts of your image. If this is not the case, you need address this using controls on the _masking_ tab.

![tone-equalizer-advanced](tone-equalizer-advanced.png)

control points on the curve:
: `click+drag` the control points on the tone equalizer curve up or down to adjust the brightness of all pixels that are classified under that mask intensity level shown on the horizontal axis. Control points to the left will normally affect your shadows, and control points to the right will normally affect your highlights, assuming you have a nice spread of the mask histogram. Moving one control points will generally affect control points on either side to ensure the curve remains smooth. Note that each control point corresponds to one of the sliders on the _basic_ tab.

curve smoothing
: moving this control to the right will cause the transitions between the control points to become more gradual. However, going past about 0.6 can introduce some instability in the curve, causing oscillations due to the mathematical constraints on the curve. Moving this slider to the left will result in a better behaved curve, but it may result in harsher tone transitions that may damage local contrast.

display exposure mask
: clicking on the icon to the right of this label will toggle the displaying of the mask.

## masking tab

This tab contains all the controls for setting up your mask. The mask should divides your image up into a range of different tonal regions that you can independently control, and it should also blur details within the different regions of your image so that local contrast is protected. You ideally want the mask histogram shown in the _advanced_ tab to be nicely spread out across all the control points. To avoid having to switch back and forth between the _advanced_ tab and the _masking_ tab, under the "mask post processing" label there is a grey bar showing a representation of the middle 80% of the histogram. By using the controls mentioned below to center and spread out this grey bar, you can then expect to have a nicely shaped histogram when you return to the "advanced" tab. If you see orange at either end of the grey bar, it means too much of the histogram has moved off the edge of the screen, and you need to bring it back to centre and/or compress it a bit more.

![tone-equalizer-masking](tone-equalizer-masking.png)

mask exposure compensation
: use this slider to adjust the histogram to the left or right. Often if you have used the _exposure_ module earlier in your pixel pipeline to adjust the image brightness, you'll need to offset that adjustment by using this exposure compensation slider to recentre the mask's histogram.

mask contrast compensation
: use this slider to spread out the histogram or compress it as needed.

As previously mentioned, the purpose of this mask is to smooth out adjustments in exposure over different regions of the image, in order to preserve the local contrast and to avoid excessively harsh transitions between different tonal ranges. There are tradeoffs to be made here, and the controls that follow allow the creation of more or less well defined edges as required. Having this mask displayed will assist in understanding the parameters that follow.

luminence estimator
: This drop-down box allows you to select the method by which the luminence of a pixel can be estimated when mapping it to a mask intensity value. It defaults to using an  RGB euclidean norm function.

preserve details
: This selects the algorithm used to specify which smoothing algorithm to use when blurring the mask. By default it will use a guided filter, which is effective at preserving strong edges preventing while avoiding gradient reversals that result in artifacts like halos. 

filter diffusion
: By default this is set to a value of `1`, and it means the filtering algorithm is run once on the input image in order to produce the blurred monochrome mask.

: If you increase this to 2, it means the filtering algorithm will be run once on the input image to produce an intermediate mask, and it will then be applied a second time on the intermediate mask to produce the final mask. As a result, the final mask is more fuzzy than when there was only one single application of the mask filtering algorithm. Progressively higher values will diffuse the mask even further, however because the mask filtering algorithm is run multiple times, it will cost more in terms of processing time.

smoothing diameter
: This controls how much of the surrounding image to take into account when calculating a blur for your mask at a particular point. It defaults to taking into account 25% of the surrounding. With lower values, the transition between dark areas of the mask and lighter areas of the mask will be more pronounced. As this value is increased, those transitions become smoother/softer. Setting really large values is quite processor intensive, and may result in slower display times, especially if the _Denoise Profiled_ module is also activated.

edges refinement/feathering
: Higher values will force the mask to follow high contrast edges more closely. Lower values will give smoother gradients, but may introduce some halos.

mask post-processing
: As previously mentioned, this is a representation of the span of the histogram. It covers the middle 80% of the histogram, dropping off the first and last decile to avoid outliers from skewing the indicator too much.

mask quantisation
: This slider applies some degree of posterisation to the mask, so that the mask will tend to center round a few discrete levels. In some cases, this may be useful to help separate out areas of your image into different masking levels.

display exposure mask
: At the bottom of the _tone equalizer_ module, to the right of the "display exposure mask" label, there is an icon like this:

![tone-equalizer-mask-icon](tone-equalizer-mask-icon.png)

Click on this icon to toggle the view of the _tone equalizer_ mask.

# cursor indicator/control
: When the _tone equalizer_ module is selected, moving the mouse pointer over the preview image reveals a cursor with a lot of useful information, and you can use your mouse wheel to brighten or darken areas of your image that are match the mask intensity level at that point. This provides a very convenient way to quickly brighten or darken specific parts of the image.

![tone-equalizer-simple](tone-equalizer-cursor.png)

- cross hairs indicate the pixel for which the information is relevant
- the text label shows the intensity of the mask at that point, in units of EV.
- the shade of the larger grey circle within the crosshairs also provides a visual indication of the intensity of the mask at that point
- if the tone equaliser is going to brighten or darken pixels matching this mask intensity, the magnitude of this adjustment is indicated by an arc around the outside of the large circle. The longer the arc, the greater the adjustment in brightness,
- if there has been an exposure adjustment, the shade of the smaller inner circle within the crosshairs indicates the amount of brightening or darkening, relative to the maks intensity indicated by the outer grey circle. That is to say, if the pixel under the crosshairs will be brightened, the inner circle will be a lighter shade of grey than the larger circle, or if the pixel is to be darkened, the inner circle will be a darker shade of grey than the outer circle.

