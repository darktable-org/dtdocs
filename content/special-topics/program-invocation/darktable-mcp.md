---
title: darktable-mcp
id: darktable-mcp
weight: 65
---

The `darktable-mcp` binary provides a [Module Context Protocol](https://modelcontextprotocol.io/docs/2026-07-28/getting-started/intro) (MCP) server interface for darktable.

`darktable-mcp` lets an AI agent drive the raw pipeline over MCP, for example it can be used to:
* list modules and inspect their parameter schemas,
* develop an image through a given module stack and get back a preview or per-channel statistics,
* read history, styles and metadata from the library.

Parameters are addressed by name through darktable's own introspection rather than by fixed offsets, so a stack stays valid across module versions, and renders run on a throwaway duplicate so the source image is never modified.

It waits for commands on its stdin, and outputs responses to its stdout; stdout carries only JSON-RPC (darktable's own logging is redirected to stderr), so a client can speak the protocol cleanly.

darktable-mcp can be called with the following optional command line parameters:

```
darktable-mcp [--core <darktable options>]
```

`--core <darktable options>`
: All command line parameters following `--core` are passed to the darktable core and handled as standard parameters. See the [`darktable binary`](./darktable.md) section for a detailed description.

  Unless you override them, two defaults are injected:

  - `--library :memory:` - the database is kept in system memory - all changes are discarded when the application terminates.
  - `--conf write_sidecar_files=never` - never update XMP sidecars.
