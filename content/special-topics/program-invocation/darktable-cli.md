---
title: darktable-cli
id: darktable-cli
weight: 20
draft: false
author: "people"
---

The `darktable-cli` binary starts the command line interface variant of darktable which allows images to be exported.

This variant does not open any display -- it works in pure console mode without launching a GUI. This mode is particularly useful for servers running background jobs.

`darktable-cli` can be called with the following command line parameters:

```
darktable-cli [<input file or folder>]
              [<xmp file>]
              <output file or folder>
              [--width <max width>]
              [--height <max height>]
              [--bpp <bpp>]
              [--hq <0|1|true|false>]
              [--upscale <0|1|true|false>]
              [--style <style name>]
              [--style-overwrite]
              [--apply-custom-presets <0|1|false|true>]
              [--out-ext <extension>]
              [--import <file or dir>]
              [--icc-type <type>]
              [--icc-file <file>]
              [--icc-intent <intent>]
              [--verbose]
              [--help [option]]
              [--core <darktable options>]
```

The user must supply an input filename and an output filename. All other parameters are optional.

`<input file or folder>`
: The name of the input file or folder (containing images) to be exported. If you wish to process multiple images or multiple folders use the `--import` option instead.

`<xmp file>`
: The optional name of an XMP sidecar file containing the history stack data to be applied during export. If this option is not provided darktable will search for an XMP file that belongs to the given input file(s).

`<output file or folder>`
: The name of the output file or destination folder. The export file format is derived from the file extension or from `--out-ext` option. You can also use a number of [variables](../variables.md) in the output filename. For obvious reasons this parameter is mandatory if you use the program on an image folder containing multiple images. If you specify output folder it is recommended that you also specify the file format with `--out-ext`.

`--width <max width>`
: Limit the width of the exported image to the given number of pixels.

`--height <max height>`
: Limit the height of the exported image to the given number of pixels.

`--bpp <bpp>`
: Define the bit depth of the exported image. Permitted values depend on the output file format. 

---

**Note:** This option is not currently functional. If you need to define the bit depth you need to use the following workaround:

```
    --core
    --conf plugins/imageio/format/<FORMAT>/bpp=<VALUE>
```
where `<FORMAT>` is the name of the selected output format.

---

`--hq <0|1|true|false>`
: Define whether to use high quality resampling during export (see the [export](../../module-reference/utility-modules/shared/export.md) module for more details). Defaults to true.

`--upscale <0|1|true|false>`
: Define whether allow upscaling during export. Defaults to false.

`--style <style name>`
: Specify the name of a style to be applied during export. If a style is specified, the path to the darktable configuration directory must also be specified (i.e. `--core --configdir ~/.config/darktable`). By default no style is applied.

`--style-overwrite`
: The specified style overwrites the history stack instead of being appended to it.

`--apply-custom-presets <0|1|false|true>`
: Whether to load `data.db` which contains presets and styles. Disabling this option allows you to run multiple instances of `darktable-cli` at the cost of being unable to use the `--style` option. Defaults to true.

`--out-ext <extension>`
: Set the output extension to use. If specified takes precedence over `<output file>`. By default this is extracted from `<output file>`. Defaults to `jpg` if `<output folder>` is specified.

`--import <file or dir>`
: Specify input file or folder, can be used multiple times. This option cannot be combined with `<input file or folder>`.

`--icc-type <type>`
: Specify the ICC profile type, which is the same as specifying `output profile` in `output color profile` module. Defaults to "image specified". Use `--help icc-type` to obtain a list of the supported types. See [output color profile](../../module-reference/processing-modules/output-color-profile) for a more detailed description of the available options.

`--icc-file <file>` 
: Specify ICC profile filename. Defaults to an empty filename.

`--icc-intent <intent>` 
: Specify rendering intent. Defaults to "image specified". Use `--help icc-intent` to obtain a list of the supported intents. See [rendering intent](../../special-topics/color-management/rendering-intent) for a more detailed description of the available options.

`--verbose`
: Enables verbose output.

`--help [option]`
: Prints usage and exits. If `option` is specified, additionally prints usage for the given option.

`--core <darktable options>`
: All command line parameters following `--core` are passed to the darktable core and handled as standard parameters. See the [darktable binary](./darktable.md) section for a detailed description.



