---
title: collection filters
id: collection-filters
applicable-version: 4.0
tags:
view: lighttable, darkroom, tethering, map
---

Filter the _collection_ of images displayed in the lighttable view and filmstrip panel using image attributes, optionally pinning filters to the [top panel](../../overview/user-interface/top-panel.md) for quick access.

Once you have defined a _collection_ of images with the [collections](./collections.md) module, the collection filters module allows you to define additional filters and sort criteria. For example, you might wish to show all images in a given folder using the collections module and then define additional quick filters to narrow-down by star rating and/or color label.

# filtering attributes

For information about the image attributes you can select, please see the documentation for the [collections](./collections.md/#filtering-attributes) module.

Note that only a subset of filters is currently implemented -- more will be added in future versions of darktable.

# default settings

By default, three filters ([range rating](#range-rating), [color labels](#color-labels) and [text search](#text-search) are defined within this module. By default these filters select all images (i.e. show images with any star rating or color label) and are all pinned to the top panel for quick access. This default setting is also available as the "initial setting" preset.

# module controls

## adding new filters

To add a new filter to the module, click on the "new rule" button and select an image attribute to use.

## combining multiple filters

When you use multiple filters, the first item on the filter header allows you to define how the filter is combined with the previous one.

and
: Narrow down search. An image is only retained if it also fulfills the new criteria.

or
: Add more images. Images from the _collection_ that fulfill the new criteria are added.

and not
: Exclude images. Images that fulfill the new criteria are removed.

---

**Note**: The and/or/not operators have a defined order of precedence such that "not" is executed first, then "and" and finally "or". This means, for example, that if you define complex filters like "A and B or C and not D" these will be implemented as "(A and B) or (C and (not D))".

---

## removing or deactivating filters

You can remove or temporarily deactivate a specific filter using the buttons on the right of the filter header (see screenshots in the following sections). If a filter is pinned to the top panel, you will need to unpin it before removing or deactivating.

## pinning into the top toolbar

The pin button on the right of the filter header allows you to pin a filter to the top panel. To avoid unwanted actions, pinned filters can't be removed or deactivated.

## resetting filters

Clicking on the module reset button will remove all un-pinned filters and reset all others to their default values. If you want to also remove the pinned filters, you can Ctrl+click on the reset button.

## returning to a previous set of filters

You can return to a previously-defined set of filters by clicking on the history button at the bottom of the module and selecting from the resulting list.

# filter widgets

A number of filter widgets have been created for use within this module. Since some of these widgets use non-standard interfaces, their usage is explained in the following sections:

## color labels

The following image shows the color labels widget, set to filter images having yellow or green color labels:

![color filter](./collection-filters/color-filter.png#w33)

You can interact with this filter widget as follows:

- Click on a color label to include images with that label
- Ctrl+click on a color label to include images without that label
- Click or Ctrl+click on the gray icon to act on all color labels simultaneously
- Use the last button to define how multiple to handle the selection of multiple color labels. Select ![and](./collection-filters/color-filter-and.png#icon) (and) to filter images having _all_ of the selected color labels; Select ![or](./collection-filters/color-filter-or.png#icon) (or) to filter images with _at least one_ of the selected color labels.

## rating

This is the classic rating selection widget that used to be shown in darktable's top panel by default.

![rating filter](./collection-filters/rating-filter.png#w33)

It is composed of a pair of comboboxes. The first combobox is used to choose the operator to use and (if applicable) the second combobox selects the number of stars to be applied to that operator. If you choose "All", the second combobox will not appear.

## range rating

This new widget also allows you to select images by star rating, this time using a new "range" widget. The following image shows the widget with ratings of 2-4 stars selected.

![range rating filter](./collection-filters/range-rating-filter.png#w33)

You can choose a new range of ratings to filter by clicking and dragging over the widget's interface. You can also access pre-defined ranges by right-clicking and selecting from the popup menu. The number of applicable images is also shown against each entry in this menu.

## range filters for numeric attributes

Numeric attributes (aperture, exposure, focal length, iso, aspect ratio) are filtered using a widget that shows a histogram of the number of images available depending on the value of the given attribute (similar to the [_timeline_](../lighttable/timeline.md) in the lighttable view).

For example, the following image shows the widget when used for selecting by aperture:

![aperture range filter](./collection-filters/aperture-range-filter.png#w33)

As with the range rating filter, you can select a range of values to filter by clicking and dragging on the widget. You can also access predefined ranges by right-clicking and selecting from the popup menu. The number of applicable images is also shown against each entry in this menu.

You can also use the "min" and "max" text entry fields in the main module interface to manually define the bounds of the selection.

## date attributes

As with numeric and rating range filters, date/time filters are represented using a "range" widget. Select a range of values by clicking and dragging on the widget and use the right-click menu for more options.

![date range filter](./collection-filters/capture-date-filter.png#w33)

You can also use the "min" and "max" text entry fields in the main module interface to manually define the bounds of the selection (right-click for more options).

The date/time format used by this module is `YYYY:MM:DD HH:MM:SS` (only the year values are mandatory).

The keyword `now` is allowed in the max field (to define the current date/time).

You can also use "relative" date/time values by preceding text entries with `+` or `-`. This allows you to set the maximum or minimum bound of the range relative to the other bound. As an example if you set the min value to `-0000:01` and the max value to `2022:04:15`, this will select images taken during the month before April 15th 2022.

## filename

The filename filter allows you to search images by their filename and/or extension. You can either enter the name or extension (with the leading`.`) manually or use the right-click menu to select.

Within the extension field, you can also use the keywords `RAW` (to select all handled RAW file extensions), `NOT RAW` (to select all non-RAW file extensions), `LDR` (to select low-dynamic-range extensions) or `HDR` (to select high-dynamic-range extensions).

## text search

You can search images using any of their text properties (path, filename, filmroll, tags, metadata) using the text search filter. The search is performed "on-the-fly" and the widget is dimmed during the search process.

By default darktable performs a "fuzzy" search (wildcards are automatically added to the start and the end of the text). If you want to search for an exact match, you can enclose it with double-quotes (`"match this exactly"`).

# sorting

The bottom part of the module allows you to define the sort order of the images when displayed in the lighttable and filmstrip views. As with the filter criteria, you can add multiple rules to this section. However, only the first-selected sort criteria is pinned to the top panel (this cannot be unpinned).

As with filter criteria, the history button allows you to access any previously-used sort criteria.

The button to the right of the attribute selection allows you to choose whether to sort that criteria in ascending or descending order.
