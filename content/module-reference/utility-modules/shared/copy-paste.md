---
title: copy & paste
id: copy-paste
---

Copying and pasting edits between images is available in multiple modules. On the lighttable buttons are available in the module [history stack](../lighttable/history-stack/history-stack.md) as well as the keyboard shortcuts listed below. In other views such as the darkroom copying and pasting is done through keyboard shortcuts. 

copy (`strg+c`)
: Copy the complete history stack from the selected image. If more than one image is selected, the history stack is taken from the image that was selected first.

: Information relating to internal display encoding and mask management is considered unsafe to automatically copy to other images and will therefore not be copied when using this button.

: The following modules are by default excluded from the _copy_ operation:

: - [_orientation_](../../processing-modules/orientation.md)
: - [_lens correction_](../../processing-modules/lens-correction.md)
: - [_raw black/white point_](../../processing-modules/raw-black-white-point.md)
: - [_rotate pixels_](../../processing-modules/rotate-pixels.md)
: - [_scale pixels_](../../processing-modules/scale-pixels.md)
: - [_white balance_](../../processing-modules/white-balance.md)
: - deprecated modules

: If you wish to include these excluded modules use _selective copy_ and  _selective paste_.

selective copy (`strg+shift+c`)
: Copy parts of the history stack from the selected image. A dialog will appear, from which you will be able to select which history stack items you want to copy. For any module, you may also choose to "reset" that module's parameters -- this will cause the module to be copied but with all controls set to their initial (default) state (as if you had clicked the module reset button).

: If more than one image is selected, the history stack is taken from the image that was selected first. Double-click on a history item to copy that item only and immediately close the dialog.

paste (`strg+v)
: Paste all items of a copied history stack onto all selected images. This has the same behavior as the "append" button in the "selective paste..." controls. If _selective copy_ was used before only selected modules will be pasted. This behavior also applies when using copy and paste keyboard shortcuts.

selective paste (`strg+shift+v`)
: Paste parts of a copied history stack onto all selected images. As with the selective copy button, a dialog appears from which you may choose the items to paste (or "reset") from the copied history stack. Choose to "append" or "overwrite" the history stack of the target image.

: A copied history stack can have multiple instances of the same module (with the same name or different names) and pasting behaves differently for these entries depending whether you use the "overwrite" or "append" button: 

: - "overwrite"  will delete the history of the destination image before adding every module instance from the copied history stack. Using the "select all" actions in both the "selective copy..." and "selective paste..." controls will precisely duplicate the copied history stack to the destination image(s) (including any duplicate occurrences).

: - The "append" button will take each module from the copied history stack and if there is a module in the destination image with the same name, it will be replaced and added to the top of the history stack. If there is no such module, a new instance will be created and added to the top of the history stack. If a module has multiple instances in either history stack, only the last occurence of that module will be added.

copy the most recently changed module to all selected images (`strg+x`)
: Only available in darkroom through it's keyboard shortcut. 
: Copy the module that was changed last from the active (open) image to all selected images: Select multiple images and apply an edit to the opened image. Hit `strg+x`: The last changed module is synced from the currently open image to all selected images. 

---

**Notes:**

- Using selective paste in "overwrite" mode is a destructive process, use it with care. The "append" mode allows you to later reconstruct your pre-existing history stack (because previous history items are retained in the stack of the destination image). With the "overwrite" mode all previous edits are irrevocably lost.

- Automatic module presets are only added to an image when it is first opened in the darkroom or its history stack is discarded. If you use the "overwrite" mode to paste history stack entries to images that haven't previously been opened in the darkroom, then the next time that image is opened in the darkroom automatic presets will be applied to the image. It may therefore seem as if the "overwrite" behavior did not accurately duplicate the existing history stack, but in this case, those automatic modules were added after the paste action.



---
