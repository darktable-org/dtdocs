---
title: copy & paste
id: copy-paste
---

Copying and pasting edits between images is available in multiple views. In the lighttable, the [history stack](../lighttable/history-stack/history-stack.md] module provides buttons for these operations; the keyboard shortcuts listed below can also be used. In other views such as the darkroom copying and pasting is done through keyboard shortcuts.


copy (`ctrl+c`)
: Copy the complete history stack from the selected image. If more than one image is selected, the history stack is taken from the image that was selected first.

: Information relating to internal display encoding and mask management is considered unsafe to automatically copy to other images and is therefore not included in this operation.

: The following modules are excluded by default from the _copy_ operation:

: - [_orientation_](../../processing-modules/orientation.md)
: - [_lens correction_](../../processing-modules/lens-correction.md)
: - [_raw black/white point_](../../processing-modules/raw-black-white-point.md)
: - [_rotate pixels_](../../processing-modules/rotate-pixels.md)
: - [_scale pixels_](../../processing-modules/scale-pixels.md)
: - [_white balance_](../../processing-modules/white-balance.md)
: - deprecated modules

: If you wish to include these modules use _selective copy_ and _selective paste_.

selective copy (`ctrl+shift+c`)
: Copy parts of the history stack from the selected image. A dialog appears, from which you can select which history stack items you want to copy.

: For any module, you may also choose to "reset" that module's parameters -- this will cause the module to be copied but with all controls set to their initial (default) state (as if you had clicked the module reset button). Double-click a history item to copy only that item and immediately close the dialog.

: If more than one image is selected, the history stack is taken from the image that was selected first.

paste (`ctrl+v)`
: Paste all items of a copied history stack onto all selected images, preserving the existing history stack by appending the edits. If _selective copy_ was used to copy selected modules, only those modules are pasted. 

: Pasting is always performed from the current state of the source image. If you change modules in the source image after copying and then paste, the  changed (most recent) settings will be pasted.

selective paste (`ctrl+shift+v`)
: Paste parts of a copied history stack onto all selected images. As with _selective copy_, a dialog appears from which you may choose items to paste (or _reset_) from the copied history stack. Choose to _append_ or to _overwrite_ the history stack of the target image(s).

: A copied history stack can have multiple instances of the same module (with identical or different instance names) and pasting behaves differently for these entries depending on whether you use _overwrite_ or _append_:

: - _overwrite_ deletes the history of the destination image before adding every module instance from the copied history stack. Choosing _select all_ in both the _selective copy..._ and _selective paste..._ dialogs will precisely duplicate the copied history stack to the destination image(s) (including any duplicate occurrences).

: - _append_ takes each module from the copied history stack and if there is a module in the destination image with the same name, it is replaced and added to the top of the history stack. If there is no such module, a new instance will be created and added to the top of the history stack. If a module has multiple instances in either history stack, only the last occurrence of that module will be added.

copy the last change to all selected images (`ctrl+x`)

: Only available in the darkroom through its keyboard shortcut.

: Copy the module that was changed last from the active (open) image to all selected images: Select multiple images and apply an edit to the opened image. Hit `ctrl+x`: The last changed module is synced from the currently open image to all selected images. 

---

**Note:**

- Using _selective paste_ with _overwrite_ is a destructive process. Use it with care. _append_  allows you to revert to the images state before pasting (because the existing history stack is preserved). With _overwrite_ all previous edits are irrevocably lost.

- Automatic module presets are added only to an image when it is first opened in the darkroom or its history stack is discarded. If you use _overwrite_ to paste history stack entries to images that haven't previously been opened in the darkroom, then the next time that image is opened in the darkroom, automatic presets will be applied to the image. It may therefore seem as if the _overwrite_ behavior did not accurately duplicate the existing history stack, but in this case, those automatic modules were applied after the paste action.
