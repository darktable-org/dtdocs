---
title: presets
id: presets
weight: 130
draft: false
---

This menu gives you an overview of the [presets](../darkroom/interacting-with-modules/presets.md) that are defined for darktable's modules. In this dialog you can select whether a user-defined preset should be auto-applied to matching images. By pressing the “import” button at the bottom of the window you can import a saved presets. Pressing the "export" button at the bottom of the window will allow you to choose directory to which you want to export all of your presets excluding predefined presets. 

Pre-defined presets (those that are included by default within darktable) are shown with a lock symbol. Their auto-apply properties cannot be changed.

Selecting a user-defined preset and pressing Enter or double-clicking on it will open an edit dialog. This allows the chosen preset to be edited, saved to an external `.dtpreset` file or deleted. Selecting a user-defined preset and pressing the Delete key will delete the preset.

auto apply this preset to matching images
: Activate this checkbutton to automatically apply the preset to newly imported images -- a set of fields is displayed where you can define patterns to be matched against Exif data.

only show this preset for matching images
: Activate this checkbutton to hide the preset in darkroom mode if it does not match the defined patterns.

model
: A pattern to be matched against the Exif field that describes your camera model; use % as wildcard.

maker
: A pattern to be matched against the Exif field that describes the maker of your camera; use % as wildcard.

lens
: A pattern to be matched against the Exif field that describes your lens; use % as wildcard.

iso
: Only apply the preset if the ISO value of your image lies within the given range.

exposure
: Only apply the preset if the exposure time of your image lies within the given range; set + as the upper value to match arbitrarily long exposures.

aperture
: Only apply the preset if the aperture of your image lies within the given range; set f/0 as the lower value to match arbitrarily open apertures; set f/+ as the upper value to match arbitrarily closed apertures.

focal length
: Only apply the preset if the focal length of your image lies within the given range (from 0 to 1000). 

See the [presets](../darkroom/interacting-with-modules/presets.md) section for more information.

