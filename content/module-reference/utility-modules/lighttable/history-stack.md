---
title: history stack
id: history-stack
applicable-version: 4.6
tags: 
view: lighttable
---

Manipulate the history stack of one or more selected images.

# module controls

selective copy...
: Copy parts of the history stack from the selected image. A dialog will appear, from which you will be able to select which history stack items you want to copy. For any module, you may also choose to "reset" that module's parameters -- this will cause the module to be copied but with all controls set to their initial (default) state (as if you had clicked the module reset button).

: If more than one image is selected, the history stack is taken from the image that was selected first. Double-click on a history item to copy that item only and immediately close the dialog.

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

selective paste...
: Paste parts of a copied history stack onto all selected images. As with the selective copy button, a dialog appears from which you may choose the items to paste (or "reset") from the source history stack.

: A copied history stack can have multiple instances of the same module (with the same name or different names) and pasting behaves differently for these entries depending if you use the "overwrite" or "append" button. 

: The "overwrite" button will delete the history of the destination image before the adding every module instance from the copied history stack. Using the "select all" actions in both the "selective copy..." and "selective paste..." controls will precisely duplicate the copied history stack to the destination images (including any duplicate occurrences).

: The "append" button will take each module from the copied history stack, and if there is a module in the destination image with the same name it will be replaced and added to the top of the history stack. If there is no such module, a new instance will be created and added to the top of the history stack. If a module has multiple instances in either history stack, only the last occurence of that module will be added.

paste
: Paste all items of a copied history stack onto all selected images. This has the same behavior as the "append" button in the "selective paste..." controls. This behavior also applies when using copy and paste keyboard shortcuts.

---

notes
: - Automatic module presets are only added to an image when it is first opened in the darkroom or its history stack is discarded. If you use the "overwrite" mode to paste history stack entries to images that haven't previously been opened in the darkroom, then the next time that image is opened in the darkroom automatic presets will be applied to the image. It may therefore seem as if the "overwrite" behavior did not accurately duplicate the existing history stack, but in this case, those automatic modules were added after the paste action.

: - The "append" mode allows you to later reconstruct your pre-existing history stack (because previous history items are retained in the stack of the destination image). However, with the "overwrite" mode all previous edits are irrevocably lost.

: - Previous versions allowed selecting an "overwrite" or "append" mode for any paste operation. To control the behavior of the paste operation you must use the "selective paste..." feature.

---

compress history
: Compress the history stack of the selected image. If any module appears multiple times in the history stack, these occurrences will be _compressed_ into a single step in the history. _Beware: this action can not be undone!_

discard history
: Physically delete the history stack of the selected images. _Beware: this action can not be undone!_

load sidecar file
: Open a dialog box which allows you to import the history stack from a selected XMP file. The imported history stack is used to _completely replace_ the current history stack(s) of the selected image(s). _Caution: this operation can not be undone!_

: Images that were exported by darktable typically contain the full history stack if the file format supports embedded metadata (see the [export](../shared/export.md) module for details of this feature and its limitations). You can load an exported image as a sidecar file in the same way as you can with an XMP file. This feature allows you to recover all parameter settings if you have accidentally lost or overwritten the XMP file. All you need is the source image, typically a raw, and the exported file.

write sidecar files
: Write XMP sidecar files for all selected images. The filename is generated by appending “.xmp” to the name of the underlying input file.

: By default darktable generates and updates sidecar files automatically whenever you work on an image and change the history stack. You can disable automatic sidecar file generation in [preferences > storage](../../../preferences-settings/storage.md). This can be useful when you are running multiple versions of darktable (so that edits in each version do not conflict with one another) however, in general, disabling this feature is not recommended.
