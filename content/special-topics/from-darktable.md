
---
title: Transitioning from darktable to Ansel
date: 2023-01-18
weight: 10
draft: false
latex: true
---

## What was removed from mainstream darktable

### Features

[The tethering view](https://docs.darktable.org/usermanual/3.8/en/tethering/)
: It relies on the lib GPhoto2 which is super brittle and buggy. The tethering view is merely a GUI over Gphoto2, much like [Entangle](https://entangle-photo.org/). The problem is GPhoto2 is known to break something different at each new release, so it's simply not worth the trouble to maintain a GUI over a Schrödinger cat. Use Entangle if you need to.

The easter egg video game
: Not funny if you happen to be with a client on April 1st and your working app opens on a silly game that can't even be closed with <kbd>Ctrl+Q</kbd>. (Yes, it happened to me).

The histogram overlay control for [exposure and black level](https://docs.darktable.org/usermanual/3.8/en/module-reference/utility-modules/shared/scopes/#exposure-adjustment)
: It's too easy to inadvertently mess up exposure when cycling through scopes (especially with a Wacom tablet) and it adds unnecessary GUI motion events and redraws. In cases of multiple instances of exposure module, it is automatically linked to the controls of the last instance, which is generally wrong because it is typically masked.

The new filtering option
: A beautiful shit made of 6300 lines of bloat and still counting, that needs a screen-reader to understand WTF those icons mean, supposed to fix a problem nobody had with something that adds bugs and trouble. That thing is the poster case of everything that's wrong in Geektable 4.0. It should be called a regression. The same feature is achieved in Ansel with about 580 lines of code. And to say that the new filtering started as a refactoring project… Never let the darktable idiots refactor anything, it's too dangerous.

The [stars rating](https://docs.darktable.org/usermanual/3.8/en/lighttable/digital-asset-management/star-color/#star-ratings) toolbar in lighttable
: It's redundant with overlays and requires to travel too far with the cursor to set it. Use overlays with cursor or key shortcuts to set stars.

The [timeline](https://docs.darktable.org/usermanual/3.8/en/module-reference/utility-modules/lighttable/timeline/)
: terrible code and a huge loss of CPU cycles for a niche feature that essentially serves no purpose. This was responsible for way too many SQL requests and removing it is responsible for most of the GUI responsiveness improvement.

The main window borders with collapsing arrows
: They waste space and tend to reappear when you don't want them because their state is view-dependent. For now, collapsing side-bars can be achieved with <kbd>Ctrl + L(eft)</kbd>, <kbd>Ctrl + R(ight)</kbd>, header with <kbd>Ctrl + T(op)</kbd> and bottom bar with <kbd>Ctrl + B(ottom)</kbd>. In the future, a global menu (you know, like in any app since 1990) will take care of that with a _view_ menu.

The [second darkroom window](https://docs.darktable.org/usermanual/3.8/en/darkroom/darkroom-view-layout/)
: darktable is slow enough with 2 pipelines (thumbnail & preview), a third one is not realistic. This should have been the main preview redirected to another window but the code has been hastily hacked by copy-pasting, it's terrible. Also there is no traceability on which display profile will be used, good luck with that.

The block and timeout overlay mode in lighttable
: terrible code for another niche feature that nobody tests until bug appear on the issue tracker that will be answered with "it works on my computer".

The extended overlays mode for thumbnails
: each of the EXIF metadata display triggered its own SQL request per-thumbnail, because no cache was used, because the guy who coded that doesn't learn or doesn't care, but such a loss of CPU cycles is inacceptable.

The non-dynamic culling mode and the zoomable lighttable view
: They are not really used and need a lot of spaghetti code to be handled.

The dark and icon themes
: dark themes trigger all sorts of unwanted visual illusions that make color assessment impossible. Their use is discouraged everywhere on darktable's doc but they are still there.

The ability to assign keyboard shortcuts to Gtk notebook tabs, as well as switching tabs by mouse scroll.
: Just because you can doesn't mean you should, and capturing mouse scroll on inner tabs messes up with sidebar scrolling (you know, the regular scolling over content that doesn't fit in the viewport).

The VIM-style shortcuts
: I bet you never knew, but if you start typing `:` in darktable, followed by a command, you can trigger stuff. This feature has never documented and the available features are really limited, but that still listens to all keystrokes to check if it should capture them.

The histogram profile
: That thing is coded by copy-pasting the display code, instead of writing reusable functions. It wouldn't be that bad if it wasn't completely misleading and actually broke the over-exposure alert (because, yes, it's used there too). Because the histogram is captured at the far end of the pipeline, in display color space, it might be already clipped to display gamut. Say you use Rec2020 space as the histogram profile, because it's the working space, what you see is RGB clipped to display space then rescaled to Rec2020, which means your clipping peak will not be at the far end of the graph, where you expect it. The result is highly misleading and voids the whole principle of a scope. That's just a whole pile of crap coded by people who have no idea of what a graphic pipeline is and hack small bits here and there because the concept of "modules" fooled them. They might be modular, but they still apply in sequence in the pipeline, so better check your inputs.

Warning messages in modules
: I'm responsible for that stupidity. The warning messages were supposed to tell users they are doing things not really intended by the designer (for example, using 2 different steps of white balance correction) and to ask them to double-check if that's really what they wanted. That backfired badly because users don't get the difference between an error and an alert, so even when instructed to use 2 white balances (for example, a custom-corrected raw WB), they would get afraid by the "error" and annoy me with questions. Given that this feature is clearly not helping anybody, and did not trigger the expected behaviour (that is, RTFM), there is no point in keeping it. The option to hide them is removed as well.

Favourite presets button
: There was this favourite presets button at the left of the bottom panel in darkroom, and I found nobody who ever used it. In fact, most people who I asked did not ever know it even existed. So it's gone.

Importing from camera
: darktable has a way to mount the camera file system (SD or CF memory cards) through USB, using the library GPhoto2. But the desktop environment is also be able to mount the camera as a local hard drive using PTP and/or MTP protocol, possibly also through Gphoto2. In that case, darktable and the OS may compete for access to the USB media, so you need to unmount it first from the OS to be able to open it from darktable. On Windows, you even need to install custom USB drivers to make it work with GPhoto2, but these drivers will prevent the camera to work with the OS until you completly remove and reset them. So this feature is completely removed, and Ansel loads memory cards as USB media through the OS mounts. To enable this, you may have to install Linux packages such as `libmtp`, `linuxptp`, `libptp`, `libgphoto2` and possibly `gphoto2`. For your desktop environnment, you may install `kio-mtp` and `kio-extras` on KDE or `gvfs-mtp` and `gvfs-gphoto2` on Gnome. In any case, you are advised to simply use an SD of CF card reader, it's cheap and prevents most issues that can arise from udev and cameras connected through USB.

Overall, 5 to 6 SQL requests per thumbnail per "mouse over" event are now spared, due to the features removed (which still lets 3 requests…, aka 2 more than what should be).

### Preferences

* The option to display a mask button in module's header is removed and the button is always shown,
* The option to display the scroll bars in lighttable and darkroom is removed, scrollbars will always appear in lighttable and will never appear in darkroom,
* The option to favour speed at the expense of quality is removed (process downscaled thumbnails), quality is favoured. This will produce previews consistent with the main preview and will prevent much confusion among users, at the expense of speed.
* The option to expand modules on "enable" event and collapse on "disable" event is removed, collapsed state is independent from enabled state (I was the author of that stupidity and even I grew weary of this).
* The option to scroll to the expanded module is removed, expanded modules will always trigger a scroll to be fully visible in viewport.
* The option to open only one module at a time is removed. Modules will never be auto-collapsed when a new module is expanded. You may use <kbd>Shift + Click</kbd> on a module header to open this one while collapsing all the others.
* The option allowing to immediately rename a new instance of a module has been removed and users will always be prompted to rename a new instance right after adding it. This simply encourages sane workflows because everybody adding unnamed instances has always hated themselves shortly after. Be nice to your future self people (no, you will not remember).
* The option to disable the silly behaviour removing the star rating if you hit 1 star twice has been removed because WTF ? To remove the star rating, hit 0 and be done with it. 1 means 1.
* The option allowing to compute a downscaled preview pipeline in darkroom is removed, and preview pipelines will always be computed at their correct size. This is a can of worms since neighbourhood filters (local contrast, contrast equalizer, diffuse and sharpen, blur, etc.) are accurate only when zoomed-in at 100%. If you zoom-out at screen size, as to fit the image within the viewport, you already introduce a visual inconsistency that produces misunderstanding among users and lots of false-positive bugs reports. But if you even downscale that, you are really pushing your luck and looking for trouble. You don't pay for that software, at least buy decent hardware to run it properly.
* The option to use single click to open images in darkroom from thumbnail has been removed. That's just not how file managers work and it creates too many opportunities to accidentally open images.

## Modules deprecated

All the remaining Lab modules that I have warned against for years are deprecated, namely:

* bloom, *(replaced by diffuse or sharpen, preset blooming)*
* raw chromatic aberrations, *(replaced by RGB chromatic aberrations)*
* contrast, lightness, saturation, *(replaced by filmic and color balance)*
* colorize, *(replaced by color balance)*
* color contrast, *(replaced by color balance)*
* color correction, *(replaced by color balance)*
* color mapping, *(replaced by color mapping features in exposure and color calibration)*
* color reconstruction, *(replaced by filmic color reconstruction, "high quality reconstruction" method)*
* high-pass, *(replaced by diffuse or sharpen, various deblurring presets)*
* levels, *(replaced by filmic, white and black relative exposures settings)*
* low light, *(replaced by color balance)*
* low-pass, *(replaced by blurs)*
* monochrome, *(replaced by color calibration, "grey" tab, and various film-emulation presets)*
* raw denoise, *(replaced by denoise profiled)*
* shadows and highlights, *(replaced by tone equalizer and local contrast)*
* sharpen, *(replaced by diffuse or sharpen, various deblurring presets)*
* soften, *(replaced by diffuse or sharpen, blooming preset)*
* split-toning, *(replaced by color balance)*
* tone curve, *(replaced by tone equalizer, filmic and color balance)*
* velvia. *(replaced by color balance)*

The display-referred RGB modules have been deprecated too:

* base curve, *(replaced by filmic)*
* RGB levels, *(replaced by filmic, white and black relative exposures settings)*

The scene-referred and display-referred processing workflows have been removed too, the scene-referred workflow is the only one and default. The chromatic adaptation workflows are removed too, the modern workflow will always be used.

One of the most common questions, since the big scene-referred change, was "what modules should I avoid". Now, you don't need to ask. Despite what some people say, "deprecated" means the modules can't be found in UI for new edits, but they are still very much in the program and ready to serve for old edits that use them. Deprecating is just GUI cleaning.

The *output color profile* module has been removed from the darkroom GUI. It is **still** applied in the pipeline, so only the GUI widget is hidden, but since the output profile is set either from the display options (for the thumbnails and previews) or in the export module (for file exports), the profile defined in the darkroom module was overwritten anyway, and the duplicated setting confused some users. In the export module, the former "same as image" profile option (that used the options set in the output color profile module) has been replaced by "same as original", which will reuse the embedded color profile if any or fall back to sRGB otherwise (noticeably for raw files). All in all, this only changes **where** the output profile is set in the GUI and de-duplicate this setting, it does not affect the pipeline.

## What was changed from mainstream darktable

### Behaviours

Mouse scroll
: The mouse scroll will scroll the content of the container (sidebars) and will not be captured by sliders, unless sliders got clicked over first (or used through keyboard shortcuts). This restores the intuitive and common behaviour of a mouse scroll and protects from unwanted setting changes. See [#11](https://github.com/aurelienpierreeng/ansel/issues/11). The preference to decide how mouse scroll should be treated is consequently removed.

"Mouse over" event
: In lighttable, the "mouse over" event now does not select images for writing and possibly harmful operation (writing metadata, copying history stack, deleting/moving files, applying styles, rating, labelling, tagging etc.). These "mouse over" events trigger only safe read-only events  in the metadata display module.

Modules listening to "mouse over"
: Similarly, the modules like tagging, geotagging, etc. that reacted to the "mouse over" event (by updating their content) now only react to hard selection (click or key stroke). This saves many SQL requests to read metadata when moving the mouse in lighttable and improves responsiveness.

Copy all
: The "copy all" history stack now copies and pastes white balance too. Meaning it does what it says. That used to be the case, but another hasty hack got that changed for madness 2 years ago.

CSS animations
: Animations are basically videos that need to be computed at 30 FPS while Gtk is only single-threaded on CPU, that's just a stupid loss of CPU cycles.

### Views

The less-used views like _Map_, _Print_ and _Slideshow_ are hidden by default, but can be re-enabled from the _Preferences_ -> _Other views_. This prevents GUI bloat since the `.so` objects of the views are simply not loaded at startup (they are not hidden from the GUI, they completely don't exist). This has the drawback of deleting user-defined shortcuts if any, for these views. But the issue is Gtk initializes and redraws all GUI widgets, whether they are visible or not, so even hidden and unused views will drain your CPU.

Users who want to preserve their shortcuts for the 3 removed views may edit the `~./config/ansel/anselrc` file by adding the following lines __before__ starting the software :

```ini
/views/map/enable=TRUE
/views/print/enable=TRUE
/views/slideshow/enable=TRUE
```

### Widgets

Capitals
: Modules names, buttons and section labels have their initial letter capitalized programmatically as grammar and typography rules suggests for better visual cues and for consistency with the rest of the world. This does not break translations but may trigger weird behaviours with accented characters. This is a work in progress and not all places have capitals yet. It uses sentence capitalization because the code to do so is 4 lines, while using title capitalization would require tokenization and is far less robust to achieve across a variety of languages.

Export
: The "export" module is moved to the left sidebar in lighttable, for consistency with import, collect, etc.

DAM modules removed from darkroom
: The "export" and "tagging" modules are removed from darkroom, since they are DAM features. Exporting an image cannot be done from the darkroom to prevent running 3 concurrent pipelines, which can produce crashes and loss of data if the available RAM is exceeded (and the RAM allocation code is currently broken, especially on GPU). This will also free some space for the image processing widgets in darkroom.


Renamings :
:  * "import" module renamed "open & import", its buttons renamed "open from disk" and "import from camera",
   * "collections" module renamed "collect",
   * "history stack" module renamed "apply development",
   * "geotagging" module renamed "edit geo tags",
   * "selected image[s]" module renamed "act on selection", and its "images" tab renamed "files",
   * "metadata editor" module renamed "edit metadata",
   * "image information" module renamed "display metadata" and moved at the bottom of the left sidebar, to be always visible if expanded (Head-Up Display style),
   * "recently used collections" module renamed "recent collections",
   * "styles" module renamed "apply styles",
   * "tagging" module renamed "edit text tags",

In the future, the modules "act on selection" and "select" will be moved to a global menu because they don't take user input but only display buttons. To display hierarchical lists of buttons, graphic designers invented drop-down menues since the 1980's. Another thing darktable failed at.

The purpose of these changes is to have a "file" left sidebar in lighttable (import, export, collect) and an "edit" right sidebar (apply styles, developments, tags, etc.), with names that call to action in order to present the workflow steps.

## Presets

Exposure module
: The exposure boost has been changed from +0.5 to +0.7 EV,

Filmic
: In filmic module, the contrast is changed to 1, latitude is set to 0.01% (which practically disables it — doesn't matter for v6), and the interpolation spline is set to back to "hard" (fourth order polynomial with $C^2$ connectivity condition).

Color balance RGB
: This module is now enabled by default with the "standard colorfulness" preset, as to give a base rendition closer to the infamous out-of-camera JPEG.

Lens correction
: This module is now enabled by default because I couldn't think of a photographer __not__ wanting to correct lenses.

Dithering
: This module is now enabled by default because it does no harm but protects JPG and other low-bit-depth exports from posterization.
