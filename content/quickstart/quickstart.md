---
title: Quick-Start Tour
id: quickstart
draft: true
weight: 10
author: "people"
---

You have probably already noticed that darktable does not use a traditional program menu.  Instead, it relies
heavily on local per-module menus as well as keyboard shortcuts and mouse actions (together with shifting keys
such as Shift and Control) and user presets.

Keyboard shortcuts are completely customizable, and nearly every action that can be performed in darktable can
be assigned to a shortcut key.  The only shortcut you really need to remember is H -- darktable will pop up a
window showing all keyboard shortcuts and mouse actions available in the current context for as long as you
hold down that key.  Click on the {icon} at the top right of that window (while still holding down H) to make
the window stay visible permanently.  This permanent window will update every time there is a change in the
available shortcuts.


## 1. Configure darktable for this tour

For this tour, you need to set two preferences to non-default values.  Click the gear icon ({icon}) at top right, then click on "processing" in the left-hand column of the preferences dialog.  Now select "scene-referred" for "auto-apply pixel workflow defaults" and "modern" for "auto-apply chromatic adaptation defaults".  A dot will appear next to each to indicate that you have changed the setting from its default.  These settings are actually the ones recommended by the developers, but are not the default because they are a new paradigm which requires unlearning some habits acquired in other programs.  Feel free to reset them and/or customize other settings after the tour.


## 2. Tell darktable about the image(s) you want to process

We will be using the image you can download from {url}.  If you want to follow along with this tour and experiment with settings and edits, download it now.

Next, you need to tell darktable about the image by importing it.  This does _not_ copy the image, it merely adds information about it to darktable's database (so don't delete the original!).  darktable will **never** modify your original image.

Import the sample image by opening the _import_ module in the left pane of darktable's window by clicking on its name.  (If the left pane is not visible, unhide it by typing Control-Shift-L or clicking the triangle on the left edge of the window.)  Click on the "image..." button and navigate to the directory where you saved StMaryOfTheMount.nef.  Then select that image and click "import".  A thumbnail will appear in the center pane in a second or two.


## 3. Switch to darkroom mode to begin editing

Double-click on the thumbnail, or select it with a single click and press D or click on "darkroom" at the top right of the window.

While you can modify module settings in any order you like, the modules will be applied in the order they appear in the right pane, from bottom to top.  This is comparable to adjustment layers in many popular pixel editors -- the original image is at the bottom of the stack of layers, and each applies some modification to the result of the previous one.

The _history_ module in the left pane shows you the order in which you adjusted settings.  Think of this as an undo list.  You can revert back to any previous state by clicking on the corresponding step in the history list.  If you then start making changes, the history from that point forward will be discarded and a new step added above the current position.

Open the _history_ module to see the steps which have already been applied to create a displayable image (other programs do the same, but hide these steps from you).  You should see "filmic rgb" and "color calibration" in the list if you correctly changed the preferences as directed before opening the image, If you don't see both, adjust the preferences now and reset the processing by clicking on the "reset" button ({icon}) in the module's header.


## (alternate) 2-3. Start directly in darkroom

If you are not interested in using darktable's file-management capabilities, you can bypass them entirely.  When you include a filename on darktable's commandline, it will register the file in its database and then go directly to the darkroom for you to edit it.  Thus, you can use a file manager of your choice and merely need to configure it to add the filename when invoking darktable for its "edit this file" action.


## 4. The quick-access panel

If not already on the quick-access panel in the right pane, switch to it by clicking on {ICON} just below the histogram in the top right corner.  This panel is customizable -- right-click on {ICON} to bring up a menu for adding and removing widgets from any of the processing modules.


## 5. Apply lens correction

The lens used for this photo has a fair amount of geometric distortion as well as noticable chromatic abberation.  Fix both of those instantly by clicking the power button icon {icon} next to "lens correction" in the quick-access panel.


## 6. Check exposure

You will have noticed that our back-lit example image looks very dark overall, while the clouds look overexposed.  Let's check whether that's really the case.  Click on {icon} or press Shift-O to turn on the raw overexposure indication.  Pixels for which the raw data is clipped will be displayed in the color of that position's filter color (red/green/blue).  Zoomed to fit (type Alt-3), no such indication is visible, so there is no problem with overexposed clouds.

If you zoom to 100% view (type Alt-1 or click {icon} in the navigation window at top left and select "100%") on the cloud to the right of the church (pan by dragging the highlighted rectange in the navigation window, dragging the center view, or using the arrow keys on the keyboard), you can see a few individual red pixels, proving that the overexposure indicator is in fact active.  Such a small blown-out highlight is not a problem, however.  Press Shift-O or click {icon} again to resume normal display, then Alt-3 to zoom out again.


## 7. Adjust overall exposure

Now adjust the brightness of the mid-tones using the exposure slider.  You'll notice that darktable has already applied a +0.5 EV correction to compensate for the brightening which camera manufacturers silently apply in their JPEG processing.  The Nikon D7200 which took this image, however, actually needs a +1.7 EV correction at ISO 100 to match out-of-camera JPEGs.  (To avoid having to make that change on every image, you can create an auto-apply preset -- click {icon} to open the full _exposure_ module and select "store new preset..." from the module's "hamburger" {icon}.)

This particular image needs even more than +1.7 EV.  To tell just how much, turn on the color assessment mode by clicking the lightbulb icon ({icon}) at the lower right of the image or pressing Control-B.  The image now appears surrounded by a white frame on a mid-gray field; this provides visual references for pure white and middle gray.  The church is clearly still darker than middle gray, so boost the exposure compensation to +2.5 EV.

You can set the value of any slider in darktable by
- clicking anywhere on the slider to set it to that value
- dragging the triangle to the desired value
- scrolling while hovering the mouse pointer over the slider
- right-clicking on the slider to bring up a multifunctional box, then
  - move the mouse within the box to adjust the value, more finely the lower down you move the pointer
  - set an exact numeric value by typing in a number and pressing Enter.  On most sliders, typing a number
    lets you exceed the soft bounds otherwise set by the slider (for exposure compensation, the hard limits
    are +/- 18 EV).
- using a shortcut key assigned to increase or decrease the slider's value
- scrolling while holding down a dynamic shortcut key assigned to the slider

Oh, no!  Now the sky at bottom right and especially the clouds are blown out!  Don't worry, you'll fix that in just a moment.  In the scene-referred workflow, you need to get the midtones to the correct brightness near middle gray so that the rest of the processing gives the best results.  It doesn't matter if that causes the highlights go above pure white, because there is no clipping until the image has to be displayed on screen.


## 8. Check the histogram

...waveform mode...


## 9, Adjust the highlights and shadows

Open the _filmic rgb_ module.  To do so, you'll need to change to the active modules tab by clicking on {icon} below the histogram, or you can type "filmic" in the search box just below that.

Now you can adjust how _filmic_ maps the large dynamic range of the camera's sensor to the (usually) lower dynamic range of our eventual output medium, such as your monitor.  The dynamic range mapping is controlled primarily by the "white relative exposure" slider and secondarily by the "black relative exposure" slider.  "white" controls mainly the highlights, while "black" controls the appearance of shadows.  Each image has its own optimal setting for these two values, but the defaults darktable uses are reasonable starting points for the majority of images.

Because the sky has been blown-out by the exposure adjustment, you will need to increase the value of the "white relative exposure".  As you move this slider further to the right, the highlights are progressively brought back into the displayable range.  Here, a setting of +6.0 is appropriate.  Then adjust the "black relative exposure" slider to brighten or darken the shadows.  For this image, the default is fine.


## 10. Recover contrast

Compressing the dynamic range leaves the image looking rather flat, because you've reduced both global and local contrast.  To make things look more natural, you need to increase the local contrast, which is easily done with the _local constrast_ module (type "local" in the search box).  Simply turning it on will improve things, but this picture can benefit from more than the default strength.  Set "detail" to 150%, or even 160% for some extra pop.


## 11. Apply perspective correction

Open the full _crop and rotate_ module.  If you are on the quick-access panel, click {icon} next to "crop and rotate".  Otherwise, you can type "crop" into the search box.

{{keystone correction}}


## 12. Crop the image

Now let's crop out unwanted parts of the image.  Start by selecting the aspect ratio for the crop box -- we'll use 7:6 for this image.  Click on "aspect ratio" in the _crop and rotate_ module to bring up a list of predefined aspect ratios.  Since 7:6 is not one of them, you can simply type it into the popup just like that (decimal numbers work too) and press Enter.  You can now drag in the center of the crop box to move it, or drag one of the edges or corners to resize it while maintaining the 7:6 aspect ratio.  If you don't want the crop constrained, use the "freehand" aspect ratio.


## 13. Fix blemishes

After cropping, there is still a branch visible at the top of the image, and (depending on how you adjusted perspective and cropped) one or both of the dust spots may still be visible above the street lamp.  The retouch module allows those unwanted elements to be removed.

Open the Retouch module (type "retouch" in the search box).  You will see four different shapes (circle, ellipse, path, and brush) and a button to show/hide the current shapes.  There are also four different algorithms which can be used with each shape.  Click the leftmost icon to select the "heal" algorithm if it not currently selected.

To remove the dust spot(s), click on the Circle shape.  Scroll to resize it so that the solid circle is just large enough to cover the spot.  Shift+Scroll to adjust the feathering zone around the circle proper, indicated by the dotted circle.  Move the circle over one of the spots, then click and drag to set both the circle to be healed (start of drag) and the position from which to copy unblemished sky (end of drag).  Repeat for the other spot if needed (darktable remembers the circle's size and feathering, so you should not need to adjust it for the second spot).

To remove the branch, you can use either the Brush or Path shapes, again in "heal" mode.


## 14. Adjust color

You will have noticed that we haven't used the _white balance_ module.  When chromatic adaptation is set to "modern", you should _not_ use that module for adjusting the image's white balance; use the _color calibration_ module's CAT tab instead.  The White Balance module is required for technical reasons, and will display a warning if changed from its default setting.

Open the _color calibration_ module and click on the CAT tab.  In addition to a large number of pre-defined light sources and a color picker for automatic white balance on a specific region of the image, _color calibration_ also provides two methods which attempt to compute the proper illumination even when there are no neutrally-colored surfaces in the image.  For our example, give "detect from image edges" a try in the "illuminant" pulldown menu.  After a moment, you'll get a message that the auto-detection has completed, and the module's settings will update.  Depending on the exact crop you used, you should get a black-body illuminant with CCT near 4850K.

Color calibration can also affect the intensity and lightness of colors, as well as function like a standard channel mixer.  You can increase the saturation of the photo using the sliders on the "colorfulness" tab, but increasing colorfulness/saturation also darkens the image a little, so you'll need to compensate by also adding a little brightness.

To demonstrate this, close and reopen the module to create a new entry in the history list.  Now add +0.3 colorfulness to each of the three channels.  Notice how the image looks a bit darker.  Close and reopen the module again, then add +0.1 brightness to each of the three channels.  Now you can compare the three versions (original, adding colorfulness, and adding both) by stepping back and forth in the history.  In particular, if you compare the none and both versions, you can see nearly identical perceived brightness but with added saturation.

For a pop-art look, try setting all three colorfulness sliders to the hard maximum of +2.0.  Go ahead!  (You will need to right-click and type in the value to exceed the soft bound of +1.0).


## 15. Apply selective adjustments

Let's use the power of darktable's masking to adjust only the tree next to the church door to make it brighter and a more vibrant green.

First, create a new instance of the Exposure module.  Click on {icon} in the Exposure module's header and select "new instance".  Rename this new instance to indicate what it is adjusting.  Click on {icon} in the new instance's header and select "rename", then type the new name (for example, "tree") and press Enter.

Enable a drawn+parametric mask by clicking on {icon}.  Use a Path shape to roughly select the pine tree next to the street signs to the right of the church door.  You don't need to be super accurate, because the parametric part of the mask will handle the fine details.  It's most important to be accurate where the tree's color is most similar to the background, and it's actually better to have the tips of the branches extend slightly outside of the drawn path.  Use Shift+Scroll to make the falloff region between the solid and dotted lines fairly small.

Next, click on {icon} to show the mask you've created in yellow.  Click on "Jz" to bring up a double slider for limiting the brightness of the pixels to which the mask should apply.  As you slide the right-hand triangles to the left, more and more of the areas brighter than the tree itself will lose their yellow color.  A slider setting of 0/0/0.29/0.29 is reasonably good.

Chroma Cz 0/0/0.1/0.1

hz 35/35/275/275

exp +0.5 EV

Now, open the Color Balance module.  You can re-use the mask you just created in the Exposure module to pick the exact pixels you brightened by clicking on {icon} and then selecting the raster mask for "exposure tree".  You can also re-use the drawn shape, but parametric mask can not be re-used because they will have different effects due to the different input from module to module.

Increase the saturation of the tree by adjusting the "output saturation" slider to 120%.  Change the color of the tree to be a more vibrant green by changing the "hue" slider in the midtones section to 85 degrees and the "saturation" slider just below it to 7%.


## 16. Compare edit versions

How have your edits changed the image?  Use a snapshot to compare versions with a variable transition point.

Open both the History and Snapshots modules.  Select an editing step in the History module (for example, "crop and rotate"), then click on "take snapshop" in the Snapshots module. Now click on the final step in the history to restore your finished edit.  Now click on the created snapshot to turn on comparison mode.  You can move the dividing line back and forth by dragging it with the mouse, or rotate it in 90 degree increments by clicking on the circular arrow which appears when you hover the mouse over the middle of the line.  Click on the snapshot name a second time to turn off comparison mode.

Note that snapshots are just a bitmap image, so you can't change their zoom after taking them.  But you _can_ compare the current image against a snapshot of a different image!

Feel free to play around with the edits -- you can always back out to an earlier state with the _history_ module, or you can create a duplicate edit to try out multiple variations using the _duplicate manager_ module.


## 17. Add tags

Return to the _lighttable_ view by pressing L or clicking on "lighttable" at top right.  Open the "tagging" module in the right pane (press Control-Shift-R if hidden) to add/remove/rename tags on the currently-selected images.  Tags let you search for images and build collections in the _collect images_ module.  Tags are hierarchical, with the levels separated by vertical bars.  For example, you could tag the image "location|USA|Pittsburgh|Mount Washington" to indicate that it is located in the Mount Washington neigborhood of Pittsburgh in the United States.  To do so, simply enter that tag in the text box below the "attach" and "detach" buttons, then click on "new".  Now that the tag has been defined, you can add it to further images by clicking on it in the bottom pane and then clicking "attach".  To remove a tag from an image, click on it in the top pane and then click "detach".

darktable uses a number of tags internally; these all start with "darktable|", and include information about the file format, whether the image has been edited or exported, etc.  Click on {icon} to toggle whether these internal tags are displayed for the selected image(s).


## 18. Add textual metadata

Open the _metadata editor_ module to enter text for the image's title, description, copyright, etc.  Press Enter to apply the text in the current field and move to the next, or click "apply" to apply all fields to the selected image(s).  You can enter multi-line text by using Control-Enter to insert a line break.

You can resize the text boxes by hovering your mouse on one and holding the Control key while scrolling.  darktable will remember the new size.


## 19. Geotag the image

Since our sample photo does not have embedded GPS data and we haven't provided a GPX track file from an external GPS logger, you'll need to manually set its location information.

Open the Map view by pressing M or clicking on "map" in the pulldown for "other" in the top right of the darktable window.  Map view lets you set the geolocation for a photo by simply dragging it from the filmstrip at the bottom and dropping it on the map.

Instead of laboriously panning and zooming the map, you can jump directly to the proper location using the _find locations_ module.  Open this module now and type in the address of the church: `407 Grandview Avenue, Pittsburgh PA`.  You'll get multiple matches; click on the one for Mount Washington to set the map location.  You can now drag the photo's thumbnail to the church at the corner of Grandview Avenue and Ulysses Street.

The _locations_ module lets you define named rectangular or elliptical regions.  Any images located within such a region can then be selected in the lighttable _collect images_ module.  As in lighttable, the _geotagging_ module lets you apply a GPX track file; the tracks are displayed on the map together with thumbnails of the matching images, letting you easily fine-tune the time offset between the camera's clock and GPS time.

Press L or click on "lighttable" at the top right of darktable's window to return to the lighttable view.


## 20. export the image

Since darktable only stores the metadata and editing steps and never modifies the original file, you must instead explicitly generate a new image file for other programs to use your result.  darktable, like other non-destructive editors, calls this process "exporting".

To export the image you have been editing in this tour, open the _export_ module at the bottom of the right pane in the lighttable.  Select where you want to store the exported image (file, email, photo-sharing site Piwigo, etc.), its format, and various other options.  For example, you could apply an additional style to the image during export, such as adding a watermark with your name.  Select one or more images from the thumbnail grid and click on the "export" button (or press Control-E).

If you prefer to export images as you finish editing each one, you can also export the image you are currently editing while in the darkroom by using the _export_ module in the darkroom's left pane, or simply press Control-E to export with the current settings.


## 21. print the image

darktable also provides a very simple printing facility (not yet available in the Windows version) to print a single image per sheet of paper.  Select "print" from the pulldown for "other" at the top right of the window, then open the "print settings" module in the right-hand pane to configure the print.  You may need to re-select the printer even if the one displayed is correct to make darktable retrieve the available media, sizes, etc. from the printer driver and display the print preview.

For more complex printouts, you will need to export your images and use a separate program to lay out the images on the printed page.


## 22. manage large collections of images

Once you have tens or even hundreds of thousands of images imported into darktable, you will want to narrow down what is shown to just the images you intend to work with at the current time.  The _collect images_ module lets you do just that, by specifying various search criteria.  You can do so by

- location on disk ("folder" for a tree view, "film roll" for a flat view)
- date the image was taken, imported, edited, exported, or printed
- camera or lens used
- camera settings such as ISO, aperture, exposure time, and focal length
- metadata such as tags, color label, or geolocation

Multiple criteria can be combined in various ways, so that you could for instance search for all images taken in 2020 with a Nikon D7000 at ISO 6400 where the color label is **not** "red".

So that you don't need to reenter your search criteria every time, the "recently used collections" module stores the last search criteria you used.  Simply click on the one you want to reactivate it.


