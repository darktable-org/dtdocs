---
title: the history stack
id: history-stack
weight: 30
draft: false
---

The _history stack_ stores the entire editing history for a given image, in the order in which those edits were applied. It is saved to darktable's library database and the image's XMP sidecar file and persists between editing sessions.

Each time a processing module is enabled, disabled, moved or amended a new entry is added to the top of the _history stack_. 

The history stack can be queried and modified within the [history stack](../../../module-reference/utility-modules/darkroom/history-stack.md) module in the darkroom.

Hovering the mouse over a specific entry in the history stack will show a tooltip describing all the changes to the module settings that are associated with that entry. This can be helpful in tracking down adjustments that were made unintentionally which could be causing a module to have unintended effects. This is expecially useful for complex modules that contain many many tabs, or for tracing changes to parametric blending settings.

---

**Note:** The history stack is not a representation of the order in which the modules are **executed** but the order in which they were **amended**. The execution order is represented by the order of the modules in the right-hand panel.

---
