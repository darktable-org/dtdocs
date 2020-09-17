---
title: mask manager
id: mask-manager
applicable-verison: 3.2.1
tags: 
view: darkroom
---

Manage all masks and shapes for the current image. This module can be used to create, rename, edit and delete shapes. You can add shapes to and remove them from a mask, group shapes together, and combine them using set operators. 

In the top line of the mask manager panel are buttons that can be used to create new shapes. They are the same as in the drawn mask GUI of the individual modules.

The panel below contains a list of all masks and individual shapes currently defined. 

Masks are indicated with a headline in the form “grp levels” indicating the module in which they are used with the component shapes being listed below. The list of masks is followed by a list of all individual shapes which have been generated in the context of the given image. If a shape is in use by any of the masks this is indicated by a symbol to the right of the shape name. 

# shapes

By default shapes receive an automatically generated name, consisting of the shape type (“brush”, “circle”, “ellipse”, “path”, “gradient”) and a number that is incremented automatically. You can replace these automatically generated names by more meaningful ones. Double-clicking on the existing shape name prompts you to provide a new name. Giving a meaningful name is a good habit, especially if you are going to use the same selection in different masks.

Clicking on the shape name shows the selected shape in the center canvas with all its controls. This is a convenient way to edit the properties of a single shape. This is especially useful where there are many overlapping shapes within a mask, making it difficult to select the right shape.

Right-clicking on a shape name gives you a drop-down menu with options to remove the current shape or to remove all shapes currently not in use.

All shapes that have ever been defined for the current image are retained unless you explicitly remove them. If you have worked a lot with shapes on one image, this list can get quite long. All defined shapes are stored within the XMP tags of an image and are included in exported files (if you choose to include develop history in the export). 

_Note: If the list of shapes is very long the space required to store all shapes might exceed the limits of certain file formats. In this case storing the XMP tags can fail during export._

# masks

Clicking on the name of a mask expands a list showing the individual shapes which constitute that mask.

Right-clicking on the shape name opens a drop-down menu. Here you can define how the individual shapes interact to form the mask. You can also remove shapes from the mask. 

Masks are constructed by adding the shapes in the order that they are listed from top to bottom. Each shape adds to the mask by using one of four logical set operators.

Because order matters when combining shapes you may move each shape up or down the list if required.

The polarity of each shape can be inverted before being added. This is depicted by the symbol **TBC**.

# set operators

**NEEDS EXAMPLE IMAGES**

We use as an example a combination of a gradient followed by a path to demonstrate the effect of each set operator when applied to the path shape. As a convention we say that a pixel is “selected” in a mask or shape if it has a value higher than zero. 

union
: This is the default set operator. It is depicted by the symbol **TBC** to the left of the shape name. The shape adds to the existing mask in such a way that the resulting mask contains the pixels that are *either* selected in the existing mask *or* in the added shape. In overlapping areas the maximum value is taken. 

intersection
: This set operator is depicted by the symbol **TBC** to the left of the shape name. The shape adds to the existing mask in such a way that the resulting mask contains only pixels that are selected in *both* the existing mask *and* the added shape. In overlapping areas the minimum value is used. In the given example we use this operator to “imprint” the path with a gradient. 

difference
: This set operator is depicted by the symbol **TBC** to the left of the shape name. In the non-overlapping area the existing mask is unchanged. In the resulting mask, pixels are selected only if they are selected in the existing mask but *not* in the added shape. This set operator can be chosen if you want to “cut out” a region from within an existing selection. 

exclusion
: This set operator is depicted by the symbol **TBC** to the left of the shape name. The resulting mask has all pixels selected that are either selected in the existing mask and not in the added shape or vice versa. This is equivalent to an “exclusive or”. 
