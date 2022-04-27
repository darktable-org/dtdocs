---
title: drawn masks
id: drawn
weight: 20
draft: false
---

With the drawn mask feature you can construct a mask by drawing shapes directly onto the image canvas. Shapes can be used alone or in combination. Once a shape has been drawn on an image it can be adjusted, removed, or reused in other modules.

Shapes are stored internally as vectors and are rendered with the required resolution during pixelpipe processing. Shapes are expressed in the coordinate system of the original image and are transformed along with the rest of the image by any active distorting modules in the pipe ([_lens correction_](../../../module-reference/processing-modules/lens-correction.md), [_rotate and perspective_](../../../module-reference/processing-modules/rotate-perspective.md) for example). This means that a shape will always work on the same image area regardless of any modifications that may be subsequently applied. 

The controls required to create and alter drawn masks may be enabled by selecting either the "drawn mask" or "drawn & parametric mask" icon at the bottom of a module. You can also create and edit shapes using the [mask manager](../../../module-reference/utility-modules/darkroom/mask-manager.md) module.

# creating shapes

Choose a shape by clicking on the appropriate shape icon (from left to right: circle, ellipse, path, brush, gradient).

![shape icons](./drawn/shape-icons.png)

This will take you into the creation mode for that shape. Once you have finished drawing your shape you will automatically be taken into edit mode. 

Ctrl+click on the shape icon to continuously draw multiple shapes of the same type -- each time a shape is completed, you will re-enter creation mode for a new instance of that shape. While in continuous creation mode, right-click on the image to stop drawing shapes and enter edit mode.

For all drawn shapes, you can hold Shift while scrolling with the mouse wheel to change the extent of the shape's feathering (the blur at the edge of the shape) and use Ctrl+scroll to change the shape's opacity (how transparent it is). These operations are available in both creation and edit modes (as long as your mouse is over the shape in question).

By default, scrolling your mouse up increases the value of the relevant shape parameters. This behavior can be changed in [preferences > darkroom > scroll down to increase mask parameters](../../../preferences-settings/darkroom.md).

---

**Note:** When used in shape creation mode, the preceding scroll operations will also cause the _default_ feathering or opacity to be changed. The new default values will be used the next time you create a new shape.

---

# editing shapes

Click on the 'show and edit mask elements' icon ![show-and-edit-masks-icon](./drawn/shape-edit.png#icon) to enter shape edit mode. This will show all drawn masks in use by the current module and allow you to edit those shapes. It will also expand the associated group in the [mask manager](../../../module-reference/utility-modules/darkroom/mask-manager.md). Ctrl+click on the same icon to enter restricted edit mode, where certain actions (e.g. dragging a complete shape or changing its size) are blocked. This is particularly useful to avoid costly mistakes when editing path and brush shapes.

Click and drag a shape to move it around the image canvas. Clicking on a shape will also select that shape in the mask manager.

# removing shapes

While in edit mode right-click on a shape to remove it.

# reusing shapes

You can reuse shapes that you have drawn in other modules. Click on the shapes drop-down (next to the 'show and edit mask elements' button) to choose previously-drawn shapes individually or to use the same group of shapes as used by another module. The following options are available for selection:

add existing shape
: Choose either an individual shape or a group of shapes that you've drawn previously (either within the [mask manager](../../../module-reference/utility-modules/darkroom/mask-manager.md) or from within the drawn mask of another module). If that shape or group is used elsewhere, any changes you make will be reflected everywhere the shape or group is used.

use same shapes as
: Add a list of shapes used in another module to the current module's mask. This differs from the previous option in that it creates a new group of shapes, allowing shapes to be added to or removed from the group independently of the module from which they were copied. All shapes that are common to both groups remain linked.

# combining and managing shapes

The [mask manager](../../../module-reference/utility-modules/darkroom/mask-manager.md) module can be used to manage your drawn shapes. This module also allows you to group and combine drawn masks using set operators (union, intersection, difference, exclusion).

# shape distortions

In order to ensure a consistent co-ordinate system, when you place a shape on the image, it is actually drawn on the original RAW file. This shape then passes up through the pixelpipe before finally being used by the module and drawn on the screen. This means that, if you have any enabled any distorting modules (such as lens correction), drawn shapes may appear distorted on the screen and in the final image. This can lead, for example, to circles being rendered as ellipses and gradient lines becoming curved. If you need to create a more accurate shape (to overcome these distortions) it is recommended that you avoid using the simple shapes (circles / ellipses) in favor of the path shape (which can be drawn using more points, reducing distortions). You can adjust the curve on gradient lines to overcome the simple distortions introduced by lens correction.

# available shapes

circle
: Click on the image canvas to place the circle. Scroll while hovering over the circle to change its diameter. Scroll while hovering over the circle's border to change the width of the feathering (the same effect as holding Shift while scrolling with the mouse wheel within the main shape).

ellipse
: The general principle is the same as for the circle shape. In addition, four nodes are shown on the ellipse line. Click and drag the nodes to adjust the ellipse's eccentricity. Ctrl+click and drag the nodes or use Shift+Ctrl+scroll (with the mouse wheel) to rotate the ellipse. Shift+click within the shape to toggle the gradual decay between equidistant and proportional mode.

path
: Click on the image canvas to place three or more nodes and generate a free-format enclosed shape. Terminate the path by right-clicking after having set the last point. By default, nodes are connected with smooth lines. If you want a node to instead define a sharp corner, you can do so by creating it with Ctrl+click.

: In edit mode Ctrl+click on an existing node to convert it from smooth to sharp corners and vice versa. Ctrl+click on one of the line segments to insert an additional node. Right-click on a node to delete it. Take care to ensure that the mouse pointer is over the desired node and the node is highlighted, to avoid accidentally removing the whole path.

: The size of the completed shape can be modified by scrolling. The same holds true for the width of the border (the area with a gradual opacity decay), which can also be changed with Shift+scroll (with the mouse wheel) from anywhere within the shape. Single nodes as well as path segments can be moved by dragging them with the mouse. If a node is selected by clicking on it, a further control point appears which allows you to modify the curvature of the line (reset to default by right-clicking). Dragging one of the control points on the border adjusts the border width just in that part of the shape.

: Consider fine-tuning paths in restricted edit mode (enabled by Ctrl+clicking on the 'show and edit mask elements' icon). This allows you to adjust single nodes and segments without the risk of accidentally shifting or resizing the whole shape. 

brush
: Start drawing a brush stroke by left-clicking on the image canvas and moving the mouse while keeping the button pressed. The brush stroke is finalized once you release the mouse button. Scroll the mouse to change the shape size and Shift+scroll to change the feathering (hardness), either before you start drawing or at any time during the operation. Likewise you can use the "`{`" and "`}`" keys to decrease/increase hardness, and the "`<`" and "`>`" keys to decrease/increase opacity.

: If you have a graphics tablet with pen pressure sensitivity, darktable can apply the recorded pen pressure to certain attributes of the brush stroke. This operation can be controlled in [preferences > darkroom > pen pressure control for brush masks](../../../preferences-settings/darkroom.md).

: On lifting the tablet pen or releasing the left mouse button the brush stroke is converted into a number of connected nodes, which define the final shape. A configuration option ([preferences > darkroom > smoothing of brush strokes](../../../preferences-settings/darkroom.md)) controls how much smoothing is applied. A higher level of smoothing leads to fewer nodes being created – this eases subsequent editing at the expense of lower accuracy.

: Nodes and segments of a brush stroke can be modified individually. See the documentation on path shapes (above) for more details. Change the size or hardness of a node by scrolling and Shift+scrolling over a node, respectively.

---

**Note:** Rendering a complex brush shape can consume a significant number of CPU cycles. Consider using the circle, ellipse or path shapes instead where possible.

---

gradient
: The gradient shape is a linear gradient which extends from a given point to the edge of the image.

: Click on the image canvas to define the position of the line that defines 50% opacity. Dotted lines indicate the distance beyond which the opacity is 100% and 0%. Between these dotted lines the opacity changes linearly. 

: The line has two anchor nodes which you can drag to change the rotation of the gradient. You can also set the rotation angle when placing the gradient shape by clicking and dragging to place the shape.

: Gradient lines can also be curved by scrolling with your mouse while hovering close to the center line. This can be useful to counteract the distortion caused by the [_lens correction_](../../../module-reference/processing-modules/lens-correction.md) module. 

: Depending on the module and the underlying image, using a gradient shape might provoke banding artifacts. You should consider activating the [_dithering_](../../../module-reference/processing-modules/dithering.md) module to alleviate this.

# reversing the polarity of a drawn mask 

Click on the "`+/-`" button to reverse the polarity of the entire drawn mask. For example, a circular mask will, by default, cause the module to be applied only to the area inside the drawn circle. Reversing its polarity will cause the module to apply to the whole image, _except for_ that circle.

