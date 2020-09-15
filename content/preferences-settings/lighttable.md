---
title: lighttable
id: lighttable
weight: 40
draft: false
---

The following options control functionality in the lighttable view.

color manage cached thumbnails
: If activated darktable generates thumbnails in a general color space (AdobeRGB) in order to render them independently of the individual monitor. Conversion to the monitor color space is done at display time. If this option is not activated thumbnails are directly stored in the specific monitor color space valid at generation time and are subsequently displayed without further corrections (default on).

don't use embedded preview JPEG but half-size raw
: If activated darktable will process the raw image data in order to generate all images in the lighttable. If deactivated, darktable will use the JPEG preview embedded in the raw file until the image has been processed in the darkroom (default off).

number of folder levels to show in lists
: The number of folder levels to show in film roll names, starting from the right (default 1).

sort film rolls by
: Sort film rolls by either the "folder" path or the film roll "id" in the _collect images_ module. "id" is an integer that's auto-generated the first time a film roll is imported (default "id").

sort collection recent to older
: Set the default collections-list order for folders, times and dates to run from recent to older (default on).

high quality thumbnail processing from size
: If the thumbnails size is greater than this value, it will be processed using the full quality rendering path, which is better but slower (default 720p).

delimiters for size categories
: Size categories are used to allow different thumbnail overlays to be shown depending on the thumbnail size. A pipe delimited set of values defines at what image sizes the categories change (default "120|400")

pattern for the thumbnail extended overlay text
: If the user has chosen to show extended overlay text over thumbnail images, this setting allows the user to define what information is displayed. See **LINK TBC** for details of how to set this.

pattern for the thumbnail tooltip (empty to disable)
: Defines what information is displayed in the tooltip when the mouse hovers over image thumbnails. See **LINK TBC** for details of how to set this.

use single-click in the collect panel
: in the collect images module, enable single-click, which allows ranges to be selected (default off).

overlay txt sidecar over zoomed images
: If there is a text file next to an image it can be shown as an overlay over zoomed images on the lighttable. The text file must have the same base name as the image file with file extension `.txt`. It either has to be present at import time or the crawler has to be enabled – see option “look for updated xmp files on startup” in the _preferences_ dialog, _storage_ tab (default off).

expand a single lighttable module at a time
: Controls how lighttable panels are expanded. If this option is enabled, expanding a panel by clicking collapses any other currently expanded panel. If you want to expand a panel without collapsing the others you do so with Shift+click. Disabling this option reverts the meaning of click and Shift+click (default off).

scroll to lighttable modules when expanded/collapsed
: With this option enabled the lighttable side panels will scroll a module to the top when it is expanded or collapsed (default off).

rating an image one star twice will not zero out the rating
: Normally clicking a one star rating twice will set a zero star rating to that image. When checking this option a second click on a one star rating will keep that rating (default off).

show scrollbars for center view
: Should scrollbars be shown in the center view of the lighttable (default on).
