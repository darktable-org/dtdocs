---
title: contrast & texture
id: contrast-and-texture
weight: 10
---

{{< details summary="Technical information" class="technical-info" >}}

description
: enhance local contrast by boosting details while preserving edges.

purpose
: creative.

input
: linear, RGB, scene-referred.

processing
: linear, RGB.

output
: linear, RGB, scene-referred.

{{< /details >}}

_contrast & texture_ is the scene-referred counterpart to the display-referred [_local contrast_](local-contrast.md) module. It can be used for both adding punch to for example clouds or foliage and for smoothing busy areas (like softening skin or calming down a cluttered background).

The module uses the same _exposure-independent guided filter (eigf)_ used by the [_tone equalizer_](tone-equalizer.md#masking-tab) module for its guided mask. The scale of detail being affected can be tuned with the module's controls. The underlying filter is exposure-independent, so the strength of the effect stays consistent across shadows and highlights alike.

A noise bias control lets you tame the amplification of shadow noise, which would otherwise be boosted along with genuine detail since both look like local contrast to the algorithm.

To build up a more elaborate effect multiple instances of _contrast & texture_ can be used together, each targeting different detail scalees (via the _detail level_ slider) and possibly masked to different parts of the image.

----

Note: This module is a first step towards a more fully-featured scene-referred local contrast tool including multiple scales within one module instance and shadows/highlights control. Feedback is welcome at the [pixls.us forum](https://discuss.pixls.us/t/merged-new-module-contrast-and-texture/59768).

----

# module controls

local contrast
: The strength of the module's effect. At 0 % (the default) the effect is neutral. Positive values boost local contrast/texture; negative values reduce it. Click the mask icon to the right of the slider to visualize the details being adjusted: a mid-gray means no local detail was found at that point, while brighter or darker areas show where detail is being targeted.

## filter settings

detail level
: Controls the scale of local contrast being affected. Higher values target finer detail; lower values shift the effect towards coarser, larger-scale contrasts.

adjust edge protection
: Controls how strictly the underlying guided filter reacts to edges. Higher values increase edge preservation, keeping strong transitions crisp. Lower values allow smoother transitions between regions, at the risk of introducing halos around high-contrast edges.

filter iterations
: The number of passes of the guided filter to run. Increasing this further diffuses the filter's edges, which can help avoid artifacts, at the cost of processing speed.

noise bias
: Helps reduce amplification of noise in the shadows by adding a bias to the luminance estimate before filtering. A higher value suppresses more shadow noise but can also reduce genuine fine detail in those areas. 
