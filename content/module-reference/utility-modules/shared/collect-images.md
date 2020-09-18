---
title: collect images
id: collect-images
applicable-verison: 3.2.1
tags: 
view: lighttable, tethering, map
---

The set of images shown in the current view of the lighttable or filmstript is called a collection. The collect images module allows you to use various criteria to decide which images to include in the current collection.

 Information about all images imported into darktable is stored in darktable's library database, along with various attributes describing each image. You define a collection by applying filtering rules to these attributes, thus creating a subset of images to display in the lighttable and filmstrip views.

The default collection is based on the _film roll_ attribute and displays all images of the last imported or selected film roll.

# available attributes

The images in a collection can be filtered using the following image attributes:

film roll 
: The name of the film roll to which the image belongs

folders 
: The folder where the image file is located

camera 
: The Exif data entry describing the camera make and model

tag 
: Any tag that is attached to the image. When activated a hierarchical list of known tags is displayed

date 
: The date the photo was taken, in the format YYYY:MM:DD

time 
: The date & time the photo was taken, in the format YYYY:MM:DD hh:mm:ss

history 
: Choose images whose history stacks have been altered or not

color label 
: Any color label that is attached to the image: “red”, “yellow”, “green”, “blue”, “purple”

title 
: The title, as listed in the image's metadata “title” field

description 
: The description, as listed in the image's metadata “description” field

creator 
: The creator, as listed in the image's metadata “creator” field

publisher 
: The publisher, as listed in the image's metadata “publisher” field

rights 
: The copyright statement, as written in the image's metadata “rights” field

lens 
: The description of the lens, as derived from Exif data

focal length 
: The focal length value, as derived from Exif data

ISO 
: The ISO value, as derived from Exif data

aperture 
: The aperture value, as derived from Exif data

filename 
: The filename of the image

geotagging 
: The geo location of the image 

# module controls

## defining filter criteria

The top line of the module can be used to define filter criteria for your collection as follows:

image attributes
: The left combobox allows you to choose which attribute to use to filter your collection (from the list defined above)

search rules
: In the text field to the right of the attribute combobox, you can write a matching pattern. The pattern is compared against all database entries with the selected attribute. The filtering mechanism detects a match if the images' attribute contains the pattern in its full text. You may use `%` as wildcard character. The collection will be limited to those images where the query matches. Leaving the text field empty matches all images for that attribute.

: Attributes with numerical or date/time attributes can be used in combination with comparative and range operators. Write `<`, `<=`, `>`, `>=`, `<>`, and `=` to select images with attributes less, less or equal, greater, greater or equal, not equal, or equal to the given value, respectively. An expression in the form `[from;to]` selects using a range of values.

## selecting by value

As well as defining filter criteria using the 'search rules' text box, you can also choose from a list of entries taken from the currently-matching set of images.

The box below the search rule will list all matching database entries for the query you are currently working on. This list is continuously updated as you type. You may also choose a sorting criteria by scrolling through the list and double-clicking.

If you enable single-click mode (see the [_lighttable_ tab of the _preferences_](../../../preferences-settings/lighttable.md) dialog) you can select with a single-click rather than double-click. This mode will also allow you to select range of values with mouse. This only works for numerical and date-time attributes.

## additional filter criteria

Click on the triangle button to the right of the text field to open a drop-down menu with options to finetune your current collection by adding or removing further rules:

clear this rule
: Remove the current rule – or reset to default if this is the only rule defined.

narrow down search
: Add a new rule, which is combined with the previous rule(s) in a logical AND operation. An image is only part of the collection if it additionally fulfills the added rule.

add more images
: Add a new rule, which is combined with the previous rule(s) in a logical OR operation. Images that fulfill the new rule are added to the collection.

exclude images
: Add a new rule, which is combined with the previous rule(s) in a logical EXCEPT operation. Images that are selected by the new rule are excluded from the collection.

The logical operators defining how rules are combined are displayed to the right of each added rule: AND by the `∩` symbol, OR by the `∪` symbol, and EXCEPT by the `\` symbol. Clicking on any of these icons allows you to change the logical operation.

## updating folder path

While it is best to not touch imported files behind darktable's back, this module can help you recover from situations when you move imported folders after import. The collect images module has a feature that allows you to tell darktable about the new location of imported folders which have been moved. The process is as follows:

1. Set the _image attributes_ combobox to _folders_ 
1. Locate the original folder name in the tree. The folder name will be displayed struck-through to emphasize that it is no longer present. 
1. Right-click on the folder name, select “search filmroll...”, and then select the new location of the folder.

