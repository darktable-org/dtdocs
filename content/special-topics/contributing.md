---
title: contributing to dtdocs
id: contributing
weight: 90
draft: false
author: "people"
---

This page defines the style guide for dtdocs and information about how to contribute to the project.

It is included in the user manual so that you can see how the page is rendered as well as how it is written. Please go to [GitHub](https://raw.githubusercontent.com/darktable-org/dtdocs/master/content/special-topics/contributing.md) to see the source for this page.

The manual structure and content have been carefully considered based on the following criteria:
1. The manual should be comprehensive -- it should describe all of the functionality available in darktable
1. It should have a consistent and logical structure and every piece of functionality should have its own logical place within that structure
1. It should be as long as necessary but as short as possible -- brevity is a must
1. It should be objective
1. Functionality should be explained once and only once (with the exception of the basic workflow guidelines in the overview section)
1. Images should be included only where necessary to improve understanding of key principles and should not contain text unless it is unavoidable

We are generally **not** interested in:
1. Restructuring the manual 
1. Switching markup languages
1. Detailed workflow tutorials (though we are interested in publishing those on the blogs of either darktable.org or pixls.us)

We **are** interested in 
1. Spelling and grammar corrections 
1. Clarification of text 
1. Documentation for new features

We are always extremely interested in hearing about which sections of the manual did not make sense to you and *why*, so that we can improve the documentation.

In general, if you wish to make a major change, please open an issue and discuss it with the maintainers first. This is to avoid doing work that wouldn't be accepted.

# format

This website is authored in pure markdown, using some extensions. It is initially designed to work with the Hugo SSG but intended to be portable enough that it can be easily rendered with another application if required.

Files should be rendered in UTF-8 and should not include any column wrapping.

# structure

The following shows the structure of an example main chapter with subsections in the dtdocs website.

```
example-chapter/
   _index.md
   section1-with-subsections/
      subsection1/
         image.png
      _index.md
      subsection1.md
      subsection2.md
   section2.md
   section3.md
```

A couple of notes on the above structure: 

- `_index.md` files do not contain any content (they contain metadata only) and are used to render section headers and ToC entries. In the above example `example-chapter/_index.md` defines the title of the example chapter and the order in which it appears in the main table of contents. Similarly `example-chapter/section1-with-subsections/_index.md` defines metadata for the first section of the chapter.
- Media files should be contained in a directory with the same name as the page to which they relate. In this example, `example-chapter/section1-with-subsections/subsection1` contains media related to the `subsection1.md` page.

# metadata

Metadata for the markdown files is presented at the head of the page using yaml. Any metadata may be defined -- the module reference sections contain quite a lot of specific metadata -- however the following defines some minimal metadata for the example page `example-chapter/section1-with-subsections/subsection1.md`.

```
---
title: Sub Section 1 Title
id: subsection1
weight: 10
---
```

title
: This should contain the rendered title of your page. To include a colon within a title, enclose the title in double-quotes.

id
: This is the id used to identify the page by Hugo. It should usually be the same name as the file (for content files) or the parent directory (for `_index.md` files).

weight
: This is an optional metadata field used to define the order in which sections are presented in the Table of Contents. If the _weight_ field is not included, pages will be rendered in alphabetic order by default. For example, to define the sections and subsections of the above example in reverse order, the following metadata would need to be set:

```
   example-chapter/
      section1-with-subsections/
         _index.md               # weight: 30 (place section1 page at the end of example-chapter)
         subsection1.md             # weight: 20 (place subsection1 page at the end of section1)
         subsection2.md             # weight: 10 (place subsection2 page at the start of section1)
      section2.md                # weight: 20 (place section2 in the middle of example-chapter)
      section3.md                # weight: 10 (place section3 at the start of example-chapter)
```

# content

## general style guidance

- All content should be authored in plain markdown without shortcodes and HTML should be kept to an absolute minimum, if used at all
- Minimalism is an absolute must. Fewer words are preferred
- Markdown files should be as short as possible
- Follow the naming and capitalization norms present in the GUI of the application -- namely all headers and titles are in lower case, except for the very top-level chapter names. Similarly, use all lower case when referencing module names and controls.
- Headers in a file should not exceed level three (###)
- The primary authoring language is English. Avoid idiomatic language where possible as the English version of the documentation may be read by people for whom English is not their native language
- Assume the reader has the application open while reading the user manual and only include images where they contribute to the explanation of complex functionality
- Use image callouts if you need to annotate an image (i.e. mark parts of the image with a letter or number and then explain the meaning in some text following the image). Do not place words directly into the image for annotations, as this makes localization difficult. See [this page](../darkroom/pixelpipe/the-anatomy-of-a-module.md) for an example.
- Changes to the content should be proposed via pull request or a similar mechanism
- Your submissions will be copy-edited -- don't take it personally

## keyboard and mouse shortcuts

- Reference named keyboard keys using CamelCase (Ctrl, Shift, Alt, Esc, AltGr, CapsLock, PageUp, PageDown)
- Reference single letter keys in lower case (this avoids confusion between for example, Ctrl+H and Ctrl+Shift+h). Quotation marks might help with clarification (press "h" to see a list of active shortcuts)
- Reference mouse actions using lower case, with multiple words joined by a hyphen (scroll, click, single-click, double-click, right-click)
- Connect combinations of keys/actions with a plus sign (Ctrl+Shift+h, Shift+double-click)

## definition lists

The standard method of presenting information about darktable module controls is with the use of definition lists. 

gui control name
: A declaration of what the control does. For example "Set the exposure in EV units".

: You can include as many paragraphs as you like, but try to limit to 2 or 3 where possible.

![active-icon](./contributing/active-icon.png#icon) a control accessed through a button with an icon
: When a control is activated using an icon, take a screenshot of the icon using the standard darktable theme (darktable-elegant-grey) and add it before the name of the control

gui combobox name
: Comboboxes often have multiple options that all need to be displayed with separate definitions. Use bulleted lists with _italics_ for the combobox values.
: - _the first value_: What the first value means
: - _the second value_: What the second value means

Definition lists are also used throughout the document, wherever a named piece of functionality needs to be defined. See, for example, [darktable-cli](./program-invocation/darktable-cli.md).

## notes

If you wish to present an important note to the user, use the following format:

---

**Note**: This is an important note.

---

## fixed-width fonts and code blocks

Fixed width fonts (using the \` character) should normally only be used for code blocks and when referencing file names and command line parameters.

## links

Internal links must be relative to the current file and must point to a valid markdown (.md) file. Start links with either `./` to represent the current directory or `../` to represent the parent directory.

- Links to a processing module should be in italics, e.g. [_exposure_](../module-reference/processing-modules/exposure.md)
- Links to a utility module should be in plaintext, e.g. [history stack](../module-reference/utility-modules/darkroom/history-stack.md)
- Link to a top level section by referencing the `_index.md` file, e.g. [module reference](../module-reference/_index.md)
- Link to a tab in the preferences dialog: [preferences > general](../preferences-settings/general.md)
- Link to a specific preference setting: [preferences > general > interface language](../preferences-settings/general.md)
- Each header within a page can be linked to directly with an anchor link: [contributing/notes](./contributing.md#notes)

## images

When taking screenshots from the darktable application itself, use the default darktable theme (darktable-elegant-grey).

Several filename suffixes can be used to control how an image is rendered.

icon
: To insert an image as an icon, include `#icon` after the image name in the link. The markdown `![squirrel icon](./contributing/contributing.png#icon)` outputs the following: ![squirrel icon](./contributing/squirrel.png#icon)

image width
: You can set the image width to 25, 33, 50, 66, 75 or 100 per cent of the rendered page width by including `#wxx` after the image name in the link, where `xx` is the desired width. For example:
: `![squirrel](./contributing/squirrel.png#w25)` outputs
: ![squirrel](./contributing/squirrel.png#w25)
: `![squirrel](./contributing/squirrel.png#w75)` outputs
: ![squirrel](./contributing/squirrel.png#w75)

inline
: With the exception of icons, images are included as block elements by default. You can override this by including `#inline` after the image name. This can be combined with the width setting as follows.
: `![squirrel](./contributing/squirrel.png#w25#inline)` outputs ![squirrel](./contributing/squirrel.png#w25#inline) 

default
: By default images are presented as block elements with 100% width. So `![squirrel](./contributing/squirrel.png#w100)` and `![squirrel](./contributing/squirrel.png)` are equivalent and both output the following:
: ![squirrel](./contributing/squirrel.png)

