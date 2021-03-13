---
title: editing your images
id: editing
draft: true
weight: 30
author: "people"
---

The darkroom view is where you edit your images.  Its layout is quite similar to the lighttable view, except
now we have only a single image in the center pane.  The left pane contains a variety of utility modules,
while the right pane contains all of the processing modules which actually modify your image.  As in
the lighttable, you can collapse individual side/top/bottom panes to give more space for the center image.

If not already on the quick-access panel in the right pane, switch to it by clicking on {ICON} just below the
histogram in the top right corner.  This panel is customizable -- right-click on {ICON} to bring up a menu for
adding and removing widgets from any of the processing modules.


# controlling the image view

{{zoom}}
{{pan}}
{{navigation window}}


# order of operations

You can modify module settings in any order you like, but the modules will be applied in the order they appear
in the right pane, from bottom to top.  This is comparable to adjustment layers in many popular pixel editors
-- the original image is at the bottom of the stack of layers, and each applies some modification to the
result of the previous one.  The order of widgets on the quick access panel also reflects this order of
application, again from bottom to top.

The "history" module in the left pane shows you the order in which you adjusted settings.  Think of this as an
undo list.  You can revert back to any previous state by clicking on the corresponding step in the history
list.  If you start making changes, the history from that point forward will be discarded and a new step added
above the current position.

It is usually preferable to work primarily from bottom to top in the same order that modules are applied.
This avoids having to tweak an already-set module due to changes in an earlier module's settings producing
different input.  It will also be faster, since darktable can cache the results up to the current module
instead of having to recompute them when you move backwards in the module order.


# resetting history

If you want to revert the image back to the state it had when first opened, you can either click on the
"reset" button in the module's header or select step 0 and click "compress history".  Such a reset is also
useful for switching between display-referred and scene-referred workflows or between legacy and modern
chromatic adaptation.  If you opened the sample image before changing preferences as described on the first
page of this tour, update the preferences and reset the history before proceeding.


# white balance

Because you have configured "modern" for chromatic adaptation, do _not_ use the White Balance module for
adjusting the image's white balance; use the Color Calibration module's CAT tab instead.  The White Balance
module is required for technical reasons, and will display a warning if changed from its default setting.

The example image's white balance is imperfect but not blatantly wrong, so leave it as is for now.  We'll use
the color calibration module to fine-tune the colors later, in keeping with a general bottom-to-top flow.


# lens correction

The lens used for this photo has a fair amount of geometric distortion as well as noticable chromatic
abberation.  Fix both of those instantly by clicking the power button icon {icon} next to "lens correction".


# exposure and contrast

You will have noticed that our back-lit example image looks very dark overall, while the clouds look
overexposed.  Let's check whether that's really the case.  Click on {icon} or press Shift-O to turn on the raw
overexposure indication.  Pixels for which the raw data is clipped will be displayed in the color of that
position's filter color (red/green/blue).  Zoomed to fit, no such indication is visible, so we don't have a
problem with overexposed clouds.  If you zoom to 100% view on the cloud to the right of the church, you can
see a few individual red pixels, proving that the overexposure indicator is in fact active.  Such a small
blown-out highlight is not a problem, however.  Press Shift-O or click {icon} again to resume normal display.

Notice that darktable has automatically applied a +0.5 EV exposure compensation.  That is because the tone
curve applied by the camera when generating a JPEG file includes a hidden exposure boost; 0.5 EV was found to
be a common value, but some cameras require much more.  The Nikon D7200 which took this picture requires +1.7
EV at ISO 100 and +1.3 EV at higher ISOs.

It would be annoying to have to make this adjustment for every image, but you don't have to.  Open the full
module by clicking on {icon} next to "exposure" in the quick-access panel.  Now adjust the compensation to
+1.7 EV.  As with all sliders in darktable, there are multiple ways to do so:
- click anywhere on the slider to set it to that value
- drag the triangle to the desired value
- scroll while hovering the mouse pointer over the slider
- right-click on the slider to bring up a multifunctional box
  - move the mouse within the box to adjust the value, more finely the lower down you move the pointer
  - set an exact numeric value by typing in a number and pressing Enter.  On most sliders, typing a number
    lets you exceed the soft bounds otherwise set by the slider (for exposure compensation, the hard limits
    are +/- 18 EV).
- use a shortcut key assigned to increase or decrease the slider's value
- scroll while holding down a dynamic shortcut key assigned to the slider

Now that you've set the compensation to +1.7 EV, you can make this the default for every image from a D7200 by
creating an auto-apply preset.  Click on the module's "hamburger" {icon} and select "store new preset...".  In
the dialog which appears, enter a name of your choice, check "auto apply this preset to matching images", then
set appropriate conditions: model "%D7200%" (the model string must contain "D7200" somewhere within it), maker
"%NIKON%", and uncheck "normal images" and "HDR", as this compensation does not apply to those types of
images.  Then click "OK".  From now on, every RAW image from a Nikon D7200 that darktable opens will
automatically have a +1.7 EV compensation applied.

But our image still looks a bit dark, doesn't it?  Let's verify that by turning on the color assessment mode.
Click the lightbulb icon at the lower right of the image or press Control-B.  The image now appears surrounded
by a white frame on a mid-gray field; this provides visual references for pure white and middle gray.  The
church is clearly still darker than middle gray, so boost the exposure compensation to +2.5 EV.

Oh, no!  Now the sky at bottom right and especially the clouds are blown out!  Don't worry, we'll fix that in
just a moment.  In the scene-referred workflow, you need to get the midtones to the correct brightness near
middle gray so that the rest of the processing gives the best results.  It doesn't matter if that causes the
highlights go above pure white, because there is no clipping until the image has to be displayed on screen.

{{histogram and waveform mode}}

The Filmic RGB module gives us a way to bring back the highlights by proving an adjustable mapping of dynamic
range from that of the camera's sensor to the (usually) lower dynamic range of our eventual output medium,
such as your monitor.  The dynamic range mapping is controlled primarily by the "white relative exposure"
slider and secondarily by the "black relative exposure" slider.  "white" controls mainly the highlights, while
"black" controls the appearance of shadows.  Each image has its own optimal setting for these two values, but
the defaults darktable uses are reasonable starting points for the majority of images.

An image with very high dynamic range, such as produced by the backlighting in the sample photo, will require
an increased white point.  As you move the "white relative exposure" slider further to the right, the
highlights are progressively brought back into the displayable range.  Here, a setting of +6.0 is appropriate.

Compressing the dynamic range leaves the image looking rather flat, because we've reduced both global and
local contrast.  To make things look more natural, we need to increase the local contrast, which is easily
done with the module by that name (type "local" in the search box).  Simply turning it on will improve things,
but this picture can benefit from more than the default strength.  Set "detail" to 150%, or even 160% for some
extra pop.


# cropping, rotation, and perspective adjustments

{{keystone correction}}


In addition to the pre-defined aspect ratios, you can enter a custom ratio simply by typing it when the
aspect-ratio menu is open.  Ratios can be entered either as a decimal number (1.9) or as a ratio of two
integers (19:10).  For the example image, use a ratio of 7:6.  You can now drag in the center to move the crop
box, or drag one of the edges or corners to resize it while maintaining the 7:6 aspect ratio.  If you don't
want the crop constrained, use the "freehand" aspect ratio.


# fixing blemishes

After cropping, there is still a branch visible at the top of the image, and (depending on how you adjusted
perspective and cropped) one or both of the dust spots may still be visible above the street lamp.  The
retouch module allows those unwanted elements to be removed.

Open the Retouch module (type "retouch" in the search box).  You will see four different shapes (circle,
ellipse, path, and brush) and a button to show/hide the current shapes.  There are also four different
algorithms which can be used with each shape.  Click the leftmost icon to select the "heal" algorithm if it
not currently selected.

To remove the dust spot(s), click on the Circle shape.  Scroll to resize it so that the solid circle is just
large enough to cover the spot.  Shift+Scroll to adjust the feathering zone around the circle proper,
indicated by the dotted circle.  Move the circle over one of the spots, then click and drag to set both the
circle to be healed (start of drag) and the position from which to copy unblemished sky (end of drag).  Repeat
for the other spot if needed (darktable remembers the circle's size and feathering, so you should not need to
adjust it for the second spot).

To remove the branch, you can use either the Brush or Path shapes, again in "heal" mode.
{{}}


# adjusting color

Now we've finally worked our way along the processing order to the color calibration module.

Start by fine-tuning the white balance.  In addition to a large number of pre-defined light sources and a
color picker for automatic white balance on a specific region of the image, the color calibration module also
provides two methods which attempt to compute the proper illumination even when there are no neutrally-color
surfaces in the image.  For the example image, give "detect from image edges" a try in the "illuminant"
pulldown menu.  After a moment, you'll get a message that the auto-detection has completed, and the module's
settings will update.  Depending on the exact crop you used, you should get a black-body illuminant with CCT
near 4850K.

Color calibration can also affect the intensity and lightness of colors, as well as function like a standard
channel mixer.  We can increase the saturation of the photo using the sliders on the "colorfulness" tab, but
increasing saturation also darkens the image a little, so you'll need to compensate by also adding a little
brightness. 

To demonstrate this, close and reopen the module to create a new entry in the history list.  Now add +0.3
colorfulness to each of the three channels.  Notice how the image looks a bit darker.  Close and reopen the
module again, then add +0.1 brightness to each of the three channels.  Now you can compare the three versions
(original, adding colorfulness, and adding both) by stepping back and forth in the history.  In particular, if
you compare the none and both versions, you can see nearly identical perceived brightness but with added
saturation.

For a pop-art look, try setting all three colorfulness sliders to the hard maximum of +2.0.  Go ahead!
(Remember that you need to right-click and type in the value to exceed the soft bound of +1.0).


# selective adjustments

One of darktable's most powerful features is its ability to apply masks to most processing modules.  This
permits selective adjustments in addition to global adjustments.  Let's use this power to adjust only the tree
next to the church door to make it brighter and a more vibrant green.

First, create a new instance of the Exposure module.  Click on {icon} in the Exposure module's header and
select "new instance".  Rename this new instance to indicate what it is adjusting.  Click on {icon} in the new
instance's header and select "rename", then type the new name (for example, "tree") and press Enter.

Enable a drawn+parametric mask by clicking on {icon}.  Use a Path shape to roughly select the pine tree next
to the street signs to the right of the church door.  You don't need to be super accurate, because the
parametric part of the mask will handle the fine details.  It's most important to be accurate where the tree's
color is most similar to the background, and it's actually better to have the tips of the branches extend
slightly outside of the drawn path.  Use Shift+Scroll to make the falloff region between the solid and dotted
lines fairly small.

Next, click on {icon} to show the mask you've created in yellow.  Click on "Jz" to bring up a double slider
for limiting the brightness of the pixels to which the mask should apply.  As you slide the right-hand
triangles to the left, more and more of the areas brighter than the tree itself will lose their yellow color.
A slider setting of 0/0/0.29/0.29 is reasonably good.

Chroma Cz 0/0/0.1/0.1

hz 35/35/275/275

exp +0.5 EV

Now, open the Color Balance module.  You can re-use the mask you just created in the Exposure module to pick
the exact pixels you brightened by clicking on {icon} and then selecting the raster mask for "exposure tree".
You can also re-use the drawn shape, but parametric mask can not be re-used because they will have different
effects due to the different input from module to module.

Increase the saturation of the tree by adjusting the "output saturation" slider to 120%.  Change the color of
the tree to be a more vibrant green by changing the "hue" slider in the midtones section to 85 degrees and the
"saturation" slider just below it to 7%.

# comparing versions

How have your edits changed the image?  Use a snapshot to compare versions with a variable transition point.

Open both the History and Snapshots modules.  Select an editing step in the History module (for example, "crop
and rotate"), then click on "take snapshop" in the Snapshots module. Now click on the final step in the
history to restore your finished edit.  Now click on the created snapshot to turn on comparison mode.  You can
move the dividing line back and forth by dragging it with the mouse, or rotate it in 90 degree increments by
clicking on the circular arrow which appears when you hover the mouse over the middle of the line.  Click on
the snapshot name a second time to turn off comparison mode.

Note that snapshots are just a bitmap image, so you can't change their zoom after taking them.  But you _can_
compare the current image against a snapshot of a different image!

Feel free to play around with the edits -- you can always back out to an earlier state with the "history"
module, or you can create a duplicate edit to try out multiple variations using the duplicate manager module.

When you're ready to continue the tour, press L or click on "lighttable" at the top right to return to the
lighttable view.