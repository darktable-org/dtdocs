---
title: highlight reconstruction
id: highlight-reconstruction
applicable-version: 4.0
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

guided laplacians
: Use an algorithm (derived from the [_diffuse or sharpen_](./diffuse.md) module) to replicate details from valid channels into clipped channels and to propagate color gradients from valid surrounding regions into clipped regions. This is a slow and computationally-intensive method designed for maximum smoothness and seamless blending of the reconstructed regions into their neighborhood, and is designed primarily to reconstruct spotlights and specular reflections. This mode is available for Bayer sensors only.

---

**Note:** When using the highlight reconstruction included with the [_filmic rgb_](./filmic-rgb.md) module it may be useful to avoid using this module in _clip highlights_ mode (so that _filmic rgb_ has more information to work with).

---

# module controls

method
: The method used to reconstruct highlights (see above).

clipping threshold
: Manually adjust the clipping threshold against magenta highlights. You shouldn't need to adjust this.

: Click the icon beside the slider to visualise what areas of the image are considered clipped (the clipping mask). If the clipping mask does not match the [RAW over-exposed warning](../utility-modules/darkroom/raw-overexposed.md), you may need to correct this value.

noise level (_guided laplacians_ mode only)
: Add Poisson noise (natural photon noise such as you would find in sensor readings) to the clipped regions. For high-ISO images, the valid regions of the image will be noisy, but the reconstructed clipped areas will be smooth, which may look odd. Adding some noise in the reconstruction helps to visually blend the result with the rest of the image.

iterations (_guided laplacians_ mode only)
: The _guided laplacians_ mode is an iterative process that extrapolates gradients and details from the neighborhood. Each new iteration refines the previous reconstruction but adds more computations that will make the module slower. The default (1 iteration) will typically not be sufficient to completely recover magenta highlights, so you will need to increase this parameter gradually but carefully, to manage the speed/quality trade-off.

inpaint a flat color (_guided laplacians_ mode only)
: Inpainting a flat color is an algorithmic trick that may help recover magenta highlights in difficult cases (large blown areas) by smoothing RGB ratios. It can be seen as a "reconstruction booster" that may reduce the number of iterations required to entirely remove magenta in clipped highlights. However, this also makes the reconstruction less accurate and can lead to non-smooth reconstructed edges and unrelated colors being inpainted (e.g. blue sky or green leaves bleeding into white clouds). Use this setting with caution.

diameter of the reconstruction (_guided laplacians_ mode only)
: The _guided laplacians_ mode uses a multi-scale algorithm that tries to recover details from each scale independently. The _diameter of the reconstruction_ is the largest scale used by the algorithm. Large scales will increase memory consumption as well as runtimes, and may also cause unrelated colors or details to be inpainted in clipped regions. You are advised to use a diameter roughly twice as large as the largest clipped area to be reconstructed. It is also possible that a given diameter may not suit all clipped areas, in which case you should use several instances at different scales and mask the clipped areas accordingly.

# comparison with filmic's highlight reconstruction

It is important to note that the _highlight reconstruction_ module is quite early in the pixel pipeline -- before [_input color profile_](./input-color-profile.md) and the full chromatic adaptation in [_color calibration_](./color-calibration.md) (if you use the _modern chromatic adaptation_ workflow). A common trick to solve clipped highlights is to simply desaturate them to white but, because white is not defined before the full chromatic adaptation and the input color profiling, it is not possible to use this trick here. Technically, there is no color yet at this point in the pipeline, only an arbitrary 3D signal.

The _guided laplacians_ approach has been designed specifically to be immune to white-balance discrepancies and to avoid any concept or method related to color (so there is no explicit desaturation). It only handles gradients (transitions) in the signal and aims at connecting them smoothly, in order to fill the missing parts. This process is quite heavy though, since it falls into the category of supervised machine learning (gradient-based optimization through multi-scale curvature), which is a sub-branch of artificial intelligence.

[_Filmic's highlight reconstruction_](./filmic-rgb.md#reconstruct) uses a simpler color propagation algorithm coupled with a desaturation option that can favor an _achromatic_ reconstruction. Not only does it _know_ about color (because it comes after the full color profiling and chromatic adaptation) but it also uses a simplified and faster version of the algorithm used by the _guided laplacians_ approach. Namely, this variant will not try as hard to restore details and will favor a smooth blur instead.

The filmic reconstruction is good enough for very large clipped patches and offers the benefit of being able to degrade to white as a last resort. It is also better and faster to inpaint solid color into clipped areas, at the expense of details. Its main drawback is that it is not as selective in the source of the colors being inpainted in clipped parts, so it may inpaint unrelated colors.

All in all, you are advised to use the _guided laplacians_ highlight reconstruction mode to:

1. smooth the boundaries of clipped areas,
2. recover spotlights and clipped areas of diameter below approximately 256px (on the full-resolution RAW),
3. remove chromatic aberrations, which can occur during [demosaicing](./demosaic.md) (the next module in the pipeline) at the boundary between clipped and valid regions.

If you find yourself having to increase the _diameter of reconstruction_ past 512px to get a full recovery from magenta, the best approach is usually to cap the diameter to 512px, do the most you can with this setting, and then enable filmic's highlight reconstruction to finish the work. This will give more bearable run-times with a very similar result.
