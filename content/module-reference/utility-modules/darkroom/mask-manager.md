---
title: mask manager
id: mask-manager
applicable-version: 4.4
tags:
view: darkroom
---

Manage all drawn masks and shapes for the current image.

![mask manager](./mask-manager/mask-manager.png#w25)

This module can be used to create, rename, edit and delete shapes. You can add shapes to and remove shapes from a mask, group shapes together, and combine them using set operators.

The top line of the mask manager panel contains buttons that can be used to create new shapes. These are the same as in the [drawn mask](../../../darkroom/masking-and-blending/masks/drawn.md) interface of in processing modules.

The panel below these buttons displays a list of all masks and individual shapes defined for the current image.

Groups of shapes forming a mask are displayed with a headline in the form "grp <module_name>" indicating the module in which they are used, with the component shapes listed below. The list of mask groups is followed by a list of all individual shapes that have been generated in the context of the current image. If a shape is in use by any masks this is indicated by a symbol to the right of the shape name.

# shapes

By default each shape receives an automatically generated name, consisting of the shape type ("brush", "circle", "ellipse", "path", "gradient") and an automatically-incremented integer. You can rename a shape by double-clicking on its current name. It is a good habit to give shapes and groups meaningful names, especially if you intend to reuse the same selection in different masks.

Click on a shape name to show the selected shape on the image canvas with all of its controls, allowing you to edit the properties of just that shape. This is especially useful where there are many overlapping shapes within a mask, making it difficult to select the right one with the mouse. Similarly if you select a shape on-screen from within the mask controls of a processing module, that shape will be selected in the mask manager.

Right-click on a shape name to show a menu containing options to remove the current shape or to remove all shapes not currently in use.

---

**Note:** darktable retains all shapes that have ever been defined for the current image unless you explicitly remove them. If you choose to include develop history when exporting an image, all defined shapes will be exported with the image. Beware that if the list of shapes is very long the space required to store those shapes might exceed the size limit of certain file formats. This can cause XMP tag creation to fail during export.

---

# masks & groups

Masks are constructed by adding a group of shapes to the image in the order that they are listed (from top to bottom). Each shape adjusts the existing mask using one of four logical set operators (see below). Because order is important it is also possible to move shapes up and down the list.

Click on the name of a group in the mask manager to expand that group, showing a list of its constituent shapes. The corresponding shapes will be shown on the center image. Similarly if you choose to show a mask from within a processing module, the corresponding group will be expanded within the mask manager.

Right-click on the group name to display a menu with options to add new or existing shapes to the group, or to clean up unused shapes. You can also choose to delete the group.

Right-click on any of the constituent shapes to control how that shape contributes to the overall group mask:

remove from group
: Remove the shape from the current mask.

use inverted shape
: Invert the polarity of the selected shape.

mode
: Choose how this shape will interact with the preceding mask by selecting one of the four set operators defined below.

move up/down
: Move the shape up or down the list.

You can also create your own groups using existing shapes by selecting the shapes you wish to group, right-clicking them and choosing "group the forms".

## properties

Expand the *properties* section to change the proporties, such as _opacity_, _size_, _feather_, etc, of the currently selected (or created) shapes.

If a _group_ is selected, the soft limits of the sliders are attempt to prevent irreversible distortions (where some of the shapes are clamped at their extreme values whereas others are still adjusted, so that reversing the move does not lead to the original situation). However, like any soft limits, these can be forced.

# set operators (modes)

Set operators are used to define how grouped shapes are combined. In the following examples (with the exception of "sum") we will use a mask that combines a gradient followed by a path, to demonstrate the effect of each set operator when applied to the path shape.

![gradient](./mask-manager/mask-manager_ex1.png#w33#inline) ![path](./mask-manager/mask-manager_ex2.png#w33#inline)

As a convention we say that a pixel is “selected” in a mask or shape if it has an opacity greater than zero.

sum (default)
: The shape adds to the existing mask by increasing its opacity by the opacity of the drawn shape. This allows multiple shapes (e.g. brush strokes) with low opacity to be layered on top of one another to increase the strength of the overall mask (e.g. for dodge and burn operations). The resulting opacity of a given pixel is the sum of the opacity of the individual shapes that intersect with that pixel, up to a maximum of 100%.

union
: The shape adds to the existing mask in such a way that the resulting mask contains the pixels that are *either* selected in the existing mask *or* in the added shape. In overlapping areas the maximum value is taken:

: ![union](./mask-manager/mask-manager_ex3.png#w33)

intersection
: The shape adds to the existing mask in such a way that the resulting mask contains only pixels that are selected in *both* the existing mask *and* the added shape. In overlapping areas the minimum value is used. In the given example we use this operator to “imprint” the path with a gradient:

: ![intersection](./mask-manager/mask-manager_ex4.png#w33)

difference
: In the non-overlapping area the existing mask is unchanged. In the resulting mask, pixels are selected only if they are selected in the existing mask but *not* in the added shape. This set operator can be chosen if you want to “cut out” a region from within an existing selection:

: ![difference](./mask-manager/mask-manager_ex5.png#w33)

exclusion
: The resulting mask selects all pixels that are selected in the existing mask and not in the added shape or vice versa. This is equivalent to an “exclusive or”:

: ![exclusion](./mask-manager/mask-manager_ex6.png#w33)

