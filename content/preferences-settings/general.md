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

# CSS theme modifications

In addition to selecting a pre-built theme you can also apply additional CSS customisations of your own to tweak the look-and-feel of darktable.

Two different methods are provided for this:

create a custom theme
: If you wish to make a large number of changes to darktable's UI you may wish to create your own theme (in a `.css` file) and place it in `$HOME/.config/darktable/themes` (or `C:\%LOCALAPPDATA%\darktable\themes` on Windows). Your new theme will automatically appear in the _theme_ selection list the next time you restart darktable. 

: Please note that the structure of darktable's internal CSS changes frequently and you may need to make significant changes to your own themes when new versions of darktable are released. For this reason (among others) we do not recommend creating complex custom themes unless you are willing to devote a lot of time to ongoing maintenance. If your theme loads any of darktable's pre-built themes using the `@import url` directive, note that your CSS theme file may not be portable between installations (`@import url` uses relative paths and the location of the pre-built themes is system-dependent).

create theme tweaks
: A text box is provided at the bottom of the general tab within which you can enter your own CSS tweaks. When using this option, darktable will first load your selected theme (the "base" theme, chosen in the _theme_ drop-down) and then apply your custom CSS on top. This means that you can easily make minor alterations to the look-and-feel, while still keeping mostly up-to-date with core theme changes when a new version of darktable is released. It also means that you can usually change your base theme without affecting your custom CSS tweaks.

: When you have finished entering your CSS, click the "save CSS and apply" button. This will save your CSS to `$HOME/.config/darktable/user.css` (or `C:\%LOCALAPPDATA%\darktable\user.css` on Windows) and immediately apply it to the current darktable session.

: If you notice any issues after applying your CSS, you can uncheck the "modify selected theme with CSS tweaks below" box to revert. This will immediately restore the base theme but will leave your tweaks in the editor so that you can re-edit them and try again. Simply press "save CSS and apply" again when you are ready to retry. This will automatically re-check the "modify selected theme with CSS tweaks below" checkbox and apply the new CSS.

---

**Note**: If you have any issues while using custom CSS tweaks please retry with the "modify selected theme with CSS tweaks below" option unchecked to be certain that they were not caused by any of your alterations.

---

## understanding darktable's themes

All of darktable's pre-built themes are provided as CSS files in `$DARKTABLE/share/darktable/themes/` (where `$DARKTABLE` is darktable's installation directory). The default theme is `darktable.css` and this contains the bulk of the code used to control the look-and-feel of darktable. A number of other themes are also provided but most of them use `darktable.css` as a base (by importing `darktable.css` using the `@import url` directive).

If you choose to create your own custom theme file you are advised to follow a similar approach -- import one of darktable's existing theme files using `@import url` (this directive expects relative paths) and then apply your own customisations on top. You do not need to do this when using the CSS text box in the preferences dialog -- attempting to use `@import url` in the CSS tweaks text box will not work correctly.

Themes use the same basic CSS principles as in html browsers (with some minor exceptions -- see the [Gtk documentation](https://developer-old.gnome.org/gtk3/stable/chap-css-overview.html) for details):

- The majority of the style properties are assigned to broad groups of UI elements, for example, Gtk buttons and text entry fields
- Next, related groups of darktable-specific UI elements are given _class names_ allowing them to be styled as a group
- Finally, some unique UI elements are assigned a CSS _id_ so that they can be styled independently

You are encouraged to explore the existing themes (`darktable.css` in particular is very well commented) and to make use of the [Gtk Inspector](https://wiki.gnome.org/Projects/GTK/Inspector) tool to figure out how to select the specific UI element (or class of elements) you wish to modify. Some experimentation will be required.

Please note that darktable themes are grayscale by default in order that users not be distracted by strong colors while editing images. You are advised to retain this practice in your own themes and to keep the average shade as close to middle-gray as possible. In addition you are advised to review your custom CSS each time darktable is updated, to ensure that changes to the application have not adversely affected your tweaks.
