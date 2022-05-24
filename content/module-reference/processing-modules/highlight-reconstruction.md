---
title: highlight reconstruction
id: highlight-reconstruction
applicable-version: 3.2.1
tags:
working-color-space: not-applicable (RAW)
view: darkroom
masking: true
---

Attempt to reconstruct color information for pixels that are clipped in one or more RGB channel.

If these pixels are left partially clipped it can result in unrealistic colors appearing in the image. For example pixels with both green and blue channels clipped will appear to be red without any highlight reconstruction.

Three methods of reconstruction are available:

clip highlights
: Clamp all pixels to the white level (i.e. clip the remaining color channels). This method is most useful in cases where clipped highlights occur in naturally desaturated objects (e.g. clouds).

reconstruct in LCh
: Analyse each pixel with at least one clipped channel and attempt to correct the clipped pixel (in LCh color space) using the values of the other (3 for Bayer or 8 for X-Trans) pixels in the affected sensor block. The reconstructed highlights will still be monochrome, but brighter and with more detail than with “clip highlights”. This method works fairly well with a high-contrast base curve, which renders highlights desaturated. As with _clip highlights_ this method is a good option for naturally desaturated objects.

reconstruct color
: Use an algorithm that transfers color information from unclipped surroundings into the clipped highlights. This method works very well on areas with homogeneous colors and is especially useful on skin tones with smoothly fading highlights. Please note that this method can produce maze-like artifacts on highlights behind high-contrast edges, for example well-exposed fine structures in front of an overexposed background.

guided laplacian
: Use an algorithm derivated from the [_diffuse or sharpen_](./diffuse.md) module to replicate the details from the valid channels into the clipped channels and to propagate the color gradients from the valid surrounding regions into the clipped ones. This is a slow and computationnaly-expensive method designed for maximum smoothness and seamless blending of the reconstructed regions into their neighbourhood, designed mostly to reconstruct spotlights and specular reflexions. This mode is available for Bayer sensor only.

---

**Note:** When using the highlight reconstruction included with the [_filmic rgb_](./filmic-rgb.md) module it may be useful to avoid _highlight reconstruction_ module in _clip_ mode so that filmic has more information to work with.

---

# module controls

method
: The method used to reconstruct highlights (see above).

clipping threshold
: Manually adjust the clipping threshold against magenta highlights. You shouldn't need to adjust this.

: Click the icon beside the slider to visualise what areas of the image are considered clipped (the clipping mask). If the clipping mask does not match the [RAW over-exposed warning](../utility-modules/darkroom/raw-overexposed.md), you may need to correct this value.

noise level (_guided laplacian_ mode only)
: Add Poisson noise (natural photon noise you would find in highlights sensor readings) in clipped regions. For high-ISO images, the valid regions of the picture will be noisy, but the reconstructed clipped areas will be smooth, which may look odd when compared to each other. Adding some noise in the reconstruction helps visually blending the result into the rest of the image.

iterations (_guided laplacian_ mode only)
: The _guided laplacian_ mode is an iterative process that extrapolates gradients and details from the neighbourhood. Each new iteration refines the previous reconstruction but adds more computations that will make the module slower. The default (1 iteration) will typically not be enough to completely recover magenta highlights, so you will need to increase this parameter gradually but carefully, to manage the speed/quality trade-off.

inpaint a flat color (_guided laplacian_ mode only)
: Inpainting a flat color is an algorithmic trick that may help recover magenta highlights in difficult cases (large blown areas) by smoothing RGB ratios. It can be seen as a "reconstruction booster" that may reduce the number of iterations required to entirely remove magenta in clipped highlights, however it also makes the reconstruction less accurate and can lead to non-smooth reconstructed edges and unrelated color being inpainted (e.g. blue sky or green leaves wrongfully bleeding in white clouds). Use this setting with caution.

diameter of the reconstruction (_guided laplacian_ mode only)
: The _guided laplacian_ mode uses a multi-scale algorithm that tries to recover details from each scale independently. The _diameter of the reconstruction_ is the largest scale being used. Large scales will increase the memory consumption as well as the runtimes, and may also allow unrelated colors or details to get inpainted in clipped regions. It is recommended to use a diameter roughly twice as large as the largest clipped area to reconstruct. It is also possible that a given diameter may not suit all clipped areas, in which case it is recommended to use several instances at different scales and to mask the clipped areas accordingly.

# Comparison with filmic's highlights reconstruction

It is important to note that the _highlights reconstruction_ module sits in the pixel pipeline before the input color profile and before the full chromatic adaptation happening in [_color calibration_](./color-calibration.md), in case you use the _modern chromatic adaptation_ workflow. A common trick to solve clipped highlights is simply to desaturate them to white. But because white is not defined before the full chromatic adaptation and the input color profiling, it is not possible to use this trick here. Technically, there is no color yet at this place in the pipeline, only an arbitrary 3D signal.

The _guided laplacian_ approach has been designed specifically to be immune to the white-balance discrepancies and to not use any concept or method related to color (so there is no explicit desaturation). It only handles the gradients (transitions) in the signal and aims at making them smoothly connected, in order to fill the missing parts. This process, however is quite heavy since it falls in the category of supervised machine learning (gradient-based optimization through multi-scale curvature), which is a subbranch of artificial intelligence.

The [_filmic highlights reconstruction_](./filmic-rgb.md#reconstruct) uses a simpler color propagation algorithm coupled with a desaturation option that can favour an _achromatic_ reconstruction. Not only does it _know_ color, because it comes after the full color profiling and chromatic adaptation, but it also uses a simplified and faster version of what _guided laplacian_ do. Namely, this variant will not try as hard to restore details and will favour smooth blur instead.

The filmic reconstruction is good enough for very large clipped patches and offers the benefit of being able to degrade to white as a last resort. It is also better and faster to inpaint solid color into clipped areas, at the expense of details. Its main drawback is it is not as selective in the source of the colors being inpainted in clipped parts, so it may inpaint unrelated colors.

All in all, you are advised to use the _guided laplacian_ to:

1. smoothen the boundaries of the clipped areas,
2. recover spot lights and clipped areas of diameter roughly lesser than 256 px (on the full-resolution RAW),
3. remove chromatic aberrations that can occur during demosaicing (next in pipeline) at the boundary between clipped and valid regions.

If you find yourself having to increase the _diameter of reconstruction_ past 512 px to get a full recovery from magenta, usually the best approach is to cap the diameter to 512 px, do the most you can with this setting, and then enable filmic's reconstruction
to finish the work. This will give more bearable runtimes with a very similar result.
