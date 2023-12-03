---
title: export
id: export-selected
applicable-version: 4.6
tags: 
view: lighttable
---

Export selected images.

When used in the darkroom view, the currently-edited image will be exported if no other images are selected in the filmstrip.

Files can be exported to a file on disk, email, various online storage locations, a web album, or a book template. 

# module controls

## storage options

target storage
: The type of location to store your selected images. A number of different back-ends are implemented, including file on disk, LaTeX book template and various web albums. Depending on the selected target, you will be asked to provide additional information, such as filenames or account name and password.

filename template
: Define the folder and file to which the image will be exported. This can be automatically generated using several pre-defined variables. See the [variables](../../../special-topics/variables.md) section for details.

output directory selector
: The button beside the filename template entry opens a dialog to select the parent directory for export.

on conflict
: Choose what to do if the generated filename conflicts with an existing file on export:

: - _create unique filename_: Automatically choose a unique new file name by appending an integer to name of the conflicting file.

: - _overwrite_: Automatically overwrite existing files. This option will present you with a confirmation dialog in order to protect you from accidental data loss -- you can disable this in [preferences > security > ask before exporting in overwrite mode](../../../preferences-settings/security.md). _**Note:** This dialog is not presented per-file but as a one-off confirmation before the export job starts._ 

: - _overwrite if changed_: Automatically overwrite existing files if the last export timestamp stored in darktable's database does not match the last changed date/time on the existing file.

: - _skip_: Do not export images where the destination filename already exists.

## format options

file format
: Choose the file format for the exported image. Additional options will appear (below) depending on the selected format.

quality
: The quality of the exported file. Higher values lead to larger file sizes. The default quality (95) is a good setting for very high quality exports (e.g. for archiving or printing purposes). If you need a good compromise between size and quality (e.g. for online image display or uploads) you should consider a value of “90” instead.

bit depth
: The number of bits used for each color channel. More bits means less posterization/color banding.

compression
: The type of compression to use.

compression level
: For export formats where _compression_ can be specified, the _compression level_ specifies how much compression to apply. The higher the level, the more the data will be compressed, at the cost of more CPU cycles.

b&w image
: For TIFF export format, it is possible to save a monochrome image. This setting controls whether the resulting file encodes the shades of gray as separate RGB channels, or as a single grayscale channel. The latter option will result in smaller files.

## global options

set size
: Choose how to measure the maximum size of your exported image

: - _in pixels (for file)_: Enter the maximum width and height in pixels. 

: - _in cm (for print)_: Enter the maximum width and height in cm and define the image's dpi. The equivalent size in pixels will be automatically calculated.

: - _in inch (for print)_: Enter the maximum width and height in inches and define the image's dpi. The equivalent size in pixels will be automatically calculated.

: - _by scale (for file)_: Enter a multiplier to specify by how much the exported image should be scaled compared to the input image. For example, entering a value of 0.5 will result in an output image with half the width and height (in pixels) of the original image.

dpi
: If units of cm or inches are chosen, set the dpi of the output image. The dpi will also be stored in the Exif data of the exported image. It will be automatically set to 300 if "in pixels" or "by scale" is chosen.

max size
: Set the maximum width and height of the exported image(s) in pixels, cm or inches (depending on the selected unit) -- zero means that no constraint will be set on that dimension. Exported images will be constrained so as not to exceed either of these values, while retaining the correct aspect ratio. Set both to zero to export with the original dimensions (after cropping). If the entered values exceed the original dimensions darktable will either export with the original dimensions or upscale the image, depending on the "allow upscaling" parameter.

allow upscaling
: Set to “yes” to perform an upscaling step if the user-defined maximum width and height exceed the original dimensions of the image. If set to “no” the exported image's dimensions will not exceed the dimensions of the original image (after cropping).

high quality resampling
: Set this to 'yes' to perform high quality resampling on the image. The image will be processed in full resolution and only downscaled at the very end. This can sometimes result in better quality, but will always be slower.

store masks
: Store masks as layers in exported image. Only works for some image formats (currently TIFF and XCF).

profile
: The output color profile. Select “image settings” if you want the settings in the [_output color profile_](../../processing-modules/output-color-profile.md) module of the individual images to be respected.

intent
: This option lets you define the intent -- the way in which darktable will handle out-of-gamut colors. See [rendering intent](../../../special-topics/color-management/rendering-intent) for a more detailed description of the available options.

style
: Choose a [style](../lighttable/styles.md) which darktable will combine with the existing history stack to generate the output image. These history items are only added temporarily -- the original history stack is not overwritten. You can use this feature to add processing steps and parameters that you want to be applied specifically to images before export. For example you may define a style that adds a stronger level of sharpening when you produce scaled-down JPEG files for the internet or add a certain level of exposure compensation to all of your output images. 

mode
: When applying a style during export this option defines whether the history stack items of that style replace the original history stack of the image or are appended to it. Technically speaking, in append mode history stack items of the style will constitute separate instances of the respective modules on top of any existing ones (see also [multiple instances](../../../darkroom/processing-modules/multiple-instances.md)). As a consequence the original history stack will remain in effect with the new items being applied in addition. This way you can apply an overall adjustment (e.g. exposure) to a number of exported images while respecting the settings of each individual image.

export
: Press this button to start a background job to export all selected images. A bar at the bottom of the left hand panel displays the progress of the export job. Furthermore a notification message pops up reporting the completion of each individual export. You may click on the pop-up to make it disappear. You may abort the export job by clicking on the "x" icon located close to the progress bar. 

---

**Note:** Images that are selected but currently hidden (because they are members of a collapsed group) will not be exported.

---

# metadata preferences

The “preferences…” option in the presets menu brings up a dialog where you can configure what metadata to include in exported files:

![metadata config](./export-selected/metadata-config.png#w66)

The parameters entered into this dialog are saved along with other export parameters to user presets and the last entered values are retained when darktable is closed. 

## general settings

The left-hand-side of this dialog allows you to choose which groups of metadata are to be exported with the image. The following options are available:

exif data
: Export the source image's Exif data.

metadata
: Export metadata defined in the [metadata editor](../shared/metadata-editor.md) module. Only metadata fields that are tagged as _visible_ and are not tagged as _private_ will be exported.

geo tags
: Export geo tags.

tags
: Export tags  created in the [tagging](../shared/tagging.md) module (to `Xmp.dc.Subject`). Three additional options can also be selected:
: - _private tags_: Export private tags
: - _synonyms_: Export tag synonyms
: - _omit hierarchy_: Only export the last part of hierarchical tags

hierarchical tags
: Export hierarchical tags (to `Xmp.lr.Hierarchical Subject`)

develop history
: Export the entire development history (history stack and shapes) where supported (e.g. JPEG, JPEG2000, TIFF). The development history will be stored as XMP tags within the output file. This information can later be used to reconstruct the parameters and settings that were used to produce the exported image.

---

**Caution:** For various reasons embedding XMP tags into output files may fail without notice, e.g. if certain size limits are exceeded. Users are therefore advised to not rely on this feature for their backup strategy. To back up your data always make sure to save your input (raw) file as well as all of darktable's XMP sidecar files.

---

## per metadata settings

The right-hand-side of this dialog allows you to define formulas to populate image metadata. The formulas defined here have priority over the settings in the left-hand-side of the dialog. The first column identifies the entry to be edited. The second column allows you to define how to calculate the value for that metadata entry using a formula. 

See the [variables](../../../special-topics/variables.md) section for details of the variables you can use in your metadata formula. Press Enter to validate the formula. Leave the formula empty to prevent a given metadata entry from being exported (`Exif.GPSInfo.GPSVersionID` in the above example). 

Use the “--” icon to remove a metadata entry from the list and the “+” icon to add a new one from a predefined list of available metadata tags.

Click on the "add" button to add a metadata entry to the list.

The formulas allow you virtually define all the metadata you need to qualify your images in tagging and export the values in the XMP or IPTC tags of your choice. The exported tags can be different from one export to the next depending on the destination of the images. Tags and Categories are displayed separately in image information.

_Remember that a tag set up as a category is never exported._

## tips

- To prevent a specific metadata field from being exported, add it to the list and leave the formula empty.
- To force a specific exif metadata field to be exported when exif export is disabled, add it to the list and enter `=` into the formula.

## examples

example 1
: A first level tag called places is set as a category, and is followed by four levels of information (or keywords): country, region, city and location (e.g. `places|France|Nord|Lille|rue Nationale`). Each level can be retrieved (when it is defined) by one of the variables `$(CATEGORY0(places))`, `$(CATEGORY1(places))`, `$(CATEGORY2(places))` and `$(CATEGORY3(places))`. In this example, the returned values are "France", "Nord", "Lille" and "rue Nationale", respectively. These keywords can also be retrieved as simple tags using the variable `$(TAGS)`. The last keyword level defined (the leaf) is displayed in [image information](../shared/image-information.md), here "rue Nationale".

example 2
: A first level tag called creator is followed by the name of the photographer, both set as categories: `creator|firstname lastname`. The formula copyrights (`$(YEAR) $(CATEGORY0(creator))`) builds the text associated with image rights. Here, [image information](../shared/image-information.md) displays "creator: firstname lastname" as categories. Neither creator nor "firstname lastname" appear in the tags list and they are not exported as simple tags.

---

**Note:** tagging is not appropriate to define free text metadata, like a title or a description, which may be specific to each image. Use the [metadata editor](../shared/metadata-editor.md) for this type of information.

---
