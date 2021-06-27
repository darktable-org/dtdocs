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

**Note:** This module is highly resource-intensive, as it is actually an anisotropic, multiscale, partial-derivative equation solver. The module's runtime increases with the number of iterations and OpenCL is therefore strongly recommended.

---

# concepts

## time

Diffusion is a time-dependent process: the more time it has, the farther the particles can spread. In this module, time is simulated by the number of iterations (the number of times the algorithm runs on top of itself). More iterations can make reconstruction (deblurring, denoising, dehazing) more accurate if properly set, but can also make it degenerate. 

## direction

Natural diffusion usually takes place from spots with a high potential (high energy or high concentration of particles) to spots with a low potential (low energy or low concentration of particles). In an image, this means that diffusion always occurs from the brightest pixels to the darkest.

This particular implementation can simulate natural diffusion, using what is called an isotropic diffusion (all directions have the same weight, like heat diffusion), but can also force a weighted direction parallel to the gradients (forcing diffusion across object edges and creating ghost edges), or a weighted direction perpendicular to the gradient, called isophote (forcing diffusion to be contained inside edges, like in a droplet of watercolor). The relative weight of each direction (gradient and isophote) is user-defined and can by found in the [_diffusion directionality_](#diffusion-directionality) section.

## speed

Depending how fluid the environnement is, particles can move more or less freely and therefore more or less fast. The speed of diffusion can be set in the [_diffusion typology_](#diffusion-typology) section.

When performing reconstruction (denoising, deblurring, dehazing), it is advisable to use small speeds for better accuracy. This prevents numerical overshoots and therefore degeneration of the solution, and may require more iterations. For small numbers of iterations, higher speeds may be used. Note that large blurs need many iterations for proper reconstruction, so the speed should be adjusted to avoid degenerating the solution.

All speeds are added (first to fourth orders), and the sums "`first order + second order`" and "`third order + fourth order`" should never exceed ±100%.

## scale

Natural diffusion is supposed to happen only to the closest neighbouring coordinates. That is, at each iteration, each pixel should only interact with its 9 closest neighours.

Here, we fast-track things a bit to save time and reuse the multi-scale wavelets scheme from the [_contrast equalizer_](./contrast-equalizer.md) module, so we can diffuse at different scales. The maximal scale of diffusion is defined by the _radius_ parameter.

Regardless of the diffusion, a _sharpness_ parameter allows you to increase or decrease the details at each scale, much like the spline controls of the _contrast equalizer_. Along with the _edge sensitivity_ slider, this provides the same features as the _contrast equalizer_ module (_luma_ and _edges_ tabs) but in a scene-referred RGB space.

# module controls

## diffusion properties

iterations
: The number of times the algorithm should run on top of itself. High values slow the module down but allow more accurate reconstructions provided the diffusion speeds are low enough.

radius
: The maximal distance of diffusion, expressed in pixels of the full-resolution image.

## diffusion typology

1st order (gradient)
: The speed of diffusion of the low-frequency wavelet layers in the direction defined by the _1st order anisotropy_ setting. Positive values apply diffusion, negative values undo diffusion, zero does nothing.

2nd order (laplacian)
: The speed of diffusion of the low-frequency wavelet layers in the direction defined by the _2nd order anisotropy_ setting. Positive values apply diffusion, negative values undo diffusion, zero does nothing.

3rd order (gradient of laplacian)
: The speed of diffusion of the high-frequency wavelet layers in the direction defined by the _3nd order anisotropy_ setting. Positive values apply diffusion, negative values undo diffusion, zero does nothing.

4th order (laplacian of laplacian)
: The speed of diffusion of the high-frequency wavelet layers in the direction defined by the _4th order anisotropy_ setting. Positive values apply diffusion, negative values undo diffusion, zero does nothing.

## diffusion directionality

1st order anisotropy
: The direction of diffusion of the low-frequency wavelet layers relative to the orientation of the gradient. Zero is isotropic, negative values make diffusion follow gradients more closely, positive values make diffusion follow isophotes more closely.

2nd order anisotropy
: The direction of diffusion of the low-frequency wavelet layers relative to the orientation of the gradient. Zero is isotropic, negative values make diffusion follow gradients more closely, positive values make diffusion follow isophotes more closely.

3rd order anisotropy
: The direction of diffusion of the high-frequency wavelet layers relative to the orientation of the gradient. Zero is isotropic, negative values make diffusion follow gradients more closely, positive values make diffusion follow isophotes more closely.

4rd order anisotropy
: The direction of diffusion of the high-frequency wavelet layers relative to the orientation of the gradient. Zero is isotropic, negative values make diffusion follow gradients more closely, positive values make diffusion follow isophotes more closely.

## edges management

sharpness
: Apply a gain on wavelet details, regardless of diffusion properties. Zero does nothing, positive values sharpen, negative values blur.

edge sensitivity
: Apply a penalty over the diffusion speeds when edges are detected. This detection uses the local variance around each pixel. Zero disables the penalty, higher values make the penalty stronger. Increase if you notice edge artifacts like fringes and halos.

edge threshold
: Define a variance threshold. Pixels with a local variance below that threshold will have their diffusion speeds amplified, while pixels with local variance above that threshold will be penalized. Use carefully for large blurs, as it may increase noise in flat areas faster than details recovery.

## diffusion spatiality

luminance masking threshold
: This control is useful if you want to inpaint highlights. For values greater than 0%, the diffusion will only happen in regions with a luminance greater than this setting.
