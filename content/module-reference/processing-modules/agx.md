---
title: agx
id: agx
weight: 10
applicable-version: 5.4
tags:
working-color-space: RGB
view: darkroom
masking: true
---

Transforms the colors and tonal range of an image to fit a display. Its primary innovation is an advanced color handling method that ensures a natural and film-like appearance, preventing the oversaturation artifacts common with simpler tone mapping techniques. It is derived from the display transform of the same name, used in the [Blender 3D modeller](https://www.blender.org/) by T. J. Sobotka, Eary_Chow, Sakari Kapanen and others.

---

**Note**: Modules placed before agx in the pipeline operate in [scene-referred](../../../darkroom/pixelpipe/the-pixelpipe-and-module-order.md/#scene-referred-workflow) space. Modules after agx work in [display-referred](../../../darkroom/pixelpipe/the-pixelpipe-and-module-order.md/#display-referred-workflow) space.

---

# usage

Please take note of the following guidelines while using this module within your workflow:

only use one display transform
: Never use _agx_ together with another display transform module (i.e. [_sigmoid_](./sigmoid.md), [_filmic rgb_](./filmic-rgb.md) or [_base curve_](./base-curve.md)).

adjust for the mid-tones first
: By default, the module preserves middle gray. Before using _agx_, you should first use the [_exposure_](./exposure.md) module to adjust the mid-tones to your liking.

usage guidelines
: To help you navigate the module, some practical advice is provided after a description of the controls.

# module controls

The module's controls are divided into four categories, presented in order of importance to the AgX process:
- Color-related controls (the primaries)
- Tone mapping controls (input range and the curve)
- Post tone-mapping adjustments ('look')

Due to the high number of controls, related controls are often grouped together in collapsible sections, and the controls are distributed between either two or three tabs.

The tabs are:
- settings
- curve (if enabled)
- primaries.

First, the contents of the various tabs are listed (note that some controls may appear at different places, depending on the choice of 2 or 3-tab mode). Then, each control will be described in detail.

# tabs

## _settings_

The _settings_ tab holds the most often-used controls:

- the _input exposure range_ section
- the collapsible curve plot (in 2-tab mode)
- the _basic curve parameters_
- the collapsible _advanced curve parameters_ section (in 2-tab mode)
- the _look_ section

## _curve_

Controls on the _curve_ tab:

- the collapsible curve plot (moved from the _settings_ tab)
- the _basic curve parameters_ (also visible on the _settings_ tab, repeated here for convenience)
- the collapsible _advanced curve parameters_ section (moved from the _settings_ tab)

The _curve_ tab is only visible in 3-tab mode, controlled via the `plugins/darkroom/agx/enable_curve_tab` variable in `darktablerc`. If the variable is set to `TRUE`, the curve plot and the advanced parameters are removed from the _settings_ tab, and can be accessed via the _curve_ tab, saving vertical space. When set to `FALSE`, all curve controls appear on the _settings_ tab. The setting is intended to be used with lower-resolution displays, to avoid the need to scroll the module.

## _primaries_

This tab holds controls similar to, but more extensive than, the [_sigmoid_](./sigmoid.md) module's _primaries_ collapsible section:

- _disable adjustments_ checkbox
- preset selector
- base color space selector
- attenuation and rotation sliders for preprocessing before tone mapping
- attenuation and rotation reversal sliders for postprocessing after tone mapping

# controls

## The primaries

These controls are the defining feature of AgX and the core of how it handles color. They determine the basic color appearance of the image *before* the tone mapping curve is applied. For precise definitions of the color terms used in this section, please refer to [_darktable's color dimensions_](./color-dimensions.md).

### A bit of background

The core challenge in fitting a scene's wide range of light into a display's limited range is managing color across the entire tonal scale. A simple per-channel curve often causes colorful objects to shift to pure, unnatural-looking primary or secondary colors as their intensity changes—an effect sometimes called the 'Notorious 6'.

The primaries controls in AgX work to prevent this by building a custom color space for the tone curve. By adjusting the primaries *before* the curve is applied, AgX creates a more graceful "path to white," allowing colors to desaturate and shift hue in a way that looks more natural and believable. This process influences the color rendering across the entire tonal range to create a cohesive final image.

disable adjustments
: Turns off all manipulation of primaries. It is not recommended to tick this checkbox for actual processing; it is intended as a learning tool for quick comparisons. For a starting point without adjustments, that can be fine-tuned manually, use the _unmodified_ configuration.

reset primaries
: Clicking this button reveals a pop-up menu to apply one of the built-in set of primaries, without altering any of the other settings. Click an item to select it, or press Escape or click outside the menu to dismiss it without applying any setting.

base primaries
: Defines which color space is used as the basis of the AgX processing space. The attenuation and rotation controls below are applied relative to this space. Options include common spaces like sRGB, Display P3, Adobe RGB (compatible), and Rec2020; the working space (set in the [_input color profile_](./input-color-profile.md) module), and the export space (set in the [_output color profile_](./output-color-profile.md) module). For especially problematic colors, you may find that wider spaces provide better control.

### before tone mapping

The controls in this group affect the operations performed before the tone mapping curve is applied.

red/green/blue attenuation
: Controls the amount of desaturation applied to the primary color. This adjusts the rate of the color's shift towards white as its intensity increases. Lower values result in a slower shift and more pronounced hue changes, at the risk of artifacts.

red/green/blue rotation
: Rotates the hue angle of the primary color. This affects the direction of the hue shift for colors as their intensity changes. For example, rotating red can influence whether it bends towards yellow or magenta.

### after tone mapping

The controls in this group affect the post-processing done after tone mapping. Use them as artistic controls to help you achieve the desired final look.

reverse all
: Ticking this checkbox will hide the other controls in the group, and adjust processing settings as if the _master_ slider were set to 100%, the _purity boost_ parameters to match the values of the corresponding _attenuation_ sliders, and the _reverse rotation_ parameters to mirror the values set with the _rotation_ sliders. The values of the hidden sliders will be retained, but not used for processing. Unchecking the checkbox will make them visible, and their settings effective, again.
The checkbox is intended to simplify the user interface (users may wish to create presets with the checkbox ticked), and for quick 'what-if' checks.

set from above
: Clicking the button will _copy_ the values of the sliders from the _before tone mapping_ section, and set the _master_ controls to 100%, producing the same visual effect as ticking _reverse all_. However, this only provides a starting point: the sliders will not be hidden, and may be adjusted to taste.

master purity boost, master rotation reversal
: These are multipliers that affect the individual red/green/blue controls below, allowing you to globally increase or decrease their effect.

red/green/blue purity boost
: Restores color purity *after* the tone curve is applied. Higher values make the image look more colorful and chroma-laden, but can introduce artifacts if pushed too far.

red/green/blue reverse rotation
: Reverses the initial primary rotation after the tone curve. This offers a final creative control over the rendered hues.

## The _input exposure range_

Provides controls similar to the [_filmic rgb_](./filmic-rgb.md) module, allowing you to set the black and white point. Any channel value lower than the selected _black relative exposure_ will be clipped to 0; any above the selected _white relative exposure_ will be clipped to 1. Due to implementation differences, the values will be similar to, but not identical with, the values _filmic rgb_ would pick.

Color pickers are provided to quickly pick the black or white point (_black_ and _white relative exposure_), or both (_auto tune levels_). A safety margin can be applied via the _dynamic range scaling_ slider: contrast at the ends of the dynamic range is more easily controlled via the _toe_ and _shoulder_ controls described below.

The selected exposure range will then be used as the input range of a logarithmic tone mapping operation, which then provides data that is further processed by the curve.

## The curve

The plot of curve can be displayed by opening the _show curve_ collapsible section. In 2-tab mode, this is visible on the _settings_ page; in 3-tab mode, it is available on the _curve_ page. It can be a useful tool to learn about the behavior of the curve and the effect of related controls. The plot is not interactive; it simply illustrates the effect of the sliders.

The x-axis of the graph shows the selected input exposure range, measured in EV, with values relative to mid-gray; mid-gray is therefore at the 0 EV mark. The y-axis displays the linear output value, 18% indicating mid-gray. The scaling of the y-axis is not linear; horizontal grid lines help visualise the non-linearity. The degree of non-linearity is governed by a gamma value (default: 2.2). More information on the gamma is provided in the description of the _advanced curve parameters_.

The curve has 5 important points:
- The _black and white points_ are at the left and right edges of the graph, respectively; their final linear output values can be controlled by the _target black_ and _target white_ sliders.
- the _pivot_ is the point around which the curve is built, indicated by a dot. By default, it maps mid-gray to mid-gray. You may move this point to match your main subject using the provided picker.
- _toe and shoulder starting points_: These define where the curve transitions from a linear section to the compressed toe (shadows) and shoulder (highlights). By default, they are set to the pivot point.

show curve
: Expands or collapses the plot of the curve. It is recommended to expand this section while getting familiar with the curve, or when investigating issues like loss of detail or curve 'inversion' (documented under _toe power / shoulder power_).

### basic curve parameters

This section is always available on the _settings_ page, and in 3-tab mode, it is also available on the _curve_ tab.

pivot input shift and pivot target output
: The pivot is the point on the curve around which contrast is adjusted. There are two controls:

  - The point of the input tonal range at which contrast will be highest, controlled by _pivot input shift_.
  - The output value (power) of the pivot point.

**pivot input shift**: shifts the input value of the pivot point, relative to mid-gray. Since contrast is highest around the pivot, this slider allows you to choose at which part of the input tonal range you want to have the most contrast. As an example: a setting of 10% would move the pivot 10% of the way between mid-gray and the selected relative white exposure (the right edge of the graph), while -10% would move it 10% the way towards black (the left edge). Depending on the relative black/white exposure settings, the two will usually not mean the same amount of displacement. By default, the value is soft-limited to +/- 50%, but other values can be entered manually, see [sliders](../../darkroom/processing-modules/module-controls.md/#sliders).

**pivot target output**: sets the target output linear value (power) for the tone selected by the pivot's input. The value is indicated on the y-axis. Note that the scale of the y-axis is not uniform, and depends on the _curve y gamma_, described in the section [advanced curve parameters](#advanced-curve-parameters).

A **color picker**, placed next to _pivot input shift_, is provided to pick an image area. The _pivot input shift_ and _pivot target output_ values will be adjusted so that the average value of the selected area is mapped to the current average output, avoiding major shifts in brightness.

contrast around the pivot
: Sets the slope of the curve at the pivot point. This value is scaled internally to maintain a consistent final (linear) output contrast, compensating for changes to both the dynamic range and the _curve y gamma_ setting.

toe power / shoulder power
: The word _toe_ refers to the lower bend of the curve (shadows), while the _shoulder_ is the higher bend (highlights). These sliders determine how gradually the contrast drops as the curve approaches black or white. Higher values result in a sharper bend, maintaining contrast for longer before a more abrupt roll-off. If the overall contrast is set too low, the curve may become "inverted," rendering these controls ineffective. Should this occur, a warning icon will appear next to the affected slider. Hovering over the warning provides a tooltip with suggested actions, and, if the _show curve_ section is expanded, the affected part of the curve will be highlighted in yellow. This warning may be disabled by setting `plugins/darkroom/agx/enable_curve_warnings=FALSE` in `darktablerc`.

### advanced curve parameters

When in 2-tab mode, these controls appear on the _settings_ page. In 3-tab mode, they only appear on the _curve_ tab.

toe start
: Defines the point where the linear portion of the curve ends and the toe begins. Keeping the value at 0% allows the smooth transition to start at the pivot; higher values push the transition point down towards the chosen _target black_. This may result in hard clipping, which can lead to a loss of detail in the shadows.

target black
: The lower bound that the curve converges to. This can be used to create a faded analog look, similar to the _offset_ control in the _look_ section or the _global offset_ in [_color balance rgb_](./color-balance-rgb.md).

shoulder start
: Defines the point where the linear portion of the curve ends and the shoulder begins. Keeping the value at 0% allows the smooth transition to start at the pivot; higher values push the transition point up towards the chosen _target white_. This may result in hard clipping, which can lead to a loss of detail in the highlights.

target white
: The upper bound that the curve converges to. This can be used to limit the maximum output luminance.

keep the pivot on the diagonal
: Automatically adjusts _curve y gamma_ in an attempt to ensure the curve remains S-shaped, as long as the contrast setting is high enough. It works much like _auto adjust hardness_ in _filmic rgb_. While the checkbox is ticked, _curve y gamma_ cannot be adjusted manually.

curve y gamma
: Shifts the representation of the pivot along the y-axis without changing its output luminance. This is an internal parameter of the algorithm and does not need to match your display's gamma. Its purpose is mainly to enable you to keep the S-shape of the curve, thereby ensuring the _shoulder_ and _toe power_ controls remain effective. Manual adjustments are disabled while _keep the pivot on the diagonal_ is enabled. 

## The _look_ section

These controls allow post-processing after the tone mapping operation. Since they are applied after the tone mapping, they are _display-referred_ operations, and can result in clipping. Use them carefully.

By default, the _look_ controls are placed inside a collapsible section. If you desire to keep them visible at all times, you can set `plugins/darkroom/agx/look_always_visible=TRUE` in `darktablerc`.

slope
: Multiplies the output values by this factor. Black (a value of 0) is not affected. Values above 1 brighten the image and increase contrast; those below darken the image and reduce contrast.

offset
: Shifts values up or down. Only blacks are fully affected, with the effect gradually reduced for brighter tones; whites are not affected if _slope_ is at its default value of 1. Negative values crush shadows; positive values can produce a faded look.

power
: Applies a power function (gamma adjustment) to the image. The black and white points are not affected. Values above 1 will darken the mid-tones and compress shadows; values below 1 will raise the mid-tones, opening up shadows.

saturation
: Controls color intensity by adjusting the image's chroma. For a precise definition of chroma vs. saturation, please see [_darktable's color dimensions_](./color-dimensions.md). Zero turns the image black-and-white.

preserve hue
: At a value of 0%, the output colors are based solely on the AgX algorithm. By raising this slider, the original input hues can be partially or fully restored.

# guidelines

Note that unless [high quality processing](../utility-modules/darkroom/high-quality-processing.md) is enabled, the effect of adjusting the primaries cannot be judged properly, especially with highly saturated colors and narrow-spectrum light sources like LEDs.

## Recommended workflow

- Set overall exposure for the mid-tones using the _exposure_ module.
- If darktable is set to apply a scene-referred workflow, the module will apply reasonable defaults. In other cases (for example, when using the legacy display-referred workflow or if the workflow preference is set to 'none'), manually select the preset _blender-like|base_ or _smooth|base_ for best results. The _punchy_ presets are more contrasty and colorful.
- Use the _auto tune levels_ picker to set the desired exposure range.
- If desired, set the pivot on the subject using the picker next to _pivot input shift_; this ensures contrast is maximized around the selected area.
- You may then move the _pivot target output_ slider to adjust the brightness of the pivot point.
- Set the contrast using _contrast around the pivot_.
- If needed, adjust _toe_ and _shoulder power_ to set contrast in shadows and highlights, respectively.
- Finally, if desired, add 'drama' by adjusting _look | power_, set overall saturation using _look | saturation_, and adjust colors using _look | preserve hue_.

# Internal processing workflow
The following is a detailed description of the steps taken when processing with the _agx_ module. Reading this section is not required to use the module; it is provided as a reference for interested readers.

- linear, scene-referred data arrives in the pipe's working space, defined in the _input color profile_ module (e.g. Rec 2020)
- if needed, it is converted to the selected 'base' space
- colors that are out-of-gamut for the 'base' space (RGB triplets that have any negative component in that space) are 'slid' into gamut (in-gamut colors are not modified; it is possible that a previously out-of-gamut color 'lands on top' of an in-gamut color). _sigmoid_ performs a similar operation, but the method is different.
- an input matrix is calculated and applied, based on the RGB attenuation and primaries rotation values: this desaturates the colors (mixing channels into each-other), and rotates the primaries. This is the same as with _sigmoid_.
- the HSV representation is calculated from the inset+rotated RGB; the hue (H) will be used later to restore the hue according to the _look / preserve hue_ slider.
- for each component (RGB channel), the same processing steps are executed independently (but, since the desaturation (primaries attenuation) mixes channels into each-other, this means that with respect to the original color, the processing is not independent at all):
    - log encoding is applied: for input x, log2(x) is calculated (_x_ would be the value of the red, green or blue channel)
    - the log value is scaled and shifted according to the selected exposure parameters, so the selected black point becomes 0, the white point 1, and the value corresponding to mid-gray (18%) ends up on the x-axis of the curve in a ratio _black relative exposure : _white relative exposure_ (by default, 10 : 6.5, or at about 0.61)
    - the curve is applied; this produces and output that is considered to be encoded according to the 'gamma'. This can be considered as data ready to be displayed on a monitor using the specified gamma value (the gamma is only used for processing, and does not have to match the gamma of the display used for editing, or that of the output color space).
    - the 'look' is applied in pure display-referred mode, like legacy editing of gamma-encoded images, similar to editing sRGB JPGs in traditional editors:
        - first the slope and the offset
        - then the power
        - finally the saturation
    - the gamma-encoded data is linearised by applying linear = gamma_encoded ^ gamma (so it is scene-referred 0..1, but the encoding is linear, like always in darktable's pipeline; mid-gray is at 0.18)
    - the HSV representation of the result is calculated; the resulting hue (from the H component) and the original hue are mixed together according to the _preserve hue_ setting to produce the final hue. This does not guarantee complete preservation of color, as the 'original' hue was already recorded after the input matrix, and after this mix, the output matrix (see below) modifies colors again
    - the output matrix is applied, which:
        - performs the rotation reversal (this is a difference with _sigmoid_: the latter always completely reverses the rotation, in _agx_, reversal is up to the user)
        - applies the purity boost (just like _sigmoid_)
        - converts the result back into the pipe working space.

# Further Reading
For a deep dive into the theory and development behind AgX, the primary resource is the discussion thread on Blender Artists: [Feedback & Development - Filmic - Baby Step to a v2](https://blenderartists.org/t/feedback-development-filmic-baby-step-to-a-v2/1361663/).
