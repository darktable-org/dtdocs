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
: The name of the output file or destination folder. The export file format is derived from the file extension or from the `--out-ext` option. You can also use a number of [variables](../variables.md) in the output filename. For obvious reasons this parameter is mandatory if you use the program on an image folder containing multiple images. If you specify output folder it is recommended that you also specify the file format with `--out-ext`.

`--width <max width>`
: Limit the width of the exported image to the given number of pixels.

`--height <max height>`
: Limit the height of the exported image to the given number of pixels.

`--hq <0|1|true|false>`
: Define whether to use high quality resampling during export (see the [export](../../module-reference/utility-modules/shared/export.md) module reference for more details). Defaults to true.

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
: Specify the ICC profile type, which is the same as specifying the "output profile" in the [_output color profile_](../../module-reference/processing-modules/output-color-profile.md) module. Defaults to "image specified". Use `--help icc-type` to obtain a list of the supported types. See the _output color profile_ module reference for a more detailed description of the available options.

`--icc-file <file>` 
: Specify the ICC profile filename. Defaults to an empty filename.

`--icc-intent <intent>` 
: Specify the rendering intent. Defaults to "image specified". Use `--help icc-intent` to obtain a list of the supported intents. See [rendering intent](../../special-topics/color-management/rendering-intent) for a more detailed description of the available options.

`--verbose`
: Enables verbose output.

`--help [option]`
: Prints usage and exits. If `option` is specified, additionally prints usage for the given option.

`--core <darktable options>`
: All command line parameters following `--core` are passed to the darktable core and handled as standard parameters. See the [`darktable binary`](./darktable.md) section for a detailed description.

# export options

Export options for darktable are defined as configuration items, set from within the [export module](../../module-reference/utility-modules/shared/export.md). There are two ways to alter this configuration when using `darktable-cli`, as described below.

## use the export module

The `darktable-cli` command will use the last format configuration used in the export module, when run in interactive (gui) mode. You may therefore manually set your desired format options in the darktable gui and then run `darktable-cli` to export your files.

## pass options on the command-line

You can set any export format configuration option using the following syntax:

```
    --core --conf plugins/imageio/format/<FORMAT>/<OPTION>=<VALUE>
```

where `<FORMAT>` is the name of the desired output format and `<OPTION>` is any configuration option for that format.

An option set in this way will not be permanently stored but will be used just for this run of `darktable-cli`.

The following sections describe the configuration options/values that are available for each export format:

### jpeg

`quality`
: The compression quality (`5` - `100`)

### j2k (jpg2000)

`format`
: The format of the output
:  - `0`: J2K
:  - `1`: jp2

`quality`
: The compression quality (`5` - `100`)

`preset`
: The DCP mode
: - `0`: Cinema2K, 24 FPS
: - `1`: Cinema2K, 48 FPS
: - `2`: Cinema4K, 24 FPS

### exr (OpenEXR)

`bpp`
: The bit depth (`16` or `32`)

`compression`
: The compression type
:  - `0`: uncompressed
:  - `1`: RLE
:  - `2`: ZIPS
:  - `3`: ZIP
:  - `4`: PIZ
:  - `5`: PXR24
:  - `6`: B44
:  - `7`: DWAA
:  - `8`: DWAB

### pdf

`title`
: The title of the pdf (any character)

`size`
: The size of the pdf (`a4`, `a3`, `letter`, `legal`)

`orientation`
: the paper orientation of the pdf
:  - `0`: portrait
:  - `1`: landscape

`border`
: The empty space around the pdf; format: size (a number) + unit; examples: 10 mm, 1 inch

`dpi`
: The bit depth inside the pdf (`1` - `5000`)

`rotate`
: Whether to rotate the pdf (`0` or `1`)

`icc`
: Whether to embed an icc profile (`0` or `1`)

`bpp`
: The bit depth (`8` or `16`)

`compression`
: Whether to compress the pdf (`0` or `1`)

`mode`
: The mode to put the images in the pdf
:  - `0`: normal: just put the images into the pdf
:  - `1`: draft: images are replaced with boxes
:  - `2`: debug: only show the outlines and bounding boxen

### pfm

No options provided.

### png

`bpp`
: The bit depth (`8` or `16`)

`compression`
: The compression level (`0` - `9`)

### ppm

No options provided.

### tiff

`bpp`
: The bit depth (`8`, `16`, `32`)

`compress`
: The compression type
:  - `0`: uncompressed
:  - `1`: deflate
:  - `2`: deflate with predictor

`compresslevel`
: The compression level (`0` - `9`)

`shortfile`
: B&W or color image
:  - `0`: write rgb colors
:  - `1`: write grayscale

### webp

`comp_type`
: The compression type
:  - `0`: lossy
:  - `1`: lossless

`quality`
: the compression quality (`5` - `100`)

`hint`
: The preferred way to manage the compression
:  - `0`: default
:  - `1`: picture: digital picture, like portrait, inner shot
:  - `2`: photo: outdoor photograph, with natural lighting
:  - `3`: graphic: discrete tone image (graph, map-tile etc)

### copy

No options provided.

### xcf

`bpp`
: The bit depth (`8`, `16`, `32`)
