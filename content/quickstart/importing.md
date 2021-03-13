---
title: getting images into darktable
id: importing
draft: true
weight: 20
author: "people"
---

As a non-destructive editor, darktable never ever modifies your original files.  But that means it has to
store your edits and metadata somewhere other than in the original file.  It does so in two places: a sidecar
file with the same name as the image but an added .xmp extension, and in a central database.  The former
allows some interchange with other programs (as well as serving as a backup), while the latter provides fast
searches for images.

Due to the central database, you need to tell darktable about the images you want to be able to edit.  As in
other non-destructive editors, the process of registering an image with the program is known as importing it.
Unlike some other programs, importing an image does not move or copy the file unless you explicitly request it
(such as importing directly from an attached camera or other removable storage).


# loading images

Use the "import" module located at the top of the left pane to import selected images, an entire folder, or an
entire directory tree.  You can also copy files from a connected camera onto your computer's hard drive and
import the copied files in one step.


# managing collections of images

Once you have tens or even hundreds of thousands of images imported into darktable, you will want to narrow
down what is shown to just the images you intend to work with at the current time.  The "collect images"
module lets you do just that, by specifying the various search criteria.  You can do so by
- location on disk ("folder" for a tree view, "film roll" for a flat view)
- date the image was taken, imported, edited, exported, or printed
- camera or lens used
- camera settings such as ISO, aperture, exposure time, and focal length
- metadata such as tags, color label, or geolocation

Multiple criteria can be combined in various ways, so that you could for instance search for all images taken
in 2020 with a Nikon D7000 at ISO 6400 where the color label is **not** "red".

So that you don't need to reenter your search criteria every time, the "recently used collections" module
stores the last search criteria you used.  Simply click on the one you want to reactivate it.


# directly opening an image

If you are not interested in using darktable's file-management capabilities, you can bypass them entirely.
When you include a filename on darktable's commandline, it will register the file in its database and then go
directly to the darkroom for you to edit it.  Thus, you can use a file manager of your choice and merely need
to configure it to add the filename when invoking darktable for its "edit this file" action.


# starting the tour: load the sample image

For this quick-start tour, we will be working with {image}, available from {url}.  If you would like to try
out the edits as we go along, download it to your computer and import it by opening the "import" module,
clicking on "image...", and navigating to the folder in which you stored it.  Then select StMaryOfTheMount.nef
and click "open".  Its thumbnail should now appear in the center pane.

Once you have imported the sample image, press L, double-click on its thumbnail, or select it and click on
"darkroom" at the top right of the window to switch to the darkroom view and begin editing.
