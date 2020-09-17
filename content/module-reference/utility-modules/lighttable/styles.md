---
title: styles
id: styles
applicable-verison: 3.2.1
tags: 
view: lighttable
---

Store an image's history stack (as a named style) and apply it to other images. Styles can either be created within this panel or in the [_history stack_](../darkroom/history-stack.md) module in the darkroom. This module allows you to create, apply, edit and delete styles.

A list of all available styles is displayed at the top of the module. A search field above the list allows you to input a text string which can be used to filter styles by their name or description.

Double clicking on a style name applies the style to all selected images. 

# module controls

create duplicate
: When applying a style to selected images, activating this box creates a duplicate of the image before applying the style. Disable this option if you want to try various styles without creating multiple duplicates. Beware that in this case any existing history stack is overwritten and cannot be recovered.

mode
: As with the lighttable [_history stack_](./history-stack.md) module, this combobox allows you to either "append" the style to the current history stack or to "overwrite" the history stack of the target image.

create
: This creates new style(s) using the history stack of the selected image(s). For each selected image a style creation window is shown. You must supply a unique name for each new style and you can add an additional description. You have the option to de-select those history stack items which you want to not be part of the newly created style.

: The panel supports a hierarchical view, this means you can create categories using the pipe symbol “|” as a separator. For example “print|tone curve +0.5 EV” will create a print category with a style of "tone curve +0.5 EV" below it.

edit
: Select "edit" to bring up a dialog which allows you to include or exclude specific items from the stack. Check the “duplicate” option if you want to create a new style, instead of overwriting the existing one. In this case you will need to provide a unique name for the new style.

remove
: Delete the selected style, without any further prompt.

import
: Import a previously saved style. Styles are stored as XML files with the extension “.dtstyle”.

export
: Save the selected style to disk as a “.dtstyle” file. This allows styles to be published and shared with other users.
