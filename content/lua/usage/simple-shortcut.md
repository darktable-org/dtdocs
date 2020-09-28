---
title: adding a simple shortcut
id: adding-a-simple-shortcut
weight: 50
draft: false
author: "people"
---

So far, all our scripts have done things during startup. This is of limited use and doesn't allow us to react to real user actions. To do more advanced things we need to register a function that will be called on a given event. The most common event to react to is a keyboard shortcut.

```
darktable = require "darktable"

local function hello_shortcut(event, shortcut)
darktable.print("Hello, I just received '"..event..
       "' with parameter '"..shortcut.."'")
end

darktable.register_event("shortcut",hello_shortcut,
       "A shortcut that prints its parameters")
```

Now start darktable, go to  `preferences -> shortcuts -> lua -> A shortcut that prints its parameters`, assign a shortcut and try it. You should see a nice message printed on the screen.

Let's look at the code in detail. We first define a function which takes two strings as input parameters. The first one is the type of event that is triggered ( `"shortcut"` ) and the second one is the name of the shortcut ( `"A shortcut that prints its parameters"` ). The function itself calls `darktable.print`, which will print the message as an overlay in the main window.

Once that function is defined, we register it as a shortcut callback. To do that we call `darktable.register_event` which is a generic function for all types of events. We tell it that we are registering a shortcut event, then we give the callback to call and last, we give the string to use to describe the shortcut in the preferences window.

Let's try a shortcut that is a little more interactive. This one will look at the images the user is currently interested in (selected or moused-over) and increase their rating.

```
darktable = require "darktable"

darktable.register_event("shortcut",function(event,shortcut)
    local images = darktable.gui.action_images
    for _,v in pairs(images) do
      v.rating = v.rating + 1
    end
  end,"Increase the rating of an image")
```

At this point, most of this code should be self explanatory. Just a couple of notes:

- Instead of declaring a function and referencing it, we declare it directly in the call to `darktable.register_event` this is strictly equivalent but slightly more compact.

- `image.rating` is a field that gives the star rating of any image (between 0 and 5 stars, -1 means rejected).

- `darktable.gui.action_images` is a table containing all the images of interest. darktable will act on selected images if any image is selected, and on the image under the mouse if no image is selected. This function makes it easy to follow darktable's UI logic in lua.

If you select an image and press your shortcut a couple of time, it will work correctly at first but when you have reached five stars, darktable will start showing the following error on the console: 

```
<![CDATA[
LUA ERROR : rating too high : 6
stack traceback:
   [C]: in ?
   [C]: in function '__newindex'
  ./configdir/luarc:10: in function <./configdir/luarc:7>
      LUA ERROR : rating too high : 6
  ]]>
```

 This is lua's way of reporting errors. We have attempted to set a rating of 6 to an image, but a rating can only go as high as 5. It would be trivial to add a check, but let's go the complicated way and catch the error instead:

```
darktable.register_event("shortcut",function(event,shortcut)
    local images = darktable.gui.action_images
    for _,v in pairs(images) do
      result,message = pcall(function()
        v.rating = v.rating + 1
        end)
      if not result then
        darktable.print_error("could not increase rating of image "..
          tostring(v).." : "..message)
      end
    end
end,"Increase the rating of an image")
```

`pcall` will run its first argument and catch any exception thrown by it. If there is no exception it will return `true` plus any result returned by the function; if there is an exception it will return `false` and the error message of the exception. We simply test these results and print them to the console.
