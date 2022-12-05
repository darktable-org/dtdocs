---
title: printing labeled images
id: printing-labeled-images
weight: 40
draft: false
author: "people"
---

The first example showed us the very basics of lua and allowed us to check that everything was working properly. Now let's do something a little bit more complex. Let's try to print a list of images that have a "red" label attached to them. But first of all, what is an image?

```
local Ansel = require "Ansel"
local debug = require "Ansel.debug"
print(Ansel.debug.dump(Ansel.database[1]))
```

Running the code above will produce a lot of output. We will look at it in a moment, but first let's look at the code itself.

We know about `require Ansel`. Here, we need to separately `require Ansel.debug` which is an optional section of the API that provides helper functions to help debug lua scripts.

`Ansel.database` is a table provided by the API that contains all images in the library database. Each entry in the database is an image object. Image objects are complex objects that allow you to manipulate your image in various ways (all documented in the `types_dt_lua_image_t` section of the API manual). To display our images, we use `Ansel.debug.dump` which is a function that will take anything as its parameter and recursively dump its content. Since images are complex objects that indirectly reference other complex objects, the resulting output is huge. Below is a cut down example of the output.

```
toplevel (userdata,dt_lua_image_t) : /images/100.JPG
   publisher (string) : ""
   path (string) : "/images"
   move (function)
   exif_aperture (number) : 2.7999999523163
   rights (string) : ""
   make_group_leader (function)
   exif_crop (number) : 0
   duplicate_index (number) : 0
   is_raw (boolean) : false
   exif_iso (number) : 200
   is_ldr (boolean) : true
   rating (number) : 1
   description (string) : ""
   red (boolean) : false
   get_tags (function)
   duplicate (function)
   creator (string) : ""
   latitude (nil)
   blue (boolean) : false
   exif_datetime_taken (string) : "2014:04:27 14:10:27"
   exif_maker (string) : "Panasonic"
   drop_cache (function)
   title (string) : ""
   reset (function)
   create_style (function)
   apply_style (function)
   film (userdata,dt_lua_film_t) : /images
      1 (userdata,dt_lua_image_t): .toplevel
      [......]
   exif_exposure (number) : 0.0062500000931323
   exif_lens (string) : ""
   detach_tag (function): toplevel.film.2.detach_tag
   exif_focal_length (number) : 4.5
   get_group_members (function): toplevel.film.2.get_group_members
   id (number) : 1
   group_with (function): toplevel.film.2.group_with
   delete (function): toplevel.film.2.delete
   purple (boolean) : false
   is_hdr (boolean) : false
   exif_model (string) : "DMC-FZ200"
   green (boolean) : false
   yellow (boolean) : false
   longitude (nil)
   filename (string) : "100.JPG"
   width (number) : 945
   attach_tag (function): toplevel.film.2.attach_tag
   exif_focus_distance (number) : 0
   height (number) : 648
   local_copy (boolean) : false
   copy (function): toplevel.film.2.copy
   group_leader (userdata,dt_lua_image_t): .toplevel
```

As we can see, an image has a large number of fields that provide all sort of information about it. Here, we are interested in the "red" label. This field is a boolean, and the documentation tells us that it can be written. We now just need to find all images with that field and print them out:

```
Ansel = require "Ansel"
for _,v in ipairs(Ansel.database) do
  if v.red then
    print(tostring(v))
  end
end
```

This code should be quite simple to understand at this point, but it contains a few interesting aspects of lua that are worth highlighting:

- `ipairs` is a standard lua function that will iterate through all numeric indices of a table. We use it here because Ansel's database has non-numeric indices which are functions to manipulate the database itself (adding or deleting images, for example).

- Iterating through a table will return both the key and the value used. It is conventional in lua to use a variable named “`_`” to store values that we don't care about.

- Note that we use the standard lua function `tostring` here and not the Ansel-specific `Ansel.debug.dump`. The standard function will return a name for the object whereas the debug function will print the content. The debug function would be too verbose here. Once again, it is a great debug tool but it should not be used for anything else.
