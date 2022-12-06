---
title: astrophoto denoise
id: astrophoto-denoise
applicable-version: 3.4
tags:
working-color-space: Lab
view: darkroom
masking: true
---

Remove image noise while preserving structure.

This is accomplished by averaging each pixel with some surrounding pixels in the image. The weight of such a pixel in the averaging process depends on the similarity of its neighborhood with the neighborhood of the pixel being denoised. A patch with a defined size is used to measure that similarity.

As denoising is a resource-intensive process, it slows down pixelpipe processing significantly. Consider activating this module late in your workflow.

## module controls

patch size
: The radius of the patch used for similarity evaluation.

strength
: The strength of the denoising.

luma
: The amount of denoising to apply to luma. Select carefully in order not to lose too much structure.

chroma
: The amount of denoising to apply to chroma. You can be much more aggressive with this parameter.
