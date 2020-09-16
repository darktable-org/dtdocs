---
title: Masks
id: masks
weight: 30
draft: false
---

Masks allow you to limit the effect of a module so that it only applies to certain parts of the image. 

A mask can be regarded as a grayscale image where each pixel has a value between 0 and 1.0 (or between 0% and 100%). This value is used to determine how much a module affects each pixel.

The following sections explain how to construct masks in darktable.

# Drawn Masks

With the drawn mask feature you can construct a mask by drawing shapes directly onto the image. Shapes can be used alone or in combination. Once a shape has been drawn on an image it can be adjusted, removed, or reused in other modules.

Shapes are stored internally as vector graphics and are rendered with the required resolution during pixelpipe processing. Shapes are expressed in the coordinate system of the original image and are transformed along with the rest of the image by any active distorting modules in the pipe (_lens correction_, _crop & rotate_ for example). This way a shape will always work on the same image area regardless of any modifications that may be subsequently applied.  Please note that this distorting effect may cause straight lines in your mask to appear curved when the _lens correction_ module is active.

The controls required to draw and alter masks may be enabled by selecting the "drawn mask" or "drawn & parametric mask" icon at the bottom of a module.

## Creating Shapes

Choose a shape by clicking on the appropriate shape icon.

**IMAGE HERE**

This will take you into the creation mode for that shape - see subsequent sections for details of the available shapes. Once you have finished drawing your shape you will automatically be taken into the edit mode. 

_Ctrl+click_ on the shape icon to continuously draw multiple similar shapes. In this mode, _right-click_ to stop drawing shapes and enter edit mode.

For all drawn shapes, _Shift+scroll_ changes the shape's feathering (the blur at the edge of the shape) and _Ctrl+scroll_ changes the shape's opacity (how transparent it is). These operations are available in both creation and edit modes.

_Note: The preceding scroll operations will also cause the **default** feathering or opacity to be changed when used in shape creation mode. These values are used again when you place the next shape._

## Editing Shapes

Click on the 'show and edit mask elements' icon to enter shape edit mode. This will show all drawn masks used by the current module and allow you to edit those shapes. _Ctrl+click_ on the same icon to enter restricted edit mode, where certain actions (e.g. dragging a complete shape or changing its size) are blocked. This is particularly useful when altering path and brush shapes (see below).

While in edit mode you can right-click on a shape to remove it.

## Reusing Shapes

You can reuse shapes that you have drawn in other modules. Click on the shapes drop-down to choose previously-drawn shapes individually or to use the same group of shapes as used in another module.

## Combining and Managing Shapes

The _mask manager_ utility module can be used to manage your drawn shapes. This module also allows you to group and combine drawn masks using set operators (union, intersection, difference, exclusion).

## Reversing the Polarity of a Drawn Mask 

Click on the "+/-" button to reverse the polarity of the entire drawn mask. For example, a circular mask will, by default, cause the module to be applied only to the area inside the drawn circle. Reversing the polarity will cause the module to apply to the whole image, except for that circle.

## Available Shapes

Brush
: Start drawing a brush stroke by left-clicking into the canvas and moving the mouse while keeping the button pressed. The brush stroke is finalized once you release the mouse button. Scroll the mouse to change the shape size, either before you start drawing or at any time during the operation. Likewise you can use keys [ | ] to decrease/increase brush size, { | } to decrease/increase hardness/feathering, and < | > to decrease/increase opacity.

: If you have a graphics tablet with pen pressure sensitivity, darktable can apply the recorded pen pressure to certain attributes of the brush stroke. This operation can be changed in the _darkroom_ section of the _preferences_ dialog.

: On lifting the tablet pen or releasing the left mouse button the brush stroke is converted into a number of connected nodes which define the shape. A configuration option (in the _darkroom_ section of the _preferences_ dialog) controls how much smoothing is applied. A higher level of smoothing leads to less nodes – this eases subsequent editing at the expense of a lower initial accuracy.

: Nodes and segments of a brush stroke can be modified individually. See the documentation on Paths below for more details.

: _Note: Rendering a complex brush shape can consume a significant number of CPU cycles; consider using the circle, ellipse or path shapes if possible._ 

Circle
: Click into the canvas to place the circle. Left-click and drag the circle to a different position if needed. Use the scroll wheel of your mouse while in the circle to change the diameter; scroll within the circle border to adjust the width of the feathering (the same effect as _shift+scroll_ within the shape).

Ellipse
: The general principle is the same as for the circle shape. In addition you get four nodes on the ellipse line. Click on the nodes to adjust the ellipse's eccentricity. _Ctrl+click_ on them to rotate the ellipse or, alternatively, use _Shift+Ctrl+scroll_. _Shift+click_ in the shape to toggle the gradual decay between equidistant and proportional mode.

Path
: Left-click on the canvas to define path nodes. Terminate the path by right-clicking after having set the last point. By default nodes are connected by smooth lines. If you want a node to define a sharp corner, you can do so by creating it with _Ctrl+click_.

: In edit mode you can convert existing nodes from smooth to sharp corners and vice versa by _Ctrl+clicking_ on them. You can insert additional nodes by _Ctrl+clicking_ on one of the line segments. Single nodes can be deleted by right-clicking on them; make sure that the mouse pointer is over the desired node and the node is highlighted, to avoid accidentally removing the whole path.

: The size of the complete shape can be modified by scrolling – analogous to the circle shape. The same holds true for the width of the border (the area with a gradual opacity decay), which can be changed with _Shift+scroll_ from anywhere within the shape. Single nodes as well as path segments can be moved by mouse-dragging. If a node is selected by clicking on it, a further control point appears – you can move this control point to modify the curvature of the line (reset to default by right-clicking). Dragging one of the control points on the border adjusts the border width just in that part of the shape.

: Consider fine tuning paths in the restricted edit mode (see above). This allows you to adjust single nodes and segments without the risk of accidentally shifting or resizing the whole shape. 

Gradient
: The gradient shape is a linear gradient which extends from a given point to the edge of the image.

: Click on the canvas to define the position of the line that defines 50% opacity. Dotted lines indicate the distance beyond which the opacity is 100% and 0%, respectively. Between these dotted lines the opacity changes linearly. 

: The line has two anchor nodes which you can drag to change the rotation of the gradient.

: Gradient lines can also be curved by scrolling close to the center line. This can be useful to counteract the distortion caused by the _lens correction_ module. 

: Depending on the module and the underlying image using a gradient shape might provoke banding artifacts. You should consider activating the _dithering_ module to alleviate this.

# Parametric Masks

The parametric mask feature offers fine-grained selective control over how individual pixels are masked. It does so by automatically generating an intermediate blend mask from user defined parameters. These parameters are color coordinates rather than the geometrical coordinates used in drawn masks.

For each data channel of a module (Lab, RGB) and additionally for several virtual data channels (e.g. hue, saturation) you  can construct a per-channel opacity function. Depending on the pixel's value for a given data channel this function determines a blending factor between 0 and 1 (or 100%) for that pixel.

Each pixel of an image thus has different blending factors for each of its data channels (real and virtual). All blending factors are finally multiplied together (pixel-wise) along with the value of the global opacity slider to form a complete blend mask for the image.

If, for a given pixel, the blend mask has a value of 0, the input of the module is left unchanged. If the blend mask has its maximum value of 1 (or 100%), the module has full effect.

## Channel Tabs

Click on one of the channel tabs to select a data channel.

Modules acting in _Lab_ color space have data channels for L, a, b, C (chroma of LCh) and h (hue of LCh). 

Modules acting in _RGB_ color space have data channels for g (gray), R, G, B, H (hue of HSL), S (saturation of HSL), and L (lightness of HSL). 

_See [Wikipedia](https://en.wikipedia.org/wiki/Color_space)._

Each tab provides two sliders for its data channels: one for the input data that the module receives and one for the output data that the module produces prior to blending.

### Inspecting Data Channels and Masks

Press the letter 'c' while hovering over the relevant slider to view the input or output image data for the selected color channel. The center image changes to display that color channel either in graycale values or in false colors depending on the preference setting _darkroom_ tab of the _preferences_ dialog. 

Press the letter 'm' to see the resulting mask for that slider overlaid on the image. 

When leaving the slider the image goes back to normal after a short delay. 

### Linear / Log Mode

Press the letter 'a' while hovering over the a slider to change it to 'log' mode. This provides more fine control in the shadows. Press 'a' again to toggle back to 'linear' mode.

## Channel Input/Output Sliders

With each color channel slider you can construct a trapezoidal opacity function. For this purpose there are four markers per slider. Two filled triangles above the slider mark the range of values where opacity is 1. Two open triangles below the slider mark the range values where opacity is zero. Intermediate points between full and zero opacities are given a proportional opacity.

The filled triangles, or inside markers, indicate the closed (mostly narrower) edge of the trapezoidal function. The open triangles, or outside markers, indicate the open (mostly wider) edge of the trapezoidal function. The sequence of the markers always remains unchanged: they can touch one another but they cannot switch position.

A polarity (+/-) button to the right of each the slider switches between "range select" and "range de-select" function modes with visual confirmation provided by exchanging the upper and lower triangle markers. These two types of trapezoidal functions are represented graphically in the following images. 

**GRAPHS REQUIRED HERE**

In their default state all markers are at their extreme positions. In this state a range select function selects the whole range of values giving an “all at 100%” mask. Starting from there one can move the sliders inwards to gradually exclude more and more parts of the image except for the remaining narrow range.

A range de-select function (enabled by toggling the polarity) by default deselects the whole range of values, giving an “all-zero” mask as a starting point. Moving the sliders inwards gradually includes more and more parts of the image except for the remaining narrow range. 

## Color Pickers

With the left-hand color picker button you can select a point or area probe from your image. The corresponding values for the real and virtual data channels are then displayed within each color channel slider.

With the right-hand color picker button you can automatically set the slider's values based on the selected range. _Click_ and drag to set the parameters for the input slider from the drawn rectangle; _Ctrl+click_ and drag to set the parameters for the output slider.

## Invert

Click the invert button above the sliders to invert the polarity of the entire parametric mask. This differs from the polarity buttons beside the individual sliders which just invert the parameters for the current slider/channel.

## Reset

Click the reset button above the sliders to revert all parametric mask parameters to their default state.

# Combining Drawn and Parametric Masks

Drawn and parametric masks can be combined to form the final output mask for a module. 

There are two main elements which control how individual masks are combined: the polarity setting of each individual mask, defined by the plus or minus buttons, and the setting in the “combine masks” combobox.

exclusive
: A straightforward method of combining masks is by multiplying the individual pixel values from each of the component masks. 

: The final mask will have a pixel value of 0 whenever one of the individual masks is 0 at that pixel location. The final mask can only reach a maximum pixel value of 1.0 if each and every of the individual masks has a value of 1.0 at that location. This method of combination is known as _exclusive_. 

: Any individual mask can exclude a pixel by setting its value to zero, regardless of what the other masks do. Once a pixel is excluded by any mask there is no way for another mask to include it again.

inclusive
: An alternative method of combining masks is to first invert each individual mask (subtract its value from 1.0), multiply those inverted masks together, and finally invert the combined mask once more. 

: Now, if _one_ of the input masks has a value of 1.0 at a given pixel the final value for that pixel will also be 1.0. Conversely, the final mask can only reach a pixel value of 0 if _all_ of the individual masks have a value of 0. This method of combination is known as _inclusive_. 

: Any individual mask can include a pixel by setting its value to 1.0, regardless of what the other individual masks do. Once a pixel is included (its value is 1.0) by any mask there is no way to exclude it again by any other individual mask.

exclusive and inclusive inverted modes
: Using the above combination methods alone would still be rather limiting. We gain maximum flexibility by allowing an additional inversion step for each individual mask. This is governed by the polarity buttons that you find close to the individual channels. 

: Toggling the polarity button of a mask inverts its values (subtracts the original value from 1.0).

: Finally within the “combine masks” combobox you may once again invert the final result to fit your needs by selecting the _exclusive & inverted_ or _inclusive & inverted_ options. 

# Typical Use Cases

Inclusive mode
: For this mode you set the “combine masks” combobox to inclusive mode and make sure that all polarity buttons of all the individual channels and of the drawn mask are set to negative (-). Your starting point is a mask where all pixels have a value of zero, i.e. no pixel is selected. You now adjust the parametric mask sliders to bring more and more pixels into the selection or you draw shapes on the canvas to select specific areas of your image.

Exclusive mode
: In the opposite case you set the “combine masks” combobox to exclusive mode and make sure that all polarity buttons are set to positive (+). Your starting point is a mask with all values at 1.0, i.e. all pixels selected. You now gradually change the parametric mask sliders to exclude parts of your image as needed or directly draw shapes on the canvas to specifically exclude these areas.

: For your convenience the parametric masks GUI provides a toggle button that inverts all channel polarities and toggles between inclusive and exclusive mode in the “combine masks” combobox.

For novice users it is recommended to stick to these two use cases. This means that you should decide beforehand how you want to construct your mask.

# Mask Refinement and Additional Controls

When a parametric/drawn mask is active, several additional sliders are shown allowing for meticulous refinement of the mask.

feathering guide
: Mask feathering smoothes a drawn or parametric mask non-uniformly such that the mask's edges automatically align with the edges of features in the image. This mask smoothing is guided either by the module's input or output (before blending), depending on what is selected in the “feathering guide” combobox. Feathering is particularly sensitive to this choice for edge-modifying modules (modules for sharpening or blurring an image).

feathering radius
: Adjust the strength of the feathering effect. Feathering works best if the drawn and/or parametric mask's edges already approximately match some edges in the guiding image. The larger the “feathering radius” the better the feathering algorithm can align the mask to more distant edges. If this radius is too large, however, the feathered mask may overshoot (cover regions that the user wants to exclude). Feathering is disabled if the feathering radius is set to 0.

mask blur
: Blurring the mask creates a softer transition between blended and unblended parts of an image and can be used to avoid artifacts. The mask blur slider controls the radius of a gaussian blur applied to the final blend mask. The higher the radius, the stronger the blur (set to 0 for an unblurred mask). Gaussian blur is always applied after feathering if both kinds of mask adjustment are activated. This allows any resulting sharp edges or artefacts to be smoothed.

mask opacity
: The strength of the module's effect is determined by the mask's local opacity. Feathering and blurring the mask may result in a mask with reduced opacity, which implies a reduced effect. Therefore, the “mask opacity” slider allows you to readjust the mask opacity to compensate. If the opacity is decreased (negative slider values) less opaque parts are affected more strongly than more opaque parts. Conversely, if the mask opacity is increased (positive slider values) more opaque parts are affected more strongly than less opaque parts. As a consequence, completely opaque portions of the mask always remain opaque and completely transparent portions always remain transparent. This is to ensure that regions which have been excluded from or included to a module's effect (by setting the mask's opacity to 0% or 100%) remain excluded or included.

mask contrast
: This slider increases or decreases the mask contrast. This allows you to adjust the transition between opaque and transparent mask parts.

temporarily switch off mask
: Sometimes it is useful to visualize the module's effect without the mask being active. Click on this icon to temporarily deactivate the mask (the selected blend mode and opacity remain in effect).

display mask
: Click on this icon to display the current mask as a yellow overlay over a black-and-white version of the image. Solid yellow indicates an opacity of 100%; a fully visible gray background image (without yellow overlay) indicates an opacity of 0%.

## Example: Feathering a Drawn Mask

**IMAGES HERE**

It can be rather tedious to create a drawn mask which precisely covers a particular object or person in an image. In this example, we want to enhance the color contrast of the lion sculpture shown in the left image above without affecting the background.

1. The first image above shows the original, unaltered image.
2. The second image shows a rough selection of the sculpture created with a drawn mask. Note that the mask is rather fuzzy and does not precisely follow the outline of the lion sculpture so requires further refinement.
3. The third image shows the effect of adjusting the feathering radius, mask opacity and mask contrast, leading to a well matched mask with little effort. In this example the feathering radius has been adjusted to 50 and a blur radius of 5 was chosen to smooth the mask to some degree. The mask opacity and mask contrast have been increased to 0.3 and 0.5, respectively. 
4. The final image above shows the end result, where the color enhancement via the _color contrast_ module is restricted to only the lion sculpture.

Mask feathering works particularly well in this example because the sculpture is well separated from the blurry background. The distinct edge at the border of the sculpture guides the feathering mask adjustment to match the shape of the sculpture. 

# Raster Mask

As described in the previous sections, the final output of a module's mask (the combined effect of any drawn and parameteric masks) is a greyscale raster image representing the extent to which the module should be applied to each pixel. This raster image is stored internally for active modules and can be subsequently reused within other modules.

As with normal masks, if the value for a pixel in a raster mask is zero the input of the module is left unchanged. If the value is 1.0 the module has full effect and for each value in-between 0 and 1.0 the module's effect is applied proportionally at that location.

Choose a raster mask from the drop-down. Raster masks can be identified by the name of the module against which they were originally generated. Raster masks can only be selected from modules that are currently active in the pixelpipe.
