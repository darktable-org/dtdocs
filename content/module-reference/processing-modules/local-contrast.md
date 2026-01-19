---
title: local contrast
id: local-contrast
weight: 10
---

Enhance the image's local contrast.

This is achieved using either a _local laplacian_ (default) or _unnormalized bilateral_ filter. Both modes work exclusively on the L channel from Lab. The _local laplacian_ filter has been designed to be robust against unwanted halo effects and gradient reversals along edges.

# module controls

mode
: Choice of _local laplacian_ filter or _bilateral grid_. The following sections define the controls available for each of these modes.

## bilateral grid

coarseness
: Adjust the coarseness of the details to be adjusted.

contrast
: Control how strongly the algorithm distinguishes between brightness levels. Increase this parameter for a more contrasty look.

detail
: Add or remove detail. Higher values increase local contrast.

## local laplacian

To understand the parameters of the local laplacian filter, one can think of it as applying a curve to the image, similar to the following graph:

![local laplacian curve](local-contrast/local-laplacian-curve.png#w33)

This curve is applied to the image in a way that works locally and avoids halo artifacts.

The local laplacian mode also supports shadow lifting and highlight compression, similar to the [_shadows and highlights_](shadows-and-highlights.md) module.

detail
: Add or remove detail. Higher values increase local contrast. This inserts an S shaped element in the center of the curve, to increase or decrease local contrast.

highlights
: This affects one end of the S shaped contrast curve, effectively increasing or compressing contrast in the highlights. A low value pulls the highlights down.

shadows
: Similar to the highlights parameter, this affects the other end of the contrast curve, and increases or decreases contrast in the shadows. A higher value gives more contrast in the shadows. A lower value lifts the shadows and can effectively simulate a fill light. Note that this is done with local manipulation of the image. However, this means that a completely dark image cannot be brightened in this way -- only dark objects in front of bright objects are affected.

mid-tone range
: This controls the extent of the S shaped part of the contrast curve. A larger value makes the S wider, and thus classifies more values as mid-tones and fewer values as highlights and shadows. In higher dynamic range settings it can be useful to reduce this value to achieve stronger range compression, by lowering the contrast in the highlights and the shadows. Note however, that for really strong HDR scenarios this may work best in combination with a [_base curve_](./base-curve.md) that pre-compresses the range, perhaps with an approximately logarithmic curve. The exposure fusion feature in the [_base curve_](./base-curve.md) module may lead to more pleasing results at times, but is also more prone to halo effects.

: This setting can cause banding artifacts in the image if pushed to extreme values. This is due to the way in which darktable computes the fast approximation of the local laplacian filter.
