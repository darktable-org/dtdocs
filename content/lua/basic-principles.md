---
title: "basic principles: luarc files"
date: 2022-12-04T02:19:02+01:00
id: basic-principles
weight: 20
draft: false
author: "people"
---

At startup, Ansel will automatically run the Lua scripts `$Ansel/share/Ansel/luarc` and `$HOME/.config/Ansel/luarc` (where `$Ansel` represents the Ansel installation directory and `$HOME` represents your home directory).

This is the only time Ansel will run Lua scripts by itself. These scripts can register callbacks to perform actions on various Ansel events. This callback mechanism is the primary method of triggering lua actions.
