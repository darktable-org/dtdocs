---
title: exporting images with lua
id: exporting-images-with-lua
weight: 60
---

So far we have learned to use lua to adapt darktable to our particular workflow. Let's look now at how to use lua to easily export images to an online service. If you are able to upload an image to a service via the command line then you can use lua to integrate this into darktable's user interface.

In this next example we will use lua to export via `scp`. A new storage type will appear in darktable's UI that will export images to a remote target via the copy mechanism in `ssh`.

```
darktable = require "darktable"

darktable.preferences.register("scp_export","export_path",
  "string","target SCP path",
  "Complete path to copy to. Can include user and hostname","")

darktable.register_storage("scp_export","Export via scp",
  function( storage, image, format, filename,
     number, total, high_quality, extra_data)
    if not darktable.control.execute("scp "..filename.." "..
      darktable.preferences.read("scp_export",
         "export_path","string")) then
      darktable.print_error("scp failed for "..tostring(image))
    end
end)
```

`darktable.preferences.register` will add a new preference to darktable's preferences menu, `scp_export` and `export_path` allow us to uniquely identify our preference. These fields are reused when we read the value of the preference. The `string` field tells the lua engine that the preference is a string. It could also be an integer, a filename or any of the types detailed in the API manual relating to `types_lua_pref_type`. We then have the label for the preference in the preference menu, the tooltip when hovering over the value and a default value.

`darktable.register_storage` is the call that actually registers a new storage type. The first argument is a name for the storage type, the second is the label that will be displayed in the UI and last is a function to call on each image. This function has a lot of parameters, but `filename` is the only one we use in this example. It contains the name of a temporary file where the image was exported by darktable's engine.

This code will work but it has a couple of limitations. This is just a simple example after all:

- We use preferences to configure the target path. It would be nicer to add an element to the export UI in darktable. We will detail how to do that in the next section.

- We do not check the returned value of `scp`. That command might fail, in particular if the user has not correctly set the preference.

- This script can't read input from the user. The remote `scp` must use password-less copy -- `scp` can't be provided with a password easily, so we will leave it that way.

- There is no message displayed once the example is done, only the progress bar on the lower left side tells the user that the job is complete.

- We use `darktable.control.execute` to call an external program. The normal `os.execute` would block other lua codes from happening.


