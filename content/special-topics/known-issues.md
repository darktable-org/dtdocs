---
title: known issues
id: known-issues
weight: 90
draft: false
author: "people"
---

Although darktable aims at keeping compatibility with old edits, there are some limitations that you need to be aware of and cannot be solved in a programmatic way.

# History inconsistencies with modules enabled by default

## Context

The editing history of pictures processed in darktable is saved in the database and in the sidecar XMP files stored in regard of your RAW files, in the same folder. This history records every step of settings change that happened during editing and let you go back to any step at any time.

Before darktable 3.0, modules like *white balance*, *demosaic* and *base curve* that were enabled by default for technical reasons did not write an entry in the editing history if the user did not change the default settings. The software always assumed that no history meant default settings were used. This is not safe because it assumes defaults will never change in the future and it prevents a systematic handling of modules.

darktable 3.0 introduced the pipeline reordering feature, allowing to change the order of application of modules in the pipe, which needs every module to write an entry in history for consistency and safety.

When no entry is detected for a module mandatorily enabled by default, darktable 3.0 and later will initialize a new entry with the default parameters of the module as of the current darktable version.

As a result, edits created with versions prior to 3.0 will lack some history entries which may be initialized by newer versions with different defaults than the ones they were created with, especially if you use the *scene-referred* workflow and the *modern* chromatic adaptation, and the look may change.

## Solution

When you open pictures edited with darktable 2.6 or before:

1. check that the *color calibration* module is turned off. If it is on, it means the *white balance* module left no history entry, which means it was used with "as shot in camera" setting, fetching the white balance setting defined in the RAW metadata. In that case:

    1. disable *color calibration* module,
    2. reset *white balance* module to "as shot in camera".

2. check that the *filmic rgb* module is turned off. If it is on, it means the *base curve* module left no history entry, which means it was used with the default curve for your camera. In that case:

    1. disable *filmic rgb* module
    2. turn the *base curve* module on and either reset it or chose the preset corresponding to your camera body.

3. check that the *sharpen* module is turned on. If it is off, search for an entry in the history that might have explicitely disabled it. If there is none, turn it back on.

4. preventively reset the module order to the "legacy" preset.


These steps should fix most issues in a safe way. In case you still see garbled output, wrong colors or obvious issues **and** you don't want to troubleshoot the problem **and** you do not care about preserving the original edit, a blind and brute-force way to fix most issues is to compress the history, which will keep what can be kept and reset the rest to sane defaults. But, doing so, you might not be able to recover the original edit, so backup your XMP files first.

XMP files are simple XML files that can be read with any text editor and contain the modules used in history, along with the parameters in use, step by step. As long as you have the original XMP created with darktable 2.6 or previous, there will be a way to recover them, either by re-importing them in the software or, worse case scenario, by manually re-entering the settings.
