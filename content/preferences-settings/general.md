---
title: general
id: general
weight: 20
draft: false
---

Control the overall look and feel of darktable.

interface language
: Set the language of the user interface. The system default is marked with an * (needs a restart)

theme
: Set the theme for the user interface. Aside from any aesthetic considerations, the recommended interface color for color evaluation is middle gray. Visual perception is affected by ambient brightness, and a low user interface brightness causes all kinds of illusions. Using a dark interface to retouch photos can therefore lead to excessive retouching (abuse of contrast and saturation) and to a photo that is too dark when printed. It is therefore highly recommended that you use one of the "gray" themes for retouching work as these are designed so that the user interface approximates middle gray (default "darktable").

prefer performance over quality
: Enable this option to render thumbnails and previews at a lower quality. This increases the rendering speed by a factor of 4, and is useful when working on slower computers (default off). This also improves the performance of slideshow image rendering.

use system font size
: Select this option to use the font size defined by your system. If unchecked, you may enter a custom font size in the box below (default on).

font size in points
: If the "use system font size" option is switched off, enter a font size (in points) for darktable to use. The font size will be changed immediately.

GUI controls and text DPI
: Adjust the global GUI resolution to rescale controls, buttons, labels, etc. Increase for a magnified GUI, decrease to fit more content in the window. Set to -1 to use the system-defined global resolution. The default is 96 DPI on most systems. (needs a restart)

# CSS Theme Modifications

In addition to selecting a pre-built theme you can also apply additional CSS customisations of your own to tweak the look-and-feel of darktable. A text box is provided for this purpose.

When you have finished entering your CSS tweaks, click on the 'save CSS and apply' button. This will save your CSS to a file (`$HOME/.config/darktable/user.css`) and immediately apply it to the current darktable session.

If your changes cause any issues, you can uncheck the "modify selected theme with CSS tweaks below" check box. This will immediately restore the base theme but will leave your tweaks in the editor so that you can re-edit them and try again. Simply press "save CSS and apply" again when you are ready to retry. This will automatically re-check the "modify selected theme with CSS tweaks below" checkbox and apply the new CSS.

If you have any issues with darktable please retry with this option unchecked to be certain that they were not caused by any of your alterations.

If you want to understand how darktable themes are constructed you are advised to look at the file `$DARKTABLE/share/darktable/themes/darktable.css` for more information (where `$DARKTABLE` is darktable's installation directory). You can also use the Gtk Inspector tool to analyse the existing layout.
