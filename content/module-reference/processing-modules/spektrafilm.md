---
title: spektrafilm
id: spektrafilm
weight: 10
include_toc: true
---

{{< details summary="Technical information" class="technical-info" >}}

description
: simulates the physical process of developing and printing analog film, using spectral emulsion and paper data from the [spektrafilm](https://github.com/andreavolpato/spektrafilm) project.

purpose
: creative.

input
: linear, RGB, scene-referred.

processing
: non-linear, RGB.

output
: non-linear, RGB, display-referred.

{{< /details >}}

Recreate the look of a chosen film stock and paper combination from spectral measurement data, rather than a fitted curve or a LUT derived from scanned samples.

This module simulates the actual physical chain a real photograph goes through on film: the film's own spectral sensitivity converts scene light into per-layer exposure, development (including inter-layer DIR coupler inhibition) turns exposure into dye density, and -- unless you choose to view the film directly -- an enlarger then prints that density through a paper's own spectral response to produce the final image. Grain, halation, and diffusion filtration are modeled as physical effects on top of this chain, not stylized overlays.

Because the underlying data is spectral rather than a fixed RGB transform, the module reacts to your working color space and white balance the way a real film stock would react to different light: the same film and paper combination will render differently under different scene illuminants, just as it would in a darkroom.

---

**Note**: Like other view transforms, modules placed before _spektrafilm_ in the pipeline operate in [scene-referred](../../../darkroom/pixelpipe/the-pixelpipe-and-module-order.md/#scene-referred-workflow) space. Modules after it work in [display-referred](../../../darkroom/pixelpipe/the-pixelpipe-and-module-order.md/#display-referred-workflow) space.

---

# usage

only use one display transform
: Never use _spektrafilm_ together with another display transform module (i.e. [_filmic rgb_](./filmic-rgb.md), [_sigmoid_](./sigmoid.md), [_AgX_](./agx.md) or [_base curve_](./base-curve.md)) -- _spektrafilm_ performs the film's own tone mapping as part of simulating development and printing.

start simple
: Selecting a film stock and a print paper is enough to get a complete, physically-plausible result. The _advanced_ tab and per-effect controls (grain, halation, diffusion) are there for fine-tuning, not required for a first pass.

positive film has no print stage
: Slide and reversal film stocks are viewed directly rather than printed -- _scan the film_ is automatically enabled when you select one, and every print-stage control (print exposure, auto print exposure, print contrast, filtration, preflash, print diffusion) has no effect while it's active.

auto print exposure is a real-world default, not a fixed brightness
: With _auto print exposure_ enabled, changing _film exposure_ does not change the final brightness -- print exposure automatically compensates, the same way a real printer exposes to a fixed target density regardless of how the negative was exposed. Disable it if you want film exposure to affect brightness directly, as it would with a fixed enlarger exposure time.

narrow-spectral-sensitivity papers may need manual print exposure
: A few print stocks (duplicating films in particular) have a very narrow spectral sensitivity. _auto print exposure_'s metering can under- or over-shoot for these -- if a print looks implausibly dark or bright with auto print exposure enabled, use _print exposure_ to correct it manually.

# module controls

The module is organized into tabs matching the stages of the physical process: _film and print_, _grain_, _halation_, _diffusion_, and _advanced_.

## film and print

film stock
: The film emulsion to simulate, selected from the included spectral profile data.

print paper
: The print/paper stock to simulate. Defaults to the film stock's own target print paper; change the film and the paper follows automatically unless you've explicitly chosen a different one.

### film

film exposure
: Exposure compensation applied at the film stage, in EV. With _auto print exposure_ enabled this has no net effect on the final brightness (see [usage](#usage) above) -- it still affects color rendering and grain the way a real exposure change would, since those depend on where on the film's characteristic curve the exposure lands.

scan the film (skip print)
: View the developed film directly instead of printing it. Automatically enabled for positive/reversal film stocks, which have no print stage; automatically disabled when you switch to a negative stock. You can still toggle it manually afterwards.

### print

print exposure
: Manual print brightness (enlarger exposure time), in EV. Independent of, and additive with, _auto print exposure_ -- see [usage](#usage) above.

auto print exposure
: Automatically compensate print exposure for film exposure changes, the way a real printer would expose to a fixed density regardless of the negative's own exposure. Has no effect while _scan the film_ is enabled, since there's no print stage to compensate.

print contrast
: Print contrast, applied by morphing the paper's own density curves rather than a simple RGB contrast operation.

filtration M / filtration Y
: Magenta and yellow enlarger filtration, in Kodak CC units from neutral.

DIR couplers
: Strength of inter-layer development inhibition, which drives saturation and edge effects in the simulated film. 1.0 is film-accurate; 0 disables the effect.

#### preflash

preflash exposure
: A brief, uniform pre-exposure of the print through the film's base density, applied before the main print exposure. Lifts shadows and reduces contrast, a real darkroom technique for controlling contrast on high-contrast negatives. 0 disables it.

preflash M filter shift / preflash Y filter shift
: Magenta/yellow filtration for the preflash exposure only, in Kodak CC units from neutral -- independent of the main enlarger filtration above.

### format

film format
: The physical film width being simulated, in mm. Sets the real-world scale that grain, scatter, and halation are computed at, so a smaller format shows proportionally coarser grain and larger scatter/halation for the same print size.

## grain

enable grain
: Enable film grain simulation.

grain
: Grain strength. 1.0 is film-accurate for the selected stock. The hard range extends to 8 (drag up to 2, right-click to enter higher values) for pushing naturally fine-grained stocks further than their catalogue amount allows.

grain size
: Grain particle size. 1.0 is the film's own default; higher values are coarser.

## halation

enable halation
: Enable in-emulsion light scatter and back-reflection halation simulation -- the softening and reddish glow around bright highlights caused by light scattering within the emulsion and, separately, reflecting off the film base back into it.

scatter amount
: Strength of in-emulsion light scatter -- the softening that happens as light passes through the emulsion, before any of it reaches the film base. Physically distinct from, and independent of, _halation_ below: 1.0 is film-accurate; 0 disables it.

scatter size
: Scatter radius. 1.0 is film-accurate.

halation
: Halation strength -- the reddish glow from light reflecting off the film base back into the emulsion. 1.0 is film-accurate for the selected film stock: stocks with a strong built-in antihalation layer (most modern colour negative film) show much less glow than one with a weak or absent antihalation layer (e.g. a redscale-style stock), so the same 1.0 setting looks different from stock to stock, matching how the actual film behaves. The hard range extends to 8 (drag up to 2, right-click to enter higher values).

halation size
: Halation glow radius. 1.0 is film-accurate.

highlight boost
: Reconstructs clipped highlights so they can bloom into scatter, halation, and diffusion, in EV. 0 disables it.

boost range
: Range of the highlight boost curve.

boost protect
: Protects tones below this many stops over mid-grey from the highlight boost, in EV.

## diffusion

enable diffusion filter
: Enable a diffusion filter, simulating the effect of a physical camera filter placed in front of the lens.

diffusion filter type
: The filter family to simulate:
: - _black pro-mist_: a concentrated, punchy halo with deep blacks preserved.
: - _glimmerglass_: a tight, subtle diffusion that preserves sharpness.
: - _pro-mist_: broader and more pastel, a softer atmospheric look.
: - _cinebloom_: a frame-wide, slow-decaying veil.

diffusion strength
: Diffusion filter strength.

diffusion size
: Diffusion halo/bloom size.

diffusion halo warmth
: Warmth of the diffusion halo -- positive values warm the outer halo, negative values cool it. Added on top of the selected filter type's own inherent warmth bias.

### print diffusion

A second, independent diffusion filter applied at the print stage rather than the film stage -- simulating a filter placed at the enlarger instead of the camera. Its controls are the same as [diffusion](#diffusion) above, applied independently: _enable print diffusion_, _print diffusion filter type_, _print diffusion strength_, _print diffusion size_, _print diffusion halo warmth_.

## advanced

quality
: Trade-off between spectral accuracy and processing speed. Higher settings use a finer-resolution lookup table, interpolated with PCHIP splines and validated against the reference implementation.

pre-compression boost
: Multiplies XYZ luminance before the output gamut compressor, pushing the histogram brighter while the compressor's own highlight rolloff is preserved. 1.0 is neutral/off.
