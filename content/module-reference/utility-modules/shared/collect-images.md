---
title: collect images
id: collect-images
applicable-verison: 3.2.1
tags: 
view: lighttable, tethering, map
---

Filter the images shown in the lighttable view and filmstrip panel using image attributes. This set of filtered images is known as a _collection_.

 All images imported imported into darktable are stored in darktable's library database, along with attributes describing each image. A collection may be  defined by applying filtering rules to these attributes, thus creating a subset of images to display in the lighttable view and filmstrip panel.

The default collection is based on the _film roll_ attribute and displays all images of the last imported or selected film roll.

# available filtering attributes

The images in a collection can be filtered using the following image attributes:

film roll 
: The name of the film roll to which the image belongs

folders 
: The folder (file path) where the image file is located

camera 
: The Exif data entry describing the camera make and model

tag 
: Any tag that is attached to the image. When activated a hierarchical list of known tags is displayed

date 
: The date the photo was taken, in the format `YYYY:MM:DD`

time 
: The date & time the photo was taken, in the format `YYYY:MM:DD hh:mm:ss`

history 
: Choose images whose history stacks have been altered or not

color label 
: Any color label attached to the image: “red”, “yellow”, “green”, “blue”, “purple”

title 
: The image's metadata “title” field

description 
: The image's metadata “description” field

creator 
: The image's metadata “creator” field

publisher 
: The image's metadata “publisher” field

rights 
: The image's metadata “rights” field

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

image attribute
: The left combobox allows you to choose which attribute to use to filter your collection (from the list described in the previous section)

search pattern
: In the text field to the right of the attribute combobox, you can write a matching pattern. The pattern is compared against all database entries with the selected attribute. The filtering mechanism detects a match if any image's attribute contains the pattern in its full text. You may use `%` as wildcard character. The collection will be limited to matching images. Leave the text field empty to match all images for that attribute.

: Attributes with numerical or date/time attributes can be used in combination with comparative and range operators. Use `<`, `<=`, `>`, `>=`, `<>`, and `=` to select images with attributes less than, less than or equal, greater than, greater than or equal, not equal, or equal to the given value, respectively. An expression in the form `[from;to]` can be used to select using a range of values.

select by value
: As well as defining filter criteria using a search pattern, you can also manually choose from a list of entries taken from the currently-matching set of images.

: The box below the search pattern will list values for the selected attribute that are present in the currently-matching images. This list is continuously updated as you type. You may also choose a sorting criteria by scrolling through the list and double-clicking.

: If you enable single-click mode (see [`preferences` -> `lighttable`](../../../preferences-settings/lighttable.md)) you can select with a single-click rather than double-click. This mode also allows you to select a range of values with the mouse. This only works for numerical and date-time attributes.

## combining multiple filters

You can combine multiple filters together to create more complex collections of images using a series of rules. A rule is a combination of a filter critera along with a logical operation that defines how that criteria is combined with any previously added rules.

Click on the triangle button (to the right of the search field) to open a menu with the following options:

clear this rule
: Remove the current rule – or reset to default if this is the only rule defined.

narrow down search
: Add a new rule, which is combined with the previous rule(s) in a logical AND operation. An image is only retained as part of the collection if it also fulfills the new criteria.

add more images
: Add a new rule, which is combined with the previous rule(s) in a logical OR operation. Images that fulfill the new criteria are added to the collection.

exclude images
: Add a new rule, which is combined with the previous rule(s) in a logical EXCEPT operation. Images that are selected by the new criteria are excluded from the collection.

The logical operators defining how rules are combined are indicated with icons to the right of each added rule: AND by the `∩` symbol, OR by the `∪` symbol, and EXCEPT by the `\` symbol. Clicking on any of these icons allows you to change the logical operation.

## updating the folder path of moved images

While it is best to not touch imported files behind darktable's back, this module can help you recover from situations when you have moved image folders after importing them. The collect images module has a feature that allows you to update darktable's library database with the new folder location. The process is as follows:

1. Set the _image attribute_ combobox to _folders_ 
1. Locate the original folder name in the tree. The folder name will be displayed struck-through to emphasize that it is no longer present. 
1. Right-click on the folder name, select “search filmroll...”, and then select the new location of the folder.

