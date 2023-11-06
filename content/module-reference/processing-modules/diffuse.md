---
title: diffuse or sharpen
id: diffuse
applicable-version: 4.2
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

- recover the original image from sensors with an anti-aliasing filter or mitigate the blur created by most demosaicing algorithms (use one of the _sharpen demosaicing_ presets and move the module before the _input color profile_ module in the pipeline),
- reverse static lens blurring/defocusing (use one of the _lens deblur_ presets),
- remove atmospheric haze (use the _dehaze_ preset),
- add extra acutance for better legibility (use the _local contrast_ preset).

Note that motion blurs cannot be reverted by undoing the diffusion process, as they are not diffusive in nature.

Diffusion can be added in order to:

- create a bloom or Orton effect (use the _bloom_ preset),
- inpaint missing or damaged parts of an image (use the _inpaint highlights_ preset),
- denoise in an edge-preserving way (use one of the _denoise_ presets)
- apply a surface blur (use the _surface blur_ preset).

Since the process is physical, even its glitches may be used for creative purposes. For example, you can:

- simulate line drawing or watercolor (use the _simulate line drawing_ and _simulate watercolor_ presets),
- create random patterns and textures by increasing noise (over time, with iterations, noise will connect with neighbours to create random specks).

---

**Note:** This module is highly resource-intensive, as it is actually an anisotropic, multiscale, partial differential equation solver. The module's runtime increases with the number of iterations and OpenCL is therefore strongly recommended. Some "fast" presets are also provided for use on systems without OpenCL.

---

# concepts

## time

Diffusion is a time-dependent process: the more time it has, the further the particles can spread. In this module, time is simulated using the number of iterations (the number of times the algorithm runs on top of itself). More iterations can make reconstruction (deblurring, denoising, dehazing) more accurate if properly set, but can also cause it to degenerate.

## direction

Natural diffusion usually takes place from points with a high potential (high energy or high concentration of particles) to those with a low potential (low energy or low concentration of particles). In an image, this means that diffusion always occurs from the brightest pixels to the darkest.

This particular implementation can simulate natural diffusion, using what is called an isotropic diffusion (all directions have the same weight, like heat diffusion), but can also force a weighted direction parallel to the gradients (forcing diffusion across object edges and creating ghost edges), or a weighted direction perpendicular to the gradients, called isophote (forcing diffusion to be contained inside edges, like in a droplet of watercolor). The relative weight of each direction (gradient and isophote) is user-defined and can be found in the [_direction_](#direction-1) section of the module.

## speed

Depending how fluid the environment is, particles can move more or less freely and therefore more or less fast. The speed of diffusion can be set in the [_speed_](#speed-sharpen--diffuse) section of the module.

When performing reconstruction (denoising, deblurring, dehazing), it is advisable to use smaller speeds for better accuracy. This prevents numerical overshoots (and therefore degeneration of the solution) and may require more iterations. For small numbers of iterations, higher speeds may be used. Note that large blurs need many iterations for proper reconstruction, so the speed should be adjusted to avoid degenerating the solution.

All speeds are added (first to fourth orders), and the sums "`first order + second order`" and "`third order + fourth order`" should never exceed ±100%, unless you want to produce [glitch art](https://en.wikipedia.org/wiki/Glitch_art).

## scale

Natural diffusion is supposed to happen only to the closest neighbouring coordinates. That is, at each iteration, each pixel should only interact with its 9 nearest neighbours.

Here, we fast-track things a bit to save time and reuse the multi-scale wavelets scheme from the [_contrast equalizer_](./contrast-equalizer.md) module, so that we can diffuse at different scales. The maximal scale of diffusion is defined by the _radius span_ parameter.

Regardless of the diffusion, a _sharpness_ parameter allows you to increase or decrease the details at each scale, much like the spline controls of the _contrast equalizer_. Along with the _edge sensitivity_ slider, this provides the same features as the _contrast equalizer_ module (_luma_ and _edges_ tabs) but in a scene-referred RGB space.

# module controls

## properties

iterations
: The number of times the algorithm should run on top of itself. High values slow the module down but allow more accurate reconstructions, provided that the diffusion speeds are low enough.

central radius
: The main scale of the diffusion. Zero causes the diffusion to act more heavily on fine details (used for deblurring and denoising). Non-zero values define the size of details to be heavily diffused (used to increase local contrast).

radius span
: This allows you to select the band of details radii to act on, around the central radius. The span of diffusion defines a range of detail scales (between `center - span` and `center + span`) within which the diffusion is confined. High values diffuse on a large band of radii, at the expense of computation time. Low values diffuse closer around the central radius. If you plan to deblur, the radius span should be approximately the width of your lens blur and the central radius should be zero. If you plan to increase the local contrast, but don't want to affect sharpness or noise, the radius span should be 3/4 of your central radius maximum.

The radii are expressed in pixels of the full-resolution image, so copy+pasting settings between images of different resolution may lead to slightly different results, except for pixel-level sharpness.

For electrical engineers, what is set here is a band-pass filter in wavelets space, using a gaussian frequential window centered on `central radius` with a fall-off (standard deviation) of `radius span`. Wavelet scales are analogous to harmonic frequencies and each wavelet scale defines the radius of the details to act on.

## speed (sharpen ↔ diffuse)

In the following controls, positive values apply diffusion, negative values undo diffusion (i.e. sharpen) and zero does nothing.

1st order speed (gradient)
: The speed of diffusion of the low-frequency wavelet layers in the direction defined by the _1st order anisotropy_ setting. 

2nd order speed (laplacian)
: The speed of diffusion of the low-frequency wavelet layers in the direction defined by the _2nd order anisotropy_ setting. 

3rd order speed (gradient of laplacian)
: The speed of diffusion of the high-frequency wavelet layers in the direction defined by the _3rd order anisotropy_ setting. 

4th order speed (laplacian of laplacian)
: The speed of diffusion of the high-frequency wavelet layers in the direction defined by the _4th order anisotropy_ setting. 

## direction

In the following controls, positive values cause diffusion to avoid edges (isophotes), negative values make diffusion follow gradients more closely, and zero affects both equally (isotropic).

1st order anisotropy
: The direction of diffusion of the low-frequency wavelet layers relative to the orientation of the gradient of the low-frequency (_1st order speed_ setting). 

2nd order anisotropy
: The direction of diffusion of the low-frequency wavelet layers relative to the orientation of the gradient of the high-frequency (_2nd order speed_ setting).

3rd order anisotropy
: The direction of diffusion of the high-frequency wavelet layers relative to the orientation of the gradient of the low-frequency (_3rd order speed_ setting).

4th order anisotropy
: The direction of diffusion of the high-frequency wavelet layers relative to the orientation of the gradient of the high-frequency (_4th order speed_ setting).

## edge management

sharpness
: Apply a gain on wavelet details, regardless of properties set above. Zero does nothing, positive values sharpen, negative values blur. This is mostly useful as an adjustment variable when blooming or blurring, to retain some sharpness while adding a glow around edges. You are not advised to use this for sharpening alone, since there is nothing to prevent halos or fringes with this setting.

edge sensitivity
: Apply a penalty over the diffusion speeds when edges are detected. This detection uses the local variance around each pixel. Zero disables the penalty, higher values make the penalty stronger and more sensitive to edges. Increase if you notice edge artifacts like fringes and halos.

edge threshold
: Define a variance threshold, which affects mostly low-variance areas (dark or blurry areas, or flat surfaces). Positive values will increase the penalty for low-variance areas, which is good for sharpening or increasing local contrast without crushing blacks. Negative values will decrease the penalty for low-variance areas, which is good for denoising or blurring with a maximal effect on black and blurry regions.

## diffusion spatiality

luminance masking threshold
: This control is useful if you want to in-paint highlights. For values greater than 0%, the diffusion will only occur in regions with a luminance greater than this setting. Note that gaussian noise will be added in these regions to simulate particles and initialize the in-painting.

# workflow

The main difficulty with this module is that while its output can vary dramatically depending on its input paramaters, these parameters have no intuitive link to everyday life. Users are likely to be overwhelmed, unless they are already familiar with Fourier partial differential equations. This section proposes some ways to approach this module without the burden of having to understand the underlying theory.

## general advice

If you intend to deblur your image using this module, always start by properly correctiong any chromatic aberrations and noise in the image, since the deblurring may magnify these artifacts. It is also important that you don't have clipped black pixels in your image. These can be corrected with the _black level correction_ of the [_exposure_](./exposure.md) module.

Since it works on separate RGB channels, it is better to apply this module after [_color calibration_](./color-calibration.md), so that you start with a fully neutral, white-balanced, input image. Note that increasing local contrast or sharpness will also lead to a slight color contrast and saturation boost, which is usually a good thing. Since it uses a variance-based regularization to detect edges, it is also better to put this module before any non-linear operation.

## starting with presets

The provided presets have been tuned by the developer and tested on a range of images for typical purposes. The easiest way is simply to start from the presets, and then tweak them as needed:

- if the effect seems too strong, decrease the number of iterations,
- if edge artifacts appear, increase the edge sensitivity,
- if deblurring starts to affect valid blurry parts (bokeh), reduce the radius,
- if deblurring seems correct in bright areas but excessive in dark areas, increase the edges _threshold_,
- if deblurring clips black pixels, lower the _black level correction_ in _exposure_ module,
- fine-tune the _sharpness_ to your taste.

## starting from scratch

The module's default settings are entirely neutral and will do nothing to your image. The spirit of the module is that each order affects the texture of the image in a particular way.

Start by tuning the first order parameters (speed and anisotropy) to get an initial base. Then adjust the radius. This will affect coarser textures (either blur or sharpen them). Remember that the first order acts on the low frequencies of the wavelet scale and follows a direction parallel or perpendicular to the gradient of the low frequencies.

Next, start to tune the second order parameters (speed and anisotropy). The second order also acts on the low frequencies of the wavelet scale but this time follows a direction parallel or perpendicular to the gradient of the _high_ frequencies, which can either be the direction of maximal sharpness or of noise. This can be used to reduce noise (using the second order in diffusion mode, with positive values) when you used the first order in sharpening mode (with negative values).

These two steps can be performed on the zoomed-out image. Remember that, while great care has been taken to make the algorithm's visual result fairly scale-invariant, the preview will be exact only when zoomed 1:1. In any case, anything happening at pixel level (radius < 2px) will not be visible for zoom levels lower than 50%.

At this point, you may want to tweak the edge sensitivity to take care of any edge artifacts. In theory, diffusing in the isophote direction ensures that diffusion is contained inside edges, but this is not sufficient when corners and sharp convex shapes are present in the image.

When the edge sensitivity control has been adjusted to produce satisfying results, the image usually becomes quite soft. In most cases it will be necessary, at this point, to increase the number of iterations in order to compensate. This will come with a performance penalty so tread carefully with the performance/quality trade-off depending on your hardware. If you can't increase the number of iterations, you will have to increase the diffusing speed.

The final step is to fine-tune the third and fourth order, which take care of the high frequencies of each wavelet scale. You will need to be a lot more gentle with these settings than for the first and second orders, as they can cause noise to blow-up really fast.

The third order follows the gradient or isophote direction of the low frequency layer, so can be used to guide the high frequency diffusion in a direction that is more likely to be legitimate regarding real edges (and less prone to catch noise).

The fourth order follows the gradient or isophote direction of the high frequency layer and is more likely to catch noise. Diffusing on the fourth order is the best way to reduce noise without affecting sharpness too much, either as a stand-alone denoiser, or as a regularization step in a deblurring process.

# using multiple instances for image reconstruction

Noise post-filtering may benefit from **introducing** a diffusion process -- this can be applied as an extra step after the [_denoise (profiled)_](./denoise-profiled.md) module.

Conversely, the following optical issues may benefit from reconstruction by **undoing** the diffusion process:

1. blur introduced by a sensor's low-pass filter (LPF) and/or anti-aliasing performed by the [_demosaic_](./demosaic.md) module,
2. static lens blur,
3. haze/fog,
4. light diffusion (using a diffuser that is too large), leading to even lighting and lack of local contrast on the subject.

While more than one of these issues can affect the same picture at the same time, it is better to try to fix them separately using multiple instances of the module. When doing so, ensure the issues are corrected from coarse scale to fine scale, and that denoising always happens first. That is, your instances should appear in the following [pipe order](../../darkroom/pixelpipe/the-pixelpipe-and-module-order.md):

1. denoise,
2. local contrast enhancement,
3. dehaze,
4. lens blur correction,
5. sensor and demosaic correction.

Starting with the coarser-scale reconstructions reduces the probability of introducing or increasing noise when performing the finer-scale reconstructions. This is unintuitive because these processes don't happen in this order during the formation of the image. For the same reason, denoising should always happen before any attempt at sharpening or increasing acutance.

# notes and warnings

While this module is designed to be scale-invariant, its output can only be guaranteed at 100% zoom and high quality or full-size export. Results at lower zoom levels or export dimensions may or may not match your expectations.

When setting a deblurring algorithm, try to bear in mind that many of the greatest images in the history of photography were taken with lenses that were not remotely as sharp as those available today. Although the current trend is to build and sell increasingly sharp lenses and have software apply insane amounts of sharpening on top, this fashion does _not_ lead to better imagery and makes the retouching process more tedious. Soft focus and a bit of blurriness have some poetic merits too, which surgically-sanitized HD images may fail to convey.

It should be noted that global contrast (using simple tone curves or black/white levels) also affects our perception of sharpness, which is quite different from optical sharpness (optical resolution). Human eyes are only sensitive to local contrast, which may come from optical sharpness (e.g absence of diffusion -- thin edges) as well as from amplified tonal transitions. If some global tone mapping is in place to increase the contrast, the image will look sharper. If a tone mapping is used to decrease the contrast, the image will look more blurry. In none of these cases are the actual edges of objects affected in any way, and the perceptual consequences are pure illusion.

Part of the aging process is a loss of eyesight. The amount of sharpening that people over 50 find pleasing may not be the same as for people in their 20s. It is worth considering sharpening to obtain a _plausible_ result (matching your everyday perception) rather than a _pleasing_ result (that may look good only to people with the same eyesight as yours).

Finally, assessing the sharpness of images zoomed to 1:1 (100%) or more is a foolish task. In museums, exhibitions and even on screen, the general audience looks at images as a whole, not with a magnifying glass. Moreover, in most practical uses, photographs rarely exceed a resolution of 3000×2000 pixels (roughly a 300 DPI print at A4/letter dimensions) which, for 24 Mpx sensors, means downscaling by a factor of 4. When examining a 24 Mpx file at 1:1, you are actually looking at an image that will never exist. Sharpening at pixel level, in this context, is a waste of time and CPU cycles.
