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

The steps shown in the diagram are as follows.

1. A black-and-white mask of the image is produced. Ideally the mask should blur out any detail in the image, and just provide an indication of the general luminosity level of various parts of the image. In the input image, we select a pixel that we want to copy over to the out image, and find the corresponding position of that pixel in the mask.

2. We look at the luminosity level of the mask at that point, then we go over to the tone equaliser curve and find that mask intensity level on the X-axis.

3. We then take a look at the curve to see how much we want to adjust the luminosity of pixels that are covered by that mask intensity level. Positive EV values here will cause that part of the image to be brightened, and negative EV values will cause that part of the image to be darkened. We feed this adjustment value into the tone equalizer's exposure adjustment algorithm.

4. We now take the original pixel fro mthe input image, adjust its luminosity by the exposure level adjustment we identified in step 3, and then copy the ajusted pixel to the output image.

This whole procedure is repeated for every pixel in the input image, until we have built up the output image. The end result is a copy of the input image, but with certain areas brightened or darkened in accordance to the mask and the associated tone equalizer adjustment curve. It is therefore important when using the tone equalizer that the mask divides your image up into different regions, and that it applies a suitable amout of blur within those regions so that all the pixels in that region will get a similar adjustment amount of adjustment to their exposure.

# Usage

The tone equalizer consists of 3 different tabs.

1. The _simple_ tab. This provides a set of sliders that affect the pixels falling under 9 different mask intentiy levels. Moving one of those sliders will affect the brightness of pixels that fall under that particular mask intentisy level.

![tone-equalizer-simple](tone-equalizer-simple.png)

2. The _advanced_ tab. This allows you to control the same 9 control points as in the basic tab, but it represents the amounts of exposure adjustment as a graph, just like the tone equalizer curve shown in the tone equalizer overview diagram. Underneath the curve, you see a histogram. It it important to understand that this histogram represents the intensity levels in your _mask_, not in your input or output image. If the histogram is too bunched up, it means your mask doesn't have a good spread of intensity levels, which means you aren't able to independently control the brightness of different parts of your image. Therefore, you want the histogram to extend from the left side to the right side to cover as many of your control points as possible, in order to give you maximum flexibility in adjusting different parts of your image. If this is not the case, you need address this using the masking tab

![tone-equalizer-advanced](tone-equalizer-advanced.png)

3. The _masking_ tab. This allows you to set up your mask, so that it divides your image up into regions you can control, and that it blurs details within the different regions of your image. Use the _Mask Exposure Compensation_ slider to adjust the histogram left or right, and use the _Mask Contrast Compensation_ slider to spread out the histogram or squeeze it together as needed. Because the histogram is on the _advanced_ tab, but the compensation sliders are on the _masking tab_, a representation of where the histogram starts and finishes is shown by the grey bar under the "mask post-processing" label on the masking tab (specifically, it shows where the middle 80% of the histogram lies). If you see orange at either end of the grey bar, it means the histogram has extended too far off in that direction. You can click the grey button with a black circle at the bottom right of the masking tab to see what the mask actually looks like.

![tone-equalizer-masking](tone-equalizer-masking.png)

Once you have adjusted the mask compensation slider, check the _advanced_ tab again and you should see a good spread of the mask histogram under the tone equalizer's control points. You now have 3 ways to brighten or darken parts of your image.

1. You can now _click+drag_ the control points to brighten or soften different parts of your image. Control points at the left side affect pixels where the mask is dark (which will typically cover your shadows), and control points at the right side affect pixels where the mask is bright (which will typically cover your highlights). 

2. you can use the sliders on the basic tab. These correspond to the control points on the advanced tag.

3. You can place your cursor over the image, and you will see an indication of the mask intensity at that point. Use your mouse wheel to brighten or darken areas of your image that match that mask intensity level.

More details of the various tone equalizer controls are given below.

## the cursor

![tone-equalizer-simple](tone-equalizer-cursor.png)

The cursor in the Tone Equalizer contains a lot of information. You'll see some cross hairs, with what appears to be a single grey circle in the middle. But it's not a single circle. It's 2 concentric circles. The outer circle will always represent the tonal value under the mouse pointer, as it was before any adjustment was made. The inner circle will show the tonal value under the mouse pointer after any adjustment has been made. So if the inner circle is brighter than the outer circle, it means a brightening adjustment has been made to that part of the tonal range of the image. If the inner circle is darker than the outer circle, then that tonal range has been darkened.

You will also notice that there is an arc which either climbs, or descends, from the left side cross hair. This is another way of showing you whether a positive or negative adjustment has been made for any given tonal range under the mouse at its current location.

There is also a text box near the right side cross hair which also shows what adjustments have been made, but in numeric text form.

## display exposure mask

At the bottom of the module, you'll see Display Exposure Mask and to the right of that, an icon as follows:

![tone-equalizer-mask-icon](tone-equalizer-mask-icon.png)

Click on this icon to see the mask which the Tone Equalizer has generated for your image.

The idea behind this mask is to create smooth transitions between tonal ranges, so as to avoid creating halos. Yet, the mask is also able to create well defined edges for high contrast areas of the image. Having this mask displayed will assist in understanding the parameters that follow.

## filter diffusion

This defaults to a value of 1, meaning there is one instance of the mask applied.

If you increase this to 2, a second mask is calculated using the first mask as an input. As a result, the new mask is more fuzzy than when there was only one instance of the mask. Progressively higher values will diffuse the mask even further, however it will cost more processing time.

## smoothing diameter

This controls how much of the surrounding image to take into account when calculating a blur for your mask at a particular point. It defaults to taking into account 25% of the surrounding. With lower values, the transition between dark areas of the mask and lighter areas of the mask will be more pronounced. As this value is increased, those transitions become smoother/softer. Setting really large values is quite processor intensive, and may result in slower display times, especially if the _Denoise Profiled_ module is also activated.

## edge refinement/feathering

Higher values will force the mask to follow high contrast edges more closely. Lower values will give smoother gradients, but may introduce some halos.

## mask quantisation

This slider applies some degree of posterisation to the mask, and in some cases it may be useful to help separate out areas of your image into different masking levels.

