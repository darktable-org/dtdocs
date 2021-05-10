---
title: lighttable
id: lighttable
weight: 40
draft: false
---

The following options control functionality in the [lighttable](../lighttable/_index.md) view and modules.

# general

hide built-in presets for utility modules
: If enabled, only user-defined presets will be shown in presets menu for utility modules -- built-in presets will be hidden (default off).

use single-click in the create collection module
: Enable "single click" mode in the [create collection](../module-reference/utility-modules/shared/create-collection.md) module, which allows ranges to be selected (default off).

expand a single utility module at a time
: Controls how utility modules are expanded. If this option is enabled, expanding a module by clicking collapses any other currently expanded panel. If you want to expand a panel without collapsing the others you can do so with Shift+click. Disabling this option inverts the meaning of click and Shift+click (default off).

scroll to utility modules when expanded/collapsed
: With this option enabled the side panels will scroll a utility module to the top of the panel when it is expanded or collapsed (default off).

rating an image one star twice will not zero out the rating
: Normally clicking a one star rating twice will set a zero star rating to that image. Check this option to disable this functionality (default off).

show scrollbars for center view
: Should scrollbars be shown in the center view of the lighttable (default on).

# thumbnails

color manage cached thumbnails
: If activated, darktable generates thumbnails in a general color space (AdobeRGB) in order to render them independently of the individual monitor. Conversion to the monitor color space is undertaken at display time. If this option is not activated thumbnails are stored directly in a monitor-specific color space at generation time and are subsequently displayed without further corrections (default on).

use raw file instead of embedded JPEG from size
: When generating thumbnails for images that have not yet been processed in the darkroom, if the thumbnail size is greater than this value, generate it by processing the raw image data. If the thumbnail is below this size, use the JPEG preview image embedded in the raw file. Once an image has been processed in the darkroom, thumbnails will always be generated from raw data (you can revert back to the JPEG preview by discarding history). To render thumbnails with the best quality choose "always".

high quality processing from size
: If the thumbnail size is greater than this value and is being generated from raw data, it will be processed using the full quality rendering path, which is better but slower (default 720p). To render thumbnails with the best quality, choose "always".

delimiters for size categories
: Size categories are used to allow different thumbnail overlays to be shown depending on the thumbnail size. A pipe delimited set of values defines at what image sizes the categories change. The default value of "120|400" means that there will be 3 categories of thumbnails: 0-120px, 120-400px and >400px.

pattern for the thumbnail extended overlay text
: If the user has chosen to show extended overlay text over thumbnail images, this setting allows the user to define what information is displayed. This pattern can use any of the variables defined in the [variables](../special-topics/variables.md) section.

pattern for the thumbnail tooltip (empty to disable)
: Defines what information is displayed in the tooltip when the mouse hovers over image thumbnails. This pattern can use any of the variables defined in the [variables](../special-topics/variables.md) section.
