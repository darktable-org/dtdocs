---
title: overview
id: overview
weight: 10
---

Lua scripts can be used to define actions for darktable to perform when an event is triggered. Prior to version 5.6 you needed to treat all Lua scripts as described in this subsection, however, if you only wish to use a built-in script, then you can follow [the process described in the previous section](../enabling-starting-scripts/process-overview).

[Lua](http://www.lua.org/) is an independent project providing a powerful, fast, lightweight, embeddable scripting language. Darktable uses Lua version 5.4. Describing the principles and syntax of Lua is beyond the scope of this manual, so for details see the [Lua reference manual](http://www.lua.org/manual/5.4/manual.html).

Lua scripts can be entirely disabled in [preferences > lua](../preferences-settings/lua-options.md). 

One example where a new Lua script might be useful would be calling an external application during file export in order to apply additional processing steps outside of darktable.

The central orchestrator for scripts is the script manager (see [basic principles](basic-principles.md)).

The following sections provide a brief introduction to how Lua scripts can be used within darktable (prior to version 5.6). Comprehensive documentation on Lua Scripting in darktable can be found in the [darktable lua documentation](https://docs.darktable.org/lua/stable/).



