---
title: chromatic aberrations
id: chromatic-aberrations
applicable-version: 3.6
tags: 
working-color-space: 
view: darkroom
masking: true
---

Correct chromatic aberrations.

# module controls

guide
: The channel that will be used as a reference for the correction.

radius
: The radius of the effect. Increase until chromatic aberrations are gone. This is the most important slider of the module.

strength
: Acts as a safeguard slider. It will help preserving colorful areas that do not suffer from chromatic aberrations. Increase for stronger correction, decrease for stronger preservation.

correction mode
: Allows to restrict the effect to brighten pixels or darken them only. For full control, can be used in combination with R, G, B blend modes and multiples instances.

very large chromatic aberrations
: Makes the algorithm iterative to help reducing very large chromatic aberrations.


# workflow

To get the best result, you are advised to follow the following steps:
- Attenuate as much as possible the chromatic aberration in the lens correction module using the TCA sliders.
- In chromatic aberration module, increase strength to better see the effect of the module.
- Increase radius until chromatic aberration disappears. If needed, try enabling the "very large chromatic aberrations" setting.
- Choose the guide that gives the best result in term of sharpness and artifacts.
- Reduce strength as much as needed to avoid washing colors too much.

For complicated cases:
- You can use several instances with different correction modes. For instance, you can use a first instance in brighten only, and a second one in darken only.
- You can use several instances with low strength to correct the chromatic aberrations by little steps without degrading colors too much.
- You can use the module with parametric or drawn masks.
- You can use RGB red, green and blue blend modes to restrict the effect to a particular channel.
