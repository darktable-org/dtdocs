---
title: History Stack
id: history-stack
date: 2020-09-13
draft: false
---

The _history stack_ stores the entire history of the edits you have undertaken on a given image, in the order you undertook them. It is saved to the database and to the `xmp` file (if used) and persists between editing sessions.

Each time a module is enabled, disabled, moved or amended a new entry is added to the top of the _history stack_. The history stack is **not** a representation of the order in which the modules are **executed** but the order in which they were **amended**.

The history stack can be queried and modified within the _history stack_ module in the darkroom.