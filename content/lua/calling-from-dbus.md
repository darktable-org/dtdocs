---
title: calling lua from dbus
id: calling-lua-from-dbus
weight: 90
draft: false
author: "people"
---

It is possible to send a lua command to Ansel via its DBus interface. The method `org.Ansel.service.Remote.Lua` takes a single string parameter which is interpreted as a lua command. The command will be executed in the current lua context and should return either nil or a string. The result will be passed back as the result of the DBus method.

If the Lua call results in an error, the DBus method call will return an error `org.Ansel.Error.LuaError` with the lua error message as the message attached to the DBus error.
