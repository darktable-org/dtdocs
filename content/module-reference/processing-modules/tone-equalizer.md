---
title: tone equalizer
id: tone-equalizer
applicable-verison: 3.4
tags: 
working-color-space: RGB
view: darkroom
masking: true
---

Perform dodging and burning on an image while preserving local contrast.

This module can selectively brighten or darken up to 9 different ranges of luminosity. When used together with [_filmic rgb_](./filmic-rgb.md), it replaces the need for other tone-mapping modules such as the [_base curve_](./base-curve.md), [_shadows and highlights_](./shadows-and-highlights.md), [_tone curve_](./tone-curve.md) and [_zone system_](./zone-system.md) modules. It works in linear RGB space and uses a mask to guide the dodging and burning adjustments, helping to preserve local contrast within the image.

In order to understand how the tone equalizer works, please refer to the following diagram and subsequent explanation:

![tone-equalizer-mask](./tone-equalizer/tone-equalizer-overview.png#w100)

1. Produce a monochrome mask which divides the input image into regions of similar luminosity. The resulting mask should blur the fine details within the image so that pixels within that region are all treated similarly. This will help to preserve local contrast.

2. Once the mask is defined, the sliders (in the simple tab) or the equalizer graph (in the advanced tab) can be adjusted to increase or decrease the brightness of the image, based on the brightness of the mask. That is, the horizonal axis of the equalizer graph corresponds to the brightness level of the mask, and the vertical axis specifies the exposure adjustment that will be be made to pixels where the mask matches that brightness level.

3. The exposure of each pixel of the input image is adjusted using the mask and the equalizer graph. For each pixel, the module looks up the brightness of the mask, finds the matching brightness on the horizontal axis of the equalizer graph and increases or decreases the exposure accordingly (using the vertical axis of the graph). 

It is important when using the tone equalizer that the mask divides your image up into different regions of similar brightness, and that a suitable amount of blur is applied within those regions. This means that all of the pixels in each region will have a similar adjustment to their exposure, without adversely affecting local contrast. Examine your image beforehand to identify which regions you wish to dodge and burn, and use the controls on the _masking tab_ to ensure that those areas are reasonably separated in tone in the final mask. This will allow those regions to be adjusted independently of one another.

# module controls

The controls of the _tone equalizer_ module are spread across 3 tabs. It is also possible to adjust the exposure levels when hovering the mouse cursor over different parts of the preview image.

The following control is provided in all three tabs:

display exposure mask
: `Click` on the icon to the right of this label to show/hide the module's guided mask over the top of the image.

## simple

This tab provides a set of sliders that control how the module affects the pixels falling under 9 different mask intensity levels. This is a simplified interface and is used to generate the tone adjustment curve, which is more fully illustrated in the _advanced_ tab.

`-8 EV` through to `0 EV`
: Each of these sliders will adjust the brightness of all pixels having that intensity level _in the guided mask_. Sliders towards the top will generally affect the shadows of the image, whereas sliders towards the bottom will generally affect the highlights of the image, assuming the mask's histogram is nicely spread over the entire tonal range (you can check this by referring to the histogram image shown on the _advanced_ tab). 

## advanced

This tab allows you to control the same intensity levels as in the basic tab, though here they are represented as control points on a curve. Behind the curve is a histogram representing the intensity levels of the **_mask_** (not of the input or output image). If the histogram is too bunched up, it means your mask doesn't have a good spread of intensity levels, which makes it harder to independently control the brightness of different parts of your image. It is therefore recommended that the histogram is adjusted so that it extends the entire range, and covers as many control points as possible, thereby providing you with maximum flexibility. You can adjust the mask using the controls in the _masking_ tab.

control points on the curve
: `Click+drag` the control points on the tone equalizer curve up or down to adjust the brightness of all pixels that are classified under that mask intensity level. Control points to the left will normally affect the shadows, and control points to the right will normally affect the highlights, assuming you have a nice spread of the mask histogram. Moving one control point will generally affect control points on either side to ensure the curve remains smooth.

curve smoothing
: Moving this control to the right will cause the transitions between the control points to become more gradual. However, going past about 0.6 can introduce some instability in the curve, causing oscillations due to the mathematical constraints on the curve. Moving this slider to the left will result in a better behaved curve, but it may result in harsher tone transitions that may damage local contrast.

## masking

This tab contains all of the controls required to set up the guided mask. The purpose of the mask is to mark out areas in your image with different tonal ranges so that these areas can be independently brightened or darkened by the tone equalizer. The masking filters are designed to allow sharp edges between these areas to be preserved, while blurring details within a particular tonal range so that the brightness can be adjusted without adversely impacting local contrast. Ideally you want the mask histogram shown in the _advanced_ tab to be nicely spread out across all the control points. 

To avoid having to switch back and forth between the _advanced_ tab and the _masking_ tab, under the "mask post processing" label there is a grey bar which shows a representation of the middle 80% of the histogram. By using the controls mentioned below to centre and spread out this grey bar, you can then expect to have a nicely shaped histogram when you return to the "advanced" tab. If you see orange at either end of the grey bar, it means too much of the histogram has moved off the edge of the screen, and you need to bring it back to centre and/or compress it a bit more.

![tone-equalizer-mask-histogram](./tone-equalizer/tone-equalizer-mask-histogram.png)

When setting up the mask, there are a number of trade-offs to be made to balance the blurring within tonal regions against the preservation of boundaries between these regions.

Often the key controls requiring adjustment are the _exposure/contrast compensation_ sliders at the bottom of the module.

The controls on the masking tab allow you to ensure that the mask properly covers the required range of tones. They also allow you to strike a balance between obtaining a smooth blur that preserves local contrast and creating more or less well defined edges between the different regions as required. Having this mask displayed while making these adjustments will assist in understanding the parameters that follow.

luminence estimator
: Choose the method by which the luminence of a pixel will be estimated when mapping it to a mask intensity value (default _RGB euclidean norm_).

preserve details
: Choose the smoothing algorithm to use when blurring the mask. An exposure independent guided filter will be used by default, which is effective at preserving strong edges while avoiding gradient reversals that result in artifacts like halos. 
 - _no:_ Do not smooth the mask (effect is the same as using normal tone curves). When the module is used to compress dynamic range, the use of this option can cause compression of local contrast. It can be useful when increasing (local and global) contrast.
 - _guided filter:_ Use the original guided filter algorithm to blur the mask while attempting to preserve edges. One of the limitations of this algorithm is that the guided filter is exposure-sensitive, meaning that shadows will experience a lot more blurring than the highlights. Note that this limitation can be an asset sometimes: if one wants to lighten shadows a lot, the guided filter can provide very good local contrast preservation.
 - _average guided filter:_ Use this option in cases where the effect of the guided filter is too strong. In this mode, a geometric mean is taken between the output of the original _guided filter_ algorithm and the output that is given by the _no_ option. 
 - _eigf (default):_ The _exposure independent guided filter_ solves the problem of the original _guided filter_, in that it makes the degree of blurring independent of the exposure. This means the degree of blurring applied to the highlights and the shadows regions should be about the same. This improved algorithm is now the default option.
 - _averaged eigf:_ This option takes the geometric mean between the _eigf_ mask and the mask generated by the _no_ option, and is useful in cases where the degree of blurring in the mask needs to be mitigated.

filter diffusion
: By default this is set to a value of `1`, meaning that the filtering algorithm is run once on the input image in order to produce the blurred monochrome mask.

: If you increase this to 2, the filtering algorithm will be run once on the input image to produce an intermediate mask, and will then be applied a second time on the intermediate mask to produce the final mask. As a result, the final mask will be more blurred than when using a single iteration. Progressively higher values will diffuse the mask even further, however because the mask filtering algorithm is run multiple times, it will cost more in terms of processing time.

smoothing diameter
: This controls how much of the surrounding image to take into account when calculating the mask's blur at a particular point, defined as a percentage of the length of the longer side of the image (default 5%). With lower values, the transition between darker and lighter areas of the mask will be more pronounced. As this value is increased, those transitions become smoother/softer. For the default exposure-independent guided filter (EIGF), you should typically use blurring radii around 1-10%. With the original guided filter, blurring radii around 1-25% will typically yield better results.

edges refinement/feathering
: Higher values will force the mask to follow high contrast edges more closely. Lower values will give smoother gradients, but may introduce some halos. If needed, feathering can be set to values as high as 10000.

mask post-processing
: As discussed above, this provides a representation of the span of the histogram. It covers the middle 80% of the histogram, dropping the first and last decile to prevent outliers from skewing the indicator too much.

mask quantisation
: This slider applies some degree of posterisation to the mask, so that the mask will tend to centre round a few discrete levels. In some cases, this may be useful to help separate out areas of your image into different masking levels.

mask exposure compensation
: Adjust the histogram to the left or right. Often if you have used the _exposure_ module earlier in your pixel pipeline to adjust the image brightness, you'll need to offset that adjustment by using this exposure compensation slider to re-centre the mask's histogram. `Click` on the eyedropper icon to the right of the slider to set the exposure compensation such that the average of the mask's histogram will coincide with the central `-4EV` control point. The slider can then be fine tuned as required.

mask contrast compensation
: Spread out (dilate) or compress the histogram as needed. The auto-adjust eyedropper icon to the right of the slider will propose a reasonable starting point, which can then be fine-tuned to optimize the spread of the histogram under the tone equalizer control points.

## cursor indicator/control
When the _tone equalizer_ module is selected, moving the mouse pointer over the preview image reveals a cursor that displays information about the pixel under the mouse pointer. When this cursor is shown, the mouse wheel can be used to brighten or darken areas of your image that match the mask intensity level at that point. This provides a convenient way to quickly brighten or darken specific parts of the image.

![tone-equalizer-simple](./tone-equalizer/tone-equalizer-cursor.png#w25)

- cross hairs indicate the pixel for which information is being displayed
- the text label shows the intensity of the mask at that point, in EV.
- the shade of the larger grey circle provides a visual indication of the intensity of the mask at that point
- if the tone equalizer is going to brighten or darken pixels matching this mask intensity, the magnitude of this adjustment is indicated by an arc around the outside of the large circle. The longer the arc, the greater the brightness adjustment,
- if there has been an exposure adjustment, the shade of the smaller inner circle indicates the amount of brightening or darkening, relative to the mask intensity indicated by the outer grey circle. That is to say, if the pixel under the crosshairs will be brightened, the inner circle will be a lighter shade of grey than the larger circle; if the pixel is to be darkened, the inner circle will be a darker shade of grey than the outer circle.

## presets
The _tone equalizer_ comes with several presets that can use used to compress shadows and highlights. Each comes in two variants, using either the guided filter (gf) or the exposure independent guided filter (eigf). The variants using the guided filter tend to preserve local contrast in the shadows better those that use the exposure independent guided filter, but at the price of reducing the local contrast in the highlights. Depending on your photo, either of these variants may lead to better results. In both cases, the presets preserve middle-grey so that you don't have to adjust the global exposure before and after activating the tone equalizer.

