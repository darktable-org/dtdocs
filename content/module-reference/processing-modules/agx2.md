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

Transforms the colors and tonal range of an image to fit a display. Its primary innovation is an advanced color handling method that ensures a natural and film-like appearance, preventing the oversaturation artifacts common with simpler tone mapping techniques. It is derived from another module of the same name in [Blender 3D modeller](https://www.blender.org/) by T. J. Sobotka.

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
: Turns off all manipulation of primaries. It is not recommended to tick this checkbox for actual processing; it is intended as a learning tool for quick comparisons. For a neutral starting point that can be adjusted later, use the `unmodified` configuration from the list below.

load primaries
: Below _disable adjustments_ you can find a drop-down list and an _apply_ button. These can be used to load one of the built-in primaries configurations (`blender-like`, `smooth`, `unmodified`) without altering other settings of the module.

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

The plot of curve can be displayed by opening the _show curve_ collapsible section. In 2-tab mode, this is visible on the _settings_ page; in 3-curve mode, it is available on the _curve_ page. It can be a useful tool to learn about the behavior of the curve and the effect of related controls. The plot is not interactive; it simply illustrates the effect of the sliders.

The x-axis of the graph shows the selected input exposure range, measured in EV, with values relative to mid-gray; mid-gray is therefore at the 0 EV mark. The y-axis displays the linear output value, 18% indicating mid-gray. The scaling of the y-axis is not linear; horizontal grid lines help visualise the non-linearity. The degree of non-linearity is governed by a gamma value (default: 2.2). More information on the gamma is provided in the description of the _advanced curve parameters_.

The curve has 5 important points:
- The _black and white points_ are at the left and right edges of the graph, respectively; their final linear output values can be controlled by the _target black_ and _target white_ sliders.
- the _pivot_ is the point around which the curve is built, indicated by a dot. By default, it maps mid-gray to mid-gray. You may move this point to match your main subject using the provided picker.
- _toe and shoulder starting points_: These define where the curve transitions from a linear section to the compressed toe (shadows) and shoulder (highlights). By default, they are set to the pivot point.

show curve
: Expands or collapses the plot of the curve.

### basic curve parameters

This section is always available on the _settings_ page, and in 3-tab mode, it is also available on the _curve_ tab.

pivot input shift
: Shifts the input value of the pivot point. Since contrast is highest around the pivot, this slider allows you to choose at which part of the input tonal range you want to have the most contrast.

pivot target output
: Sets the target output luminance for the tone selected by the pivot's input. This adjusts the brightness of the pivot point.

A color picker, placed next to _pivot input shift_, is provided to pick an image area. The pivot x and y values will be adjusted so that the average value of the selected area is mapped to the current average output.

contrast around the pivot
: Sets the slope of the curve at the pivot point. This value is scaled internally to maintain a consistent final (linear) output contrast, compensating for changes to both the dynamic range and the `curve y gamma` setting.

toe power / shoulder power
: The word _toe_ refers to the lower bend of the curve (shadows), while the _shoulder_ is the higher bend (highlights). These sliders determine how gradually the contrast drops as the curve approaches black or white. Higher values result in a sharper bend, maintaining contrast for longer before a more abrupt roll-off. If the overall contrast is set too low, the curve may become "inverted," rendering these controls ineffective. Should this occur, a warning icon will appear next to the affected slider. Hovering over the warning provides a tooltip with suggested actions, and the affected part of the curve will be highlighted in yellow. This warning may be disabled by setting `plugins/darkroom/agx/enable_curve_warnings=FALSE` in `darktablerc`.

### advanced curve parameters

When in 2-tab mode, these controls appear on the _settings_ page. In 3-tab mode, they only appear on the _curve_ tab.

toe start
: Defines the point where the linear portion of the curve ends and the toe begins. Keeping the value at 0% allows the transition to start at the pivot; higher values push the transition point down towards the chosen _target black_. This may result in hard clipping, which can lead to a loss of detail in the shadows.

target black
: The lower bound that the curve converges to. This can be used to create a faded analog look, similar to the `offset` control in the _look_ section or the `global offset` in [_color balance rgb_](./color-balance-rgb.md).

shoulder start
: Defines the point where the linear portion of the curve ends and the shoulder begins. Keeping the value at 0% allows the transition to start at the pivot; higher values push the transition point up towards the chosen _target white_. This may result in hard clipping, which can lead to a loss of detail in the highlights.

target white
: The upper bound that the curve converges to. This can be used to limit the maximum output luminance.

keep the pivot on identity line
: Automatically adjusts _curve y gamma_ in an attempt to ensure the curve remains S-shaped, as long as the contrast setting is high enough. It works much like _auto adjust hardness_ in _filmic rgb_.

curve y gamma
: Shifts the representation of the pivot along the y-axis without changing its output luminance. This is an internal parameter of the algorithm and does not need to match your display's gamma. Its purpose is mainly to enable you to keep the S-shape of the curve, thereby ensuring the _shoulder_ and _toe power_ controls remain effective.

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
- If darktable is set to apply a scene-referred workflow, the module will apply reasonable defaults. In other cases (for example, when using the legacy display-referred workflow or if the workflow preference is set to 'none'), manually select the preset `blender-like|base` or `smooth|base` for best results. The `punchy` presets are more contrasty and colorful.
- Use the _auto tune levels_ picker to set the desired exposure range.
- If desired, set the pivot on the subject using the picker next to _pivot input shift_; this ensures contrast is maximized around the selected area.
- You may then move the _pivot target output_ slider to adjust the brightness of the pivot point.
- Set the contrast using _contrast around the pivot_.
- If needed, adjust _toe_ and _shoulder power_ to set contrast in shadows and highlights, respectively.
- Finally, if desired, add 'drama' by adjusting _look | power_, set overall saturation using _look | saturation_, and adjust colors using _look | preserve hue_.

# Further Reading
For a deep dive into the theory and development behind AgX, the primary resource is the discussion thread on Blender Artists: [Feedback & Development - Filmic - Baby Step to a v2](https://blenderartists.org/t/feedback-development-filmic-baby-step-to-a-v2/1361663/).