---
title: darktable color pipeline
id: color-pipeline
weight: 80
draft: false
author: "people"
---

Most image processing applications you may be familiar with come from the 1990's and/or inherit a 1990's workflow. These applications used to process images encoded in 8 bits unsigned integers, because it was both memory and computationaly efficient. But, because of the integer format, which implies rounding errors, they had to use a "gamma", which essentially is a transfert function applying a power 1/2.2 or 1/2.4 to encode the RGB values and increase the bit-depth in low-lights, to reduce rounding errors there because human being are very sensitive to low-lights. Also, 8 bits integer formats are technically limited to the 0-255 range, and anything outside this range would overflow the format and be clipped to the nearest bound.

These workflows using bounded RGB representations and possibly non-linear transforms to encode RGB signals are called "display-referred". They rely on the assumption that the image has been prepared for display at an early stage in the pipeline, and embed hard-coded assumptions on the RGB values of black, middle-grey and white. Most of the image-processing algorithms have been tuned around these assumptions, for example the darken or lighten blending modes expect a middle-grey encoded at 50% (or 128 in integer encoding).

However, the non-linear scaling, mandatory to make the integer encoding work, breaks the natural relationships between pixels values: hue and saturation will change in unpredictable ways, and values relationships between neighbour pixels are dilated or compressed such that gradients are unpredictably changed to.

Display-referred pipelines therefore break optical filters (lens blurring or deblurring), alpha compositing (relying on optical and geometrical definitions of occlusion), colors and gradients (local relationships between chrominance and luminance of pixels). They also don't scale well to HDR images, for which many disputable local and global tonemapping methods had to be developed, and are responsible for the infamous 2010's "HDR-look".

Modern computers are not tied to the same limitations as the 1990's ones, and can work on pixels which values are completely unbounded, from 0 up to +infinity, but also encoded as real numbers (using floating point formats). These possibilities enable what we call a "scene-referred" workflow, in which pixels can keep their original radiometric relationships along the pipe, and get prepared for display only at the last stage of the pipeline, in the display transform. This means that the RGB values of the pixels are kept proportionnal to the intensity of the light emission recorded by the camera on the scene, which enables accurate alpha compositing and accurate optical filters emulations, but they also scale to any dynamic range through the same algorithm, SDR as well as HDR.

However, scene-referred pipelines loose the conveniently fixed assumptions about the values of white, middle-grey and black, and the responsability of setting them, according to the scene and to the conditions of shooting, is now up to the user. This introduces a slight complexification of the user interface.

Also, because scene-referred values are supposed to be physically-meaningful, pixels cannot have zero intensity, which would mean they have no light at all, because many physically-accurate algorithms will then break. In fact, white and black mean nothing to the original scene, which is only a collection of luminances at varying intensities, and the scene-referred workflow simply aims at remapping some arbitrary scene luminances to what will appear white or black on the output medium.

darktable prior to 2.6 had a non-linear display-referred pipeline, assuming non-linear transform early in the pipe and middle-grey encoded as 50%. However, not all modules and filters clipped the pixel values above 100%, letting open the possibility to recover them later in the pipe.

The _filmic_ view transform introduced in darktable 2.6 was the first step toward a scene-referred pipeline, and deferred the mandatory non-linear preparation for display to the end of the pipe, along with the possibility to set custom black, grey and white values. Then, _color balance_ introduced a way to deal with a variable definition of middle-grey.

As of darktable 3.2, users could choose between two workflows that allowed to define consistent default settings, modules and pipeline order: _display-referred_ and _scene-referred_.

In darktable 3.4, a full scene-referred masking and blending option has been introduced, allowing to define masks for pixel values above 100% and using only unbounded blending operators.

Switching to _scene-referred_ is a cognitive leap for most experienced users, used to display-referred thinking. In a display-referred workflow, it is customary to anchor the white value and let tone adjustments revolve around that point, trying to maximize brightness while avoiding clipping. In a display-referred workflow, white and black values are fluid and adapted to the output exporting medium. It is advised to anchor middle-grey, which will be preserved as-is for any output medium, and let the view transform (_filmic_) dilate or contract the dynamic range around that point. Because 10 bits HDR white is 4 times as bright as 8 bits SDR white, any rigid definition of "white" becomes irrelevant. But anchoring for middle-grey is actually more convenient, since it keeps the average brightness of the picture unchanged through the view transform.

Some modules are inherently non compatible with a scene-referred workflow, because their graphical interface implicitely suggests RGB values bounded in 0-100%: _levels_, _rgb levels_, _tone curve_, _rgb curve_. While the pixel operations they perform can be used in any workflow, scene or display referred, because they are unbounded internally, their controlling interface does not allow to select pixels out of the 0-100% range.

Similarly, blending modes such as overlay, linear light, soft light, hard light, darken, brighten, etc. have hard-coded thresholds that internally expects display-referred non-linear encoding.

darktable 3.4 shows in a tooltip, when the cursor hovers the module header, what color spaces, ranges and encodings each module expects, uses and produces. Here are the definitions of the terms used:

linear
: pixel values are proportionnal to the scene radiometric emission, in a state that enables accurate emulation of physical filters.

non-linear
: pixels values are rescaled such that low-lights get a larger encoding range, usually to remap the 18.45% reference middle-grey to 46 to 50%.

display-referred
: pixels values are expected between 0 and 100% of the display range, where 100%
is understood as the luminance of a 20% reflective white surface (white patch of a Color Checker) and 0% is understood as the maximum density of the output medium (saturated black ink or minimum LED panel backlighting).

scene-referred
: pixels values are expected non-zero, positive, up to +infinity. The meaning of specific pixels values will have to be defined at runtime by the user. Scene-referred values don't automatically imply a linear, radiometrically scaled, encoding.
