---
title: duplicate manager
id: duplicate-manager
---

View and create multiple versions of the current image. Each version can be edited independently without affecting other versions -- all versions use the same underlying image file, but the editing history of each version is stored in its own independent XMP sidecar file. 

The duplicate manager lists each version of the current darkroom image along with its preview thumbnail. Hold down the left mouse button on a thumbnail to temporarily show that version in the center view. Double-click to switch to that version and edit it. 

Buttons to manage the duplicates are shown to the right of each preview thumbnail:

![duplicate with history](./dupicate-manager/copy-current.png#icon) duplicate with history 
: Create a new duplicate with the same history stack (only shown if the selected duplicate has been edited).

![duplicate original](./duplicate-manager/copy-original.png#icon) duplicate original 
: Create a new duplicate with no edit history.

![delete](./duplicate-manager/delete.png#icon) delete 
: Delete the duplicate.

A version number is displayed to the right of each thumbnail. Click in the area below the version number to enter a description against that version of the image. This description is stored in the _version name_ metadata tag, which can also be edited within the [metadata editor](../shared/metadata-editor.md) module in the lighttable view.
