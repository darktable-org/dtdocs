---
title: retouch
id: retouch
applicable-version: 3.2.1
tags: 
working-color-space: rgb
view: darkroom
masking: 
---

Remove unwanted image elements by cloning, healing, blurring and filling using drawn shapes.

This module extends the capabilities of the [_spot removal_](./spot-removal.md) module by including a "heal" tool (based on the heal tool from GIMP) which provides a type of seamless cloning. It can also take advantage of [wavelet decomposition](../../darkroom/interacting-with-modules/wavelets.md), allowing the image to be separated into layers of varying detail (from coarse to fine). These layers can then be selectively retouched before being recombined to produce the output image. Examples of these capabilities are shown in the following sections.

# clone and heal

Cloning allows us to hide part of an image by replacing it with an area copied from another part of the image. For example, we may wish to get rid of a small cloud in a blue sky:

![retouch-original](./retouch/rt-original.png#w33)

The simplest way to do this is with the _basic cloning_ tool (![retouch-clone-icon](./retouch/rt-clone-icon.png#icon)) -- simply take a circle of blue sky next to the cloud, and use it to paint over the cloud we want to hide:

![retouch-clone](./retouch/rt-clone.png#w33)

However, if the sample we take doesn't precisely match the surroundings of the item we want to clone out, the result can look a bit jarring. In our example, the sample of sky we chose to use (the clone "source" patch) was slightly darker than the piece of sky we wanted to replace (the "target" patch):

![retouch-clone-nocontrol](./retouch/rt-clone-nocontrol.png#w33)

If we instead use the _heal_ tool (![retouch-heal-icon](./retouch/rt-heal-icon.png#icon)), the color and luma of the sample is blended to fit better with the surroundings. In our example, using _heal_ instead of _clone_ gives a much more uniform-looking result:

![retouch-heal-nocontrol](./retouch/rt-heal-nocontrol.png#w33)

# fill and blur

The _clone_ and _heal_ tools both require us to specify another part of the image, which is used to "fill in" the region we want to hide. Sometimes there is no suitable sample in the image that we can use to fill over the spot. In such cases, the _retouch_ module offers two further options:

![retouch-fill-icon](./retouch/rt-fill-icon.png#icon) fill tool
: This tool will fill in the selected region using a chosen color.

![retouch-blur-icon](./retouch/rt-blur-icon.png#icon) blur tool
: This tool applies a blur to the selected region, smoothing out any detail.

These two options are most useful when used together with wavelet decomposition, where they can be used to smooth over features within a selected detail layer.

# source and target shapes

When you activate the _clone_ or _heal_ tool, you will place one or more matching pairs of shapes on the image, each consisting of a target region to be repaired, and a source region to use to undertake that repair. You must first choose the shape you wish to use (you can choose from _circle_, _ellipse_, _path_ or _brush_ -- see the [drawn masks](../../darkroom/masking-and-blending/masks/drawn.md) section for details) and (except when using the path shape), an outline of the shape will appear under the cursor.

While you hover over the image with your mouse, a small plus sign (+) will be shown somewhere on the image, marking where the source shape will be placed by default. This plus sign will either be in a fixed position on the image or will move about with your cursor depending on whether the last pair of shapes was placed using absolute or relative mode (see below). 

![retouch-source-cross](./retouch/rt-source-cross.png)

The source and target shapes can be placed onto the image in the following ways:

- Click on the image to begin placing the target shape (see the [drawn masks](../../darkroom/masking-and-blending/masks/drawn.md) section for details on how to draw shapes). The source shape will be placed at the position of the "plus" (+) sign on the image and can be adjusted later.

- Shift+click to change the position of the source shape in "relative mode". The position of the "plus" (+) symbol will move to the clicked location. Then move the mouse and Click to begin placing the target shape. If you place subsequent shapes without changing the target location, the source shape will be placed at the same offset from the target shape as was used for the first stroke.

- Ctrl+Shift+click to change the position of the source shape in "absolute" mode. As above, the position of the "plus" (+) symbol will move to the clicked location and you can then place your target shape. If you place subsequent shapes without changing the target location, exactly the same source position will be used, fixed in the absolute coordinate system of the image.

- For _circle_ and _ellipse_ shapes only, you can simply click on the desired target location and then drag, releasing your mouse button when you reach the desired source location. This operation does not affect the placement of subsequent shapes.

The positions of the source and target shapes may then be altered manually.

# retouch with wavelet decomposition

Wavelets allow us to decompose an image into different layers with varying levels of detail, so that we can work on the layers independently and then recombine them at the end. This is particularly useful in portrait photography, where we are able to deal with skin blotches and blemishes on a coarse layer of detail, while leaving the skin texture in a finer layer of detail untouched. The [_wavelets_](../../darkroom/interacting-with-modules/wavelets.md) section provides an example of how wavelets decompose the image into detail layers.

Through this method, we could for example use the healing tool to paint over a spot that appears in one of the coarse detail layers, while leaving the whiskers in the fine detail layers intact:

![retouch-beard-preserve](./retouch/rt-beard-preserve.jpg#w50)

# module controls

![retouch-overview](./retouch/rt-overview.png#w33)

## retouch tools

The _retouch tools_ section consists of two items:

shapes
: The number after the _shapes_ label indicates how many shapes have been placed on the image, either directly or within a wavelet layer. 

: Click on one of the shape icons to draw a new shape on the image (see [drawn masks](../../darkroom/masking-and-blending/masks/drawn.md) for details). 

: Ctrl+click on a shape icon to draw multiple shapes continuously (right-click to cancel). 

: Click the _show and edit shapes_ button (![retouch-shapes-icon](./retouch/rt-shapes-icon.png#icon)) to show all existing shapes for the currently-selected wavelet scale (see below) and edit them.

algorithms
: Choose a retouching algorithm: clone, heal, fill or blur (see above for details).

## wavelet decompose

The _wavelet decompose_ section centres around a bar graph showing how the image has been decomposed into different detail (scale) layers. The key features of the bar graph are:

- The black square on the left represents the entire non-decomposed image.
- The grey squares show the various wavelet layers, with fine details to the left, and coarse details to the right.
- The white square on the right represents the residual image (the remainder of the image after the detail layers have been extracted).
- A light grey dot in a square indicates the currently-selected layer. Click on another square to select a different layer.
- The light grey bar running along the top indicates which levels of detail are visible at the current zoom level. Zoom in closer to see the finer levels of detail.
- The triangle at the bottom shows how many layers the image has been decomposed into. Drag the triangle to the right to create more layers. Drag it to the left to decrease the number of layers. By default no wavelet decomposition is performed.
- The triangle at the top shows the current value of the "merge from" parameter (see below)
- The orange lines under the squares indicate which layers have retouching edits applied.

The remaining items in this ection are:

scales
: Indicates how many detail layers the image has been decomposed into. Zero indicates that no wavelet decomposition has been performed.

current
: Indicates which layer is currently selected (also marked with the light grey dot on the bar graph).

merge from
: This setting allows a common edit to be applied to multiple consecutive scales within a group starting from the coarsest scale (not including the residual image) down to the scale selected. For example, if "merge from" is set to 3 and the maximum scale is 5 then all edits that are added to scale 5 will be applied to scales 3 to 5. Edits added to scale 4 will be applied to scales 3 and 4, and edits added to scale 3 will be applied only to scale 3. If you set _merge from_ to 0, then merging is disabled, and all edits apply only to the scale that are defined in. Setting _merge from_ to the highest scale (in this example, 5) would also effectively disable any merging.

```
           merge_from
               v
   0   1   2   3   4   5    scale
               <-------o    scale 5 edits
               <---o        scale 4 edits
               o            scale 3 edits
           o                scale 2 edits
       o                    scale 1 edits
```

![retouch-display-icon](./retouch/rt-display-icon.png#icon) display wavelet scale
: Toggles whether to display the currently-selected wavelet layer on the center image. Selecting this option brings up an additional control -- _preview single scale_.

preview single scale
: An additional control that allows the black, white and grey points of the wavelet scale preview to be adjusted to make it easier to see. Click the ![auto-levels-icon](./retouch/rt-auto-levels-icon.png#icon) to set them automatically. This does not affect the module's operation -- only the wavelet scale preview.

![retouch-cut-icon](./retouch/rt-cut-icon.png#icon) cut
: Place all shapes on the currently-selected layer onto the clipboard so they can be moved to another layer

![retouch-paste-icon](./retouch/rt-paste-icon.png#icon) paste
: Move the shapes on the clipboard to the currently-selected layer.

![retouch-hide-icon](./retouch/rt-hide-icon.png#icon) temporarily switch off shapes
: Toggle all shapes (whether on the current layer or not) on or off, so temporarily removing the module's effect.

![retouch-mask-icon](./retouch/rt-mask-icon.png#icon) display masks
: Show the target shapes associated with the currently-selected layer with a yellow overlay.


## shapes

This section allows you to modify settings related to the currently-selected shape:

shape selected
: Indicates which shape is currently selected, and what type of shape it is.

fill mode
: If the _fill_ algorithm has been selected for the currently-selected shape, choose whether to "erase" or fill the selected shape with a chosen "color".

fill color
: If a _fill mode_ of "color" has been selected, choose which color to fill the shape with. You can click to select or enter a custom rgb value or use the color picker to take a sample from the image.

brightness
: If a _fill_ algorithm has been selected, fine-tune the color's brightness. This slider also works in "erase" mode.

blur type
: If the _blur_ algorithm has been selected for the currently-selected shape, choose whether to use a "gaussian" or "bilateral" blur.

blur radius
: If the _blur_ algorithm has been selected for the currently-selected shape, choose the radius of the blur.

mask opacity
: Alter the opacity of the mask associated with the currently-selected shape. An opacity of 1.000 indicates the shape is completely opaque and the module's effect is fully applied, whereas a value less than 1.000 indicates that the effect applied by the shape is blended with the underlying image to the degree indicated by the slider.

