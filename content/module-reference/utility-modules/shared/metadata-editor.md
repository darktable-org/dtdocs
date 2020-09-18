---
title: metadata editor
id: metadata-editor
applicable-verison: 3.2.1
tags: 
view: lighttable, tethering
---

Edit the metadata (title, description, creator, publisher, rights etc.) of selected images. You can define your own presets if you need to apply specific settings frequently.

_Ctrl+scroll_ on any field to increase its height. Use _Ctrl+Enter_ to insert a new line.

# module controls

clear
: Delete existing metadata from the selected image(s).

apply
: Apply new settings, as defined in the fields above, to the selected image(s).

configure metadata
: Click this button to bring up a dialog to configure how metadata is handled within darktable. For each metadata item, two check boxes are available to allow you to restrict how metadata is handled:
: _hidden_: Hide this metadata field. It will not be displayed anywhere in darktable's interface and will not be included in exported images.
: _private_: Keep this metadata field private. It will be displayed within darktable's interface but will not be included in exported images.
: _(none)_: If both options are unchecked, the field will be displayed within darktable's interface and will be included in exported images.
