---
title: the history stack
date: 2022-12-04T02:19:02+01:00
id: history-stack
weight: 30
draft: false
---

The _history stack_ stores the entire editing history for a given image, in the order in which those edits were applied. It is saved to Ansel's library database and the image's XMP sidecar file and persists between editing sessions.

Each time a processing module is enabled, disabled, moved or amended a new entry is added to the top of the _history stack_.

The history stack can be queried and modified within the [history stack](../../../module-reference/utility-modules/darkroom/history-stack.md) module in the darkroom.

---

**Note:** The history stack is not a representation of the order in which the modules are **executed** but the order in which they were **amended**. The execution order is represented by the order of the modules in the right-hand panel.

---
