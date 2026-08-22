---
title: saturation curve
id: saturation-curve
weight: 10
---

{{< details summary="Technical information" class="technical-info" >}}

description
: remap saturation and brilliance with curves.

purpose
: corrective or creative.

input
: linear, RGB, scene-referred.

processing
: darktable UCS or JzAzBz, perceptual.

output
: linear, RGB, scene-referred.

{{< /details >}}

Remaps the saturation and brilliance of an image as a function of their own input value, using two independent, editable curves. Unlike a flat saturation or vibrance slider, each curve lets you decide exactly how much correction is applied at every point along the saturation range -- for example, protecting already-vivid colors while boosting near-neutral ones, or the reverse.

An optional edge-aware guided filter can smooth the value the curves read from, so the correction varies gradually across saturation edges instead of switching abruptly.

# introduction

Global saturation and vibrance controls apply a single coefficient, sometimes weighted by chroma, to the whole image. This is often too blunt an instrument: skin tones, skies and foliage usually sit at different points on the saturation range, and pushing all of them by the same amount rarely gives a natural result.

_Saturation curve_ plots a curve over the full range of a perceptually normalized saturation axis, from 0 to 100% of the local gamut boundary, and lets you add, move or remove control nodes anywhere along it. A second, independent curve does the same for brilliance, the perceptual dimension that behaves like a saturation-aware exposure change. Both curves are read using each pixel's own saturation as the lookup value, so the correction is local to the pixel's starting saturation rather than to a spatial mask, unless the guided filter is enabled (see [_guided filter_](#guided-filter)).

# general principles

Each pixel's RGB value is converted to a perceptual color space and reduced to two numbers: a hue angle and a normalized saturation between 0 (neutral) and 1 (the gamut boundary for that hue and lightness). This normalized value is looked up on the saturation and brilliance curves, and the resulting curve heights become multiplicative correction factors, applied at constant hue.

Two perceptual formulas are available, from the _saturation formula_ setting:

JzAzBz (2021)
: The original formula. Uses the JzAzBz uniform color space, which does not fully account for the [Helmholtz-Kohlrausch effect](https://en.wikipedia.org/wiki/Helmholtz%E2%80%93Kohlrausch_effect) and can behave less smoothly near black.

darktable UCS (2022)
: The darktable Uniform Color Space, designed specifically for saturation manipulation. It accounts for the Helmholtz-Kohlrausch effect and includes a built-in, more accurate gamut-mapping model, giving smoother results across the lightness range. This is the default and recommended formula.

Colors that would fall outside the destination gamut after correction are soft-clipped at constant hue toward the nearest in-gamut saturation, instead of being hard-clipped. This allows stronger curve adjustments without posterization or clipping near the gamut boundary. The soft-clip is applied once after the saturation curve and again after the brilliance curve.

# module controls

The module has two tabs, one per curve, a row of shared controls below the curve graph, and a collapsible _guided filter_ section.

## saturation tab

saturation curve
: Plots the output saturation multiplier (_y_ axis) against the normalized input saturation (_x_ axis). The default curve is a flat line at 50%, a neutral, unity multiplier. Moving a node above the midline increases saturation at that point on the input range; moving it below decreases it.

: - click the curve to add a node, drag an existing node to reposition it
: - Ctrl+right-click a node to reset it to neutral
: - right-click a node to remove it, when more than two nodes are present
: - double-click anywhere on the graph to reset the active curve
: - scroll over a selected node to nudge its value; Ctrl+scroll uses larger steps

: The graph background shows a log-compressed histogram of the image's own input-saturation distribution, so you can see which parts of the range are populated before placing nodes. A gradient strip below the graph shows the corresponding hue-less perceptual gradient for reference.

## brilliance tab

brilliance curve
: Works identically to the saturation curve, but its output multiplier applies to the perceptual brilliance dimension. Brilliance changes act at constant hue and combine a luminance and chroma shift orthogonal to pure saturation, closer to a local, saturation-aware exposure adjustment.

: The same node interactions apply as for the [_saturation curve_](#saturation-tab). Switching tabs does not reset the other curve -- both are always active and can be combined. Both curves are looked up at the same input value for a given pixel, whether that is the pixel's raw saturation or, with the guided filter enabled, its smoothed counterpart.

## shared controls

color picker
: Samples the normalized saturation at the selected point and overlays it on the active curve's graph as a vertical guide, using the standard [picker](../../darkroom/processing-modules/module-controls.md#pickers) behavior. Use it to locate where a subject, such as skin or sky, sits on the input axis before shaping the curve. Always reads the raw, unfiltered per-pixel saturation, regardless of the guided filter setting.

show saturation mask
: Toggles a grayscale preview of the normalized input saturation used to look up both curves, shown in place of the image. Brighter areas correspond to higher input saturation. With the guided filter disabled, this shows the raw per-pixel saturation; enabled, it shows the guided-filter-smoothed version instead. Either way, the mask reflects the module's input, not any correction the curves apply.

saturation formula
: Selects the perceptual normalization model, described in [general principles](#general-principles). Affects both curves and is not meant to be changed regularly, hence its place in the shared row rather than duplicated per tab.

## guided filter

Optional edge-aware smoothing of the saturation value that both curves are looked up with.

use guided filter
: Enables the smoothing. Disabled by default. Off, each pixel's curve lookup uses its own raw, normalized saturation. On, that value is first passed through a fast scalar guided filter before being used as the lookup for both curves, so neighboring pixels with similar saturation are pulled toward a common, locally smoothed value. Reduces halos and stair-stepping at boundaries between saturated and neutral regions, especially with aggressive curves and brilliance changes.

filter radius
: Neighborhood radius, in pixels, used for the guided filter's local statistics. Larger values give a more strongly smoothed lookup value with broader spatial influence; smaller values keep the smoothing tighter around local structures.

edge feathering
: Controls how strongly the filter follows edges in the saturation signal. Lower values preserve harder edges and keep the smoothed value aligned to the underlying saturation structure; higher values give softer, less edge-anchored transitions.

iterations
: Number of times the guided filter runs in sequence. More iterations increase smoothing and the effective reach of the filter, at the cost of additional computation.

_Note that the _filter radius_, _edge feathering_ and _iterations_ sliders are only active when _use guided filter_ is enabled._

# usage guide

## basic workflow

When first enabled, both curves default to a flat, neutral line and the image is unchanged.

1. use the color picker on a subject you want to target, for example skin or sky, to see where its saturation falls on the graph,
2. briefly enable the saturation mask to confirm which regions of the image correspond to which part of the curve's _x_ axis,
3. add a node near the picked position and drag it up to boost, or down to reduce, saturation in that range; the histogram overlay shows how much of the image is affected,
4. add further nodes to protect one end of the range, for example keeping already-vivid colors near the right edge untouched, while adjusting another,
5. switch to the brilliance tab if the corrected colors need a luminance/chroma trim at constant hue to look balanced, which is often useful after a strong saturation boost,
6. if strong curve settings produce halos or stair-stepping around saturated edges, enable the guided filter and re-check the mask preview, which now shows the smoothed lookup value, while adjusting filter radius, edge feathering and iterations.

## choosing a formula

Leave the formula on _darktable UCS_ unless matching the behavior of an older edit or style built with _JzAzBz_. Switching formulas changes how input saturation is normalized and therefore changes the effect of existing curve nodes.

_Note that you should re-check the curves against the histogram overlay after switching formulas._

## using the guided filter

The guided filter does not change what the curves do; it only changes which saturation value they are evaluated at for each pixel. Start with the default radius and one iteration, and increase the radius or iteration count if halos persist across large color transitions. Increase edge feathering only if transitions still look too abrupt after adjusting radius and iterations. Because the smoothing sits upstream of both curves, it affects the saturation and brilliance results together; there is no separate guided-filter control per curve.

# FAQ

## why does the curve reference a normalized value instead of raw chroma?

Raw chroma or saturation values are not bounded consistently across hues and lightness levels -- the same numeric chroma can be barely visible for one hue and heavily clipped for another. Normalizing input to the local gamut boundary, from 0 to 1, for the current hue and lightness makes the curve behave consistently across the image: a node placed at 80% always means 80% of the way to the most saturated color physically displayable at that hue and lightness.

## how is this different from color balance RGB's perceptual saturation grading?

[_Color balance RGB_](./color-balance-rgb.md) applies a single perceptual saturation and brilliance coefficient, optionally split between shadows, mid-tones and highlights via luminance masks. _Saturation curve_ instead lets the correction vary continuously as a function of the pixel's own saturation, independent of its luminance. The two modules are complementary and can be used together: luminance-based masking in _color balance RGB_, saturation-based shaping here.

## does the guided filter blend the corrected image with the original?

No. It does not mix the untouched and corrected pixels after the fact. It only smooths the saturation value fed into the saturation and brilliance curves for each pixel, before any correction is computed. A pixel is always fully processed through the curves; what changes is which point on the curve it is evaluated at.

## internal processing

The following is the internal order of operations within the module, for each active pixel:

1. convert from pipeline RGB to XYZ, then to the selected perceptual space, JzAzBz or darktable UCS JCH,
2. compute the hue angle and the saturation normalized to the local gamut boundary,
3. if the guided filter is enabled, replace this value with the corresponding value from a full-image scalar mask already smoothed with the guided filter, computed on CPU or, where available, GPU via OpenCL, with downsampling to stay efficient at high resolutions; otherwise use the value from step 2 directly,
4. look up the saturation and brilliance curves at that value to obtain two correction factors,
5. apply the saturation factor at constant hue, soft-clipping against the gamut boundary,
6. apply the brilliance factor at constant hue, orthogonal to saturation,
7. soft-clip the result again against the destination gamut,
8. convert back to pipeline RGB.

# caveats

Changing the working RGB space mid-session will change how existing curve nodes behave, since 80% of the gamut boundary under one profile is not the same absolute saturation as under another. If you change the working profile, re-check the curves against the histogram overlay.

The saturation mask preview shows the module's input to the curves, raw or guided-filter-smoothed, not the corrected output. It is a diagnostic aid for shaping the curve, not a preview of the final result.

_Note that enabling the guided filter adds computation cost that scales with filter radius and iteration count. Very large radii combined with several iterations will noticeably increase processing time on high-resolution images._
