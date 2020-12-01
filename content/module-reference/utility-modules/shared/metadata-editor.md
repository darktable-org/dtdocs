---
title: metadata editor
id: metadata-editor
applicable-verison: 3.2.1
tags: 
view: lighttable, tethering
---

Edit the metadata (title, description, creator, publisher, rights etc.) of selected images. 

# module controls

metadata entry fields
: A separate field is displayed for each metadata item. Hold Ctrl while scrolling with your mouse to increase the height of a field. Press Ctrl+Enter to insert a new line. Press Enter to apply any text entered in the current metadata field to the selected images.

clear
: Delete existing metadata from the selected images.

apply
: Apply new settings, from the metadata entry fields, to the selected images.

configure metadata
: Click this button to bring up a dialog where you can configure how metadata is handled within darktable. For each metadata item, two check boxes are available which allow you to restrict how metadata is handled:
: - _hidden_: Hide this metadata field. It will not be displayed anywhere in darktable and will not be included in exported images.
: - _private_: Keep this metadata field private. It will be displayed within darktable but will not be included in exported images.
: If both options are unchecked, the field will be displayed within darktable and included in exported images.
