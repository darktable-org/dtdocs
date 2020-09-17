---
title: drawn masks
id: drawn
weight: 20
draft: false
---

With the drawn mask feature you can construct a mask by drawing shapes directly onto the image. Shapes can be used alone or in combination. Once a shape has been drawn on an image it can be adjusted, removed, or reused in other modules.

Shapes are stored internally as vector graphics and are rendered with the required resolution during pixelpipe processing. Shapes are expressed in the coordinate system of the original image and are transformed along with the rest of the image by any active distorting modules in the pipe ([_lens correction_](../../../module-reference/processing-modules/lens-correction.md), [_crop & rotate_](../../../module-reference/processing-modules/crop-rotate.md) for example). This way a shape will always work on the same image area regardless of any modifications that may be subsequently applied.  Please note that this distorting effect may cause straight lines in your mask to appear curved when the [_lens correction_](../../../module-reference/processing-modules/lens-correction.md) module is active.

The controls required to draw and alter masks may be enabled by selecting the "drawn mask" or "drawn & parametric mask" icon at the bottom of a module.

# creating shapes

Choose a shape by clicking on the appropriate shape icon.

**IMAGE HERE**

This will take you into the creation mode for that shape - see subsequent sections for details of the available shapes. Once you have finished drawing your shape you will automatically be taken into the edit mode. 

_Ctrl+click_ on the shape icon to continuously draw multiple similar shapes. In this mode, _right-click_ to stop drawing shapes and enter edit mode.

For all drawn shapes, _Shift+scroll_ changes the shape's feathering (the blur at the edge of the shape) and _Ctrl+scroll_ changes the shape's opacity (how transparent it is). These operations are available in both creation and edit modes.

_Note: The preceding scroll operations will also cause the **default** feathering or opacity to be changed when used in shape creation mode. These values are used again when you place the next shape._

# editing shapes

Click on the 'show and edit mask elements' icon to enter shape edit mode. This will show all drawn masks used by the current module and allow you to edit those shapes. _Ctrl+click_ on the same icon to enter restricted edit mode, where certain actions (e.g. dragging a complete shape or changing its size) are blocked. This is particularly useful when altering path and brush shapes (see below).

While in edit mode you can right-click on a shape to remove it.

# reusing shapes

You can reuse shapes that you have drawn in other modules. Click on the shapes drop-down to choose previously-drawn shapes individually or to use the same group of shapes as used in another module.

# combining and managing shapes

The _mask manager_ utility module can be used to manage your drawn shapes. This module also allows you to group and combine drawn masks using set operators (union, intersection, difference, exclusion).

# reversing the polarity of a drawn mask 

Click on the "+/-" button to reverse the polarity of the entire drawn mask. For example, a circular mask will, by default, cause the module to be applied only to the area inside the drawn circle. Reversing the polarity will cause the module to apply to the whole image, except for that circle.

# available shapes

brush
: Start drawing a brush stroke by left-clicking into the canvas and moving the mouse while keeping the button pressed. The brush stroke is finalized once you release the mouse button. Scroll the mouse to change the shape size, either before you start drawing or at any time during the operation. Likewise you can use keys [ | ] to decrease/increase brush size, { | } to decrease/increase hardness/feathering, and < | > to decrease/increase opacity.

: If you have a graphics tablet with pen pressure sensitivity, darktable can apply the recorded pen pressure to certain attributes of the brush stroke. This operation can be changed in the [_darkroom_ section of the _preferences_](../../../preferences-settings/darkroom.md) dialog.

: On lifting the tablet pen or releasing the left mouse button the brush stroke is converted into a number of connected nodes which define the shape. A configuration option (in the [_darkroom_ section of the _preferences_](../../../preferences-settings/darkroom.md) dialog) controls how much smoothing is applied. A higher level of smoothing leads to less nodes – this eases subsequent editing at the expense of a lower initial accuracy.

: Nodes and segments of a brush stroke can be modified individually. See the documentation on Paths below for more details.

: _Note: Rendering a complex brush shape can consume a significant number of CPU cycles; consider using the circle, ellipse or path shapes if possible._ 

circle
: Click into the canvas to place the circle. Left-click and drag the circle to a different position if needed. Use the scroll wheel of your mouse while in the circle to change the diameter; scroll within the circle border to adjust the width of the feathering (the same effect as _shift+scroll_ within the shape).

ellipse
: The general principle is the same as for the circle shape. In addition you get four nodes on the ellipse line. Click on the nodes to adjust the ellipse's eccentricity. _Ctrl+click_ on them to rotate the ellipse or, alternatively, use _Shift+Ctrl+scroll_. _Shift+click_ in the shape to toggle the gradual decay between equidistant and proportional mode.

path
: Left-click on the canvas to define path nodes. Terminate the path by right-clicking after having set the last point. By default nodes are connected by smooth lines. If you want a node to define a sharp corner, you can do so by creating it with _Ctrl+click_.

: In edit mode you can convert existing nodes from smooth to sharp corners and vice versa by _Ctrl+clicking_ on them. You can insert additional nodes by _Ctrl+clicking_ on one of the line segments. Single nodes can be deleted by right-clicking on them; make sure that the mouse pointer is over the desired node and the node is highlighted, to avoid accidentally removing the whole path.

: The size of the complete shape can be modified by scrolling – analogous to the circle shape. The same holds true for the width of the border (the area with a gradual opacity decay), which can be changed with _Shift+scroll_ from anywhere within the shape. Single nodes as well as path segments can be moved by mouse-dragging. If a node is selected by clicking on it, a further control point appears – you can move this control point to modify the curvature of the line (reset to default by right-clicking). Dragging one of the control points on the border adjusts the border width just in that part of the shape.

: Consider fine tuning paths in the restricted edit mode (see above). This allows you to adjust single nodes and segments without the risk of accidentally shifting or resizing the whole shape. 

gradient
: The gradient shape is a linear gradient which extends from a given point to the edge of the image.

: Click on the canvas to define the position of the line that defines 50% opacity. Dotted lines indicate the distance beyond which the opacity is 100% and 0%, respectively. Between these dotted lines the opacity changes linearly. 

: The line has two anchor nodes which you can drag to change the rotation of the gradient.

: Gradient lines can also be curved by scrolling close to the center line. This can be useful to counteract the distortion caused by the [_lens correction_](../../../module-reference/processing-modules/lens-correction.md) module. 

: Depending on the module and the underlying image using a gradient shape might provoke banding artifacts. You should consider activating the [_dithering_](../../../module-reference/processing-modules/dithering.md) module to alleviate this.
