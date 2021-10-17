---
title: spot removal (deprecated)
id: spot-removal
applicable-version: 3.6
tags: 
working-color-space:  
view: darkroom
masking: 
---

---

**Please note that this module is [deprecated](../../darkroom/processing-modules/deprecated.md) from darktable 3.6 and should no longer be used for new edits. Please use the "cloning" tool in the [_retouch_](./retouch.md) module instead.**

---

Correct areas of an image (the target) using details from another area of the image (the source).

This module uses some of the shapes that are available for [drawn masks](../../darkroom/masking-and-blending/masks/drawn.md) (circles, ellipses and paths), and the user interface is similar. 

To use this module, first select the desired shape by clicking the corresponding shape icon (Ctrl+click to enable continuous shape creation mode). Next, you may optionally choose the source for the correction by using Shift+Ctrl+click or Shift+click on the image canvas to choose absolute or relative mode, respectively (see below). Finally click on the canvas to choose the area to be healed (the target area). A cross is displayed where the source area will be positioned.

The source positioning has two modes

absolute mode
: Before placing a shape on the image canvas, Shift+Ctrl+click on the desired position for the source. From this point on, all new shapes will have their source created at the same absolute position (in image co-ordinates). 

relative mode
: Before placing a shape on the image canvas, Shift+click on the desired position for the source. The current shape will have the source created at that position and subsequent shapes will have their source created at the same position, _relative to the target shape_.

After creation the source and target areas of each shape can be shifted independently until the result matches your expectations. An arrow points from the source area of each shape to its target.

Use the shape-specific controls to adjust each shape's size, border width, and other attributes.

Right-click on a shape to delete it.

This module is equivalent to the "cloning" tool in the [_retouch_](./retouch.md) module; see the description of the cloning tool for additional details and examples.  If _spot removal_ produces unsatisfactory results, you may want to try the "heal" tool in _retouch_ instead.
