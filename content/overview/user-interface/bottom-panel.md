---
title: bottom panel
id: bottom-panel
weight: 50
---

The bottom panel appears in all darktable views. Common controls are described here; view-specific controls are described in the appropriate pages.

# common controls

![view-log-history icon](./bottom-panel/view-log-history.png#icon) view log history
: Display a scrollable popover showing stored log messages with timestamps. The log history viewer provides a persistent record of application log messages (e.g., export/import progress, library operations, warnings, and errors).
The key features are:
: - Messages are stored in a circular buffer; when the buffer is full, older entries are removed as new ones arrive
: - Consecutive identical messages are automatically deduplicated (e.g., repeated "exporting image" updates)
: - Entries are displayed in monospace format with HH:MM:SS timestamps
: - Individual entries are selectable and can be copied to the clipboard with Ctrl+C
: - the viewer is closed by clicking anywhere outside the popover
