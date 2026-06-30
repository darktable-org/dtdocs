---
title: translators guide
id: translators guide
weight: 110
---

You are welcome to help translate darktable's docs. Please read through this guide to learn the conventions and requirements for translation work.

Translations are maintained through [weblate](https://hosted.weblate.org/projects/darktable-documentation/). Unregistered users can add suggestions for translations. To contribute to the translations you need to [register with weblate](https://hosted.weblate.org/accounts/register/).

Recommended reading:

* Guide for [styles and conventions](styles-conventions.md): Formalities and conventions on how dtdocs should be done
* [Translations setup](translations-setup.md) contains information on how data flows between the [dtdocs github repository](https://github.com/darktable-org/dtdocs) and weblate
* Documentation on how to [use weblate](https://docs.weblate.org/en/latest/user/translating.html)

Visit the [projects page](https://hosted.weblate.org/projects/darktable-documentation/) to see which languages need work and select one you are fluent in. You can then dive into translation work by picking one of the categories (e.g. "Untranslated strings").

If you want to know where a translatable string is located in the docs, you can check the *string information* and then *details* on the right side.

When translating, always preserve the original Markdown formatting — bold, italics, links, and shortcodes must appear in the translated string exactly as they do in the source.

# translating a specific section of the docs

If you want to translate a specific page, you need to use weblate's search function as there is no direct way of selecting e.g. "translate filmic.md". But if you either enter "all strings" or "untranslated strings" and use the filter at the top to filter for the first sentence, which is usually unique for each page, you can find the proper starting point to go through the page from top to bottom. For [AgX](../module-reference/processing-modules/agx.md) you could e.g. search for "Transform the colors and tonal range of an image to fit a display" (note that the apostrophes need to be included in the filter-search-field). 

After translating a string you can click "Save and continue" to go through the translatable strings in order.

It is helpful to open the page you are currently working on in a second window (e.g. using split view) to better see the context of the translatable strings. 

# technical information sections

At the top of each processing module's page there is a collapsible "Technical information" section that needs special formatting and is supposed to exactly mirror the descriptions available as tooltips in darktable. Automated translation of these sections is under construction. You can either carefully manually translate these strings or choose to skip and ignore them for now.
