---
title: The Pixelpipe and Module Order
id: the-pixelpipe-and-module-order
weight: 20
draft: false
---

## The Pixelpipe

The sequence of modules operating on an input file in a defined order to generate an output image is known as the "pixelpipe".

### Module Order and Workflows

The order in which modules are executed within the pixelpipe has been carefully chosen to give the best output quality. In previous versions of darktable it was not possible to change the module order. However, there are a number of very specific use cases and workflows where the movement of some modules in the pipe is advised.

One of the main reasons to change the module order came about with darktable version 3.0 which introduced the new _scene-referred_ way of working. Version 3.2 formalised this by introducing _workflows_, which are controlled via settings in the _processing_ tab of the _preferences_ dialog.

These workflows primarily differ in when the high-dynamic-range input from the camera is compressed to fit the dynamic range of the output medium.

#### Display-Referred Workflow

Prior to version 3.0 darktable's workflow was _display-referred_. The _base curve_ or _filmic_ module was placed early in the pixelpipe and most other darktable modules operated on image data only after its dynamic range had already been compressed to match the output medium (monitor) by one of these modules.

This method of operation is still enabled by default by setting the _pixel workflow defaults_ to "display-referred". This setting enables the legacy (pre-darktable-3.0) module order and automatically switches on the _base curve_ module for new images.

Unfortunately, within the display-referred workflow, most image operations take place on non-linear input data, which is not physically realistic and can lead to artifacts with some modules.

#### Scene-Referred Workflow

The new _scene-referred_ workflow was introduced as part of darktable 3.0. The module order was entirely rearranged to place the _filmic rgb_ and _base curve_ modules at the end of a sequence of modules designed to work in _linear rgb_ space and before the modules that only work in display-referred (usually _Lab_) space. It is recommended that the majority of image processing takes place using modules up to and including the _filmic rgb_ module. Operations in this section of the pixelpipe, being truly linear, are much more physically realistic and produce fewer artifacts.

This method of operation can be enabled by setting the _pixel workflow defaults_ to "scene-referred" in the _preferences_ dialog. This enables the new (darktable 3.0+) module order and automatically enables the _exposure_ and _filmic rgb_ modules with some presets designed to act as a reasonable starting point for scene-referred image editing.

### Module order in the GUI

It is important to note that the order in which image operation modules are executed matches exactly the order in which the modules appear in darktable's GUI. The pixelpipe runs from the bottom to the top of the modules as they appear in the darkroom (i.e. RAW image at the bottom of the pipe and output image at the top). **Changing the order of the modules in the GUI will change how your image is processed.**

It is still highly recommended that users not change the order of module execution for a number of reasons:

* The sequence of modules has been selected with great care in order go give highest output quality. Changes to the sequence can often worsen the result rather than improving it.
* Certain image processing steps simply don't make sense if they are shifted in the pixelpipe. To mention just a few: highlight reconstruction needs to be done on raw data before demosaicing and the demosaic step needs to be performed before any input color profile can be applied. For this reason it is still not possible to move some of the modules that are placed early in the pixelpipe.
* Most of darktable's modules are designed to work within a specific color space (see **LINK TBC** _color management_ for more details). Full flexibility would require modules to support different parallel algorithms depending on the color space they are working in – this would drastically increase complexity.

### Changing Module Order

Despite the general recommendation to leave the pixelpipe order alone, it is possible to move modules within the pixelpipe by holding _Ctrl+Shift_ and dragging and dropping the desired module to a new location. This should only be done by experienced users who understand the impact this will have on the image.

The module order can be manually changed back to either the _3.0_ or _legacy_ versions using the _module order_ module, which can also be used to define your own custom order.
