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
: Selecting a film stock and a print paper is enough to get a complete, physically-plausible result. The per-effect controls (grain, halation, diffusion) and the film tab's _chemistry_ section are there for fine-tuning, not required for a first pass.

positive film has no print stage
: Slide and reversal film stocks are viewed directly rather than printed -- _scan the film_ is automatically enabled when you select one, and every print-stage control (print exposure compensation, auto print exposure, print contrast, print development time, filtration, preflash, print diffusion) has no effect while it's active. The scanner tab's _viewing glare_ is also inactive, since a directly scanned film has no print surface.

auto print exposure is a real-world default, not a fixed brightness
: With _auto print exposure_ enabled, changing _film exposure_ does not change the final brightness -- print exposure automatically compensates, the same way a real printer exposes to a fixed target density regardless of how the negative was exposed. Disable it if you want film exposure to affect brightness directly, as it would with a fixed enlarger exposure time.

narrow-spectral-sensitivity papers may need manual print exposure
: A few print stocks (duplicating films in particular) have a very narrow spectral sensitivity. _auto print exposure_'s metering can under- or over-shoot for these -- if a print looks implausibly dark or bright with auto print exposure enabled, use _print exposure compensation_ to correct it manually.

# module controls

Film stock, print paper, and the film format are always visible at the top of the module. Everything else is organized into tabs matching the stages of the physical process: _film_, _print_, _grain_, _halation_, _diffusion_, and _scanner_.

## header

film stock
: The film emulsion to simulate, selected from the included spectral profile data.

print paper
: The print/paper stock to simulate. Defaults to the film stock's own target print paper; change the film and the paper follows automatically unless you've explicitly chosen a different one.

format
: A preset picker for common film/sensor gate sizes (half-frame, 35mm, 6x6, 6x7, 6x9, 4x5, 8x10, Super 8, 16mm, Super 16, Super 35, VistaVision, 65mm 5-perf, IMAX 15-perf, or custom). Choosing a preset sets the _frame long edge_ slider below to match. Note that the preset names a film _gauge_ (35mm), while the slider is the frame's long edge (36mm) -- both describe the same format.

frame long edge
: The physical size of the simulated frame's long edge, in mm. Sets the real-world scale that grain, scatter, and halation are computed at, so a smaller format shows proportionally coarser grain and larger scatter/halation for the same print size.

## film

### exposure

film exposure
: Exposure compensation applied at the film stage, in EV. With _auto print exposure_ enabled this has no net effect on the final brightness (see [usage](#usage) above) -- it still affects color rendering and grain the way a real exposure change would, since those depend on where on the film's characteristic curve the exposure lands.

scan the film (skip print)
: View the developed film directly instead of printing it. Automatically enabled for positive/reversal film stocks, which have no print stage; automatically disabled when you switch to a negative stock. You can still toggle it manually afterwards.

push/pull
: Push (positive values) or pull (negative values) processing, in stops: shoot at an effective ISO different from box speed, then under- or over-develop to compensate. Combines an exposure shift with a derived contrast increase/decrease -- an approximation, since the exact relationship depends on the specific film/developer combination, which isn't modeled here. Stacks with the _chemistry_ controls below for further fine-tuning.

### chemistry

development time
: The development time the film's characteristic curves were measured at, in minutes. Only black & white stocks are characterised at more than one development time (Kodak Double-X at 4/5/6.5/9/12 minutes, for example); the slider is greyed out for colour stocks and for stocks with a single characterisation. The value snaps to the nearest measured time, and 0 selects the stock's own standard development. Unlike _development gamma_ below, which morphs the curves mathematically, this selects a different set of actually-measured curves.

development gamma
: Overall development contrast, applied by morphing the film's own density curves -- extended or reduced development time, as in push/pull processing. 1.0 is normal development.

fast layer gamma
: Contrast of the fastest (most light-sensitive) emulsion sub-layer only, independent of the slow layer -- push/pull processing doesn't always affect every sub-layer equally.

slow layer gamma
: Contrast of the mid and slow emulsion sub-layers.

developer exhaustion
: Local developer depletion in dense (highly-exposed) areas: blends the highlight shoulder toward a self-limiting rolloff without shifting mid-grey. 0 disables it.

### couplers and quality

DIR couplers
: Strength of inter-layer development inhibition (DIR couplers), which drives saturation and edge effects in the simulated film. 1.0 is film-accurate; 0 disables the effect. The slider stops at 1.0: the inhibition has to stay invertible for the film's "before couplers" curves to be recoverable, and beyond film-accurate strength that breaks down -- for some stocks well before 2.0. The module additionally reduces the effective amount if a particular stock's curves would become non-invertible sooner.

quality
: Trade-off between spectral accuracy and processing speed. Higher settings use a finer-resolution lookup table, interpolated with PCHIP splines and validated against the reference implementation.

## print

print exposure compensation
: Manual print brightness (enlarger exposure time), in EV. This is an offset either way: with _auto print exposure_ enabled it shifts the automatic result rather than being ignored -- see [usage](#usage) above.

auto print exposure
: Automatically compensate print exposure for film exposure changes, the way a real printer would expose to a fixed density regardless of the negative's own exposure. Has no effect while _scan the film_ is enabled, since there's no print stage to compensate.

print contrast
: Print contrast, applied by morphing the paper's own density curves rather than a simple RGB contrast operation.

### chemistry

development time
: The development time the print paper's characteristic curves were measured at, in minutes -- the print-stage counterpart of the film tab's _development time_, and independent of it. Only black & white print stocks carry more than one measured development (Kodak Print Film 2302 at 2/3.5/5/7/9 minutes); the slider is greyed out otherwise, and while _scan the film_ is enabled.

### filtration

filtration M / filtration Y
: Magenta and yellow enlarger filtration, in Kodak CC units from neutral.

### preflash

preflash exposure
: A brief, uniform pre-exposure of the print through the film's base density, applied before the main print exposure. Lifts shadows and reduces contrast, a real darkroom technique for controlling contrast on high-contrast negatives. 0 disables it.

preflash M filter shift / preflash Y filter shift
: Magenta/yellow filtration for the preflash exposure only, in Kodak CC units from neutral -- independent of the main enlarger filtration above.

## grain

Grain is not drawn as a separate layer on top of a sharp image. The simulation produces a grained film density, softens it with a small clump blur -- image detail and grain together, as the emulsion itself does -- and then restores the lost edge definition with the _acutance recovery_ sharpening below. The blur and the recovery are a matched pair, tuned together, so a picture with grain enabled is very slightly softer than the same picture with grain off. That is the film's own behaviour, not an artifact; if you want it sharper, reduce _grain strength_ or turn grain off rather than raising _grain recovery strength_.

enable grain
: Enable film grain simulation.

grain strength
: Strength of the simulated film grain. 1.0 is film-accurate for the selected stock. The hard range extends to 8 (drag up to 2, right-click to enter higher values) for pushing naturally fine-grained stocks further than their catalogue amount allows.

grain size
: Grain particle size. 1.0 is the film's own default; higher values are coarser.

### acutance recovery

grain recovery sharpness
: Radius of the acutance-recovery sharpening applied after grain's clump blur. 0 disables it; higher values produce wider halos, lower values finer detail.

grain recovery strength
: Strength of the acutance-recovery sharpening -- it restores the edge definition the clump blur takes away. 0 disables it, which leaves the softening in place with nothing recovering it. The defaults are the reference implementation's own tuned pair; raising the strength well above them sharpens beyond what the blur removed, which makes grain look crunchy rather than photographic.

## halation

enable halation
: Enable in-emulsion light scatter and back-reflection halation simulation -- the softening and reddish glow around bright highlights caused by light scattering within the emulsion and, separately, reflecting off the film base back into it.

scatter amount
: Strength of in-emulsion light scatter -- the softening that happens as light passes through the emulsion, before any of it reaches the film base. Physically distinct from, and independent of, _halation strength_ below: 1.0 is film-accurate; 0 disables it. This is the fraction of light that scatters, so 1.0 (all of it) is the maximum -- unlike _halation strength_, it has no meaningful values above film-accurate.

scatter size
: Scales the in-emulsion scatter radius. 1.0 is film-accurate, and is the value the reference implementation always uses -- it doesn't expose this control at all. Above 1.0 you are past what the film model claims, and because the radius scales directly with the value the whole frame softens quickly. Drag up to 1.5, right-click to enter higher values.

halation strength
: Strength of the halation glow -- light reflecting off the film base back into the emulsion. 1.0 is film-accurate for the selected film stock: stocks with a strong built-in antihalation layer (most modern colour negative film) show much less glow than one with a weak or absent antihalation layer (e.g. a redscale-style stock), so the same 1.0 setting looks different from stock to stock, matching how the actual film behaves. The hard range extends to 8 (drag up to 2, right-click to enter higher values).

halation size
: Halation glow radius. 1.0 is film-accurate.

### threshold

highlight boost
: Reconstructs clipped highlights so they can bloom into scatter, halation, and diffusion, in EV. 0 disables it. The boost is applied over a fixed 4 EV window above the _boost protect_ threshold, so the same setting produces the same result regardless of image size, zoom level, or whether the export is tiled.

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

## scanner

The scanner stage models how the developed film or finished print is digitised, and the conditions it is viewed under. These act on the final image, after everything else.

pre-compression boost
: Multiplies XYZ luminance immediately before the OkLCh output gamut compressor, pushing the histogram to the right while the film's own shoulder rolloff is preserved. 1.0 is neutral/off. Because it acts at the very end of the module, the picker measures the processed image rather than the input: use it on an area of highlights to set the boost so the brightest tone lands just past the compressor's knee.

scanner blur
: Softening from the scanner's own optics, in pixels. 0 disables it.

scanner sharpness
: Radius of the scanner's sharpening pass, in pixels.

scanner sharpen strength
: Strength of the scanner's sharpening pass. 0 disables it. This defaults to the reference implementation's own value -- set it to 0 if you would rather sharpen further down the pipeline with darktable's [_sharpen_](./sharpen.md) or [_diffuse or sharpen_](./diffuse.md) modules.

viewing glare
: A faint veil of the viewing light reflecting off the print surface, as a percentage. Lifts the deepest blacks very slightly, the way a real print viewed in a real room never reaches true black. Has no effect while _scan the film_ is enabled, since a directly scanned film has no print surface to reflect off.
