---
title: using multiple computers
id: multiple-computers
weight: 100
---

Editing the same photos from multiple computers requires some setup as darktable has no dedicated function for sharing its database across computers. 

The [local copies](../overview/sidecar-files/local-copies.md) feature is the included solution for "editing on the road" and could be used if your files live on a NAS or external storage. 

## General considerations

Multiple machines are not natively supported. darktable assumes one local database per installation; there is no built-in functionality for resolving edit-conflicts. 
* Make sure the same darktable version is used everywhere; using different versions can trigger incompatible edits.
* Always make sure synchronization is up to date; never work on both machines at the same time or synchronization conflicts might arise. 

darktable stores its edits in two places: 

  - XMP sidecar files: `image.raw.xmp`; if enabled in the [preferences](../preferences-settings/storage.md)
  - `library.db` (unless using `--library :memory:`-mode)

Presets, settings etc. are stored in further files inside the [configuration directory](../preferences-settings/config-directory.md).

## Approach A: Sync RAW-files + XMP-sidecars only

The simplest approach; syncs your edits leaving your configuration alone. Does allow for mixed setups with e.g. Windows and Linux.  

Setup:
* Use a file-synchronization service of your choice (e.g. Syncthing, Dropbox) to sync the RAW-Files + XMP files between your devices.
* Have darktable read the XMP files upon startup: In the [preferences](../preferences-settings/storage.md) set _create XMP files_ to "on import" and enable _look for updated XMP files on startup_.

Caveats: 
* Only updated XMP files will be read by darktable: New files added on one computer must be imported manually on the other. The same goes for deleted files.
* Settings, presets, styles etc. will not be synced and will have to be manually transferred.
* Take care to ensure synchronization is up to date before opening darktable. There is no built in function to resolve synchronization conflicts.

Can be combined with the [`--library :memory:` mode](program-invocation/darktable.md) to omit the usage of a local `library.db`; darktable will then always only work off the XMP files.

## Approach B: Sync files and entire configuration directory

More complicated to setup, more error prone and requires some special considerations. 

Setup:

* Use a file-synchronization service of your choice (e.g. Syncthing) to sync the RAW-Files + XMP files AND the contents of your [configuration directory](../preferences-settings/config-directory.md) between your devices.
  -  Note: Services like Dropbox might not work as well because they mostly don't allow for syncing multiple folders in different locations.
* Since the `library.db` in the configuration directory references the RAW-files by their _absolute_ path the location of the files has to be exactly matched between different machines.
* Somewhat more error prone than Approach A as synchronization conflicts could mess with your configuration.

Variation: Sync the files and a separate `library.db`, specify the location of the `library.db` in your launcher, not automatically syncing the rest of the configuration folder. 

Caveats:
* Not cross platform compatible.
* Machine specific settings could get overridden, for instance OpenCL settings.
* Consider excluding the cache directory from sync. The [darktable cache](../preferences-settings/config-directory.md#cache-directory) (thumbnails etc.) is large; syncing it just costs bandwidth and storage for no benefit.
* It is recommended to have a robust versioned backup strategy _including the configuration directory_ to avoid breaking/losing your setup.
