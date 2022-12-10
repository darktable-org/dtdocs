---
title: combining drawn & parametric masks
date: 2022-12-04T02:19:02+01:00
id: drawn-and-parametric
weight: 40
draft: false
---

Drawn and parametric masks can be used in combination to form a single mask that can be applied to a module.

There are two main elements which control how individual masks are combined: the _polarity_ setting of each individual mask (defined by the plus or minus buttons) and the setting in the “combine masks” combobox.

The "combine masks" combobox contains the following options, defining how the drawn and parametric masks will be combined:

exclusive
: A straightforward method of combining masks, exclusive mode multiplies together the individual pixel values from each of the component masks.

: For a given pixel, the final mask will have value of 0 if _any_ of the individual masks are 0 at that location and it will only have a value of 1.0 if _all_ masks have a value of 1.0 at that location.

: Any individual mask can _exclude_ a pixel by setting its value to 0, regardless of what the other masks do. Once a pixel is excluded by a mask there is no way for another mask to include it again.

inclusive
: Inclusive mode first inverts each individual mask (subtracts its value from 1.0), multiplies the inverted masks together, and finally inverts the combined mask once again.

: For a given pixel, the final mask will have a value of 1.0 if _any_ of the individual masks are 1.0 at that location and it will only have a value of 0 if _all_ masks have a value of 0 at that location.

: Any individual mask can _include_ a pixel by setting its value to 1.0, regardless of what the other masks do. Once a pixel is fully included by a mask (its value is 1.0) there is no way for another mask to exclude it again.

exclusive and inclusive inverted modes
: Using the above combination methods alone would still be rather limiting. We gain maximum flexibility by allowing an additional inversion step for each individual mask. This is governed by the polarity buttons that you find close to the individual channels.

: Toggling the polarity button of a mask inverts its values (subtracts the original value from 1.0).

: Finally within the “combine masks” combobox you may select the _exclusive & inverted_ or _inclusive & inverted_ options. Each of these options is equivalent to the _exclusive_ and _inclusive_ modes, respectively, but with a final step that inverts the resulting mask.

## typical use cases

inclusive mode
: For this mode you set the “combine masks” combobox to inclusive mode and make sure that all polarity buttons of all the individual channels and of the drawn mask are set to negative (-). Your starting point is a mask where all pixels have a value of zero (no pixel is selected). You now adjust the parametric mask sliders to bring more and more pixels into the selection or you draw shapes on the canvas to select specific areas of your image.

exclusive mode
: In the opposite case you set the “combine masks” combobox to exclusive mode and make sure that all polarity buttons are set to positive (+). Your starting point is a mask with all values at 1.0 (all pixels are selected). You now adjust the parametric mask sliders to exclude parts of your image as needed or directly draw shapes on the canvas to exclude those areas.

For your convenience the parametric masks GUI provides a toggle button that inverts all channel polarities and toggles between inclusive and exclusive mode in the “combine masks” combobox.

For novice users it is recommended that you stick to the above two use cases. This means that you should decide beforehand how you want to construct your mask.
