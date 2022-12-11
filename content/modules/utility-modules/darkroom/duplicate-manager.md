---
title: duplicate manager
date: 2022-12-04T02:19:02+01:00
id: duplicate-manager
applicable-version: 3.6
tags:
view: darkroom
---

View and create multiple versions of the current image. Each version can be edited independently without affecting other versions -- all versions use the same underlying image file, but the editing history of each version is stored in its own independent XMP sidecar file.

The duplicate manager lists each version of the current darkroom image along with its preview thumbnail. Hold down the left mouse button on a thumbnail to temporarily show that version in the center view. Double-click to switch to that version and edit it.

The buttons at the bottom of the module allow you to create new duplicates of the current image. You can either create a 'virgin' version (with an empty history stack) using the "original" button or an exact duplicate of the current edit using the "duplicate" button.

A version number is displayed to the right of each thumbnail. Click in the area below the version number to enter a description against that version of the image. This description is stored in the _version name_ metadata tag, which can also be edited within the [metadata editor](../shared/metadata-editor.md) module in the lighttable view.
