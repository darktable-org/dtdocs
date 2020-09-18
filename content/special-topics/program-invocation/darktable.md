---
title: darktable
id: darktable
weight: 10
draft: false
author: "people"
---

The `darktable` binary starts darktable with its GUI and full functionality. This is the standard way to use darktable.

`darktable` can called with the following command line parameters:

```
darktable [-d {all,cache,camctl,camsupport,control,dev,
               fswatch,input,lighttable,lua,masks,memory,nan,
               opencl,perf,pwstorage,print,sql}]
          [<input file>|<image folder>]
          [--version]
          [--disable-opencl]
          [--library <library file>]
          [--datadir <data directory>]
          [--moduledir <module directory>]
          [--tmpdir <tmp directory>]
          [--configdir <user config directory>]
          [--cachedir <user cache directory>]
          [--localedir <locale directory>]
          [--luacmd <lua command>]
          [--noiseprofiles <noiseprofiles json file>]
          [--conf <key>=<value>]
```

All parameters are optional. In most cases darktable should be started without any additional parameters, in which case darktable uses suitable defaults.

`-d {all,cache,camctl,camsupport,control,dev,fswatch,input,lighttable,lua,masks,memory,nan,opencl,perf,pwstorage,print,sql}`
: Enable debug output to the terminal. There are several subsystems of darktable and debugging of each of them can be activated separately. You can use this option multiple times if you want debugging output of more than one subsystem.

`<input file>|<image folder>`
: Optionally supply the name of an image file or folder. If a filename is given darktable starts in darkroom view with that file opened. If a folder is given darktable starts in lighttable view with the content of that folder as the current collection.

`--version`
: Print the darktable version number, a copyright notice, some other useful information, and then terminate.

`--disable-opencl`
: Prevent darktable from initializing the OpenCL subsystem. Use this option if darktable crashes at startup due to a defective OpenCL implementation.

`--library <library file>`
: darktable keeps image information in an sqlite database for fast access. The default location of that database file is `$HOME/.config/darktable/library.db`. Use this option to provide an alternative location, e.g. if you want to do some experiments without compromising your original `library.db`. If the database file does not exist, darktable creates it for you. You may also provide `:memory:` as the library file, in which case the database is kept in system memory – all changes are discarded when darktable terminates.
: Whenever darktable starts, it will lock the library to the current user. It does this by writing the current process identifier (PID) into a lock file `<library file>.lock` next to the library specified. If darktable finds an existing lock file for the library, it will terminate immediately.

`--datadir <data directory>`
: Define the directory where darktable finds its runtime data. The default place depends on your installation. Typical locations are `/opt/darktable/share/darktable/` and `/usr/share/darktable/`.

`--moduledir <module directory>`
: darktable has a modular structure and organizes its modules as shared libraries for loading at runtime. This option tells darktable where to look for its shared libraries. The default location depends on your installation. Typical locations are `/opt/darktable/lib64/darktable/` and `/usr/lib64/darktable/`.

`--tmpdir <tmp directory>`
: Define where darktable should store its temporary files. If this option is not supplied darktable uses the system default.

`--configdir <config directory>`
: Define the directory where darktable stores the user specific configuration. The default location is `$HOME/.config/darktable/`.

`--cachedir <cache directory>`
: darktable keeps a cache of image thumbnails for fast image preview and of precompiled OpenCL binaries for fast startup. By default the cache is located in `$HOME/.cache/darktable/`. Multiple thumbnail caches may exist in parallel – one for each library file.

`--localedir <locale directory>`
: Define where darktable can find its language specific text strings. The default location depends on your installation. Typical locations are `/opt/darktable/share/locale/` and `/usr/share/locale/`.

`--luacmd <lua command>`
: A string containing lua commands to execute after lua initialization. These commands will be run after your “luarc” file.
: If lua is not compiled in, this option will be accepted but won't do anything.

`--noiseprofiles <noiseprofiles json file>`
: Provide a json file that contains the camera specific noise profiles. The default location depends on your installation. Typical locations are `/opt/darktable/share/darktable/noiseprofile.json` and `/usr/share/darktable/noiseprofile.json`.

`--conf <key>=<value>`
: darktable supports a rich set of configuration parameters which the user defines in `$HOME/.config/darktable/darktablerc`. You may temporarily overwrite individual settings on the command line with this option – however, these settings will not be stored in “darktablerc” on exit.

