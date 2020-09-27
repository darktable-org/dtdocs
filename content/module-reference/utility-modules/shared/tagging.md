---
title: tagging
id: tagging
applicable-verison: 3.2.1
tags: 
view: lighttable, [darkroom], tethering, map
---

This module is used to manage tags on images.  Tags provide a means of adding information to images using a keyword dictionary. You can manage tags as a hierarchical tree, which can be useful when their number becomes large. Only a tags at the leaf of the tree add information to an image. Parent tags just serve as category moarks to organise the leaf tags. For example, in the “color|white” tag, “color” is a category for the “white” tag.

Tags are physically stored in [XMP sidecar files](../../../overview/sidecar-files/_index.md) as well as in darktable's library database.

# module sections

The tagging module consists of two sections

1. The upper “attached tags” section

2. The lower “tag dictonary” section

## attached tags section

The _attached tags_ section in the top part of the module displays tag(s) that are attached to image(s) that are 

- currently selected (if the mouse cursor is not hovering over an image on the lighttable); or

- under the cursor (if hovering over an image in the lighttable view)

At the bottom of the _attached tags_ section are the following buttons, from left to right:

attach 
: If a tag is selected in the _tag dictionary_  section (below the _attached tags_ section) this tag will be attached to the selected image(s), and it will then appear in the _attached tags_ list.

detach
: If a tag is selected in the _attached tags_ list, this button will detach the tag from the selected image(s), and it will no longer appear in the _attached tags_ list. A tag can also be detached by `right clicking` on the tag name and selecting "detach" from the pop-up menu.

checkmark 
: Toggle the display of any tags in the _attached tags_ that darktable has automatically attached to the selected image(s).

sort 
: This button toggles whether the to sort the _attached tags_ list alphabetically or by the selected image count of each tag (shown in brackets to the right of the tag name).

collapse 
: This button toggles whether the attached tags list will show the full path name of each tag (ie. including a list of its parent categories), or just the name of the tag itself.

Hold `Ctrl` while scrolling the mouse wheel to adjust the height of the _attached tags_ list.

## tag dictionary section

The _tag dictionary_ section displays all of the tags that are available in darktable's database. At the top of the _tag dictionary_ section is a text box where tag names can be entered. Below this is a list of available tags, which may include indicator symbols to the left of the tag names. The meanings of these symbols are:

- a "check-mark" indicates that all images selected are attached to this tag.

- a "minus" sign indicates that the tag is attached to at least one of the selected images. In the heirarchical tree view, a "minus" sign next to a parent category name means that at least one child tag is attached to one of the selected images.

- if no indicator is present, this means that the tag is not attached to any of the selected images. In the heirarchical tree view, no indicator means that none of the child tags are attached to any of the selected images.

In the heirarchical tree view, if the name is in italics it means it is a category rather than a child tag. Categories are just used to organise the tags and cannot be directly attached to an image or exported.

Below the _tag dictionary list_ are a number of buttons, from left to right:

new
: Create a new tag, using the name that has been entered into the text entry box at the top of the _tag dictionary_ section. 

import...
: Import tags from a Lightroom keyword file.

export...
: Export all tags to a Lightroom keyword file.

`-` toggle button
: Toggle the _tag dictionary_ list to only show tags that have been applied to a proper subset of the selected images (i.e. hide tags that have been applied to all or none of the selected images). This can be useful to see if you want to apply any of those tags to the remainder of the selected images.

# usage

The following sections describe the operations that can be performed on tags.

## text entry
The text entry box, between the two lists, has multiple purposes.  First, for those who prefer not to leave the keyboard, when the dictionary view is in list mode, as soon as you start to enter a keyword, a list of corresponding tags is opened. When you see the one you are looking for, use the `down` arrow to highlight it, press `Enter` twice to attach the tag. This auto completion behaviour can be disabled in [`preferences` -> `miscellaneous` -> `disable the entry completion`](../../../preferences-settings/miscellaneous.md).

The entry box also allows you to filter the dictionary (list and tree) by searching both tag names and synonyms. If you then press `Enter` the entered tag will be attached to the selected images. If the tag does not yet exist in the database, it will be created before attaching it.

The pop-up menu entry “copy to entry” can be used to copy a selected tag to the text entry box. You can then edit this name and press `Enter` to create a new tag similar to the one you just selected, making it convenient to create tags with similar names.

## create tag

There are several ways to create a new tag:

- Import a text file. You can import any text file as long as it follows the lightroom tagging file format. It is possible to import several files. It is also possible to export your tags, add information to the exported file and re-import it. As long as you don't change the tag name, the import function updates the existing tags with new information and create any new ones.

- Import already-tagged images. This is not a well controlled method especially if your dictionary is hierarchical.

- Use the “create tag” sub-menu. A tag can be created manually, under an existing one (hierarchical) or at the root level.

- Type into the text box and press the “new” button. Hierarchical tags are created using the pipe symbol “|”. Note that the tag is also attached to selected images.

dartable also automatically creates a number of tags (e.g. “darktable|exported” or “darktable|styles|your style”) which keep track of your actions and, for example allow you to easily find already exported images or images with specific styles applied.

## edit/rename tag

The tag dictionary can be mainained via the “edit tag...” and “rename path...” submenus (`right-click` on a tag in dictionary view).

The command “edit tag...” shows the number of tags and images which are potentially impacted by a change to the given tag. The edit window lets the user change the name of a node on the path but not the rest of the path of hierarchical tags (pipe symbol “|” not allowed). The command is aborted if there is at least one tag corresponding to the new name. Tags with the “private”, “category” “synonyms” flags can be changed here. These attributes help to control the information you attach to exported images. This information is recorded in the `XMP-dc Subject` and `XMP-lr Hierarchical Subject` metadata entries. You can control which tags are exported in the [export selected](../lighttable/export-selected.md) module.

- A tag set as “private” is, by default, not exported. 

- A tag set as “category” is not exported in `XMP-dc Subject`. However it is exported in `XMP-lr Hierarchical Subject` as this XMP metadata holds the organization of your tags.

- “synonyms” enrich the tag information and are mainly destined for use in search engines. For example “juvenile”, “kid” or “youth” can be set as synonyms of “child”. An other usage is to translate the tag to other languages. 
 
The command “rename path...” appears only on the tree view and shows the number of tags and images which are potentially impacted by a change of this tag. The rename path window lets the user change the full path of tag. You can add or remove the pipe symbol “|”.  This command is powerful but you must know what your doing. The command is aborted if there is at least one tag corresponding to the new path.

## attach tag

Selected tags are attached to selected images with the following actions.

- `click` on the “attach” button to attach the tag selected in the dictionary.
- `right-click` on a tag in the dictionary view and sub-menu “attach tag”
- `double-click` on a tag n the _tag dictionary_ list.
- `right-click` on a tag of attached view and sub-menu “attach tag to all”
-  Type into the text box and press the “new” button or `Enter`. Note that the tag is also created if it doesn't already exist.
- `Ctrl+T` opens a small text box at the bottom of the central view for quickly tagging your selected images by typing a tag phrase and pressing `Enter`.

When hovering over the images in the ligthtable you can check which tags are attached to the image, either by looking at the _attached tags_ list or in the [image information](./image-information.md) module.

## detach tag

An attached tag can be detached in the following ways.

- `click` on the “detach” button to detach the tag selected in the attached view.
- `double-click` on a tag in the attached view.
- `right-click` on a tag in the attached view and sub-menu “detach”

## delete tag

Delete a tag from the list and from all images. A warning will be displayed showing many images have this tag attached. Take this warning seriously as there is no way to recover or later find the affected images (except by taking a backup). A tag in dictionary view can be deleted in the following ways.

- `click` on the “delete” button to delete the selected tag.
- `right-click` on a tag in the dictionary view and sub-menu “delete tag”.
- `right-click` on a tag in the dictionary view and sub-menu “delete branch”. In this case the tag and its sub tags are deleted.

## import - export operations

The “import” button allows you to choose a text file, which must follow the lightroom tag text file format and import its content. If a tag already exists, its properties will be updated, otherwise the tag will be created.

The “export” button exports your entire tag dictionary into a text file of your choice (Lightroom tag text file format).

## navigation

`right-click` on an attached tag in the dictionary view make appear in the submenu an entry “go to tag collection”. This opens the collection associated to this tag and let you see the images which have this tag attached. It is possible to jump from one tag collection to the other.

To come back to the original collection, where you were working before moving to a tag collection, the submenu presents the entry “go back to work”. This option is kept as long your don't change the collection in collect module and you are not back to the original collection.

