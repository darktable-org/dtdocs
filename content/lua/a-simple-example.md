---
title: a simple lua example
date: 2022-12-04T02:19:02+01:00
id: a-simple-lua-example
weight: 30
draft: false
author: "people"
---

Let's start with a simple example that will print some code on the console. Create a file called `luarc` in Ansel's configuration directory (usually `$HOME/.config/Ansel/`) and add the following line to it:

```
print("Hello World !")
```

Start Ansel and you will see the sentence "`Hello World !`" printed on the console. Nothing fancy but it's a start.

At this point, there is nothing Ansel-specific in the script. We simply use Lua's standard print function to print a string. That's nice and all, but we can do better than that. To access the Ansel API you first need to `require` it and save the returned object in a variable. Once this is done you can access the Ansel API as subfields of the returned object. All of this is documented in Ansel's [Lua API](./api.md) reference manual.

```
local Ansel = require "Ansel"
Ansel.print_error("Hello World !")
```

Run the script and ... nothing happens. The function `Ansel.print_error` is just like `print` but will only print the message if you have enabled lua traces by running Ansel with "`Ansel -d lua`" on the command line. This is the recommended way to do traces in a Ansel lua script.
