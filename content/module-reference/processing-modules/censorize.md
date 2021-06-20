---
title: censorize
id: censorize
applicable-version: 3.6
tags:
working-color-space: RGB
view: darkroom
masking: true
---

Degrade parts of the image in an aesthetically pleasing way, in order to anonymize people/objects or hide body parts.

Censorize works in linear RGB color space to apply a physically-accurate gaussian blur and gaussian luminance noise.

Aside from anonymization, this module can also be used for a wide range of creative purposes, for example:

- Combine a simple blur with a multiply [blend mode](../../darkroom/masking-and-blending/blend-modes.md) to create a realistic bloom (Orton effect).
- Combine a simple blur with a subtract blending mode and low opacity to create an [unsharp mask](https://en.wikipedia.org/wiki/Unsharp_masking), similar to the [sharpen](./sharpen.md) module but in an RGB scene-referred space.
- Add noise to create artificial grain.

---

**Note:** The anonymizing methods provided by this module are not forensically safe in order to favor aesthetics. Some forensic techniques may still be able to reconstruct the censorized content based on its structure, especially for simple shapes and text (e.g. license plates, street numbers).

If forensically safe anonymization is required, the only way to achieve this is to paint the surfaces with a solid color. 

**The darktable team does not accept responsibility for poorly anonymized pictures leading to the identification of individuals or personal property.**

---

# workflow

You are advised to leave the module's controls at their default values while you [mask](../../darkroom/masking-and-blending/masks/drawn.md) the areas of the image that you wish to censorize, in order that the details of the image remain visible.

# module controls

input blur radius
: The strength of the first pass of the gaussian blur.

pixellation radius
: The size of the "big pixels" created after the first pass of gaussian blur.

output blur radius
: The strength of the second pass of the gaussian blur, applied after the pixellation.

noise level
: The strength (standard deviation) of the luminance gaussian noise applied after the second pass of the gaussian blur. Adding noise can fake details in the blurred regions and make content detection more difficult for artificial intelligence algorithms.
