---
title: building user interface elements
id: building-ui-elements
weight: 70
draft: false
author: "people"
---

Our previous example was a bit limited. In particular the use of a preference for the export path wasn't very nice. We can do better than that by adding elements to the user interface in the export dialog.

UI elements are created via the `darktable_new_widget` function. This function takes a type of widget as a parameter and returns a new object corresponding to that widget. You can then set various fields in that widget to set its parameters. You will then use that object as a parameter to various functions that will add it to the darktable UI. The following simple example adds a lib in the lighttable view with a simple label

```
local my_label = darktable.new_widget("label")
my_label.label = "Hello, world !"

dt.register_lib("test","test",false,{
    [dt.gui.views.lighttable] = {"DT_UI_CONTAINER_PANEL_LEFT_CENTER",20},
    },my_label)
```

There is a nice syntactic trick to make UI elements code easier to read and write. You can call these objects as functions with a table of key values as an argument. This allows the following example to work. It creates a container widget with two sub-widgets: a label and a text entry field.

```
   local my_widget = darktable.new_widget("box"){
      orientation = "horizontal",
      darktable.new_widget("label"){ label = "here => " },
      darktable.new_widget("entry"){ tooltip = "please enter text here" }
   }
```

Now that we know that, let's improve our script a bit.

```
darktable = require "darktable"

local scp_path = darktable.new_widget("entry"){
  tooltip ="Complete path to copy to. Can include user and hostname",
  text = "",
  reset_callback = function(self) self.text = "" end
}

darktable.register_storage("scp_export","Export via scp",
  function( storage, image, format, filename,
     number, total, high_quality, extra_data)
    if coroutine.yield("RUN_COMMAND","scp "..filename.." "..
      scp_path.text
    ) then
      darktable.print_error("scp failed for "..tostring(image))
    end
    end,
    nil, --finalize
    nil, --supported
    nil, --initialize
    darktable.new_widget("box") {
    orientation ="horizontal",
    darktable.new_widget("label"){label = "target SCP PATH "},
    scp_path,
})
```
