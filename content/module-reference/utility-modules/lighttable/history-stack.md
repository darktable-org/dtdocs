---
title: history stack
date: 2022-12-04T02:19:02+01:00
id: history-stack
applicable-version: 3.6
tags:
view: lighttable
---

Manipulate the history stack of one or more selected images.

## module controls

selective copy...
: Copy parts of the history stack from the selected image. A dialog appears from which you may choose the items to copy from the history stack. If more than one image is selected, the history stack is taken from the image that was selected first. Double-click on a history item to copy that item only and immediately close the dialog.

copy
: Copy the complete history stack from the selected image. If more than one image is selected, the history stack is taken from the image that was selected first.

: Information relating to internal display encoding and mask management is considered unsafe to automatically copy to other images and will therefore not be copied when using this button.

: The following modules are excluded from the _copy_ operation:

: - [_orientation_](../../processing-modules/orientation.md)
: - [_lens correction_](../../processing-modules/lens-correction.md)
: - [_raw black/white point_](../../processing-modules/raw-black-white-point.md)
: - [_rotate pixels_](../../processing-modules/rotate-pixels.md)
: - [_scale pixels_](../../processing-modules/scale-pixels.md)
: - [_white balance_](../../processing-modules/white-balance.md)
: - deprecated modules

: You can override all of these exclusions by using "selective paste..." and choosing which modules to paste to the target image(s).

compress history
: Compress the history stack of the selected image. If any module appears multiple times in the history stack, these occurrences will be _compressed_ into a single step in the history. _Beware: this action can not be undone!_

discard history
: Physically delete the history stack of the selected images. _Beware: this action can not be undone!_

selective paste...
: Paste parts of a copied history stack onto all selected images. A dialog appears from which you may choose the items to paste from the source history stack.

paste
: Paste all items of a copied history stack onto all selected images.

mode
: This setting defines how the paste actions behave when applied to an image that already has a history stack. In simple terms the “overwrite” mode deletes the previous history stack before pasting, whereas “append”  concatenates the two history stacks together.

: A copied history stack can have multiple entries of the same module (with the same name or different names) and pasting behaves differently for these entries in append and overwrite modes.

: In _append_ mode, for each module in the copied history stack, if there is a module in the destination image with the same name it will be replaced. If there is no such module, a new instance will be created. In both cases the pasted instance is placed on top of the history stack. If a particular module appears multiple times in either history stack only the last occurrence of that module will be processed.

: In _overwrite_ mode the behavior is the same except that the history of the destination image is deleted before the paste operation commences. The “copy all”/“paste all” actions in this mode will precisely duplicate the copied history stack to the destination images (including any duplicate occurrences).

---

Notes
: - Automatic module presets are only added to an image when it is first opened in the darkroom or its history stack is discarded. If you use _overwrite_ mode to paste history stack entries to images that haven't previously been opened in the darkroom then the next time that image is opened in the darkroom, automatic presets will be applied to the image. It may therefore seem as if the “overwrite” mode did not accurately duplicate the existing history stack, but in this case, those automatic modules were added subsequently.

: - The _append_ mode allows you to later reconstruct your pre-existing history stack (because previous history items are retained in the stack of the destination image). However, in “overwrite” mode all previous edits are irrevocably lost.

: - The _mode_ setting is retained when you quit darktable -- if you change it for a one-off copy and paste, make sure to change it back again.

---

load sidecar file
: Open a dialog box which allows you to import the history stack from a selected XMP file. This copied history stack can then be pasted onto one or more images.

: Images that were exported by darktable typically contain the full history stack if the file format supports embedded metadata (see the [export](../shared/export.md) module for details of this feature and its limitations). You can load an exported image as a sidecar file in the same way as you can with an XMP file. This feature allows you to recover all parameter settings if you have accidentally lost or overwritten the XMP file. All you need is the source image, typically a raw, and the exported file.

write sidecar files
: Write XMP sidecar files for all selected images. The filename is generated by appending “.xmp” to the name of the underlying input file.

: By default darktable generates and updates sidecar files automatically whenever you work on an image and change the history stack. You can disable automatic sidecar file generation in [preferences > storage](../../../preferences-settings/storage.md). This can be useful when you are running multiple versions of darktable (so that edits in each version do not conflict with one another) however, in general, disabling this feature is not recommended.
