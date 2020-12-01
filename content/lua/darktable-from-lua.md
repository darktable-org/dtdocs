---
title: using darktable from a lua script
id: using-darktable-from-a-lua-script
weight: 100
draft: false
author: "people"
---

_Warning: This feature is very experimental. It is known that several elements don't yet work in library mode. Careful testing is highly recommended._

The lua interface allows you to use darktable from any lua script. This will load darktable as a library and provide you with most of the lua API (darktable is configured headless, so the functions relating to the user interface are not available).

As an example, the following program will print the list of all images in your library:

```
#!/usr/bin/env lua
package = require "package"
package.cpath=package.cpath..";./lib/darktable/lib?.so"

dt = require("darktable")(
"--library", "./library.db",
"--datadir", "./share/darktable",
"--moduledir", "./lib/darktable",
"--configdir", "./configdir",
"--cachedir","cachedir",
"--g-fatal-warnings")

require("darktable.debug")

for k,v in ipairs(dt.database) do
   print(tostring(v))
end
```

Note the third line that points to the location of the `libdarktable.so` file.

Also note that the call to require returns a function that can be called only once and allows you to set darktable's command line parameter. The `:memory:` parameter to `--library` is useful here if you don't want to work on your personal library.
