---
title: color harmonizer
id: color-harmonizer
weight: 10
---

The color harmonizer nudges hues — and optionally chroma — toward a selected color palette: a set
of geometrically related hue angles called *harmony nodes*. The goal is to reduce chromatic discord
in an image. Colors that are "off-palette" are gently pulled toward the nearest node; colors
already on a node are left unchanged. A per-node saturation multiplier can additionally boost or
reduce the colorfulness of colors near each node.

# module controls

harmony rule
: Select one of the harmony rules. All node positions are offsets from the anchor hue. Angles are in degrees.

    | Rule | Nodes | &nbsp; Node positions &nbsp; | Character |
    |------| :-------: |----------------|-----------|
    | **Monochromatic** | 1 | 0° | Single hue family |
    | **Analogous** | 3 | 0°, −30°, +30° | Adjacent neighbors; naturalistic, cohesive |
    | **Analogous complementary** | 4 | 0°, −30°, +30°, +180° | Analogous triad plus its opposite |
    | **Complementary** | 2 | 0°, +180° | Direct opposites; maximum contrast |
    | **Split complementary** | 3 | 0°, +150°, +210° | Anchor plus both neighbors of its complement |
    | **Dyad** | 2 | −30°, +30° | Anchor is symmetry axis, not a node |
    | **Triad** | 3 | 0°, +120°, +240° | Evenly spaced; balanced, colorful |
    | **Tetrad** | 4 | −30°, +30°, +150°, +210°  &nbsp;| Two dyad pairs; anchor is symmetry axis, not a node |
    | **Square** | 4 | 0°, +90°, +180°, +270° | Four equally spaced hues |
    | **Custom** | 2–4 | Freely placed | User-defined node positions |

    **Note on dyad and tetrad:** the anchor hue sets the symmetry axis of the pattern, not the position of a node. The palette is symmetric around the anchor. This matches the vectorscope harmony guide overlay.

![infer-from-image](./color-harmoinzer/infer-from-image.png#icon) infer from image *(standard modes only)*
: Analyses the preview image's chroma-weighted hue histogram and automatically selects the harmony
rule and anchor hue that best fit the image's existing color distribution — i.e. the combination
that already covers the most chromatic energy and therefore requires the least correction.

anchor hue
: The primary hue from which all node positions are derived (not shown in *custom* mode). Expressed
as a normalized value displayed in degrees. An eyedropper ![eye-dropper](./color-harmonizer/eye-dropper.png#icon)  is available to sample a color directly
from the image.
The color swatch strip below the slider shows the actual node colors for quick visual feedback.

vectorscope two-way sync
: When enabled (default), any change to the harmony rule, anchor hue, or custom node positions is
immediately reflected in the vectorscope harmony overlay, and changes made in the vectorscope are
reflected back in the module. Disable to make adjustments without disturbing the vectorscope
display.

![import-from-vectorscope](./color-harmonizer/import-from-vectorscope.png#icon) import from vectorscope *(standard modes only)*
: Imports the harmony rule and anchor hue currently configured in the vectorscope panel, then
switches the histogram panel to the vectorscope view.

    The algorithm:
    1. Builds a 360-bin hue histogram weighted by chroma (achromatic pixels are ignored).
    2. Smooths it with three passes of a circular box filter to suppress noise.
    3. Scores all 9 × 360 = 3,240 (rule, anchor) combinations at 1° resolution by computing what
       fraction of chromatic energy falls within the Gaussian attraction zones of each rule's nodes.
    4. Sets the rule and anchor hue to the combination with the highest coverage score.

    The result replaces the current rule and anchor. Use **pull strength** to control how strongly
    the remaining off-palette hues are then pulled toward the detected palette.

nodes *(custom mode only)*
: Number of active harmony nodes in custom mode (2–4). Only the first N node rows are shown and
active; the others are hidden.

node hue sliders *(custom mode only)*
: One row per active node. Each row shows a color swatch and a hue slider with an eyedropper. The
hue slider sets the node position on the hue wheel (0°–360°). Use the eyedropper to sample a
desired hue directly from the image.

## Effect controls

pull strength
: Global scale on the hue pull. At 0 nothing changes. At 1 the Gaussian proximity weight is the
only limit on how far each pixel moves. A pixel exactly on a node shifts by 0; a pixel at the
midpoint between two nodes is shifted by the Gaussian weight at that distance multiplied by its
angular gap to the nearest node.

    Note: pull strength scales the **hue** correction only. The saturation correction (per-node saturation multipliers) is applied independently, at full strength regardless of this slider.

pull width
: Scales the standard deviation σ of each node's Gaussian attraction zone. Range: 0.25–4.0.

- **< 1 (narrow):** the Gaussian decays quickly with distance; only hues very close to a node
  are attracted. The rest of the hue wheel is barely touched. Useful for images already close to
  harmonic, or when precise, surgical correction of specific hues is needed.
- **= 1 (default):** the Gaussian tapers to roughly 14 % at the midpoint between adjacent nodes —
  clean zone separation with smooth transitions.
- **> 1 (wide):** the Gaussian stays high across most of the hue circle; all pixels are
  attracted noticeably regardless of how far they are from a node. Useful for strongly discordant
  images or a painterly look.

    Increasing pull width never displaces pixels that are already exactly on a harmony node — their angular distance to the nearest node is zero, so their hue shift is always zero.

neutral color protection
: Shields low-chroma pixels from correction. The weight for each pixel is:

    ```
    chroma_weight = C / (C + t³ · 0.03)
    ```

    At C = 0 the weight is always zero regardless of the slider: fully achromatic pixels (pure
    grays) are never touched. As C grows, the weight approaches 1. The slider sets how aggressively
    low-chroma pixels are exempted: low values protect only near-absolute grays; high values extend
    protection to muted and pastel tones. Even at the maximum, vivid colors remain largely unaffected.

    Default: 0.50.

smoothing
: Applies a Gaussian blur to the correction maps (hue delta and saturation delta) before they are
applied to the image. This smooths the spatial transitions at zone boundaries — visible as subtle
colour steps in smooth gradients like skies or skin when adjacent regions fall in different
attraction zones.

    The blur sigma scales with both this slider and the current pull width: wider attraction zones
    span larger hue ranges and generate larger corrections, which can produce sharper spatial
    boundaries when pixels near each other fall on opposite sides of a zone midpoint.

    - **0 (default, off):** transitions are handled purely by the Gaussian interpolation in hue space.
      Maximum detail is preserved. Recommended for most uses.
    - **0.1–0.5:** subtle spatial averaging to reduce colour noise in smooth areas.
    - **> 1.0:** broad spatial blending; can create a painterly effect but may bleed corrections
      across image edges.

## Saturation section *(collapsible)*

One row per active harmony node. Each row shows a color swatch (the node's hue) and a saturation
multiplier slider.

node saturation sliders
: Saturation multiplier for colors near the corresponding harmony node.

    - **100 % (default):** chroma is unchanged.
    - **< 100 %:** desaturates colors near this node, proportionally to their Gaussian proximity.
    - **> 100 %:** boosts chroma near this node.

    The effect is weighted by the pixel's Gaussian proximity to the node (`w_nearest`) and further
    modulated by **neutral color protection** so near-achromatic pixels are spared. At the node itself
    (maximum weight) the chroma is multiplied by exactly the slider value.

---

## Usage guide

### Basic workflow

1. **Set the anchor hue.** Use the eyedropper to pick the dominant or most important color in
   the scene — a sky, a garment, a skin tone — or drag the slider manually while watching the
   swatch strip.

2. **Choose a harmony rule.** For portraiture, *complementary* (subject vs. background) or
   *analogous* (warm tones) are natural starting points. For landscapes, *triad* or *split
   complementary* often work well. Enable *vectorscope two-way sync* (under the harmony rule
   heading) to see the palette on the vectorscope while you choose.

3. **Raise pull strength slowly.** Start around 0.2–0.3. The effect is graduated; values
   above 0.6 are rarely needed for a convincing result.

4. **Adjust pull width if needed.** If many off-palette hues are not moving enough, widen the
   zones. If you want to correct only specific hue ranges without touching the rest, narrow them.

5. **Use neutral color protection to taste.** Raise it for images with many desaturated tones
   (architecture, faded film looks) to exempt pastels and muted tones from correction.

6. **Use the saturation section for palette polishing.** Once the hue pull is set, open the
   Saturation section to boost or calm chroma per node — e.g. boost the warm nodes and desaturate
   the cool ones for a cinematic split-tone look.

### Custom harmony mode

Use *custom* when none of the geometric rules match the image's intended palette.

1. Set the harmony rule to *custom*. The previous rule's node positions are copied as a starting
   point.
2. Use *nodes* to select how many palette targets you need (2–4).
3. Drag each node's hue slider or use its eyedropper to position nodes at the desired palette
   hues.
4. Raise pull strength to pull off-palette colors toward the custom nodes.

Custom nodes are synced to the vectorscope as free-floating angle markers (the vectorscope shows
no standard rule name for custom palettes).

### Working with the vectorscope

With *vectorscope two-way sync* enabled, the vectorscope overlays the harmony guide on the
image's color distribution. Colors inside the guide arcs are on-palette; colors outside are
being corrected. Use this to verify the pull is moving in the intended direction.

To start from a palette already set in the vectorscope panel, click the *import from vectorscope*
button (![import-from-vectorscope](./color-harmonizer/import-from-vectorscope.png#icon)).

### Interaction with blending

The module supports parametric and drawn masking. Common uses:

- Apply harmonization only to the background by masking out the subject.
- Use a luminance mask to restrict corrections to mid-tones.
- Reduce opacity as a global intensity control on top of pull strength.

### Typical parameter ranges

| Goal | Pull strength | Pull width | Neutral color protection |
|------|--------------|------------|-------------------------|
| Subtle finishing touch | 0.1–0.25 | 1.0–1.5 | 0.2–0.4 |
| Moderate creative grade | 0.3–0.5 | 1.5–2.5 | 0.2–0.5 |
| Aggressive stylization | 0.5–0.9 | 2.5–4.0 | 0.0–0.3 |
| Fix specific off-hues only | 0.4–0.8 | 0.25–0.7 | 0.2 |
