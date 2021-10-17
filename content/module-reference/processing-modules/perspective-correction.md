---
title: perspective correction
id: perspective-correction
applicable-version: 3.8
tags: 
working-color-space:  
view: darkroom
masking: 
---

Automatically correct for converging lines, a form of perspective distortion. The underlying mechanism is inspired by Markus Hebel's [_ShiftN_](http://www.shiftn.de/) program.

Perspective distortions are a natural effect when projecting a three dimensional scene onto a two dimensional plane and cause objects close to the viewer to appear larger than objects further away. Converging lines are a special case of perspective distortions frequently seen in architectural photographs. Parallel lines, when photographed at an angle, are transformed into converging lines that meet at some vantage point within or outside of the image frame.

This module is able to correct converging lines by warping the image in such a way that the lines in question become parallel to the image frame. Corrections can be applied in a vertical and horizontal direction, either separately or in combination. In order to perform automatic correction the module first analyzes the image for suitable structural features consisting of line segments. Based on these line segments a fitting procedure is initiated which determines the best values for the module's parameters.

# analysing the structure of an image

Click the ![structure-icon](./perspective-correction/icon-get-structure.png#icon) icon to analyze the image for structural elements -- darktable will automatically detect and evaluate line elements. Only lines that form a set of vertical or horizontal converging lines are used for the subsequent processing steps. The line segments are displayed as overlays on the image canvas, with the type of line identified by color:

green
: Vertical converging lines

red
: Vertical lines that do not converge

blue
: Horizontal converging lines

yellow
: Horizontal lines that do not converge

gray
: Other lines that are not of interest to this module

Lines marked in red or yellow are regarded as outliers and are not taken into account during the automatic fitting step. This outlier elimination involves a statistical process using random sampling which means that each time you press the “get structure” button the color pattern of the lines will look slightly different. 

You can manually change the status of line segments: Left-Click on a line to select it (turn the color to green or blue) and Right-click to deselect it (turn the color to red or yellow). If you keep the mouse button pressed, you can use a sweeping action to select/deselect multiple lines in a row. The size of the select/deselect brush can be changed with the mouse wheel. Hold down the Shift key and keep the left or right mouse button pressed while dragging to select or deselect all lines in the chosen rectangular area.

Click on one of the “automatic fit” icons (see below) to initiate an optimization process, which finds the best suited module parameters based on the detected structure. The image and the overlaid lines are then displayed with perspective corrections applied.

# module controls

Once the initial image analysis is complete, the following controls can be used to perform the perspective corrections.

rotation
: Control the rotation of the image around its center to correct for a skewed horizon.

lens shift (horizontal)
: Correct converging horizontal lines (i.e. to make the _blue_ lines parallel).

lens shift (vertical)
: Correct converging vertical lines (i.e. to make the _green_ lines parallel). In some cases you can obtain a more natural looking image if you correct vertical distortions to an 80 ~ 90% level rather than to the maximum extent. To do this, reduce the correction slider after having performed the automatic correction.

shear
: Shear the image along one of its diagonals. This is required when correcting vertical and horizontal perspective distortions simultaneously.

guides
: When activated, a grid is overlaid on the image to help you judge the quality of the correction.

automatic cropping
: When activated, this feature crops the image to remove any black areas at the edges caused by the distortion correction. You can either crop to the “largest area”, or to the largest rectangle that maintains the original aspect ratio (“original format”). In the latter case you can manually adjust the automatic cropping result by clicking in the clip region and moving it around. The size of the region is modified automatically to exclude any black areas.

lens model
: This parameter controls the lens focal length, camera crop factor and aspect ratio that used by the correction algorithm. If set to “generic” a lens focal length of 28mm on a 35mm full-frame camera is assumed. If set to “specific”, the focal length and crop factor can be set manually using the sliders provided.

focal length
: If the _lens model_ is set to "specific", set the lens focal length. The default value is taken from the image's Exif data, and can be overridden by adjusting the slider manually.

crop factor
: If the _lens model_ is set to "specific", set the camera crop factor. You will normally need to set this value manually.

aspect ratio
: If the _lens model_ is set to "specific", this parameter allows for a free manual adjustment of the image's aspect ratio.  This is useful for "unsqueezing" images taken with an anamorphic lens (which changes the ratio of image height to width).

automatic fit
: Click on one of the _automatic fit_ icons to set the distortion correction sliders automatically based on the edge detection analysis. You can choose to automatically apply just the vertical corrections ![vertical-icon](./perspective-correction/icon-vertical.png#icon), just the horizontal corrections ![horizontal-icon](./perspective-correction/icon-horizontal.png#icon), or both together ![both-icon](./perspective-correction/icon-both.png#icon). Ctrl+click on any of the icons to apply a rotation without the lens shift. Shift+click on any of the icons to apply the lens shift without any rotation.

get structure
: Click on the ![structure-icon](./perspective-correction/icon-get-structure.png#icon) icon to (re-)analyze the image for suitable line segments. Shift+click to apply a contrast enhancement step before performing further analysis. Ctrl+click to apply an edge enhancement step before performing further analysis. Both variations can be used alone or in combination if the default analysis is not able to detect a sufficient number of lines.

: Click on the ![cross-icon](./perspective-correction/icon-cross.png#icon) icon to discard any structural information collected during any previous structural analysis.

: Click on the ![eye-icon](./perspective-correction/icon-eye.png#icon) icon to show or hide the line segments identified by any previous structural analysis.


show guides
: Tick the box to show guide overlays whenever the module is activated. Click the icon on the right to control the properties of the guides. See [guides & overlays](../utility-modules/darkroom/guides-overlays.md) for details.

# examples

Here is an image with a skewed horizon and converging lines caused by directing the camera upwards:

![prespective-correction-example-before](./prespective-correction/perspective-correction-example-before.png#w66)

Here is the image after having corrected for vertical and horizontal perspective distortions. Note the framing adjustment made by the automatic cropping feature and the still-visible overlay of structural lines:

![prespective-correction-example-after](./prespective-correction/perspective-correction-example-after.png#w66)



