---
title: tagging
id: tagging
applicable-verison: 3.2.1
tags: 
view: lighttable, [darkroom], tethering, map
---

This module is used to manage tags on images.  Tags provide the means of adding information to the images within a given keyword dictionary. You can manage tags as a hierarchical tree, which is useful when their number becomes large. Only a tags at the leaf of the tree adds information to an image; parent tags on the other hand just serve as category moarks to organise the leaf tags. For example, in the “color|white” tag “color” is a category for the “white” tag.

Tags are physically stored in both XMP sidecar files associated with each image as well as in the darktable database.

# module sections

The tagging module consists of two sections

1. The upper “attached tags” section

2. The lower “tag dictonary” section

## attached tags section

The _attached tags_ section in the top part of the module displays tag(s) that are currently attached to the image:

- under the cursor (if hovering over an image in the lighttable view) or

- the selected image(s) (if the mouse cursor is not hovering over an image on the lighttable)

At the bottom of the _attached tags_ section there are the following buttons, from left to right:

attach button
: if a tag is selected in the _tag dictionary_  section below the _attached tags_ section then this tag will be attached to the selected image(s), and it will then appear in the _attached tags_ list.

detach
: if a tag is selected in the _attached tags_ list, then this button will detach the tag from the selected image(s), and it will no longer appear in the _attached tags_ list. A tag can also be detached with a `right click` on the tag name and selected "detach" from the pop-up menu.

checkmark button
: this button will toggle the display of any tags in the _attached tags_ that darktable has automatically attached to the selected image(s).

sort button
: this button toggles whether the to sort the _attached tags_ list alphabetically or by the selected image count of each tag (shown in brackets to the right of the tag name).

collapse button
: this button toggles whether the attached tags list will show the full path name of each tag (ie. including a list of its parent categories), or whether it will just show the the name of the tag itself.

`ctrl-mouse wheel`
: adjust the hright of the _attached tags_ list.

## tag dictionary section

The _tag dictionary_ section displays all tags that are available in the darktable database. At the top of the _tag dictionary_ section is a text box where tag names can be entered. Below this is a list of available tags, which may include indicator symbols to the left of the tag names. The meanings of these symbols are:

- a "check-mark" means that all images selected are attached to this tag.

- a "minus" sign it indicates that the tag is attached to at least one of the selected images. In the heirarchical tree view, a "minus" sign next to a parent category name means that at least one child tag is attached to one of the selected images.

- no indicator means that the tag is not attached to any of the selected images. In the heirarchical tree view, no indicator means that none of the child tags are attached to any of the selected images.

In the heirarchical tree view, if the name is in italics it means it is a category rather than a child tag, which is just used to organise the tags. Such categories cannot be directly attached to an image, and cannot be exported.

Below the _tag dictionary list_ are a number of buttons, from left to right:

new
: used to create a new tag, using the name that has been entered into the text entry box at the top of the _tag dictionary_ section. 

import...
: imports tags from a Lightroom keyword file.

export...
: exports all tags to a Lightroom keyword file.

`-` toggle button
: toggles the _tag dictionary_ list to only show tags that have been applied to a proper subset of the selected images (ie. hide tags that have been applied to all or none of the selected images). This can be useful to see if you want to apply any of those tags to the remainder of the selected images.

# usage

The following sections describew the operations that can be performed on tags.

## text entry
The text entry box, between the two lists, has multiple purposes.  First, for those who like not to leave the keyboard, when the dictionary view is in list mode, as soon as you start to enter a keyword, it opens a list of corresponding tags. When you see the one you look for, use the `down` arrow to highlight it, press twice `enter` to get the tag attached ! This auto completion behaviour can be disabled in the preferences item "disable the entry completion".

Besides this, the entry box lets you filter the dictionary (list and tree) just below searching amongst the tag names but also the synonyms. If you then press `enter` this tag will be attached to the selected images. If the tag does not yet exist in the database, it will be created before attaching it.

The pop-up menu entry “copy to entry” can be used to copy a selected tag to the text entry box. You can then edit this name and press `enter` to create a new tag similar to the one you just selected, which makes it convenient to create tags with similar names..

## create tag

There are several ways to create a new tag:

- On import of a text file. You can import whatever text file as soon as it follows the lightroom tagging file format. It is possible to import several files. It is also possible to export your tags, add information in it and re-import it. As long as you don't change the tag name, the import function updates the existing tags with new information and create the new ones.

- On import of already tagged images. This is not a well controlled way especially if your dictionary is hierarchical.

- In submenu “create tag”. A tag can be created manually, under an existing one (hierarchical) or at the root level.

- By typing into the text box and pressing the “new” button. Hierarchical tags are created using the pipe symbol “|”. Note that the tag is also attached to selected images.

As you may notice there are automatically created tags like “darktable|exported” or “darktable|styles|your style”, which keep track of your actions and let you easily find already exported images or images with specific styles applied.

## edit/rename tag

The maintenance of the dictionary can be done through “edit tag...” and “rename path...” submenu (right-click on dictionary view tag).

The command “edit tag...” shows the number of tags and images which are potentially impacted by a change of this tag. The edit window lets the user change the name of a node on the path but not the rest of the path of hierarchical tags (pipe symbol “|” not allowed). The command is aborted if there is at least one tag corresponding to the new name. “private”, “category” flags and “synonyms” can be change here. These attributes help to control the information you attach to exported images. This information is recorded in the “XMP-dc Subject” and “XMP-lr Hierarchical Subject” metadata entries.

- A tag set as “private” is by default not exported. The configuration point "force exportation of private tags" allows you to keep private tags on exported images. Both “XMP-dc Subject” and “XMP-lr Hierarchical Subject” are affected.

- A tag set as “category” is not exported in “XMP-dc Subject”. However it is exported in “XMP-lr Hierarchical Subject” as this XMP metadata holds the organization of your tags.

- “synonyms” enriches the tag information and is mainly destined to search engines. For example “juvenile”, “kid” or “youth” can be set as synonyms of “child”. An other usage is to translate the tag in other languages. The configuration point "request exportation of synonyms", when set, makes the image exportation add synonyms to “XMP-dc Subject” metadata.
 
The command “rename path...” appears only on the tree view and shows the number of tags and images which are potentially impacted by a change of this tag. The rename path window lets the user change the full path of tag. You can or remove the pipe symbol “|”.  This command is powerful but you must know what your doing. The command is aborted if there is at least one tag corresponding to the new path.

## attach tag

Selected tags are attached to selected images with the following actions.

- `click` on button “attach” attaches the selected tag in dictionary.
- `right-click` on a tag of dictionary view and sub-menu “attach tag”
- `double-click` on a tag n the _tag dictionary_ list.
- `right-click` on a tag of attached view and sub-menu “attach tag to all”
-  Typing into the text box and pressing the “new” button or `enter`. Note that the tag is also created if doesn't exist already.
- `ctrl+t` opens a small text box at the bottom of the central view for quickly tagging your selected images by typing a tag phrase and hitting `enter`.

If you hovering over the images in ligthtable you can check which tags are attached to the image, either by looking at the _attached tags_ list or in the _image information_ module.

## detach tag

An attached tag can be detached in the following ways.

- `click` on button “detach” detaches the selected tag in attached view.
- `double-click` on a tag of attached view.
- `right-click` on a tag of attached view and sub-menu “detach”

## delete tag

Delete a tag from the list and from all images. A warning will be displayed on how many images have this tag attached. Take this warning seriously as there is no way to recover or later find the affected images (except backup). A tag in dictionary view can be deleted in the following ways.

- `click` on button “delete” delete the selected one.
- `right-click` on a tag of dictionary view and sub-menu “delete tag”.
- `right-click` on a tag of dictionary view and sub-menu “delete branch”. In that case the tag itself and sub tags are deleted.

## import - export operations

The button “import” let you choose a text file, which must follows the lightroom tag text file format and import its content. If a tag already exists, its properties will be updated, otherwise the tag is created.

The button “export” exports all your tag dictionary into a text file of your choice (lightroom tag text file format).

## navigation

`right-click` on an attached tag (count not null) in the dictionary view make appear in the submenu an entry “go to tag collection”. This opens the collection associated to this tag and let you see the images which have this tag attached. It is possible to jump from one tag collection to the other.

To come back to the original collection, where you were working before moving to a tag collection, the submenu presents the entry “go back to work”. This option is kept as long your don't change the collection in collect module and you are not back to the original collection.

