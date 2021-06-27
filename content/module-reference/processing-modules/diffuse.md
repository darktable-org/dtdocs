---
title: diffuse or sharpen
id: diffuse
applicable-version: 3.8
tags:
working-color-space: RGB
view: darkroom
masking: true
---

Diffusion is a family of physical processes by which particles move and spread to their surrounding, gradually with time, from a source that generates them. In image processing, diffusion can happen mostly at two places:

* diffusion of photons through lens glass (blur) or humid air (hazing),
* diffusion of pigments in wet inks or watercolors.

In both cases, diffusion will make the image less sharp by "leaking" particles. Diffusion smoothens local variations.

The _diffuse or sharpen_ module uses a generalized physical model to describe several kinds of diffusions, which can be used by image makers to either simulate or revert diffusion processes.

As it is a highly technical module, several presets are provided to demonstrate its use for various purposes.

Removing diffusion is useful for:

* recovering the original image from sensors that have an anti-aliasing filter and mitigating the blur created by most demosaicing algorithms (preset _sharpen sensor demosaicing_, and move the module instance before _input color profile_ in pipeline),
* undoing the lens blur or defocusing (presets _lens deblur_),
* undoing the atmospheric haze (preset _dehaze_),
* adding extra acutance for better legibility (preset _local contrast_)

Adding diffusion is useful for:

* creating blooming or Orton effect (preset _bloom_),
* inpainting missing or damaged image parts,
* denoising in an edge-preserving way (preset _denoise_) and applying surface blur (preset _surface blur_).

Since the process is physical, even its glitches may be used for creative purposes:

* simulating line drawing or watercolor (presets _simulate line drawing_ and _simulate watercolor_),
* creating random patterns and textures by increasing noise (over time, with iterations, noise will connect with neighbours to create random specks).

---

**Note:** this module is very heavy, as it is actually an anisotropic, multiscale, partial-derivative equation solver. OpenCL is highly recommended to use it with decent runtimes.

---

## Concepts

### Time

Diffusion is a timely process: the more time you leave to it, the farther the particles can spread. In the module, time is simulated by the number of iterations (the number of times the algorithm runs on top of itself). More iterations can make reconstruction (deblurring, denoising, dehazing) more accurate if properly set, but can also make them degenerate. Obviously, more iterations make the module slower.

### Direction

Natural diffusion usually happens from the spots that have a high potential (high energy or high concentration of particles) to the spots that have a low potential (low energy or low concentration of particles). In an image, that would mean diffusion always happens from the brightest pixels to the darkest.

This particular implementation can simulate natural diffusion, using what is called an isotropic diffusion (all directions have the same weight, like heat diffusion), but can also force a weighted direction parallel to the gradients (so we force diffusion across object edges and create ghost edges), or a weighted direction perpendicular to the gradient, called isophote (so we force diffusion to be contained inside edges, like in a droplet of watercolour). The relative weight of each direction (gradient and isophote) is user-parametric and can by found in the section _diffusion directionnality_.

### Speed

Depending how fluid the environnement is, particles can move more or less freely and therefore more or less fast. The speed of diffusion can be found in the section _diffusion typology_.

When doing reconstructions (denoising, deblurring, dehazing), it is advised to use small speeds for better accuracy. This will prevent numerical overshooting and therefore degeneration of the solution, and may require more iterations. For small numbers of iterations, higher speed may be used. Notice large blurs will require a lot of iterations for proper reconstruction, so speed should be adjusted to avoid degenerating the solution.

All speeds are added (first to fourth orders), and the sums `first + second` orders and `third + fourth` orders should never exceed ±100%.

### Scale

Natural diffusion is supposed to happen only to the closest neighbouring coordinates. That is, at each iteration, each pixel should only interact with its 9 closest neighours.

But here, we fast-track things a bit to spare time and reuse the multi-scale wavelets scheme from the _contrast equalizer_ module, so we can diffuse at different scales. The maximal scale of diffusion is defined by the _radius_ parameter.

Regardless of the diffusion, a _sharpness_ parameter lets you increase or decrease the details of each scale, much like the _contrast equalizer_. This plus the _edge sensitivity_ provides the same feature as the _contrast equalizer_ (_luma_ and _edges_ tabs) but in a scene-referred RGB space.

# module controls

## diffusion properties

iterations
: number of times the algorithm should run on top of itself. High values slow the module down but allow more accurate reconstructions provided the diffusing speeds are low enough.

radius
: maximal distance of diffusion, expressed in pixels of the full-resolution image.

## diffusion typology

1st order (gradient)
: the speed of diffusion of the low-frequency wavelets layers in the direction defined by the _1st order anisotropy_ setting. Positive values apply diffusion, negative values undo diffusion, zero does nothing.

2nd order (laplacian)
: the speed of diffusion of the low-frequency wavelets layers in the direction defined by the _2nd order anisotropy_ setting. Positive values apply diffusion, negative values undo diffusion, zero does nothing.

3rd order (gradient of laplacian)
: the speed of diffusion of the high-frequency wavelets layers in the direction defined by the _3nd order anisotropy_ setting. Positive values apply diffusion, negative values undo diffusion, zero does nothing.

4th order (laplacian of laplacian)
: the speed of diffusion of the high-frequency wavelets layers in the direction defined by the _4th order anisotropy_ setting. Positive values apply diffusion, negative values undo diffusion, zero does nothing.

## diffusion directionnality

1st order anisotropy
: the direction of diffusion of the low-frequency wavelets layers relatively to the orientation of the gradient of the low-frequency. Zero is isotrope, negative values make diffusion follow gradients more closely, positive values make diffusion follow isophotes more closely.

2nd order anisotropy
: the direction of diffusion of the low-frequency wavelets layers relatively to the orientation of the gradient of the high-frequency. Zero is isotrope, negative values make diffusion follow gradients more closely, positive values make diffusion follow isophotes more closely.

3rd order anisotropy
: the direction of diffusion of the high-frequency wavelets layers relatively to the orientation of the gradient of the low-frequency. Zero is isotrope, negative values make diffusion follow gradients more closely, positive values make diffusion follow isophotes more closely.

4rd order anisotropy
: the direction of diffusion of the high-frequency wavelets layers relatively to the orientation of the gradient of the high-frequency Zero is isotrope, negative values make diffusion follow gradients more closely, positive values make diffusion follow isophotes more closely.

## edges management

sharpness
: apply a gain on wavelets details, regardless of diffusion properties. Zero does nothing, positive values sharpen, negative values blur.

edge sensitivity
: apply a penalty over the diffusion speeds when edges are detected. This detection uses the local variance around each pixel. Zero disables the penalty, higher values make the penalty stronger. Increase if you notice edge artifacts like fringes and halos.

edge threshold
: define a variance threshold. Pixels which local variance is below that threshold will get amplified diffusion speeds, while pixels with local variance above that threshold will get penalized. Use carefully for large blurs, as it may increase noise in flat areas faster than details recovery.

## diffusion spatiality

luminance masking threshold
: useful if you want to inpaint highlights. For values greater than 0%, the diffusion will only happen in regions which luminance is greater than this setting.

# workflow

The difficulty of this module is that its results can be entirely different depending on the values set as parameters, but these have no intuitive link to everyday's life. Users are expected to be overwhelmed, unless they are already familiar with Fourier partial derivative equations. We propose here a method to get into the using without the burden of having to understand the theory.

## starting from presets

The provided presets have been tuned by the developer and tested on a range of pictures for typical purposes. The easiest way is simply to use them, and slightly tweak them:

* when the preset effect seems too strong, decrease the number of iterations,
* if edge artifacts appear, increase the edge sensitivity to protect edges better,
* if debluring start catching valid blurry parts (bokeh), reduce the radius,
* fine-tune the _sharpness_ the way you like it.

## starting from scratch

The default settings are entirely neutral and will do nothing to your image. The spirit of the module is that each order will affect the texture of the image in a particular way.

Start tuning the first order parameters (speed and anisotropy) to get a first base. Then, adjust the radius. This will affect coarser textures (either blur or sharpen them). Remember the first order acts on the low-frequency of the wavelets scales and follows the direction parallel or perpendicular to the gradient of the low-frequencies.

Then start tuning the second order parameters (speed and anisotropy). The second order also acts on the low-frequency of the wavelet scales but follows the direction parrallel or perpendicular to the gradient of the high-frequencies, which can either be the direction of maximal sharpness or of noise. This can be used to reduce noise (using the second order in diffusion mode, with positive values) when you used the first order in sharpening mode (with negative values).

These two steps can be done zoomed-out. Remember that, while great care has been given to make the algorithm visual result fairly scale-invariant, the preview will be exact only when zoomed 1:1. In any case, anything happening at pixel level (radius < 2px) will not be visible for zoom levels lower than 50%.

At this point, you may want to tweak the edge sensitivity to take care of edge artifacts that may happen. In theory, diffusing in the isophote direction ensures diffusion is contained inside edges, but this is not enough when corners and sharp convex shapes are present in the image.

When the edge sensitivity is satisfying, usually the result is a lot softened. In most cases, it will be necessary, at this point, to increase the number of iterations to compensate. This will come at a performance cost so tread carefully with the performance/quality trade-off depending on your hardware. If you can't increase the number of iterations, you will have to increase the diffusing speed.

The last remaining step is to fine-tune the third and fourth order, which take care of the high-frequencies of each wavelet scale. The settings there will need to be a lot more gentle than for the first and second orders, as noise can blow-up really fast.

The third order follows the gradient or isophote direction of the low-frequency layer, so this can be used to guide the high-frequency diffusion in a direction that is more likely to be legitimate regarding real edges (and less prone to catch noise).

The fourth order follows the gradient or isophote direction of the high-frequency layer and is more likely to catch noise. Diffusing on the fourth order is the best way to reduce noise without affecting sharpness too much, either as a stand-alone denoiser, or as a regularization step in a deblurring process.
