---
title: highlight reconstruction
id: highlight-reconstruction
weight: 10
applicable-version: 4.4
tags:
working-color-space: not-applicable (RAW)
view: darkroom
masking: true
---

Attempt to reconstruct color information for pixels that are clipped in one or more RGB channels.

# clipping

Clipping occurs when the amount of captured light exceeds either the capacity of a camera's sensor to record that light (photosite saturation) or the capacity of the Raw file to store it (digital clipping). Once a pixel is clipped we can no longer know the precise brightness of that pixel -- only that it is equal to or greater than the maximum value that pixel can store.

Ideally, the photosite saturation point would be the same as the value at which digital clipping occurs (to make maximum use of the camera's dynamic range) but these values often differ between cameras. Darktable uses a camera's "white point" to determine whether or not a given channel is clipped. If the white point is set incorrectly for a given camera, this can lead to valid pixels being clipped and can adversely impact the effectiveness of this module.

When a camera captures light (using a normal Bayer sensor) each pixel represents a single color (R,G,B), which is then interpolated by the demosaic module to calculate the color of neighboring pixels. The result will often be pixels (in the demosaiced image) that are clipped in some (R,G,B) channels but not others.

If these pixels are left partially clipped it can result in unrealistic colors appearing in the image. These incorrect colors can then be further skewed by the white balance module, which adjusts the ratios of the R, G, and B channels to account for the overall color of the scene. For example, where only the G channel is clipped (and R and B are close to clipping) the white balance module can cause the R and B channels to be adjusted above the clipping point of the G channel leading to pink highlights that would otherwise have been white.

The crude method to resolve this is to clip the R and B channels to the clipping point of the G channel (the "clip highlights" reconstruction method), but this can result in the loss of valid pixel data that may be useful in highlight reconstruction, and may also cause other artefacts and hue shifts.

# highlight reconstruction methods

A number of highlight reconstruction methods are provided within this module. These methods all use unclipped channels and/or adjacent pixels to reconstruct the missing data.

inpaint opposed (default)
: Restore clipped pixels by using an average of adjacent unclipped pixels to estimate the correct color. This works well for the majority of images but may fail where the clipped areas are adjacent to areas of a different color.

segmentation based
: A more sophisticated algorithm that uses adjacent unclipped pixels to estimate the correct color, by treating each clipped area separately (as an individual segment). The color of each clipped segment is estimated by analysing the color ratios of the adjacent pixels. Pixels that are too dark or appear to be an edge are rejected by the algorithm. If all surrounding pixels are rejected, that segment is reconstructed using the "inpaint opposed" method (above). Segments that are close together are often parts of the same object and so can be treated as if they were a single segment.

: Segmentation based reconstruction is able to rebuild large areas where all channels are clipped by examining the surrounding gradients. However, you should think of this method more as a way to "disguise" clipped areas with something plausible, rather than a way to "magically" repair them.

guided laplacians
: Use an algorithm (derived from the [_diffuse or sharpen_](./diffuse.md) module) to replicate details from valid channels into clipped channels and to propagate color gradients from valid surrounding regions into clipped regions. This is a computationally-intensive method designed for maximum smoothness and seamless blending of the reconstructed regions into their neighborhood, and is designed primarily to reconstruct spotlights and specular reflections. This mode is available for Bayer sensors only.

clip highlights
: Clamp all pixels to the white level (i.e. clip the remaining color channels). This method is most useful in cases where clipped highlights occur in naturally desaturated objects (e.g. clouds).

reconstruct in LCh
: Analyse each pixel with at least one clipped channel and attempt to correct the clipped pixel (in LCh color space) using the values of the other (3 for Bayer or 8 for X-Trans) pixels in the affected sensor block. The reconstructed highlights will still be monochrome, but brighter and with more detail than with “clip highlights”. This method works fairly well with a high-contrast base curve, which renders highlights desaturated. As with _clip highlights_ this method is a good option for naturally desaturated objects.

reconstruct color
: Use an algorithm that transfers color information from unclipped surroundings into the clipped highlights. This method works very well on areas with homogeneous colors and is especially useful on skin tones with smoothly fading highlights. Please note that this method can produce maze-like artifacts on highlights behind high-contrast edges, for example well-exposed fine structures in front of an overexposed background.

---

**Note:** When using the highlight reconstruction included with the [_filmic rgb_](./filmic-rgb.md) module it may be better to avoid using this module in _clip highlights_ mode (so that _filmic rgb_ has more information to work with).

**Note 2:** The amount of 'clipped signal' is advertised as a raster mask that can be used by other modules as usual.

---

# module controls

## common controls

method
: The method used to reconstruct highlights.

clipping threshold
: Pixels above this value are considered to be clipped.

: Click the icon beside the slider to visualise what areas of the image are considered to be clipped (the clipping mask). If the clipping mask does not match the [RAW overexposed warning](../utility-modules/darkroom/raw-overexposed.md), you may need to correct this value.

## "guided laplacians" mode

noise level
: Add Poisson noise (natural photon noise such as you would find in sensor readings) to the clipped regions. For high-ISO images, the valid regions of the image will be noisy, but the reconstructed clipped areas will be smooth, which may look odd. Adding some noise in the reconstruction helps to visually blend the result with the rest of the image.

iterations
: The _guided laplacians_ mode is an iterative process that extrapolates gradients and details from the neighborhood. Each new iteration refines the previous reconstruction but adds more computations that will make the module slower. The default number of iterations should provide reasonable results but you can increase if magenta highlights are not completely recovered -- increase this parameter gradually but carefully, to manage the speed/quality trade-off.

inpaint a flat color
: Inpainting a flat color is an algorithmic trick that may help recover magenta highlights in difficult cases (large blown areas) by smoothing RGB ratios. It can be seen as a "reconstruction booster" that may reduce the number of iterations required to entirely remove magenta in clipped highlights. However, this also makes the reconstruction less accurate and can lead to non-smooth reconstructed edges and unrelated colors being inpainted (e.g. blue sky or green leaves bleeding into white clouds). Use this setting with caution.

diameter of the reconstruction
: The _guided laplacians_ mode uses a multi-scale algorithm that tries to recover details from each scale independently. The _diameter of the reconstruction_ is the largest scale used by the algorithm. Large scales will increase memory consumption as well as runtimes, and may also cause unrelated colors or details to be inpainted in clipped regions. You are advised to use a diameter roughly twice as large as the largest clipped area to be reconstructed. It is also possible that a given diameter may not suit all clipped areas, in which case you should use several instances at different scales and mask the clipped areas accordingly.

## "segmentation based" mode

clipping threshold
: Since this controls the locations of pixels that are considered to be clipped, it also changes the size of the resulting segments and the location of the adjacent pixels used for the reconstruction. For accurate adjustment, you can use the exposure module to ensure that no highlights are clipped in the histogram (or the image you see on screen). Then raise the clipping threshold until the highlights are no longer white and slowly lower it again until they look acceptable.

combine
: The radius at which close segments are combined and considered to be part of the same segment. Increase (to combine more segments) when different parts of the same object have been incorrectly reconstructed to different colors. Decrease (to separate segments) when different objects have been incorrectly reconstructed to the same color. Click on the button beside the slider to see the outlines of the resulting segments.

candidating
: Choose whether to prefer choosing candidate pixels (used to obtain color data) with segmentation analysis (high values) or inpaint opposed (low values). Click the button beside the slider to show the segments that are considered to have good candidates.

rebuild
: Choose how to rebuild areas that have all channels clipped. The "small" and "large" modes are tuned for segment sizes less than 25 and greater than 100 pixels in diameter, respectively. The "flat" modes attempt to ignore narrow un-clipped features (powerlines, branches) to avoid gradients. Finally, the "generic" modes attempt to find the best settings for each segment.

# "guided laplacians" mode and filmic's highlight reconstruction

It is important to note that the _highlight reconstruction_ module is quite early in the pixel pipeline -- before [_input color profile_](./input-color-profile.md) and the full chromatic adaptation in [_color calibration_](./color-calibration.md) (if you use the _modern chromatic adaptation_ workflow). A common trick to solve clipped highlights is to simply desaturate them to white but, because white is not defined before the full chromatic adaptation and the input color profiling, it is not possible to use this trick here. Technically, there is no color yet at this point in the pipeline, only an arbitrary 3D signal.

The _guided laplacians_ approach has been designed specifically to be immune to white-balance discrepancies and to avoid any concept or method related to color (so there is no explicit desaturation). It only handles gradients (transitions) in the signal and aims at connecting them smoothly, in order to fill the missing parts. This process is quite heavy though, since it falls into the category of supervised machine learning (gradient-based optimization through multi-scale curvature), which is a sub-branch of artificial intelligence.

[_Filmic's highlight reconstruction_](./filmic-rgb.md#reconstruct) uses a simpler color propagation algorithm coupled with a desaturation option that can favor an _achromatic_ reconstruction. Not only does it _know_ about color (because it comes after the full color profiling and chromatic adaptation) but it also uses a simplified and faster version of the algorithm used by the _guided laplacians_ approach. Namely, this variant will not try as hard to restore details and will favor a smooth blur instead.

The filmic reconstruction is good enough for very large clipped patches and offers the benefit of being able to degrade to white as a last resort. It is also better and faster to inpaint solid color into clipped areas, at the expense of details. Its main drawback is that it is not as selective in the source of the colors being inpainted in clipped parts, so it may inpaint unrelated colors.

All in all, you are advised to use the _guided laplacians_ highlight reconstruction mode to:

1. smooth the boundaries of clipped areas,
2. recover spotlights and clipped areas of diameter below approximately 256px (on the full-resolution RAW),
3. remove chromatic aberrations, which can occur during [demosaicing](./demosaic.md) (the next module in the pipeline) at the boundary between clipped and valid regions.

If you find yourself having to increase the _diameter of reconstruction_ past 512px to get a full recovery from magenta, the best approach is usually to cap the diameter to 512px, do the most you can with this setting, and then enable filmic's highlight reconstruction to finish the work. This will give more bearable run-times with a very similar result.
