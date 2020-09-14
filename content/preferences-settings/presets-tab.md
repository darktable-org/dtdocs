---
title: Preferences - presets tab
date: 2020-09-09
draft: false
---

This menu gives you an overview of the presets that are defined for darktable's modules. In this dialog you can select whether a certain user defined preset shall be auto-applied to matching images. By pressing the “import” button at the bottom of the window you can import a saved preset.

darktable already comes with a set of pre-defined presets for several modules. In addition you can define your own presets from within each module in darkroom mode (see **LINK TBC**).

Pre-defined presets are shown with a lock symbol. Their auto-apply properties cannot be changed.

Double clicking on a user-defined preset will open a menu. This allows the preset to be edited or saved to an external `.dtpreset` file. 

auto apply this preset to matching images
: Activate this checkbutton to automatically apply the preset on newly imported images; a set of fields is displayed where you can define patterns to be matched against Exif data.

only show this preset for matching images
: Activate this checkbutton to hide the preset in darkroom mode if it does not match the defined patterns.

model
: A pattern to be matched against the Exif field that describes your camera model; use "%" as wildcard.

maker
: A pattern to be matched against the Exif field that describes the maker of your camera; use "%" as wildcard.

lens
: A pattern to be matched against the Exif field that describes your lens; use "%" as wildcard.

iso
: Only apply the preset if the ISO value of your image lies within the given range.

exposure
: Only apply the preset if the exposure time of your image lies within the given range; set "+" as the upper value to match arbitrarily long exposures.

aperture
: Only apply the preset if the aperture of your image lies within the given range; set "f/0" as the lower value to match arbitrarily open apertures; set "f/+" as the upper value to match arbitrarily closed apertures.

focal length
: Only apply the preset if the focal length of your image lies within the given range (from 0 to 1000). 