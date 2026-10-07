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

_contrast & texture_ is the scene-referred counterpart to the display-referred [_local contrast_](local-contrast.md) module. It can be used for both adding punch to, for example, clouds or foliage and for smoothing busy areas (like softening skin or calming down a cluttered background). It can also be used to manage highlights and shadows as the scene referred equivalent of the display referred [_shadows and highlights_](shadows-and-highlights.md).

The module uses the same _exposure-independent guided filter (eigf)_ used by the [_tone equalizer_](tone-equalizer.md#masking-tab) module for its guided mask. The affected scale of detail can be tuned with the module's controls, and three separate scale levels can be targeted individually. The underlying filter is exposure-independent, so the strength of the effect stays consistent across shadows and highlights alike.

A noise bias control lets you tame the amplification of shadow noise, which would otherwise be boosted along with genuine detail since both look like local contrast to the algorithm.

To build up a more elaborate effect, multiple instances of _contrast & texture_ can be used together, each targeting different detail scales and possibly masked to different parts of the image.

Multiple controls have a mask display button ![mask-icon](./contrast-texture/mask.png#icon) available - only one mask can be displayed at a time, so clicking on a mask display button turns off any other mask currently being displayed.

----

Note: This module is a first step towards a more fully-featured scene-referred local contrast tool including multiple scales within one module instance and shadows/highlights control. Feedback is welcome at the [pixls.us forum](https://discuss.pixls.us/t/merged-new-module-contrast-and-texture/59768).

----

# module controls

base detail level
: Adjust the base detail level, which determines the scale targeted by highlights, shadows, and coarse, medium and fine details.
: - higher values: affect local contrast in finer details.
: - lower values: affect local contrast in coarser details.
: Press the mask display button to preview the low pass filter result used for shadows (blue) and highlights (yellow).
: The detail scales targeted by the three local contrast sliders can be previewed with their respective mask buttons (see below). Use them in conjunction with adjusting _base detail level_ to tune the detail level you want to affect.

highlights
: Adjust highlights at the base detail level size.

shadows
: Adjust shadows at the base detail level size.

Note: When adjusting _highlights_ and _shadows_ a lower _base detail level_ will tend to enhance local contrast in those respective regions while a higher _base detail level_ will result in flatter local contrasts in those regions. 

## local contrast

coarse details
: Adjust coarse, low frequency local contrasts. Click the mask display button to preview the size of the coarse details to adjust.

medium details
: Adjust medium frequency local contrasts. Click the mask display button to preview the size of the medium details to adjust.

fine details
: Adjust fine, high frequency local contrasts. Click the mask display button to preview the size of the fine details to adjust. Can be used for sharpening.

## filter settings

halo control
: Adjust the halo control of the filter.
: - higher values: suppress halos at the expense of details around edges. Helps with making the effect on local contrast smoother
: - lower values: allow more halos to get more local contrast and details.

noise bias
: Helps reduce amplification of noise in the shadows by adding a bias to the luminance estimate before filtering. A higher value suppresses more shadow noise but can also reduce genuine fine detail in those areas. 
