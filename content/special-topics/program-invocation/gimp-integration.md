---
title: gimp integration
id: gimp-integration
weight: 85
---

GIMP can use darktable to open a Raw file if the darktable executable is on the PATH. If the GIMP user opens a RAW file, then GIMP invokes darktable with some special command line parameters to get a temporary file for GIMP to work with, as follows:

```
darktable --gimp [version]
                 [file <path>]
                 [thumb <path> <dim>]
```

In all cases, darktable will report its result to GIMP wrapped in tags like this (where `<res>` depends on the command given):

```
<<<gimp
<res>
gimp>>>
```

Only one of the commands should be present on the command line.

`version`
: Note that `<res>` is the version of the GIMP API (_not_ the darktable version).

`file <path>`
: Starts darktable in darkroom mode with the image from the `<path>` loaded. The user is prevented from switching to another darktable mode. When the user closes the darkroom window, the result is exported as an EXR file to a temporary location. The returned `<res>` is the full path of the exported file. If the image is already in the darktable database, then any edits previously done in darktable will be part of the image exported. Any edits during the GIMP invocation of darktable will not, however, be saved to the database.

`thumb <path> <dim>`
: darktable writes a thumbnail JPEG file to a temporary location -- `<path>` is the RAW file path, `<dim>` (in pixels) is is the greater of width or height (in pixels) required for the thumbnail. The original ratio of dimensions is maintained. The returned `<res>` has the following format:

: - The full path of the exported file on the first line.
: - The width and height of the original file as space-separated integers on the second line. These dimensions are informational and may not be accurate. For Raw files these represent the sensor size.
