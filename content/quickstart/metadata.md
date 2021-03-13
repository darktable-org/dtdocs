---
title: manipulating metadata
id: metadata
draft: true
weight: 40
author: "people"
---

Still on the tour?  We'll now update the image's metadata, which is something you would normally do _before_
editing.  As with editing operations, darktable doesn't care in which order you do things, so use whichever
workflow is best for _you_.

# tags

Open the "tagging" module to add/remove/rename tags on the currently-selected images.  Tags let you search for
images and build collections in the "collect images" module.  Tags are hierarchical, with the levels separated
by vertical bars.  For example, we could tag our image "location|USA|Pittsburgh|Mount Washington" to indicate
that it is located in the Mount Washington neigborhood of Pittsburgh in the United States.  To do so, simply
enter that tag in the text box below the "attach" and "detach" buttons, then click on "new".  Now that the tag
has been defined, you can add it to further images by clicking on it in the bottom pane and then clicking
"attach".  To remove a tag from an image, click on it in the top pane and then click "detach".

darktable uses a number of tags internally; these all start with "darktable|", and include information about
the file format, whether the image has been edited or exported, etc.  Click on {icon} to toggle whether these
internal tags are displayed for the selected image(s).


# textual metadata

Open the "metadata editor" module to enter text for the image's title, description, copyright, etc.  Press
Enter to apply the text in the current field and move to the next, or click "apply" to apply all fields to the
selected image(s).  You can enter multi-line text by using Control-Enter to insert a line break.

You can resize the text boxes by hovering your mouse on one and holding the Control key while scrolling.
darktable will remember the new size.


# location metadata

If your camera embeds GPS location information in the image file, darktable will automatically read the
location.  You can also apply the track from an external GPS logger if you have the .gpx file it generated.
Open the "geotagging" module, select a track file and one or more images, then click on "apply GPX track file"
to add location information to images taking during the time of the track(s) in the GPX file.  Because the
camera's clock will vary from the GPS time if you forgot to synchronize at the start of your shooting session,
you can also apply a time offset so that the images are correctly matched to the track.

Since our sample photo does not have embedded GPS data and we haven't provided a GPX track file, you'll need
to manually set its location information.  To do so, open the Map view by pressing M or clicking on "map" in
the pulldown for "other" in the top right of the darktable window.

Map view lets you set the geolocation for a photo by simply dragging it from the filmstrip at the bottom and
dropping it on the map.  Instead of laboriously panning and zooming the map, you can jump directly to the
proper location using the "find locations" module.  Open this module now and type in the address of the
church: `407 Grandview Avenue, Pittsburgh PA`.  You'll get multiple matches; click on the one for Mount
Washington to set the map location.  You can now drag the photo's thumbnail to the church at the corner of
Grandview Avenue and Ulysses Street.

The "locations" module lets you define named rectangular or elliptical regions.  Any images located within
such a region can then be selected in the lighttable "collect images" module.  As in lighttable, the "geotagging"
module lets you apply a GPX track file; the tracks are displayed on the map toghether with thumbnails of the
matching images, letting you easily fine-tune the time offset.

Press L or click on "lighttable" at the top right of darktable's window to return to the lighttable view.
