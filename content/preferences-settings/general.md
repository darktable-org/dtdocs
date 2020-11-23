---
title: general
id: general
weight: 20
draft: false
---

The preferences in this tab control the overall look and feel of darktable.

interface language
: Set the language of the user interface. The system default is marked with an * (needs a restart)

theme
: Set the theme for the user interface. Apart from any aesthetic considerations, the recommended interface color for color evaluation is middle grey. Indeed, visual perception is affected by ambient brightness, and a low brightness of the interface causes all kinds of illusions. Using a dark interface to retouch photos can therefore lead to excessive retouching (abuse of contrast and saturation) and to a photo that is too dark once printed. It is therefore highly recommended that you use one of the "grey" themes for retouching work as these are designed so that the user interface approximates middle grey (default "darktable").

performance mode
: Enable this option to render thumbnails and previews at a lower quality. This increases the rendering speed by a factor of 4, and is useful when working on slower computers (default off). This also improves the performance of the slideshow image rendering.

use system font size
: Select this option to use the font size defined by your system. If unchecked, you may enter a custom font size in the box below (default on).

font size in points
: If the "use system font size" option is switched off, enter a font size (in points) for darktable to use. The font size will be changed immediately.

GUI controls and text DPI
: Adjust the global GUI resolution to rescale controls, buttons, labels, etc. Increase for a magnified GUI, decrease to fit more content in the window. Set to -1 to use the system-defined global resolution. Default is 96 DPI on most systems. (needs a restart)

# CSS Theme Modifications

In addition to selecting a pre-built theme you can also apply additional CSS customisations of your own to tweak the look-and-feel of darktable. A text entry box is provided for this purpose.

When you have finished entering your CSS tweaks, click on the 'save and apply' button. This will save your CSS to a file (`$HOME/.config/darktable/user.css`) and immediately apply it to the current darktable session.

If your changes cause any issues, you can uncheck the "modify selected theme with CSS tweaks below" check box. This will immediately restore the base theme but will leave your tweaks in the editor so that you can re-edit and try again. Simply press "save and apply" again when you are ready to retry. This will automatically re-check the "modify selected theme with CSS tweaks below" checkbox and apply the new CSS.

If you have any issues with darktable please retry with this option unchecked to be certain that they were not caused by any of your changes.
