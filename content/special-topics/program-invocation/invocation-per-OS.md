---
title: invocation per OS
id: invocation-per-os
weight: 5
---

`darktable` and the other binaries (e.g. `darktable-cltest`) can be called from the console as follows:

Linux
* Installed as package or snap: `darktable`
* Flatpak: `flatpak run org.darktable.Darktable`. 
     + To run e.g. `darktable-cltest`: `flatpak run --command=darktable-cli org.darktable.Darktable --arguments-go-here`
* AppImage: Navigate to containing folder, then `./darktable.Appimage` (or however you named the file). 
     + To run e.g. `darktable-cltest`: `./darktable.Appimage darktable-cltest`
     + An additional option to run the various binaries included in darktable (e.g. `darktable-cltest` or `darktable-cli`) you can also use a symbolic link: Create a symbolic link to your AppImage and call it e.g. `darktable-cli`. Then, when calling the AppImage through the symbolic link with `./darktable-cli`, the code inside the package checks to see if there is a binary file inside the AppImage with a name that matches the symlink name, and if so, it will be run instead of the default one.
     
Windows
* Navigate to darktable's program folder: `cd "\Program Files\darktable\bin"`
* Then `.\darktable.exe` 
* The other binaries e.g. `darktable-cltest.exe` are also located in this folder and can be called accordingly

macOS
* `/Applications/darktable.app/Contents/MacOS/darktable`
* The other binaries e.g. `darktable-cltest` are also located in this folder and can be called accordingly

Command line options are in any case simply appended. (e.g. `-d common`).
