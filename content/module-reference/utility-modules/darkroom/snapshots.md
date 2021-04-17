---
title: snapshots
id: snapshots
applicable-version: 3.2.1
tags: 
view: darkroom
---

A snapshot is a stored bitmap of the center image in the darktable view. Snapshots can be taken at any point in the development process and later selected to be overlaid onto the current center view. This allows you to undertake a side by side comparison (by default left=snapshot, right=active edit) while you are tuning parameters of a module. This can also be combined with [history stack](./history-stack.md) module to compare a snapshot against different stages of development. 

To take a snapshot, click on the _take snapshot_ button in the snapshot module. Above the button you will see a list of the various snapshots that have been taken for this image. The name of each snapshot reflects the most recent module name and history stack position that was active at the time the snapshot was taken.

Click on the name of a snapshot to enable a split view between the saved snapshot image and the current state of the processed image. You can control the split view by moving the splitline back and forth over the image with your mouse. If you hover with the mouse over the splitline, a small rotation icon will appear on the center of the line. Click this icon to change between vertical and horizontal split view. 

At all times, an arrow containing the letter "S" is displayed to indicate which side of the image is the snapshot and which is the current edit.

Click the module's reset button to remove all existing snapshots.

---

**Note:** Snapshots are retained for the duration of your darktable session. This means that you can also use snapshots to compare with a duplicate edit of the same image. Just navigate to that image and enable the snapshot view as normal.

---
