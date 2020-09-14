---
title: denoise (non-local means)
id: denoise-non-local-means
applicable-verison: 3.2.1
tags: 
working-color-space: Lab 
view: darkroom
masking: true
---

Remove image noise while preserving structure. 

This is accomplished by averaging each pixel with some surrounding pixels in the image. The weight of such a pixel in the averaging process depends on the similarity of its neighborhood with the neighborhood of the pixel being denoised. A patch with a certain size is used to measure that similarity. As denoising is a resource hungry process, it slows down pixelpipe processing significantly. Consider activating this module late in your workflow.

## Module Controls

patch size
: The radius of the patch used for similarity evaluation.

strength
: The strength of the denoising.

luma
: Amount of denoising to apply to luma. Select carefully in order not to lose too much structure.

chroma
: Amount of denoising to apply to chroma. You can be much more aggressive with this parameter compared to luma.