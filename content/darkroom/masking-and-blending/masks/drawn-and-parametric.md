---
title: combining drawn & parametric masks
id: drawn-and-parametric
weight: 40
draft: false
---

Drawn and parametric masks can be combined to form the final output mask for a module. 

There are two main elements which control how individual masks are combined: the polarity setting of each individual mask, defined by the plus or minus buttons, and the setting in the “combine masks” combobox.

exclusive
: A straightforward method of combining masks is by multiplying the individual pixel values from each of the component masks. 

: The final mask will have a pixel value of 0 whenever one of the individual masks is 0 at that pixel location. The final mask can only reach a maximum pixel value of 1.0 if each and every of the individual masks has a value of 1.0 at that location. This method of combination is known as _exclusive_. 

: Any individual mask can exclude a pixel by setting its value to zero, regardless of what the other masks do. Once a pixel is excluded by any mask there is no way for another mask to include it again.

inclusive
: An alternative method of combining masks is to first invert each individual mask (subtract its value from 1.0), multiply those inverted masks together, and finally invert the combined mask once more. 

: Now, if _one_ of the input masks has a value of 1.0 at a given pixel the final value for that pixel will also be 1.0. Conversely, the final mask can only reach a pixel value of 0 if _all_ of the individual masks have a value of 0. This method of combination is known as _inclusive_. 

: Any individual mask can include a pixel by setting its value to 1.0, regardless of what the other individual masks do. Once a pixel is included (its value is 1.0) by any mask there is no way to exclude it again by any other individual mask.

exclusive and inclusive inverted modes
: Using the above combination methods alone would still be rather limiting. We gain maximum flexibility by allowing an additional inversion step for each individual mask. This is governed by the polarity buttons that you find close to the individual channels. 

: Toggling the polarity button of a mask inverts its values (subtracts the original value from 1.0).

: Finally within the “combine masks” combobox you may once again invert the final result to fit your needs by selecting the _exclusive & inverted_ or _inclusive & inverted_ options. 

# typical use cases

inclusive mode
: For this mode you set the “combine masks” combobox to inclusive mode and make sure that all polarity buttons of all the individual channels and of the drawn mask are set to negative (-). Your starting point is a mask where all pixels have a value of zero, i.e. no pixel is selected. You now adjust the parametric mask sliders to bring more and more pixels into the selection or you draw shapes on the canvas to select specific areas of your image.

exclusive mode
: In the opposite case you set the “combine masks” combobox to exclusive mode and make sure that all polarity buttons are set to positive (+). Your starting point is a mask with all values at 1.0, i.e. all pixels selected. You now gradually change the parametric mask sliders to exclude parts of your image as needed or directly draw shapes on the canvas to specifically exclude these areas.

: For your convenience the parametric masks GUI provides a toggle button that inverts all channel polarities and toggles between inclusive and exclusive mode in the “combine masks” combobox.

For novice users it is recommended to stick to these two use cases. This means that you should decide beforehand how you want to construct your mask.
