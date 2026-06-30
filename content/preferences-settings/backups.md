---
title: backup settings & edits
id: backups
weight: 15
---

If you want to back up darktable's settings and edits you can save a copy of the contents of the [content directory](config-directory.md). Transferring the contents of this directory also allows for migration between versions of darktable. See [content directory](config-directory.md) for descriptions of what the individual files contain.

Darktable also maintains a number of backups of `data.db` and `library.db`: 15 daily snapshots of each, plus a snapshot created when updating to a new version (e.g. `data.db-pre-5.4.1`).

If you configure darktable to create sidecar files, your RAW files will be accompanied by XMP files containing your edits (see [preferences/storage](storage.md)).
