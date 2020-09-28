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

1. The upper _attached tags_ section (ie. with the `attach/detatch` buttons under it)

2. The lower _tag dictonary_ section (ie. with the `new/import.../export...` buttons under it)

![tagging-overview](tagging-overview.png)

## attached tags section

The _attached tags_ section in the top part of the module displays tag(s) that are attached to image(s) that are 

- currently selected (if the mouse cursor is not hovering over an image on the lighttable); or

- under the cursor (if hovering over an image in the lighttable view)

At the bottom of the _attached tags_ section are the following buttons, from left to right:

`attach` button
: If a tag is selected in the _tag dictionary_ section (below the _attached tags_ section) this tag will be attached to the selected images.

`detach` button
: If a tag is selected in the _attached tags_ list, the `detach` button will disassociate that tag from the selected images. A tag can also be detached if you `right click` on the tag name and select `detach` from the pop-up menu.

`check mark` [✓] button
: This toggle button allows you to see any hidden tags that darktable has automatically attached to the selected images.

`sort` [⥯] button: 
: This toggle button selects whether the to sort the _attached tags_ list alphabetically or by the count shown in brackets next to the tag (this count indiates how many of the selected images are bearing that tag)

`minus sign` [--] button
: This toggle button selects whether or not to show the parent categories of the tag

Adjust the height of the _attached tags_ window using `Ctrl+mouse wheel`.

## tag dictionary section

The _tag dictionary_ section displays all of the tags that are available in darktable's database. At the top of the _tag dictionary_ section is a text box where tag names can be entered. Below this is a list of available tags, which may include indicator symbols to the left of the tag names. The meanings of these symbols are:

- a `check mark` [✓] symbol indicates that the tag is attached to all the selected images

- a `minus sign` [--] symbol indicates that the tag is attached to at least one of the selected images. If the symbol is next to a category name in the hierarchical _tree_ view, it means one of the child tags under that category is attached to at least one of the selected images.

- if no indicator symbol is present, this means that the tag is not attached to any of the selected images, or the category has no child tags attached to any of the selected images.

In the _tree_ view, a name in italics means that this is a category, not a child tag. Note that categories are just used to organise the tags, and that a category cannot be attached to an image or exported.

Below the _tag dictionary_ list, there are a number of buttons, from left to right:

`new` button
: Create a new tag, using the name that has been entered into the text entry box at the top of the _tag dictionary_ section. 

`import...` button
: Import tags from a Lightroom keyword file.

`export...` button
: Export all tags to a Lightroom keyword file.

`plus sign` [+] toggle button
: Use this to show any tags that have been attached to some of the selected images but not to all of them. This can be useful to see if you want to apply any of those tags to the rest of the selected images.

`list/tree` [☷] button
: this toggles the display of tags between a straight _list_ view and a hierarchical _tree_ view.
 
Adjust the height of the _tag dictionary_ window using `Ctrl+mouse wheel`.

# usage

The following sections describe the operations that can be performed with tags.

## text entry

The text entry box (appearing under the `attach`/`detach` buttons) has multiple purposes.

- If the _tag dictionary_ list is in _list_ view mode (and not _tree_ view mode), then typing the first few characters of a tag will bring up a list of suggestions. You can then scroll down with the `arrow` keys and hit `enter` to select one of the suggestions. Hitting `enter` a second time will attach it to the selected images. You can also edit the name of the tag before hitting `enter` (and the tag will be created if it doesn't already exist in the database). **Note:** if the user finds the auto-completion behaviour annoying, it can be disabled in [`preferences` -> `miscellaneous` -> `disable the entry completion`](../../../preferences-settings/miscellaneous.md).

- Aside from the auto-completion suggestions, typing in some partial text in the text entry box allows you filters set of tags shown in the _tag dictionary_ window to those whose name or synonyms matches the entered text. Press `Enter` to attach a tag with the entered name the entered tag will be attached to theelected images. If that tag name does not yet exist in the database, it will be created before attaching it.

- The pop-up menu entry “copy to entry” can be used to copy a selected tag to the text entry box. You can then edit this name and press `Enter` to create a new tag similar to the one you just selected, making it convenient to create tags with similar names.

## create tag

There are several ways to create a new tag:

- Import a text file. You can import any text file that is in the lightroom tagging file format. You can import several files. You can also export your tags, add information to the exported file, then re-import it. The import function updates the existing tags with new information, and create any new ones. If you change the name of a tag in the import file, it will be treated as a new tag.

- Import already-tagged images. This method does not offer any flexibility to change tag names or categories during the import process.

- Use the “create tag” sub-menu. A tag can be created manually, under an existing one (hierarchical) or at the root level.

- Type into the text box and press the “new” button. Hierarchical tags are created using the pipe symbol “|”. Note that the tag is also attached to selected images.

A number of tags are also generated automatically by dartable (e.g. “darktable|exported” or “darktable|styles|your style”). This help keep track of what actions may have been taken concerning the images. For example, these automatic tags allow you to idenntify which images have previously been exported, or which images have specific styles applied.

## edit/rename tag

The _tag dictionary_ can be mainained via the `edit tag...` and `rename path...` pop-up menu items (`right-click` on a tag in the _tag dictionary_ view).

The `edit tag...` operation allows you to change the name of a tag, but you cannot change which category it belongs to (that is to say, you cannot use the pipe "|" symbol in the tag name field). The command is aborted if you try to enter a tag name that already exists. You can set the _private_ and _category_ flags (see below for these attributes mean), and you can define _synonyms_ for the tag (see below for a description of these attributes). These attributes are recorded in the `XMP-dc Subject` and `XMP-lr Hierarchical Subject` metadata entries, and you can control which tags are exported in the [export selected](../lighttable/export-selected.md) module.

- A tag set as “private” is, by default, not exported. 

- A tag set as “category” is not exported in `XMP-dc Subject`. However it is exported in `XMP-lr Hierarchical Subject` as this XMP metadata holds the organization of your tags.

- “synonyms” enrich the tag information and are mainly used to assist search engines. For example “juvenile”, “kid” or “youth” can be set as synonyms of “child”. Synonyms can also be used to indicate the tag name translated to other languages. 
 
The “rename path...” operation is only aqvailable in the _tree_ view mode, and it shows the number of tags images which would be impacted by a change to the name of this tag or category. The rename path window lets the user change the full path of tag, including the catagories to which it belongs (categories can be specified using the pipe "|" symbol). This operation is powerful, but please take care careful as it can have a large impact on the metadata of your images. The operation is aborted if the requested change causes any conflict with an existing tag.

## attach tag

There are a number of ways to attach an existing tag to a set of selected images. These are:

- `click` on a tag in the _tag dictionary_ window to select it, then `click` on the `attach` button to attach that tag to the selected images
- `right-click` on a tag in the _tag dictionary_ window which will bring up a pop-up menu, then select the “attach tag” menu item to attach that tag to the selected images.
- a `double-click` on a tag in the _tag dictionary_ window will cause that tag to be attached to the selected images.
- `right-click` on a tag shown in the _attached tags_ view to get a pop-up menu, and if not all of the selected images have that tag, the `attach tag to all` menu item will attach that tag to all the selected images.
-  Type into the text box and press the “new” button or `Enter`. This will create the tag if it doesn't already exist, and attach it to the selected images.
- `Ctrl+T` opens a small text box at the bottom of the central view of the lighttable. Type in the name of a tag and press `enter`. The tag will be created if it doesn't exist, and the tag will be attached to all the selected images.

When hovering over the images in the ligthtable you can check which tags are attached to the image, either by looking at the _attached tags_ window in the _tagging_ module, or in the _tags_ attribute in the [image information](./image-information.md) module.

## detach tag

There are several ways to remove a tag from a set of selected images. They are:

- `click` on a tag in the _attached tag_ window of the _tagging_ module to select the tag, then `click` on the `detach` button underneath to remove the tag from the selected images.
- a `double-click` on a tag in the _attached tag_ window will remove that tag from all the selected images.
- `right-click` on a tag in the _attached tag_ window to bring up a pop-up menu, and select the `detach` menu item to remove the tag from all the selected images.

## delete tag

It is possible to completely remove a tag from all images (whether selected or not) and delete the tag from the database. Because this could impact a large number of images, a warning will be displayed indicating how many images have this tag attached. Take this warning seriously because there is no way to undo this action (except by restoring your database and/or XMP sidecar files from a backup). A tag in _tag dictionary_ window can be deleted in the following ways:

- `right-click` on a tag in the _tag dictionary_ window to get a pop-up menu, and choose the `delete tag` item to delete the tag.
- `right-click` on a tag or category in the _tag dictionary_ window to get a pop-up menu, and choose the `delete path` item to delete the tag or category, together with any child tags or categories.

## import - export operations

The “import” button allows you to choose a text file (which must comply with the Lightroom tag text file format) and import its content. If a tag already exists, its properties will be updated, otherwise the tag will be created.

The “export” button exports your entire tag dictionary into a text file of your choice (Lightroom tag text file format).

## navigation

The see the images bearing a particular tag in the _tag dictionary_ window, `right-click` on the tag name and choose the `go to tag collection` item on the pop-up menu. This opens a collection in the _collect images_ module with all the images matching this tag. You can also select other tags in the _collect images_ module by using a `double click` on the collection for the other tag.

To return to the collection that was selected before opening a tag collectioelect the `go back to work` item from the pop-up menu. This will allow you to return to the original collection, as long ans you didn't select any other collections in the meantime.

