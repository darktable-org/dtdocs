---
title: metadata editor
id: metadata-editor
applicable-version: 5.2
tags:
view: lighttable, tethering
---

Edit the metadata of selected images.

Metadata is freeformat text (title, description, creator, publisher, rights etc.) that describes your images.

# module controls

reset
: Delete visible metadata (see below) from the selected images.

metadata entry fields
: A separate entry field is displayed for each visible metadata item, containing its current value (if any). Press Ctrl+Enter to insert a new line in a field. Double-click on a field's label to delete the contents of that field.

: When several images are selected that have differing values for a given field, the module displays "_\<leave unchanged\>_" for that field -- if you choose to apply changes, these fields will not be changed. If you right-click on such a field, the different values are listed at the end of the contextual menu. Select one of those values to apply that value to all of the selected images.

: Hold Ctrl while scrolling with your mouse to increase the height of a field's entry box. 

apply
: Apply new settings from the metadata entry fields to the selected images.

# keyboard

You may use the keyboard to navigate and apply changes while any of the metadata entry boxes have focus, as follows:

- The Tab key saves the current field and moves the cursor to the next field. When the last field is reached, the Tab key returns focus to the first field.

- Shift+Tab works the same as Tab, but in the opposite direction.

- The Enter key saves the current field without moving the cursor.

# preferences

The "preferences" option in the presets menu brings up a dialog where you can configure what metadata tags to display and how they are handled within darktable. For each metadata item, two check boxes allow you to restrict how metadata is handled as follows:

visible
: Show or hide this metadata field. Hidden fields are not included in exported images.
 
private
: Keep this metadata field private. Private fields are not included in exported images.

The display name of a metadata field can be changed by clicking on it. Drag-and-drop the rows to change the display order.

To add new metadata fields to the module, press the "+" button at the bottom of the dialog. This will allow you to search for the tags you want to add in a new dialog. Tags can be added by either double-clicking on a tag name or pressing the "add" button. Press "done" to update the metadata editor with the new tags.

All tags in this module are available for display in the [image information](./image-information.md) module, updating in the [import](../lighttable/import.md) module and filtering in the [collections](./collections.md) module.

The field values can be used in [variable substitution](../../../special-topics/variables.md) using the full case sensitive Xmp tag name as the variable name, i.e. `Xmp.iptc.location`.
