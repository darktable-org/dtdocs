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

Recreate the look of a film stock printed onto darkroom paper.

Most film emulations are a colour recipe: someone photographed a scene on film, measured how the colours moved, and saved that as a curve or a LUT. This module works the other way round. It starts from laboratory measurements of what real film and real paper are made of -- how sensitive each colour layer is to each wavelength of light, and how much dye each one produces -- and simulates what physically happens to a photograph, step by step:

- light from the scene falls on the film and exposes its three colour layers,
- development turns that exposure into dye, with the layers chemically interfering with one another as they do in a real tank,
- an enlarger shines light through the developed negative onto a sheet of paper,
- the paper develops in turn, and the finished print is scanned.

Grain, halation and diffusion filters are simulated as things that physically happen along the way, rather than as effects painted on at the end.

One consequence is worth knowing up front. Because the module works from what light actually is, rather than from a fixed colour recipe, the same film and paper render differently under different lighting -- exactly as real film does. Tungsten light and midday sun will not simply differ in white balance.

The measurement data comes from the [spektrafilm](https://github.com/andreavolpato/spektrafilm) project by Andrea Volpato.

---

**Note**: Like other view transforms, modules placed before _spektrafilm_ in the pipeline operate in [scene-referred](../../../darkroom/pixelpipe/the-pixelpipe-and-module-order.md/#scene-referred-workflow) space. Modules after it work in [display-referred](../../../darkroom/pixelpipe/the-pixelpipe-and-module-order.md/#display-referred-workflow) space.

---

# usage

install the data first
: The module needs a data pack -- the film and paper measurements it works from -- and cannot render anything without one. If none is installed, the module shows a single button that downloads it, and the rest of the controls appear once that finishes. Packs are checked against a checksum before being installed, and are stored alongside your configuration, so they survive clearing the cache.

only use one display transform
: Never use _spektrafilm_ together with another display transform module (i.e. [_filmic rgb_](./filmic-rgb.md), [_sigmoid_](./sigmoid.md), [_AgX_](./agx.md) or [_base curve_](./base-curve.md)) -- _spektrafilm_ performs the film's own tone mapping as part of simulating development and printing.

start simple
: Choosing a film stock is enough. Everything else already carries a sensible value taken from that film's own measurements, and the paper follows the film automatically. The tabs are for fine-tuning, not for getting a first result.

everything resets
: Double-click any slider to return it to its default. Each section heading has its own reset button for just that group of controls, and double-clicking a tab resets the whole tab -- useful for getting back to the film's own behaviour after experimenting, without starting over.

slide film has no print stage
: Slide and reversal stocks are viewed directly rather than printed. _scan the film_ switches on by itself when you choose one, and the entire print tab then has no effect, along with _viewing glare_ on the scanner tab -- there is no print surface for the light to reflect off.

auto print exposure changes what film exposure does
: Out of the box, _film exposure_ behaves like leaving the enlarger on for a fixed time: expose the film more and the print comes out brighter. Switch on _auto print exposure_ and it stops doing that, because print exposure now compensates automatically -- which is what a real printer does, aiming for consistent print density however the negative was exposed. _film exposure_ then changes only colour and grain, by moving the scene to a different part of the film's response. It is off by default so that the control does the obvious thing until you ask for the darkroom behaviour.

some print stocks need manual print exposure
: A few print stocks respond only to a very narrow slice of the spectrum -- the duplicating and release print films (Kodak 2302, 2383, 2393) rather than the ordinary papers. _auto print exposure_ can misjudge these. If a print looks implausibly dark or bright with it on, correct it with _print exposure compensation_, or leave auto off for those stocks.

# module controls

Film stock, print paper and film format are always visible at the top. Everything else is grouped into tabs, one per stage of the physical process: _film_, _print_, _grain_, _halation_, _diffusion_ and _scanner_.

## header

film stock
: The film to simulate.

print paper
: The paper to print onto. Left on _auto_ it follows the film stock's own intended paper, and names which one that currently is -- for example _auto (Kodak Portra Endura)_. Choose a paper explicitly and it stays put when you change film.

format
: A preset picker for common frame sizes (half-frame, 35mm, 6x6, 6x7, 6x9, 4x5, 8x10, Super 8, 16mm, Super 16, Super 35, VistaVision, 65mm 5-perf, IMAX 15-perf, or custom), which sets _frame long edge_ below. The preset names a film _gauge_ (35mm) while the slider gives the frame's long edge (36mm); both describe the same format.

frame long edge
: The real-world width of the simulated frame, in mm. This is the physical scale everything else is measured against, so grain, scatter, halation and diffusion all come out proportionally larger on a smaller format at the same print size -- just as they do in reality. Grain becomes coarser relative to the frame rather than softer, since its clumping stays a fixed size on screen.

## film

### exposure

film exposure
: Exposure adjustment at the film stage, in EV. With _auto print exposure_ on this no longer changes overall brightness (see [usage](#usage) above), but it still changes colour and grain, because it moves the scene to a different part of the film's response.

scan the film (skip print)
: Look at the developed negative or slide directly instead of printing it. Switches on by itself for slide and reversal stocks and off again for negative stocks; you can override it either way afterwards.

push/pull
: Shooting the film at a speed other than the box says, then compensating in development, in stops. Positive values push (shoot darker, develop longer), negative values pull. An approximation, since the real result depends on the specific developer, which is not simulated. Stacks with the _chemistry_ controls below.

### chemistry

development time
: How long the film is developed, in minutes. Only a few black & white stocks were measured at more than one time -- Kodak Double-X at 4, 5, 6.5, 9 and 12 minutes, for instance -- so the slider is greyed out for colour films and for anything measured only once. Values snap to the times actually measured, and 0 means the stock's standard development. Unlike _development gamma_ below, this switches between genuinely different measurements rather than calculating something in between.

development gamma
: Overall development contrast, as though you had developed for longer or shorter. 1.0 is normal.

fast layer gamma
: Contrast of the most light-sensitive layer alone. Real film has several layers of differing sensitivity, and a change in development does not affect them equally.

slow layer gamma
: Contrast of the less sensitive layers.

developer exhaustion
: In a real developing tank the chemistry gets locally used up where the film was most heavily exposed. Those areas then stop gaining density however much brighter the scene gets, so highlights run into a ceiling instead of climbing indefinitely -- and the approach to that ceiling steepens, so highlight contrast tends to rise rather than soften. Mid-grey is held still, so only the bright end moves. 0 switches it off.

### DIR couplers

As one colour layer develops, it releases a chemical that slows development in its neighbours. This is where much of colour negative film's saturation comes from, and it sharpens edges too: a bright area holds back development just beyond its own boundary, which reads as extra definition.

DIR couplers
: Overall strength of the effect. 1.0 matches the real film, 0 switches it off. The slider stops at 1.0 because the simulation has to be able to work backwards from the film's measured curves, and beyond film-accurate strength that becomes impossible -- for some stocks well before 2.0. The module quietly reduces the amount further for stocks where it would break down sooner.

same-layer inhibition
: How much each layer holds back its own development. Raising it flattens contrast within each colour channel.

interlayer inhibition
: How much each layer holds back the other two. This is the part that produces the saturation the effect is known for; at 0 the three colours develop independently.

diffusion size
: How far the released chemical spreads through the emulsion, in thousandths of a millimetre. This is what turns the couplers into an edge effect rather than a purely tonal one: the further it spreads, the further a bright area reaches past its own boundary, and the more the result looks like added sharpening. Shorten it for a gentler, more purely tonal response. Each film carries its own value, and the slider follows the film when you change stock.

diffusion tail
: A small part of the chemical travels much further than the rest. This sets how far, and is what gives large bright areas a broad, gentle falloff rather than a glow that stops abruptly.

tail weight
: How much of the chemical travels in that long tail rather than spreading normally. 0 removes the tail entirely.

### advanced

quality
: How finely the colour simulation is calculated. The three table settings work the answer out on a grid in advance and interpolate between the points, so a larger grid is closer to exact and slower to prepare. _exact spectral_ skips the grid and calculates every pixel directly: much slower, CPU only, and rarely visibly different.

bandwidth adaptation
: Trims the extreme violet and deep red ends of the film's sensitivity, as part of how each stock is characterised. On by default and best left on -- it belongs to the film's description rather than being a look.

surface adaptation
: An optional per-colour exposure correction carried in the film data, worth up to two stops for strongly coloured light and nothing at all for neutral. Off by default, because it shifts saturated colours noticeably and the reference implementation does not apply it either. Stocks whose data does not include the correction are unaffected either way.

## print

### exposure

print exposure compensation
: How long the enlarger stays on, in EV -- the brightness of the print. Always an offset: with _auto print exposure_ on it shifts the automatic result rather than being ignored.

auto print exposure
: Compensate print exposure automatically for changes in film exposure, the way a real printer aims for consistent density whatever the negative. Does nothing while _scan the film_ is on.

print contrast
: Contrast of the print, achieved by reshaping the paper's own response rather than by a generic contrast adjustment.

### chemistry

development time
: How long the print is developed. Works exactly like the film tab's version and is set separately from it. Only Kodak Print Film 2302 was measured at more than one time (2, 3.5, 5, 7 and 9 minutes), so the slider is greyed out for every other paper -- and while _scan the film_ is on, since there is no print to develop.

### filtration

filtration M / filtration Y
: Magenta and yellow filters in the enlarger, in Kodak CC units away from neutral -- the colour balance of the print, adjusted the way it is in a darkroom.

### preflash

preflash exposure
: A brief, even pre-exposure of the paper before the main one, through the blank part of the film. Lifts shadows and lowers contrast; a standard darkroom technique for printing difficult negatives. 0 switches it off.

preflash M filter shift / preflash Y filter shift
: Magenta and yellow filtration for the preflash alone, in Kodak CC units, independent of the main filtration above.

## grain

Grain is not sprinkled over a sharp picture. The simulation makes the film grainy, blurs detail and grain together the way an emulsion does, and then restores the lost edge definition with the sharpening under _acutance recovery_ below. The blur and the recovery are tuned as a pair, so a picture with grain on is slightly softer than the same picture with grain off. That is how film behaves. If you want it sharper, lower _grain strength_ or switch grain off rather than raising the recovery.

enable grain
: Switch grain simulation on.

### grain

grain strength
: How pronounced the grain is. 1.0 matches the real stock. The slider drags to 2 and accepts up to 8 by right-clicking, for pushing a naturally fine-grained film further than it would really go.

grain size
: How large the grain particles are. 1.0 is the film's own; higher is coarser.

### acutance recovery

grain recovery sharpness
: How wide the recovery sharpening reaches. 0 switches it off; wider gives broader halos, narrower keeps to fine detail.

grain recovery strength
: How strongly it sharpens, restoring the definition the grain blur took away. 0 leaves the softening in place with nothing countering it. The defaults are matched to the blur; pushing well beyond them sharpens more than was ever lost, which makes grain look crunchy rather than photographic.

## halation

Two separate things happen to bright light inside film. Some of it scatters sideways within the emulsion as it passes through. Some goes all the way through, reflects off the film base behind, and comes back -- which is what puts a reddish glow around very bright highlights. Both are simulated, and adjusted independently.

enable halation
: Switch both effects on.

### scatter

scatter amount
: How much light scatters sideways within the emulsion. 1.0 matches the film, 0 switches it off. This is a fraction of the light, so 1.0 -- all of it -- is genuinely the maximum, unlike _halation strength_ below.

scatter size
: How far it scatters. 1.0 matches the film and is the value the simulation normally works at. Above that the whole frame softens quickly, since the radius grows directly with the value. Drags to 1.5, right-click for more.

### halation

halation strength
: How strong the reflected glow is. 1.0 matches the chosen film, which means it looks very different from stock to stock: most modern colour negative film has a layer specifically to absorb this light and shows almost none, while film without one (a redscale-style stock, say) glows dramatically. That difference belongs to the real film, it is not an inconsistency. Drags to 2, right-click for up to 8.

halation size
: How far the glow spreads. 1.0 matches the film.

### threshold

highlight boost
: Rebuilds highlights that were clipped in the original file, so they can glow into the scatter, halation and diffusion effects instead of sitting flat. In EV; 0 switches it off. The boost applies over a fixed range, so it gives the same result regardless of image size, zoom level, or how the export was processed.

boost range
: How far down the tonal range the boost reaches. Lower keeps it to the very brightest areas; higher pulls more of the upper midtones into the glow.

boost protect
: Keeps everything below this many stops above mid-grey out of the boost entirely.

## diffusion

Simulates a diffusion filter -- the physical piece of glass a cinematographer puts in front of the lens to bloom highlights and take the edge off contrast. There are two here, at different points in the chain: one at the camera, one at the enlarger.

enable diffusion filter
: Switch on the camera-stage filter.

### film

diffusion filter type
: Which filter to imitate:
: - _black pro-mist_: a concentrated, punchy halo that keeps blacks deep.
: - _glimmerglass_: tight and subtle, preserving sharpness.
: - _pro-mist_: broader and more pastel, a softer atmospheric look.
: - _cinebloom_: a wide, slowly fading veil across the frame.

diffusion strength
: How much light is diverted into the halo. 0 switches it off. The halo is added on top of the unfiltered picture, so raising this lifts shadows and lowers contrast as well as making highlights glow.

diffusion size
: How far the halo spreads -- the same light carried further, rather than more of it. Use _diffusion strength_ for more.

diffusion halo warmth
: Warms (positive) or cools (negative) the outer halo, on top of whatever bias the chosen filter type already has.

### print

enable print diffusion
: A second, independent filter at the enlarger rather than the camera, diffusing the print instead of the exposure. Its controls work exactly like the ones above and are set separately: _print diffusion filter type_, _print diffusion strength_, _print diffusion size_, _print diffusion halo warmth_.

## scanner

How the finished print -- or the negative, in _scan the film_ mode -- is digitised, and the conditions it is looked at under. These act on the final image, after everything else.

### output

pre-compression boost
: Brightens the finished picture without flattening its highlights, because the film's own highlight rolloff is applied afterwards, so the image lifts instead of washing out. 1.0 leaves it alone. Since it acts right at the end, the colour picker reads the finished picture rather than the original: point it at a highlight area and it sets the boost so the brightest tone lands just short of where the rolloff takes over.

### sharpness

scanner blur
: Softening from the scanner's own optics, in pixels. 0 switches it off.

scanner sharpness
: How wide the scanner's sharpening reaches, in pixels.

scanner sharpen strength
: How strongly it sharpens. 0 switches it off -- worth doing if you would rather sharpen later with darktable's [_sharpen_](./sharpen.md) or [_diffuse or sharpen_](./diffuse.md) modules.

### glare

viewing glare
: A faint veil of room light reflecting off the print surface, as a percentage. Lifts the deepest blacks very slightly, the way a real print in a real room never quite reaches black. Does nothing while _scan the film_ is on, since there is no print surface.
