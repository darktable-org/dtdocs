---
title: metadata editor
id: metadata-editor
applicable-version: 4.0
tags:
view: lighttable, tethering
---

Edit the metadata of selected images.

Metadata is freeformat text (title, description, creator, publisher, rights etc.) that describes your images.

When several images are selected having different values for a given metadata field, the module displays _<leave unchanged>_ for that field -- if you choose to apply changes, these fields will not be changed. If you right-click on the field the different values are listed at the end of the contextual menu. Select one of the values in the menu to apply that value to all of the selected images -- the change will be saved once you press the "apply" button or the Enter/Tab key.

# module controls

reset
: Delete visible (see below) metadata from the selected images.

metadata entry fields
: A separate field is displayed for each metadata item. Hold Ctrl while scrolling with your mouse to increase the height of a field. Press Ctrl+Enter to insert a new line. Double-click on a field's label to delete the contents of that field.

apply
: Apply new settings from the metadata entry fields to the selected images.

# keyboard

You may use the keyboard to navigate and apply changes while any of the metadata entry boxes have focus:

- The Tab key saves the current field and moves the cursor to the next field. When the last field is reached, the Tab key returns focus to the first field.

- Shift+Tab works the same as Tab, but in the opposite direction.

- The Enter key saves the current field without moving the cursor.

# preferences

The "preferences…" option in the presets menu brings up a dialog where you can configure how metadata is handled within darktable. For each metadata item, two check boxes allow you to restrict how metadata is handled:

visible
: Show or hide this metadata field. Hidden fields are not included in exported images.

private
: Keep this metadata field private. Private fields are not included in exported images.
