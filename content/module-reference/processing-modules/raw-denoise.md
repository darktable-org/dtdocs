---
title: raw denoise
id: raw-denoise
applicable-verison: 3.2.1
tags: 
working-color-space: Not Applicable (RAW) 
view: darkroom
masking: true
---

Perform denoising on raw image data before it is demosaiced. This module is ported from dcraw (http://www.cybercom.net/~dcoffin/dcraw/).

## Module Controls

noise threshold
: The threshold for noise detection. Higher values lead to stronger noise removal and greater loss of image detail.

coarse/fine curves
: The noise of an image is usually not only fine grain, but also more or less coarse grain. These curves allow the image to be denoised more or less depending on the coarseness of the visible noise. The left of the curve will act on very coarse grain noise, while the right of the curve will act on very fine grain noise. 

: Pushing up the curve will result in more smoothing, pulling it down will result in less smoothing. As an example, you can preserve very-fine grain noise by pulling down the rightest point of the curve to its the minimum value. 

: As another example, if you are tackling chroma noise with a blend mode, you can push up the right part of the curve, as colors are not supposed to change a lot on fine grain scales. This will help especially if you see some isolated pixel left undenoised. 

: The best way to use the R, G, and B curves is to examine each of the channels in turn using the channel mixer module in gray mode, denoise that channel, and then repeat for the other channels. This way, you can take into account the fact that some channels may be noisier than others. Beware that guessing which channel is noisy without actually seeing the channels individually is not straightforward and can be counterintuitive: a pixel which is completely red may not be caused by noise on the R channel, but actually by noise on B and G channels.