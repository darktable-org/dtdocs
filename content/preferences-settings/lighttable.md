---
title: lighttable
id: lighttable
weight: 40
draft: false
---

The following options control functionality in the [lighttable](../lighttable/_index.md) view and modules.

color manage cached thumbnails
: If activated, darktable generates thumbnails in a general color space (AdobeRGB) in order to render them independently of the individual monitor. Conversion to the monitor color space is undertaken at display time. If this option is not activated thumbnails are stored directly in a monitor-specific color space at generation time and are subsequently displayed without further corrections (default on).

don't use embedded preview JPEG but half-size raw
: If activated, darktable will process the raw image data in order to generate all images in the lighttable. If deactivated, darktable will use the JPEG preview embedded in the raw file until the image has been processed in the darkroom (default off).

number of folder levels to show in lists
: The number of folder levels to show in film roll names, starting from the right (default 1).

sort film rolls by
: Sort film rolls by either the "folder" (path) or the "id" (roughly equivalent to the date the film rolls were first imported) in the [collect images](../module-reference/utility-modules/shared/collect-images.md) module (default "id").

sort collection recent to older
: When selecting folders and dates/times within the [collect images](../module-reference/utility-modules/shared/collect-images.md) module, sort items from recent to older (default on).

high quality thumbnail processing from size
: If the thumbnails size is greater than this value, it will be processed using the full quality rendering path, which is better but slower (default 720p).

delimiters for size categories
: Size categories are used to allow different thumbnail overlays to be shown depending on the thumbnail size. A pipe delimited set of values defines at what image sizes the categories change (default "120|400")

pattern for the thumbnail extended overlay text
: If the user has chosen to show extended overlay text over thumbnail images, this setting allows the user to define what information is displayed. This pattern can use any of the variables defined in the [variables](../special-topics/variables.md) section.

pattern for the thumbnail tooltip (empty to disable)
: Defines what information is displayed in the tooltip when the mouse hovers over image thumbnails. This pattern can use any of the variables defined in the [variables](../special-topics/variables.md) section.

use single-click in the collect panel
: Enable "single click" mode in the [collect images](../module-reference/utility-modules/shared/collect-images.md) module, which allows ranges to be selected (default off).

overlay txt sidecar over zoomed images
: If there is a text file next to an image in the filesystem it can be shown as an overlay over zoomed images on the lighttable. The text file must have the same base name as the image file with file extension `.txt`. The text file either has to be present at import time or the crawler has to be enabled – see [`preferences > storage > look for updated xmp files on startup`](./storage.md) (default off).

expand a single lighttable module at a time
: Controls how lighttable modules are expanded. If this option is enabled, expanding a module by clicking collapses any other currently expanded panel. If you want to expand a panel without collapsing the others you can do so with `Shift+click`. Disabling this option inverts the meaning of `click` and `Shift+click` (default off).

scroll to lighttable modules when expanded/collapsed
: With this option enabled the lighttable side panels will scroll a module to the top of the panel when it is expanded or collapsed (default off).

rating an image one star twice will not zero out the rating
: Normally clicking a one star rating twice will set a zero star rating to that image. Check this option to disable this functionality (default off).

show scrollbars for center view
: Should scrollbars be shown in the center view of the lighttable (default on).
