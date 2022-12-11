---
title: filtering
id: filtering
applicable-version: 3.8
tags:
view: lighttable, darkroom, tethering, map
---

Filter the _collection_ of images shown in the lighttable view and filmstrip panel using image attributes.

Once you have set the _collection_ of images with the [collections](./collections.md) module, you can refilter and sort it by setting some filters based on image attributes.

The filters can optionally be "pinned" into the top toolbar for a quick access.

## filtering attributes

The images attributes used to setup filters are defined in [collections module](./collections.md/#filtering-attributes).

Note that currently only a subset of this filters are implemented. More is expected in next versions.

# filters controls

### combining multiple filters

When you use multiple filters, the first item on the filter header allow you to define how the filter is combined with the previous one.

and
: narrow down search. An image is only retained if it also fulfills the new criteria.

or
: add more images. Images from the _collection_ that fulfill the new criteria are added.

and not
: exclude images. Images that fulfill the new criteria are removed.

### removing or deactivating filters

You can remove completely or deactivate temporarily a specific filter using the buttons on the right of the header.

### pinning into the top toolbar

The pin togglebutton on the right of the header allow you to pin a _clone_ of the filter into the top toolbar. The filter and its clone stay synchronized all the time. To avoid unwanted actions, pinned filters can't be removed or deactivated. If you want to do so, un-pin the filter first.

# filters specific widgets

### color labels

You can filter images by their colorlabels by using the dedicated filter which expose a widget where you can click on the colorlabel you want to search for.
Ctrl-Click on a color button, allow you to exclude the color.
The last _grey_ icon will act on all color simultaneously.
The last button define the operator used to combine the color together. It can be either `∩` (and) to get images having all selected color labels, or `∪` (or) to get images with at least one of the selected color labels.

### rating

In order to answer different workflows, two rating widgets can be used.

rating
: this is the _legacy_ rating widget with a first combobox to choose the comparator and a main combobox to select the number of stars to filter.

range rating
: this is new widget that allow you to select the range of the rating you want to filter by using Click+Drag. You can also access predefined ranges, as well as specific rating (with an indication of the number of images concerned) using the context-menu that can be shown using Right-Click.

## numeric attributes

Numeric filters (aperture, exposure, focal length, iso, aspect ratio) use a widget that show on a graph the repartition of the images depending on their attribute value.
To select a range of value you can Click+Drag on the graph. You can also access predefined range if any, as well as the specific values (with an indication of the number of images concerned) using the context-menu that can be shown using Right-Click.
In the left panel, you can also used the "min" and "max" entry to define the bounds manually (or Right-Click on the entries to get a context-menu with existing values).

### date attributes

Like for numeric filters, date-time filters are represent on a graph and a range can be selected with Click+Drag. The context menu allow to set a date using a calendar as well as to select an existing date-time).
In the left panel, you can also used the "min" and "max" entry to define the bounds manually (or Right-Click on the entries to get the context-menu with calendar and existing values)
Date-time format is `YYYY:MM:DD HH:MM:SS` (only the year values are mandatory).
The keyword `now` is allowed in the max field.
You can also use "relative" date-time value by preceding the values with `+` or `-`. This allow you to set the max or min bound of the range relatively to the other bound. As an example if you set min value to `-0000:01` and max value to `2022:04:15` you get the image taken during the month before april, 15th 2022.

### filename

The filename filter allow you to search images by their filename and/or extension name. You can either enter the name or extension (with the leading`.`) manually or use the context-menu that will show you each specific values in the _collection_ with the number of images concerned.
For the extension field, you can use the keyword `RAW` as a replacement of all handled RAW extensions, `NOT RAW` for all the extensions except the RAW ones, `LDR` for all low dynamic range extensions and `HDR` for hight dynamic range extensions.

### text search

You can search images by their text properties (path, filename, filmroll, tags, metadata) using this filter. The search is done "on-the-fly" and the widget is dimmed during the search process.
By default we do a "fuzzy" search (we add wildcards at the start and the end of the text). If you want to search for an exact text, you can enclose it with `"`.

# module controls

## resetting filters

Like all darktable module, you can reset the modules settings with the usual module header button. For this specific module a "simple" click will remove all un-pinned filters and reset the other to their default values. If you want to also remove the pinned filters, you can Ctrl-Click on the reset button.

## adding a new filter

A "new rule" button popup a menu that allow you to select the filter you want to add to the list.

## returning to a previous set of filters

You can revert to a previously defined set of filters by clicking on the history button and selecting one of the most recent set you have used.

## sorting

Criterias and orders used to sort the images can be defined using the bottom part of the module.
You can use multiple criterias if needed.
The first (and mandatory) criteria is also shown in the top toolbar.
As for filters, you can add a new sort or revert to a previous set of sorts by using the "new sort" and "history" buttons.
