---
title: user interface
date: 2022-12-04T02:19:02+01:00
lastmod: 2023-01-21
id: user-interface
draft: false
weight: 10
author: "people"
---

## Views

The functionality in Ansel is separated into six different views:

[Lighttable](../../views/lighttable/_index.md)
: Manage images and collections. It is the main view and can be accessed from anywhere in the software by hitting the <kbd>Escape</kbd> key.

[Darkroom](../../views/darkroom/_index.md)
: Develop a single image. It can be accessed from the lighttable by double-click on a thumbnail or by hitting the <kbd>Enter</kbd> key when a picture is selected.

[Map](../../views/map/_index.md)
: Show geo-tagged images on a map and manually geo-tag new images. It is an optional view hidden by default, it can be enabled in the [preferences](../../preferences-settings/other-views.md).

[Print](../../views/print/_index.md)
: Send images to a printer for self-made prints. It is an optional view hidden by default, it can be enabled in the [preferences](../../preferences-settings/other-views.md). This view is not available on Windows since it relies on [CUPS](http://www.cups.org/).

[Slideshow](../../views/slideshow/_index.md)
: Display images as a slideshow, processing them on-the-fly. It is an optional view hidden by default, it can be enabled in the [preferences](../../preferences-settings/other-views.md).

You can switch between views by clicking the view name at the top of the right-hand panel (the currently active view is highlighted).

## Main content

### Panels

The layout of all Ansel views is similar and consists of a center area with panels at the edges:

Left panel
: Can be shown and hidden with <kbd>Shift + Ctrl + L</kbd> :
    * __In lighttable__ : Shows the file import, export and collections.
    * __In darkroom__ : Shows various peripheral informations on the currently edited picture.

Right panel
: Can be shown and hidden with <kbd>Shift + Ctrl + R</kbd> :
    * __In lighttable__ : Contains metadata editors and bulk processing tools.
    * __In darkroom__ : Contains the settings to edit the picture.

Top panel (header)
: Contains information about the current Ansel version and allows you to switch between views. Also used by some modules to show additional hints and messages. Can be hidden and shown by pressing <kbd>Ctrl + H</kbd>

Top toolbar
: Provides buttons to access the global settings and shortcuts. Can be hidden and shown by pressing <kbd>Shift + Ctrl + T</kbd>.

Bottom panel
: Provides buttons to access to view-specific settings and shortcuts. Can be hidden and shown by pressing <kbd>Shift + Ctrl + B</kbd>

[Filmstrip](../../modules/utility-modules/shared/filmstrip.md)
: An optional panel that can be enabled at the bottom of the screen to display a timeline (in the lighttable view) or a filmstrip (in other views) of images in the current collection. Can be shown and hidden by pressing <kbd>Shift + Ctrl + F</kbd>.

### Resizing

The left, right and filmstrip panels can be resized by clicking and dragging their inner borders. Some shortcuts allow to globally change the layout :

 - <kbd>TAB</kbd> temporarily expands the centre view to fill the whole window (hide all panels). Press again to return to the previous view.
 - <kbd>F11</kbd> toggles fullscreen mode

{{< note >}}
The size and visibility of the panels are stored independently for each view.
{{</ note >}}


### Top toolbar

The top panel is common to all Ansel views and provides access to a number of common functions.

Filter / sort
: Choose how to filter and sort the images. Criteria can be altered in the [collection filters](../../modules/utility-modules/shared/collections.md) module.

Sort order
: Switch the sort order (ascending / descending).

Context-sensitive help
: Click this icon and then click on a control element to be directed to the appropriate online help page.

Shortcut mapping
: Click this icon to enter the [visual shortcut mapping](../../preferences-settings/shortcuts.md#visual-shortcut-mapping) mode to create keyboard/mouse shortcuts.

Preferences
: View and amend Ansel's [preferences & settings](../../preferences-settings/_index.md).

### Bottom toolbar

Grouping
: Expand or collapse [grouped images](../../views/lighttable/digital-asset-management/grouping.md).

Thumbnail overlays
: Define what information is overlaid on to thumbnails in the lighttable/filmstrip.
: You can define different settings depending on the thumbnail size. See [preferences > lighttable](../../preferences-settings/lighttable.md#thumbnails) for details of how size delimiters are set.


### Filmstrip

The filmstrip, when enabled, is shown at the bottom of the screen and displays the images from the current [collection](../../views/lighttable/digital-asset-management/collections.md) (set in the lighttable view). You can navigate the filmstrip by scrolling with the mouse wheel or with

The filmstrip allows you to interact with images while you are not in the lighttable view. For example, while developing an image in darkroom mode, you can switch to another image to by clicking its thumbnail in the filmstrip. You can copy & paste the history stack using keyboard shortcuts (<kbd>Ctrl + C</kbd> and <kbd>Ctrl + V</kbd>).

See the [filmstrip](../../modules/utility-modules/shared/filmstrip.md) module documentation for more information.


## Keyboard shortcuts

Much of the functionality in Ansel can be controlled via keyboard shortcuts, which can be customised in [preferences > shortcuts](../../preferences-settings/shortcuts.md).

Press the H key (for help) in any Ansel view to show a list of all shortcuts that are applicable to the current view.
