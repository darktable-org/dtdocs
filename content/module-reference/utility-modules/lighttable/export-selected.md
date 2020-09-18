---
title: export selected
id: export-selected
applicable-verison: 3.2.1
tags: 
view: lighttable
---

Export images selected in the lighttable. Files can be exported to a file on disk, email, various on-line storage locations, a webalbum, or a book template. 

_Note: You can also use Ctrl+E from within the darkroom mode to export the current image._

# module controls

target storage
: Where to store your selected images. Different back-ends are implemented, including file on disk, a LaTeX book template and various web albums. Depending on the selected target, you will be asked to give additional information, like filenames, or account name and password.

filename template
: You can define filenames that darktable generates for export. Several pre-defined variables can be used as placeholders (see the [variables](../../../special-topics/variables.md) section).

output directory
: The button beside the filename entry opens a dialog to select the parent directory for export.

on conflict
: _create unique filename_: Automatically choose a unique new file name if the generated filename conflicts with an existing file. 

: _overwrite_: Automatically overwrite any existing files with the same name. This option will present you with a confirmation dialog in order to protect you from accidental data loss. 

: _skip_: Do not export images if the destination filename already exists.


file format
: You can export to various file formats. Depending on the output format you can define additional parameters. For some formats you need to choose the desired bit depth and compression method.

: For some export formats you can define an output quality. Higher values will lead to larger file sizes. The default quality “95” is a good setting for very high quality exports, e.g. for archiving or printing purposes. If you need a good compromise between size and quality, e.g. for online image display or uploads, you should consider a value of “90” instead.

: If the file format supports embedded metadata (e.g. JPEG, JPEG2000, TIFF) darktable will try to store the history stack as XMP tags within the output file. This information can later be used to reconstruct your parameters and settings that were used to produce the exported image.

: _Caution: For various reasons embedding XMP tags into output files may fail without notice, eg. if certain size limits are exceeded. Users are therefore advised to not rely their backup strategy on this feature. To back up your data make sure to save your input (raw) file as well as all of darktable's XMP sidecar files._

: If you don't want to distribute history stack data (or any other type of metadata) with your images your can tweak the export metadata configuration.

max size
: Set the maximum width and height of the output images in pixels. Set both to a value of “0” to export with the original dimensions (after cropping). If the values exceed the original dimensions darktable will either export with the original dimensions or perform an upscaling step, depending on the setting of the following parameter.

high quality resampling
: Set this to 'yes' to perform high quality resampling on the image. The image will first be processed in full resolution, and downscaled at the very end. This can sometimes result in better quality, but will always be slower.

allow upscaling
: If set to “yes” darktable will perform an upscaling step if the user defined maximum width and height exceed the original dimensions. If set to “no” the exported image's dimensions will not exceed the dimensions of the original image (after cropping).

profile
: This defines the output color profile. Select “image settings” if you want the settings in the _output color profile_ module of the individual images to take precedence.

intent
: This option lets you define the intent, i.e. the way in which darktable will deal with out-of-gamut colors. See Section **LINK TBC**, “Rendering intent” for a more detailed description of the available options.

style
: This option lets you choose a style (a collection of history stack items) which darktable combines with the existing history stack to generate the output image. These history items are only added temporarily; the original history stack is not overwritten. You can use this feature to add processing steps and parameters that you want to be applied specifically to images before export. For example you may define a style that adds a stronger level of sharpening when you produce scaled-down JPEG files for the internet or add a certain level of exposure compensation to all of your output images. 

mode
: When applying a style during export this option defines whether the history stack items of that style replace the original history stack of the image or are appended to it. Technically speaking, in append mode history stack items of the style will constitute separate instances of the respective modules on top of any existing ones (see also Section 3.2.4, “Multiple instances”). As a consequence the original history stack will fully remain in effect with the new items being applied additionally. This way you can apply an overall adjustment (e.g. exposure) to a bunch of exported images while respecting the settings of each individual image.

export
: Pressing this button starts a background job to export all selected images. A bar at the bottom of the left side panel displays the progress. Furthermore a notification message pops up reporting the export progress. You may click on the pop-up to make it disappear. You may abort the export job by clicking on the "x" icon located close to the progress bar.

metadata
: Press the icon on the right of export button allows you to to configure which metadata items are to be embedded into the exported image. This is done in a separate dialog which is further defined below

# including metadata in the exported image

Metadata configuration is saved along with other export selected parameters to your favorites presets and is retained when darktable is closed. Clicking on the icon to the right of the export button shows the following dialog to control how to include metadata in the exported image

## general settings

The left-hand-side of this dialog allows you to choose which groups of metadata are to be exported with the image. The following options are available:

exif data
: Export the source image's exif data

metadata
: Export metadata defined in the _metadata editor_ module

geo tags
: Export geo tags

tags
: Export tags (to Xmp.dc.Subject) created in the _tagging module_. Three subsets of tags can also be selected:

: _private tags_: Export private tags
: _synonyms_: Export tag synonyms
: _omit hierarchy_: Only export the last part of hierarchical tags

hierarchical tags
: Export hierarchical tags (to Xmp.lr.Hierarchical Subject)

develop history
: Export the development history (history stack and shapes) where supported. It may be necessary to deselect this if your image has a very large history stack as most output file formats place a limit on the size of this field.

## per metadata settings

The right-hand-side of this dialog allows you to define a formulas to populate metadata. The formulas defined here have priority over the settings in the left-hand-side of the dialog. The first column identifies the entry to be edited. The second column allows you to define how to calculate the value for that metadata entry. 

Leaving the formula empty prevents that specific metadata entry from being exported **(Exif.GPSInfo.GPSVersionID in the above example)**. To define a formula, you can use the same variables and rules as for filenames (as documented in the [variables](../../../special-topics/variables.md) section). Press enter to validate the formula.

Use the “-” icon to remove a metadata entry from the list and the “+” icon to add a new one from a predefined list of available metadata tags.

Double-click or click on button add to add a metadata entry to the configuration list.

The formulas allow you virtually define all the metadata you need to qualify your images in tagging and export the values in the xmp or iptc tags of your choice. The exported tags can be different from one export to the next depending on the destination of the images. Tags and Categories are displayed separately in image information.

_Remember that a tag set up as a category is never exported._

## examples

example 1
: A first level tag called places is set as a category, and is followed by four levels of information (or keywords), country, region, city and location: places|France|Nord|Lille|rue Nationale. Each level can be retrieved (when it is defined) by one of the variables $(CATEGORY0(places)), $(CATEGORY1(places)), $(CATEGORY2(places)) and $(CATEGORY3(places)). In that example, the returned values are respectively: France, Nord, Lille and rue Nationale. These keywords can also be retrieved as simple tags by the variable $(TAGS). The last keyword level defined (the leaf) is displayed in Image informations, here rue Nationale.

example 2
: A first level tag called creator followed by the name of the photographer, both set as category: creator|firstname lastname. The formula copyrights $(YEAR) $(CATEGORY0(creator)) builds the text associated to image rights. Image information display in categories the following: creator: firstname lastname. Neither creator nor firstname lastname appear in tags list; they are also not exported as simple tags.

Note: tagging is not appropriate to define free text metadata, like a title or a description, which may be specific to each image. Use the _metadata editor_ for this type of information.
