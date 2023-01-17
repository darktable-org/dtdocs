---
title: snapshots
id: snapshots
applicable-version: 4.2
tags: 
view: darkroom
---

Store development snapshots and compare with the current edit.

Snapshots can be taken at any point in the development process and later overlaid onto the current center view. This allows you to undertake a side by side comparison (by default left=snapshot, right=active edit) while you are tuning parameters of a module. It can also be combined with the [history stack](./history-stack.md) module to compare a snapshot against different stages of development. 

To take a snapshot, click on the _take snapshot_ button. Above the button you will see a list of the snapshots that have been taken for this editing session. The name of each snapshot reflects the name of the module selected in the history stack and its position at the time the snapshot was taken.

Click on the name of a snapshot to show it -- this enables a split view between the saved snapshot image and the current state of the processed image. You can control the position of the split-line by clicking and dragging the line with your mouse. If you hover over the split-line with your mouse, a small rotation icon will appear on the center of the line. Click this icon to change between vertical and horizontal split view -- the positions of the snapshot and current image will be rotated anti-clockwise allowing you to choose whether they appear to the top, bottom, left or right of the screen. 

At all times, an arrow containing the letter "S" is displayed to indicate which side of the image is the snapshot and which is the current edit.

You can pan or zoom the image while using the snapshot view using your keyboard or mouse. To pan with the mouse you will need to hold the "a" key while clicking and dragging (this key can be configured in [preferences > shortcuts > views > darkroom > force pan & zoom with mouse](../../../preferences-settings/shortcuts.md)).

Click on the name of the snapshot again to disable the overlay and return to your editing session. Click the module's reset button to remove all existing snapshots. 

---

**Note:** Snapshots are retained for the duration of your darktable session. This means that you can also use snapshots to compare with a duplicate edit of the same image. Just navigate to that image and enable the snapshot view as normal. When you do this, a pair of asterisks (\*\*) appear against the snapshot name to indicate it was not taken from the current image -- hover over the name with your mouse to see the originating image name in a tooltip).

---
