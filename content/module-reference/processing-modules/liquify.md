---
title: liquify
id: liquify
applicable-version: 3.2.1
tags: 
working-color-space: RGB
view: darkroom
masking: 
---

Move pixels around by applying freestyle distortions to parts of the image using points, lines and curves.

# nodes

Each of liquify's tools is based on nodes. A point consists of a single node and a line or curve consists of a sequence of linked nodes defining a path.

Each instance of the liquify module is limited to a maximum of 100 nodes -- for more nodes, use additional instances. However, please note that the liquify module consumes a lot of system resources. 

Drag the central point of a node to move the node around. The radius describes the area of the effect (distortion occurs only within this radius). To change the radius drag the handle at the circumference. A strength vector starting from the center describes the direction of the distortion, and its strength is depicted by the length of the vector. Change the vector by dragging its arrow head. 

# points

A point consists of a single node and strength vector. 

Click the point icon to activate the point tool and then click on the image to place it. Hold Ctrl while clicking on the point icon to add multiple points without having to click the icon again each time. Right-click to exit creation mode.

## point modes

The strength vector of a point has three different modes. These can be toggled by holding Ctrl and clicking on the arrowhead of the strength vector.

linear
: A linear distortion inside the circle, starting from the opposite side of the strength vector and following the vector's direction. This is the default mode.

: ![linear](./liquify/liquify_ex1.png#w33)

radial growing
: The strength vector's effect is radial, starting with a strength of 0% in the center and increasing away from the center. This mode is depicted by an additional circle with the arrow pointing outwards.

: ![radial growing](./liquify/liquify_ex4.png#w33)

radial shrinking
: The strength vector's effect is radial, starting with a strength of 100% in the center and decreasing away from the center. This mode is depicted by an additional circle with the arrow pointing inwards.

: ![radial shrinking](./liquify/liquify_ex3.png#w33)

## feathering

default mode
: By default the strength varies linearly from 0% to 100% between the center and the radius of the control point. It is possible to modify the feathering effect by clicking on the center of the circle.

: ![default](./liquify/liquify_ex1.png#w33)

feathered mode
: In "feathered" mode, two control circles are displayed, which can be modified independently to feather the strength of the effect. Note that clicking the center of the circle again hides the feathering controls but does _not_ return to the default mode.

: ![feathered](./liquify/liquify_ex2.png#w33)

## removing points

A point can be removed by right-clicking on the center of the node.

# lines and curves

Lines and curves are sequences of points linked together by straight or curved lines. The effect is interpolated by a set of associated strength vectors. 

Click the appropriate icon to activate the line or curve tool and then click on the image to place a sequence of points forming the path. Right-click anywhere when the last point has been placed in order to finish drawing the line/curve.

Hold Ctrl while clicking on the line/curve icon to add multiple lines/curves without having to click the icon again each time. Right-click a second time to exit creation mode after the final line or curve has been completed.

lines
: ![lines](./liquify/liquify_ex5.png#w50)

curves
: ![curves](./liquify/liquify_ex6.png#w50)

Ctrl+click on a line or curve segment to add a new control point. Ctrl+right-click on the center of a node to remove a control point. 

Right-click on a segment to remove the shape completely. Ctrl+Alt+click on a segment to change that segment from a line to a curve and vice versa.

# link modes

Ctrl+click on the center of a node to change the way the points of a curve are linked together. There are four modes, which correspond to different ways of handling the steepness of the bezier curve using control handles: 

autosmooth
: This is the default mode, in which control handles are not displayed -- controls are automatically computed to give a smooth curve.

cusp
: Control handles can be moved independently. This mode is depicted by a triangle symbol in the node's center.

smooth
: Control handles always give a smooth curve. This mode is depicted by a diamond symbol in the node's center.

symmetrical
: Control handles are always moved together. This mode is depicted by a square symbol in the node's center.

# view and edit nodes

Click the node tool icon to activate or deactivate the node edit tool. This displays all currently-defined distortion objects and their controls. Alternatively you can right-click on the image at any time for the same effect. 

# warps and nodes count

This information field displays the number of warps (individual distortion objects) and nodes currently in use.

