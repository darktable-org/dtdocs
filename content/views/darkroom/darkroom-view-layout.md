---
title: darkroom view layout
date: 2022-12-04T02:19:02+01:00
id: the-darkroom-view
weight: 20
draft: false
---

## left panel

From top to bottom:

[navigation](../../modules/utility-modules/darkroom/navigation.md)
: Navigate and zoom the center view.

[snapshots](../../modules/utility-modules/darkroom/snapshots.md)
: Take and view snapshots for comparison with the current edit.

[duplicate manager](../../modules/utility-modules/darkroom/duplicate-manager.md)
: View and manage duplicates.

[global color picker](../../modules/utility-modules/darkroom/global-color-picker.md)
: Select and display color information taken from parts of the image.

[tagging](../../modules/utility-modules/shared/tagging.md)
: Manage tags.

[image information](../../modules/utility-modules/shared/image-information.md)
: Display information about the current image.

[mask manager](../../modules/utility-modules/darkroom/mask-manager.md)
: View and edit drawn shapes.

[export](../../modules/utility-modules/shared/export.md)
: Export selected images to local files or external services.

## right panel

From top to bottom:

[scopes](../../modules/utility-modules/shared/scopes.md)
: A graphical depiction of the image's light levels and colors. This module can be moved to the left-hand panel if desired (see [preferences > miscellaneous > position of the scopes module](../../preferences-settings/miscellaneous.md)).

[module groups](./organization/module-groups.md)
: Select module groups (if enabled).

search module
: Search for a module (if enabled).

[processing modules](../../modules/processing-modules/_index.md)
: The modules used to process an image.

[module order](../../modules/utility-modules/darkroom/module-order.md)
: Choose the order in which processing modules are executed in the pixelpipe.

## bottom panel

![darkroom-view-layout](./darkroom-view-layout/darkroom-bottom-panel.png#w100)

From left to right:

![presets-icon](./darkroom-view-layout/presets-icon.png#icon) [presets](./processing-modules/presets.md)
: Quick access menu for module presets. You can manage the contents of this menu by selecting "manage quick presets list...".

![styles-icon](./darkroom-view-layout/styles-icon.png#icon) [styles](../../modules/utility-modules/lighttable/styles.md)
: Quick access menu for styles. Hover over a style name with your mouse to show a preview of the current darkroom image with the selected style applied.

![second-window-icon](./darkroom-view-layout/second-window-icon.png#icon) second darkroom window
: For multi-monitor setup, allows the user to display a second image on another screen.

![focus-peak-icon](./darkroom-view-layout/focus-peak-icon.png#icon) [focus peaking](../../modules/utility-modules/shared/focus-peaking.md)
: Toggle focus peaking mode.

![color-assessment-icon](./darkroom-view-layout/color-assessment-icon.png#icon) [color assessment](../../modules/utility-modules/darkroom/color-assessment.md)
: Toggle the ISO12646 color assessment view.

![raw-overexposed-icon](./darkroom-view-layout/raw-overexposed-icon.png#icon) [raw overexposed warning](../../modules/utility-modules/darkroom/raw-overexposed.md)
: Toggle raw overexposed indicators (right-click for options).

![clipping-icon](./darkroom-view-layout/clipping-icon.png#icon) [clipping warning](../../modules/utility-modules/darkroom/clipping.md)
: Toggle clipping warnings (right-click for options).

![softproof-icon](./darkroom-view-layout/softproof-icon.png#icon) [soft proof](../../modules/utility-modules/darkroom/soft-proof.md)
: Toggle softproofing overlays (right-click for options).

![gamut-check-icon](./darkroom-view-layout/gamut-check-icon.png#icon) [gamut check](../../modules/utility-modules/darkroom/gamut.md)
: Toggle gamut checking (right-click for options).

![guides-overlays-icon](./darkroom-view-layout/guides-overlays-icon.png#icon) [guides & overlays](../../modules/utility-modules/darkroom/guides-overlays.md)
: Left-click to switch global guide overlays on/off and right-click to change the guide settings, including the color of all on-image drawing (masks, crop guides etc.)

You can also enable the [filmstrip](../../modules/utility-modules/shared/filmstrip.md) module at the bottom of the screen to allow you select and interact with the currently selected collection in the [lighttable](../../lighttable/_index.md) view.
