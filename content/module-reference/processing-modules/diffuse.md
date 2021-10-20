---
title: diffuse or sharpen
id: diffuse
applicable-version: 3.8
tags:
working-color-space: RGB
view: darkroom
masking: true
---

Diffusion is a family of physical processes by which particles move and spread gradually with time, from a source that generates them. In image processing, diffusion mostly occurs in two places:

- diffusion of photons through lens glass (blur) or humid air (hazing),
- diffusion of pigments in wet inks or watercolors.

In both cases, diffusion makes the image less sharp by "leaking" particles and smoothing local variations.

The _diffuse or sharpen_ module uses a generalized physical model to describe several kinds of diffusion, and can be used by image makers to either simulate or revert diffusion processes.

As it is a highly technical module, several presets are provided to demonstrate its use for various purposes.

Diffusion can be removed in order to:

- recover the original image from sensors with an anti-aliasing filter or mitigate the blur created by most demosaicing algorithms (use the _sharpen sensor demosaicing_ preset and move the module before the _input color profile_ module in the pipeline),
- reverse lens blurring/defocusing (use the _lens deblur_ preset),
- remove atmospheric haze (use the _dehaze_ preset),
- add extra acutance for better legibility (use the _local contrast_ preset)

Diffusion can be added in order to:

- create a bloom or Orton effect (use the _bloom_ preset),
- inpaint missing or damaged parts of an image,
- denoise in an edge-preserving way (use the _denoise_ preset)
- apply a surface blur (use the _surface blur_ preset).

Since the process is physical, even its glitches may be used for creative purposes. For example, you can:

- simulate line drawing or watercolor (use the _simulate line drawing_ and _simulate watercolor_ presets),
- create random patterns and textures by increasing noise (over time, with iterations, noise will connect with neighbours to create random specks).

---

**Note:** This module is highly resource-intensive, as it is actually an anisotropic, multiscale, partial differential equation solver. The module's runtime increases with the number of iterations and OpenCL is therefore strongly recommended.

---

# concepts

## time

Diffusion is a time-dependent process: the more time it has, the further the particles can spread. In this module, time is simulated using the number of iterations (the number of times the algorithm runs on top of itself). More iterations can make reconstruction (deblurring, denoising, dehazing) more accurate if properly set, but can also cause it to degenerate.

## direction

Natural diffusion usually takes place from points with a high potential (high energy or high concentration of particles) to those with a low potential (low energy or low concentration of particles). In an image, this means that diffusion always occurs from the brightest pixels to the darkest.

This particular implementation can simulate natural diffusion, using what is called an isotropic diffusion (all directions have the same weight, like heat diffusion), but can also force a weighted direction parallel to the gradients (forcing diffusion across object edges and creating ghost edges), or a weighted direction perpendicular to the gradients, called isophote (forcing diffusion to be contained inside edges, like in a droplet of watercolor). The relative weight of each direction (gradient and isophote) is user-defined and can by found in the [_diffusion directionality_](#diffusion-directionality) section of the module.

## speed

Depending how fluid the environnement is, particles can move more or less freely and therefore more or less fast. The speed of diffusion can be set in the [_diffusion speed_](#diffusion-speed) section of the module.

When performing reconstruction (denoising, deblurring, dehazing), it is advisable to use smaller speeds for better accuracy. This prevents numerical overshoots (and therefore degeneration of the solution) and may require more iterations. For small numbers of iterations, higher speeds may be used. Note that large blurs need many iterations for proper reconstruction, so the speed should be adjusted to avoid degenerating the solution.

All speeds are added (first to fourth orders), and the sums "`first order + second order`" and "`third order + fourth order`" should never exceed ±100%.

## scale

Natural diffusion is supposed to happen only to the closest neighbouring coordinates. That is, at each iteration, each pixel should only interact with its 9 nearest neighours.

Here, we fast-track things a bit to save time and reuse the multi-scale wavelets scheme from the [_contrast equalizer_](./contrast-equalizer.md) module, so that we can diffuse at different scales. The maximal scale of diffusion is defined by the _max radius_ parameter.

Regardless of the diffusion, a _sharpness_ parameter allows you to increase or decrease the details at each scale, much like the spline controls of the _contrast equalizer_. Along with the _edge sensitivity_ slider, this provides the same features as the _contrast equalizer_ module (_luma_ and _edges_ tabs) but in a scene-referred RGB space.

# module controls

## diffusion properties

iterations
: The number of times the algorithm should run on top of itself. High values slow the module down but allow more accurate reconstructions, provided that the diffusion speeds are low enough.

max radius
: The maximal distance of diffusion, expressed in pixels of the full-resolution image. High values diffuse further, at the expense of computation time. Low values diffuse closer. If you plan to denoise, the max radius should be approximately the width of your lens blur.

central radius
: The main scale of the diffusion. Zero causes the diffusion to act more heavily on fine details (used for deblurring and denoising). Non-zero values define the size of details to be heavily diffused (used to increase local contrast).

## diffusion speed

1st order speed (gradient)
: The speed of diffusion of the low-frequency wavelet layers in the direction defined by the _1st order anisotropy_ setting. Positive values apply diffusion, negative values undo diffusion, zero does nothing.

2nd order speed (laplacian)
: The speed of diffusion of the low-frequency wavelet layers in the direction defined by the _2nd order anisotropy_ setting. Positive values apply diffusion, negative values undo diffusion, zero does nothing.

3rd order speed (gradient of laplacian)
: The speed of diffusion of the high-frequency wavelet layers in the direction defined by the _3nd order anisotropy_ setting. Positive values apply diffusion, negative values undo diffusion, zero does nothing.

4th order speed (laplacian of laplacian)
: The speed of diffusion of the high-frequency wavelet layers in the direction defined by the _4th order anisotropy_ setting. Positive values apply diffusion, negative values undo diffusion, zero does nothing.

## diffusion directionality

1st order anisotropy
: The direction of diffusion of the low-frequency wavelet layers relative to the orientation of the gradient of the low-frequency. Zero is isotropic, negative values make diffusion follow gradients more closely, positive values make diffusion follow isophotes more closely.

2nd order anisotropy
: The direction of diffusion of the low-frequency wavelet layers relative to the orientation of the gradient of the high-frequency. Zero is isotropic, negative values make diffusion follow gradients more closely, positive values make diffusion follow isophotes more closely.

3rd order anisotropy
: The direction of diffusion of the high-frequency wavelet layers relative to the orientation of the gradient of the low-frequency. Zero is isotropic, negative values make diffusion follow gradients more closely, positive values make diffusion follow isophotes more closely.

4rd order anisotropy
: The direction of diffusion of the high-frequency wavelet layers relative to the orientation of the gradient of the high-frequency. Zero is isotropic, negative values make diffusion follow gradients more closely, positive values make diffusion follow isophotes more closely.

## edges management

sharpness
: Apply a gain on wavelet details, regardless of diffusion properties. Zero does nothing, positive values sharpen, negative values blur.

edge sensitivity
: Apply a penalty over the diffusion speeds when edges are detected. This detection uses the local variance around each pixel. Zero disables the penalty, higher values make the penalty stronger. Increase if you notice edge artifacts like fringes and halos.

edge threshold
: Define a variance threshold. Pixels with a local variance below that threshold will have their diffusion speeds amplified, while pixels with local variance above that threshold will be penalized. Use carefully for large blurs, as it may increase noise in flat areas faster than details recovery.

## diffusion spatiality

luminance masking threshold
: This control is useful if you want to in-paint highlights. For values greater than 0%, the diffusion will only occur in regions with a luminance greater than this setting.

# workflow

The main difficulty with this module is that while its output can vary dramatically depending on its input paramaters, these parameters have no intuitive link to everyday life. Users are likely to be overwhelmed, unless they are already familiar with Fourier partial differential equations. This section proposes some ways to approach this module without the burden of having to understand the underlying theory.

## general advice

If you intend to deblur your image using this module, always start by properly correctiong any chromatic aberrations and noise in the image, since the deblurring may magnify these artifacts. It is also important that you don't have clipped black pixels in your image. These can be corrected with the _black level correction_ of the [_exposure_](./exposure.md) module.

## starting with presets

The provided presets have been tuned by the developer and tested on a range of images for typical purposes. The easiest way is simply to start from the presets, and then tweak them as needed:

- if the effect seems too strong, decrease the number of iterations,
- if edge artifacts appear, increase the edge sensitivity,
- if debluring starts to affect valid blurry parts (bokeh), reduce the radius,
- if debluring seems correct in bright areas but excessive in dark areas, increase the edges _threshold_,
- if debluring clips black pixels, lower the _black level correction_ in _exposure_ module,
- fine-tune the _sharpness_ to your taste.

## starting from scratch

The module's default settings are entirely neutral and will do nothing to your image. The spirit of the module is that each order affects the texture of the image in a particular way.

Start by tuning the first order parameters (speed and anisotropy) to get an initial base. Then adjust the radius. This will affect coarser textures (either blur or sharpen them). Remember that the first order acts on the low frequencies of the wavelet scale and follows a direction parallel or perpendicular to the gradient of the low frequencies.

Next, start to tune the second order parameters (speed and anisotropy). The second order also acts on the low frequencies of the wavelet scale but this time follows a direction parallel or perpendicular to the gradient of the _high_ frequencies, which can either be the direction of maximal sharpness or of noise. This can be used to reduce noise (using the second order in diffusion mode, with positive values) when you used the first order in sharpening mode (with negative values).

These two steps can be performed on the zoomed-out image. Remember that, while great care has been taken to make the algorithm's visual result fairly scale-invariant, the preview will be exact only when zoomed 1:1. In any case, anything happening at pixel level (radius < 2px) will not be visible for zoom levels lower than 50%.

At this point, you may want to tweak the edge sensitivity to take care of any edge artifacts. In theory, diffusing in the isophote direction ensures that diffusion is contained inside edges, but this is not sufficient when corners and sharp convex shapes are present in the image.

When the the edge sensitivity control has been adjusted to produce satisfying results, the image usually becomes quite soft. In most cases it will be necessary, at this point, to increase the number of iterations in order to compensate. This will come with a performance penalty so tread carefully with the performance/quality trade-off depending on your hardware. If you can't increase the number of iterations, you will have to increase the diffusing speed.

The final step is to fine-tune the third and fourth order, which take care of the high frequencies of each wavelet scale. You will need to be a lot more gentle with these settings than for the first and second orders, as they can cause noise to blow-up really fast.

The third order follows the gradient or isophote direction of the low frequency layer, so can be used to guide the high frequency diffusion in a direction that is more likely to be legitimate regarding real edges (and less prone to catch noise).

The fourth order follows the gradient or isophote direction of the high frequency layer and is more likely to catch noise. Diffusing on the fourth order is the best way to reduce noise without affecting sharpness too much, either as a stand-alone denoiser, or as a regularization step in a deblurring process.

# notes and warnings

When setting a deblurring algorithm, try to bear in mind that many of the greatest images in the history of photography were taken with lenses that were not remotely as sharp as those available today. Although the current trend is to build and sell increasingly sharp lenses and have software apply insane amounts of sharpening on top, this fashion does _not_ lead to better imagery and makes the retouching process more tedious. Soft focus and a bit of blurriness have some poetic merits too, which surgically-sanitized HD images may fail to convey.

It should be noted that global contrast (using simple tone curves or black/white levels) also affects our perception of sharpness, which is quite different from optical sharpness (optical resolution). Human eyes are only sensitive to local contrast, which may come from optical sharpness (e.g absence of diffusion -- thin edges) as well as from amplified tonal transitions. If some global tone mapping is in place to increase the contrast, the image will look sharper. If a tone mapping is used to decrease the contrast, the image will look more blurry. In none of these cases are the actual edges of objects affected in any way, and the perceptual consequences are pure illusion.

Part of the aging process is a loss of eyesight. The amount of sharpening that people over 50 find pleasing may not be the same as for people in their 20s. It is worth considering sharpening to obtain a _plausible_ result (matching your everyday perception) rather than a _pleasing_ result (that may look good only to people with the same eyesight as yours).

Finally, assessing the sharpness of images zoomed to 1:1 (100%) or more is a foolish task. In museums, exhibitions and even on screen, the general audience looks at images as a whole, not with a magnifying glass. Moreover, in most practical uses, photographs rarely exceed a resolution of 3000×2000 pixels (roughly a 300 DPI print at A4/letter dimensions) which, for 24 Mpx sensors, means downscaling by a factor of 4. When examining a 24 Mpx file at 1:1, you are actually looking at an image that will never exist. Sharpening at pixel level, in this context, is a waste of time and CPU cycles.
