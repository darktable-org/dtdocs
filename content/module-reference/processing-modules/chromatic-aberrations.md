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

# workflow 

To obtain the best result, you are advised to proceed as follows:
1. Attenuate the chromatic aberrations as much as possible in the [_lens correction_](./lens-correction.md) module using the TCA sliders.
2. Increase the strength slider in this module to better see its effect.
3. Increase the radius until the chromatic aberrations disappear. If this is insufficient, try enabling the "very large chromatic aberrations" setting.
4. Choose the guide that gives the best result in term of sharpness and artifacts.
5. Reduce the strength to avoid washing out the colors too much.

For more complicated cases you could also try the following:
- Use several instances with different correction modes -- for example, a first instance in "brighten only" mode, and a second in "darken only" mode.
- Use several instances with low strength to correct the chromatic aberrations a little at a time without degrading colors too much.
- Use the module with parametric or drawn masks.
- Use RGB red, green and blue blend modes to restrict the effect to a particular channel.

# module controls

guide
: The color channel that will be used as a reference for the correction.

radius
: The radius of the effect. Increase until chromatic aberrations are eliminated. This is the most important slider of the module.

strength
: This slider acts as a safeguard and can help to preserve colorful areas that do not suffer from chromatic aberrations. Increase for stronger correction, decrease for stronger preservation.

correction mode
: Allows you to restrict the effect to brighten or darken pixels only. For full control, this can be used in combination with R, G, B blend modes and multiples instances.

very large chromatic aberrations
: Makes the algorithm iterative to help in reducing very large chromatic aberrations.
