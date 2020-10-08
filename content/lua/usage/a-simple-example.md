---
title: a simple lua example
id: a-simple-lua-example
weight: 30
draft: false
author: "people"
---

Let's start with a simple example which will print some code on the console. Create a file called `luarc` in darktable's configuration directory (usually `$HOME/.config/darktable/`) and add the following line to it:

```
print("Hello World !")
```

Start darktable and you will see the sentence "`Hello World !`" printed on the console. Nothing fancy but it's a start.

At this point, there is nothing darktable-specific in the script. We simply use Lua's standard print function to print a string. That's nice and all, but we can do better than that. To access the darktable API you first need to `require` it and save the returned object in a variable. Once this is done you can access the darktable API as subfields of the returned object. All of this is documented in darktable's [Lua API](../api.md) reference manual.

```
local darktable = require "darktable"
darktable.print_error("Hello World !")
```

Run the script and ... nothing happens. The function `darktable.print_error` is just like `print` but will only print the message if you have enabled lua traces by running darktable with "`darktable -d lua`" on the command line. This is the recommended way to do traces in a darktable lua script.
