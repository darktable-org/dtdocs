---
title: censorize
id: censorize
applicable-verison: 3.6
tags:
working-color-space: RGB
view: darkroom
masking: true
---

Degrade parts of the image in an aesthetically pleasing way, to anonymize people, objects or hide body parts to comply with social media censorship.

---

**Note:** the anonymizing method is not forensic-safe in order to favour aesthetics. Some forensic artificial intelligences could still be able to identify the censorized content based on its structure, especially for simple shapes and text (for example: license plates, street numbers).

If forensic-safe anonymization is needed, paint the surfaces with a solid color. **The darktable team rejects any responsability in poorly anonymised pictures leading to the ulterior identification of individuals or personal property, and their following consequences.**

---

Censorize works in linear RGB to apply physically-accurate gaussian blur and gaussian luminance noise.

# Workflow

It is advised to mask the image areas to censorize, using darktable usual [masking tools](../darkroom/masking-and-blending/masks/drawn/), before setting up the module controls so they remain visible while drawing the masks.

Aside from its original anonymization purpose, it can be used for a large variety of creative purposes, for example:

* with a simple blur :
   * combined with a multiply [blending mode](../darkroom/masking-and-blending/blend-modes/) to create a realistic blooming effect (Orton's effect),
   * combined with a subtract blending mode and low opacity to create an [unsharp masking](https://en.wikipedia.org/wiki/Unsharp_masking), similar to the [sharpen](../module-reference/processing-modules/sharpen.md) module but in an RGB scene-referred space,
* with a simple noise, to create artificial grain.

# Module controls

input blur radius
: the strength of the first pass of gaussian blur

pixellation radius
: the size of the "big pixels" created after the first pass of gaussian blur

output blur radius
: the strength of the second pass of gaussian blur, applied after the pixellation

noise level
: the strength (standard deviation) of the luminance gaussian noise applied after the second pass of blur. Adding noise can fake details in the blurred regions and make content-detection more difficult for artificial intelligences algorithms.
