---
title: mask refinement & additional controls
id: masks
weight: 50
draft: false
---

When a parametric/drawn mask is active, several additional sliders are shown allowing for meticulous refinement of the mask.

feathering guide
: Mask feathering smoothes a drawn or parametric mask non-uniformly such that the mask's edges automatically align with the edges of features in the image. This mask smoothing is guided either by the module's input or output (before blending), depending on what is selected in the “feathering guide” combobox. Feathering is particularly sensitive to this choice for edge-modifying modules (modules for sharpening or blurring an image).

feathering radius
: Adjust the strength of the feathering effect. Feathering works best if the drawn and/or parametric mask's edges already approximately match some edges in the guiding image. The larger the “feathering radius” the better the feathering algorithm can align the mask to more distant edges. If this radius is too large, however, the feathered mask may overshoot (cover regions that the user wants to exclude). Feathering is disabled if the feathering radius is set to 0.

mask blur
: Blurring the mask creates a softer transition between blended and unblended parts of an image and can be used to avoid artifacts. The mask blur slider controls the radius of a gaussian blur applied to the final blend mask. The higher the radius, the stronger the blur (set to 0 for an unblurred mask). Gaussian blur is always applied after feathering if both kinds of mask adjustment are activated. This allows any resulting sharp edges or artefacts to be smoothed.

mask opacity
: The strength of the module's effect is determined by the mask's local opacity. Feathering and blurring the mask may result in a mask with reduced opacity, which implies a reduced effect. Therefore, the “mask opacity” slider allows you to readjust the mask opacity to compensate. If the opacity is decreased (negative slider values) less opaque parts are affected more strongly than more opaque parts. Conversely, if the mask opacity is increased (positive slider values) more opaque parts are affected more strongly than less opaque parts. As a consequence, completely opaque portions of the mask always remain opaque and completely transparent portions always remain transparent. This is to ensure that regions which have been excluded from or included to a module's effect (by setting the mask's opacity to 0% or 100%) remain excluded or included.

mask contrast
: This slider increases or decreases the mask contrast. This allows you to adjust the transition between opaque and transparent mask parts.

temporarily switch off mask
: Sometimes it is useful to visualize the module's effect without the mask being active. Click on this icon to temporarily deactivate the mask (the selected blend mode and opacity remain in effect).

display mask
: Click on this icon to display the current mask as a yellow overlay over a black-and-white version of the image. Solid yellow indicates an opacity of 100%; a fully visible gray background image (without yellow overlay) indicates an opacity of 0%.

# example: feathering a drawn mask

**IMAGES HERE**

It can be rather tedious to create a drawn mask which precisely covers a particular object or person in an image. In this example, we want to enhance the color contrast of the lion sculpture shown in the left image above without affecting the background.

1. The first image above shows the original, unaltered image.
2. The second image shows a rough selection of the sculpture created with a drawn mask. Note that the mask is rather fuzzy and does not precisely follow the outline of the lion sculpture so requires further refinement.
3. The third image shows the effect of adjusting the feathering radius, mask opacity and mask contrast, leading to a well matched mask with little effort. In this example the feathering radius has been adjusted to 50 and a blur radius of 5 was chosen to smooth the mask to some degree. The mask opacity and mask contrast have been increased to 0.3 and 0.5, respectively. 
4. The final image above shows the end result, where the color enhancement via the [_color contrast_](../../../module-reference/processing-modules/color-contrast.md) module is restricted to only the lion sculpture.

Mask feathering works particularly well in this example because the sculpture is well separated from the blurry background. The distinct edge at the border of the sculpture guides the feathering mask adjustment to match the shape of the sculpture. 
