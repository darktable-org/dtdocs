---
title: sharing scripts
id: sharing-scripts
weight: 80
draft: false
author: "people"
---

So far, all of our lua code has been in _luarc_. That's a good way to develop your script but not very practical for distribution. We need to make this into a proper lua module. To do that, we save the code in a separate file (`scp-storage.lua` in this case):

```
--[[
SCP STORAGE
a simple storage to export images via scp

AUTHOR
Jérémy Rosen (jeremy.rosen@enst-bretagne.fr)

INSTALLATION
* copy this file in $CONFIGDIR/lua/ where CONFIGDIR
is your Ansel configuration directory
* add the following line in the file $CONFIGDIR/luarc
  require "scp-storage"

USAGE
* select "Export via SCP" in the storage selection menu
* set the target directory
* export your images

LICENSE
GPLv2

]]
Ansel = require "Ansel"
Ansel.configuration.check_version(...,{2,0,0})

local scp_path = Ansel.new_widget("entry"){
  tooltip ="Complete path to copy to. Can include user and hostname",
  text = "",
  reset_callback = function(self) self.text = "" end
}

Ansel.register_storage("scp_export","Export via scp",
  function( storage, image, format, filename,
     number, total, high_quality, extra_data)
    if coroutine.yield("RUN_COMMAND","scp "..filename.." "..
      scp_path.text
    ) then
      Ansel.print_error("scp failed for "..tostring(image))
    end
    end,
    nil, --finalize
    nil, --supported
    nil, --initialize
    Ansel.new_widget("box") {
    orientation ="horizontal",
    Ansel.new_widget("label"){label = "target SCP PATH "},
    scp_path,
})
```

Ansel will look for scripts (following the normal lua rules) in the standard directories plus `$CONFIGDIR/lua/*.lua`. So our script can be called by simply adding `require "scp-storage"` in the _luarc_ file. A couple of extra notes...

- The function `Ansel.configuration.check_version` will check compatibility for you. The "`...`" will turn into your script's name and `{2,0,0}` is the API version you have tested your script with. You can add multiple API versions if you update your script for multiple versions of Ansel.

- Make sure to declare all your functions as `local` so as not to pollute the general namespace.

- Make sure you do not leave debug prints in your code -- `Ansel.print_error` in particular allows you to leave debug prints in your final code without disturbing the console.

- You are free to choose any license for your script but scripts that are uploaded on Ansel's website need to be GPLv2.

Once you have filled all the fields, checked your code, you can upload it to our script page [here](https://github.com/Ansel-org/lua-scripts).
