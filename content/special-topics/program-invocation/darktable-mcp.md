---
title: darktable-mcp
id: darktable-mcp
weight: 65
---

The `darktable-mcp` binary provides a [Model Context Protocol](https://modelcontextprotocol.io/docs/2026-07-28/getting-started/intro) (MCP) server interface for darktable.

`darktable-mcp` can be used to let an AI agent drive the raw pipeline over MCP, for example it can be used to:
* list modules and inspect their parameter schemas,
* develop an image through a given module stack and get back a preview or per-channel statistics,
* read history, styles and metadata from the library.

`darktable-mcp` is only built if darktable was compiled with the `USE_MCP` option, so the binary may not be present in all packages.

Module parameters are referred to by name, so a set of instructions written for one version of darktable keeps working when a module is updated. Images are developed on a temporary copy, so neither the original file nor its existing edits are changed.

It waits for commands on its stdin, and outputs responses to its stdout; stdout carries only JSON-RPC (darktable's own logging is redirected to stderr), so a client can speak the protocol cleanly.

darktable-mcp can be called with the following optional command line parameters:

```
darktable-mcp [--core <darktable options>]
```

`--core <darktable options>`
: All command line parameters following `--core` are passed to the darktable core and handled as standard parameters. See the [`darktable binary`](./darktable.md) section for a detailed description.

  Unless you override them, two defaults are injected:

  - `--library :memory:`
    - the database is kept in system memory - all changes are discarded when the application terminates. Images are rendered and inspected by file path, and the library tools see nothing else.
  - `--conf write_sidecar_files=never`
    - never update XMP sidecars.

To work against a real catalog instead, so that existing images, their edits and saved styles are visible, pass `--core --library /path/to/library.db`. darktable locks `library.db` and `data.db` while it runs, so this only works when the darktable GUI is not open on that library -- or against a copy of it. The default in-memory database takes no such lock and can be used while darktable is running.


# available tools

The server exposes three groups of tools to the connected client.

*Introspection* tools describe darktable's modules: list the available processing modules, retrieve the parameters of a given module with their types, ranges and defaults, and convert between a module's stored parameter blob and named values. Each module also reports a link to its page in this manual.

*Develop* tools process images: develop an image through its history stack, optionally with additional modules applied on top, and return either a preview image or per-channel statistics. Rendering is performed on a throwaway duplicate, so the source image is never modified.

*Library* tools read and modify the catalog: list images, read an image's decoded history stack, list, apply, save and import styles, and export a developed image to a file. Note that several of these write to the library -- applying or saving a style changes the catalog, just as it would in the GUI.

# connecting a client

`darktable-mcp` is not run directly by the user -- it is launched by an MCP client, which talks to it over stdin and stdout. Most clients are configured with a JSON entry naming the command and its arguments:

```json
{
  "mcpServers": {
    "darktable": {
      "command": "/usr/bin/darktable-mcp",
      "args": ["--core",
               "--configdir", "/home/user/.config/darktable-mcp",
               "--cachedir",  "/home/user/.config/darktable-mcp/cache"]
    }
  }
}
```

Give the server its own configuration and cache directories, as above. With the default in-memory library it can then be used at any time, including while darktable itself is open.

Consult the documentation of your MCP client for where this configuration is stored, and whether it provides a command to add a server rather than editing the file by hand.
