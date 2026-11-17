---
title: writing Lua scripts
id: writing-lua-scripts
weight: 20
---

Lua scripts can be used to define actions for darktable to perform when an event is triggered. 

[Lua](http://www.lua.org/) is an independent project providing a powerful, fast, lightweight, embeddable scripting language. darktable uses Lua version 5.4. Describing the principles and syntax of Lua is beyond the scope of this manual, so for details see the [Lua Reference manual](http://www.lua.org/manual/5.4/manual.html).

One example where a new Lua script might be useful would be calling an external application during file export in order to apply additional processing steps outside of darktable.

The darktable lua documentation's [programmers guide](https://docs.darktable.org/lua/development/lua.programmers.guide/) includes information on how darktable loads scripts and how you can write your own scripts. 
