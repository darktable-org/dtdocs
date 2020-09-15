---
title: general
id: general
weight: 20
draft: false
---

The preferences in this tab control the overall look and feel of darktable.

interface language
: Set the language of the user interface. the system default is marked with an * (needs a restart)

theme
: Set the theme for the user interface 

use system font size
: Select this option to use the font size defined by your system. If unchecked, you may enter a custom font size in the box below (default on).

font size in points
: If the "use system font size" option is switched off, enter a font size (in points) for darktable to use. The font size will be changed immediately.

GUI thumbs and previews DPI scaling factor
: Scale the thumbnails and previews resolutions for high DPI screens. Increase if thumbnails look blurry, decrease if lighttable is too slow. Set to -1.0 to use the system-defined global scaling. Default is 1.0 on most systems, or 2.0 when using resolutions above 1920×1080 px. This needs a restart to apply changes.

GUI controls and text DPI
: Adjust the global GUI resolution to rescale controls, buttons, labels, etc. Increase for a magnified GUI, decrease to fit more content in window. Set to -1 to use the system-defined global resolution. Default is 96 DPI on most systems. This needs a restart to apply changes.

### CSS Theme Modifications

In addition to selecting a pre-built theme to apply to darktable as a whole (above) you can also enter additional CSS customisations of your own to tweak the look-and-feel of darktable. A text entry box is provided for this purpose.

When you have finished entering your CSS tweaks, click on the 'save and apply' button, which will save the tweaks to a file (`$HOME/.config/darktable/user.css`) and immediately apply them to the current darktable session.

If there are any issues with the entered tweaks, you can uncheck the "modify selected theme with CSS tweaks below" check box. This will immediately restore the base theme but will leave your tweaks in the editor so that you can edit and try again. Simply press "save and apply" again when you are ready to retry. This will automatically re-check the "modify selected theme with CSS tweaks below" checkbox and apply the new CSS.

If you have any issues with darktable please retry with this option unchecked to be certain that they were not caused by any of your changes.
