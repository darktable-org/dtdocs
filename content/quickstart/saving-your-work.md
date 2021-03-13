---
title: saving your work
id: saving-your-work
draft: true
weight: 50
author: "people"
---

Once you finish editing your file and applying metadata, you will want to save your work, print it out, or
perhaps post it to social media.

# why there is no "save" button

Because the only thing darktable needs to save to be able to recreate your edits is the editing steps you
applied, it continually updates its database and the current image's sidecar file as you work.  So even if
your computer crashes, the most you will lose is the changes you were making in the current module at the time
of the crash.


# exporting images

Since darktable only stores the metadata and editing steps and never modifies the original file, you must
instead explicitly generate a new image file for other programs to use your result.  darktable, like other
non-destructive editors, calls this process "exporting".

To export the image we have been editing in this tour, open the "export" module at the bottom of the right
pane in the lighttable.  Select where you want to store the exported image (file, email, photo-sharing site
Piwigo, etc.), its format, and various other options.  For example, you could apply an additional style to the
image during export, such as adding a watermark with your name.  Select one or more images from the thumbnail
grid and click on the "export" button (or press Control-E).

If you prefer to export images as you finish editing each one, you can also export the image you are currently
editing while in the darkroom by using the "export" module in the darkroom's left pane, or simply press
Control-E to export with the current settings.


# printing images

darktable also provides a very simple printing facility (not yet available in the Windows version) to print a
single image per sheet of paper.  Select "print" from the pulldown for "other" at the top right of the window,
then open the "print settings" module in the right-hand pane to configure the print.  You may need to
re-select the printer even if the one displayed is correct to make darktable retrieve the available media,
sizes, etc. from the printer driver and display the print preview.

For more complex printouts, you will need to export your images and use a separate program to lay out the
images on the printed page.
