---
title: metadata editor
id: metadata-editor
applicable-version: 3.2.1
tags:
view: lighttable, tethering
---

Edit the metadata  of selected images.

Metadata is freeformat text (title, description, creator, publisher, rights etc.) that describes your images.

# module controls

metadata entry fields
: A separate field is displayed for each metadata item. Hold Ctrl while scrolling with your mouse to increase the height of a field. Press Ctrl+Enter to insert a new line. Press Enter to apply any text entered in the current metadata field to the selected images. Double-click on a field's label to delete the contents of that field.

apply
: Apply new settings from the metadata entry fields to the selected images.

reset button
: Delete existing metadata from the selected images.

# preferences

The “preferences…” option in the presets menu brings up a dialog where you can configure how metadata is handled within darktable. For each metadata item, two check boxes allow you to restrict how metadata is handled:

visible 
: Show or hide this metadata field. Hidden fields are not displayed anywhere in darktable and are not be included in exported images.

private
: Keep this metadata field private. Private fields are displayed within darktable but are not be included in exported images.

Fields with both options unchecked are displayed within darktable and included in exported images.
