---
title: metadata editor
id: metadata-editor
applicable-version: 3.2.1
tags:
view: lighttable, tethering
---

Edit the metadata of selected images.

Metadata is freeformat text (title, description, creator, publisher, rights etc.) that describes your images.

When several images are selected and these images have a different values for a given metadata, the module displays _<leave unchanged>_ (in case you apply). Click Right on the field shows the different values at the end of the contextual menu. If you select one of them it becomes the common value, which can be saved afterwords.

# module controls

reset
: Delete visible (see below) metadata from the selected images.

metadata entry fields
: A separate field is displayed for each metadata item. Hold Ctrl while scrolling with your mouse to increase the height of a field. Press Ctrl+Enter to insert a new line. Press Enter to apply any text entered in the current metadata field to the selected images. Double-click on a field's label to delete the contents of that field.

apply
: Apply new settings from the metadata entry fields to the selected images.

# keyboard

- Tab key saves the field, moves forward the cursor to the next field, and to the last field loops to the first one.

- Shift+Tab does the same, backward.

- Enter save the field but doesn't move the cursor.

# preferences

The “preferences…” option in the presets menu brings up a dialog where you can configure how metadata is handled within darktable. For each metadata item, two check boxes allow you to restrict how metadata is handled:

visible
: Show or hide this metadata field. Hidden fields are not included in exported images.

private
: Keep this metadata field private. Private fields are not included in exported images.
