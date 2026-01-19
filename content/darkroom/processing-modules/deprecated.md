---
title: deprecated modules
id: deprecated
weight: 57
---

The darktable team regularly reviews old modules and updates their implementation where issues are found or updated science means that they can be improved. Most of the time we try to update existing modules with new functionality but occasionally that becomes problematic, often due to the overhead of having to maintain multiple versions of the module. In such circumstances a new replacement module is created and the old module becomes _deprecated_.

Module deprecation follows a fairly standard process: In the release that deprecates a module, that module can no longer be searched or added to custom module groups. It is moved into the read-only _deprecated modules_ group and a message added to the module to warn of its removal and direct the user to a suitable alternative.

After a year, the module is removed from the _deprecated modules_ group and is then only available for use in old edits (where that module was already active against a given image). Deprecated modules are never fully removed from darktable (in order to retain old edits) but development ceases and you are advised to use supported modules instead if you encounter an issue.

For example, modules deprecated in darktable 3.4 will be removed from the _deprecated modules_ group in darktable 3.8 (assuming two major releases each year).
