---
title: backup settings & edits
id: backups
weight: 15
---

If you want to back up darktable's settings and edits you can save a copy of the contents of the configuration directory. See [configuration directory](config-directory.md) for descriptions of what the individual files contain.

Transferring the contents of this directory also allows for migration between variants (e.g. between Flatpak and AppImage) of darktable. 

Darktable also maintains a number of backups of `data.db` and `library.db` inside the configuration directory: 15 daily snapshots of each, plus a snapshot created when updating to a new version (e.g. `data.db-pre-5.4.1`).

If you configure darktable to create sidecar files, your RAW files will also be accompanied by XMP files containing your edits (see [preferences/storage](storage.md)).
