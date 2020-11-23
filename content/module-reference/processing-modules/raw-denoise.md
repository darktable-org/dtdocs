---
title: raw denoise
id: raw-denoise
applicable-verison: 3.2.1
tags: 
working-color-space: Not Applicable (RAW) 
view: darkroom
masking: true
---

Perform denoising on raw image data before it is [demosaiced](./demosaic.md). 

This module has been ported from [dcraw](https://www.dechifro.org/dcraw/).

# module controls

noise threshold
: The threshold for noise detection. Higher values lead to stronger noise removal and greater loss of image detail.

coarse/fine curves
: The noise of an image is usually a combination of fine-grained and coarse-grained noise. These curves allow the image to be denoised more or less depending on the coarseness of the visible noise. The left of the curve will act on very coarse grain noise, while the right of the curve will act on very fine grain noise. 

: Pushing the curve up will result in more smoothing, pulling it down will result in less smoothing. As an example, you can preserve very fine-grained noise by pulling down the rightmost point of the curve to the minimum value. 

: As another example, if you are tackling chroma noise with a [blend mode](../../darkroom/masking-and-blending/blend-modes.md), you can push the rightmost part of the curve up, as colors do not change a lot on fine grain scales. This will help especially if you see some isolated pixel left un-denoised. 

: The best way to use the R, G, and B curves is to examine each of the channels in turn using the [_color calibration_](./color-calibration.md) module in gray mode, denoise that channel, and then repeat for the other channels. This way, you can take into account the fact that some channels may be noisier than others. Beware that guessing which channel is noisy without actually seeing the channels individually is not straightforward and can be counterintuitive. A pixel which is completely red may not be caused by noise on the R channel, but actually by noise on G and B channels.

: See the [wavelet](../../darkroom/interacting-with-modules/wavelets.md) section for more details.
