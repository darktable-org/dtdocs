---
title: data safety and workflow
id: safety
weight: 80
draft: false
author: "people"
---


# Concepts

darktable is a non-destructive editor. It means the original RAW files will never ever be changed by the software, even to change their names. They are archived as-is.

A darktable editing only exists as a list of modules and their parameters: the history. This history is saved in a local SQL database and duplicated, upon user request (in [preferences > Storage > xmp > write sidecar file for each image](../preferences-settings/storage.md#xmp)), and in sidecar XMP files saved in the same directory as the original RAW files. An history is merely a text file describing what should be done to the original RAW, step by step as the user set the modules, like a cooking recipe. The history is not a finished product.

Histories are saved automatically when the user exits the darkroom view, no action is required. However, this produces no image until the export. Exportation is a process by which the original RAW is read, the settings defined in the history will be applied on it, and an output image file will be created. The exported file can then be read in any image viewer, which is not true for the RAW file.

Ensuring history is preserved uncorrupted as years go by is therefore critical until you export the final image, because until exportation, the editing is only virtual: it is a text file of settings, not an image.

Although darktable aims at keeping compatibility across versions, meaning old edits *should* open and look the same in new versions of darktable, compatibility has be broken several times and bugs happen.


# Saved data

darktable saves user sessions and settings in:
*  `/home/$user_id/.config/darktable/` (Linux and MacOS)
* `C:\\Users\$user_id\AppData\Local\darktable\` (Windows)

where `$user_id` is to be replaced with your actual user ID on the current system.

There are 4 important files:

* `library.db`, the database containing the collection of all images known by darktable, along with their edits, keywords, etc.,
* `data.db`, the database containing the module's presets, styles, tags, GPS locations.
* `darktablerc`, a configuration text file, containing preferences and the state of the GUI for the latest session,
* `keyboardrc`, a configuration text file, containing the user-defined keyboard shortcuts.

When installing darktable on another system, you can duplicate the whole content of this directory to your new system to synchronize all your edits and preferences. However, you might need to update the links to the files.

The databases can be opened, read and written from any SQL viewer, such as *DB browser for SQLite*. The configuration files can be opened, read and written from any text editor.

# Database backups

## Before upgrade

For darktable 3.0 and later, the 2 databases are automatically backed-up before migration when installing a newer release of darktable. For example, when you install the release 3.0.0, your old databases will be archived as `library.db-pre-3.0.0` and `data.db-pre-3.0.0`, and then the main original databases upgraded if needed. The backups will be saved in the same directory.

Once a database structure has been migrated to a newer version, it is impossible to open it from another previous version, so you could not open a 3.0.0 database with the 2.6.0 software. It can also happen that the database is upgraded between 2 minor versions, for example 3.0.1 and 3.0.2. The database structure is not systematically upgraded at each new version of the software, it happens only if needed, but you need to be prepared for an upgrade every time.

If, for some reason, your upgraded database is corrupted or you want to downgrade the software, you can restore the backups by simply renaming them `library.db` and `data.db` (remove the `pre-x.x.x` suffix).

## During normal use

For darktable 3.2 and later, backups snapshots of the 2 databases are automatically triggered periodically, as well as database cleaning and optimizations to spare storage. These can induce a slight slow-down in the software when the optimization happens, but shall otherwise speed-up the database reading in normal use.

You can set how many snapshots you wish to conserve, and how often you want to create a backup in [Preferences > Storage > Database](../preferences-settings/storage.md). You can also chose if you want to be asked for confirmation before backups happen and if you want them to happen when the software opens or exits.


# Sidecar XMP

XMP are XML text files acting as a redundancy of the `library.db` database, which also store the editing history, individually for each picture. They are more easily readable and can be exported, imported and shared with other people, using the [history stack](../module-reference/utility-modules/lighttable/history-stack.md) lighttable module.

XMP sidecars can be enabled or disabled in [preferences > storage > XMP > write sidecar file for each image](../preferences-settings/storage.md). It is strongly recommended to enable them, since they are text files that weigh typically just a couple of kilobytes.

In case you store your original RAW files on an external drive that is shared between several systems, these XMP sidecars will be saved on the external drive and can be use to synchronize the database between all systems (see below, *Using a cloud/NAS with darktable*).

XMP can additionnaly be backed-up too, with external tools like Git.


# Using a cloud/NAS with darktable

darktable is not explicitely meant to maintain a server-client architecture since there is no bidirectionnal and dynamic synchronization on, and no way to handle editing conflicts when the same files are edited simultaneously on more than one system. However, it can be used with RAW files on a remote file system shared between several systems, provided users are careful and disciplined enough to not work on the same pictures at the same time on several systems.

---

**Note:** For a more robust versionning and conflict handling, it is advised to use a Git repository in which XMP are commited as plain text and RAW file are commited through `git-annex`.

---

Here is a possible setup for a NAS/cloud hosting of the RAW files:

1. Ensure a systematic folders architecture on the remote storage, with a minimal number of pictures in each sub-folders to avoid synchronizing large amount of data each time. For example: in the main `/NAS/Photos/` directory, each collection of pictures is stored in a sub-folder named `/NAS/Photos/year-month-day-topic/`.
2. Mount your distant folder as a local drive, using SSH, WebDAV, Samba or any protocol that allows remote access in a way that makes the server locally available to local applications. Ensure the remote location is mounted on a stable and unique mounting point that will be the same in the future, for example `/media/remote/NAS/Photos`.
3. In darktable preferences, under [import > base directory naming pattern](../preferences-settings/import.md#session_options), input this exact mounting point for all the systems that may connect to this remote storage, for example `/media/remote/NAS/Photos`.
4. In darktable [preferences > storage > xmp](../preferences-settings/storage.md#xmp), enable XMP sidecars and check the *look for updated xmp files on startup* option.
5. When it is time to edit a picture, connect to your remote collection, then select the images to edit, and in the [selected image](../module-reference/lighttable/selected-image.md) lighttable module, click the *copy locally* button. This will ensure the images are on your computer in case the network connection closes unexpectedly and your editing history is stored locally.
6. When the editing is done, select the edited images, and in the same [selected image](../module-reference/lighttable/selected-image.md) module, click the *resync local copy* button. This will send your updated XMP to the server.

With this setup, each local installation of darktable will edit on its own local database, keep a local copy of the edit, and only when finished, send the XMP to the remote server upon request. In case anything bad happen during upload to server, the original data are still safe on the local system and upload can be reattempted until success.

Then, at startup, each local installation will lookup for updated XMP on the server and, if newer edits have been found, will prompt the user to update the local database from the remote XMP. Notice that this process will slow-down the software startup proportionaly to the amount of pictures.

While it is possible to host remotely the `library.db` database too, and start darktable in command line with `$ darktable --library /mounting_point_to_server/library.db`, this is not recommended because it will read/write the database live, and there is no recovery mechanism in case the remote connection is closed unexpectedly, which could result in definitive data corruption and loss if your internet connection is unstable or in case of power failure.

If using the recommended method above, reading and writing the XMP/database are 2 separated processes that happen asynchronously and only upon user request. Waiting for a proper editing conflicts resolution system and a proper database recovery during network and power failures, this is the safest way to ensure the integrity of history data.

# Images backup

darktable does not store images, but only their editing histories. The final result exists only after applying the history on the RAW file and exporting it to a raster file.

If bugs or incompatibilies are introduced (or fixed) in future releases of darktable, the current look resulting from your current editing history may slightly change in the future and you might not be able to reproduce the exact same look with the same parameters. Although the darktable team does not aim at breaking compatibility willingly, and the visual changes will likely be too small to be noticed, bugs happen and this is a risk.

If some picture is important to you, you might want to archive the exported file along the original RAW and its history, just to be safe. For archival purposes, we recommend exporting files to 16 bits TIFF at full resolution, in Adobe RGB or ProPhoto RGB color spaces. This will retain enough data accuracy to allow future re-editing and printing, while still using a reasonable amount of memory. If absolute accuracy is needed and storage space is no issue, use 32 bits float TIFF encoding with Prophoto linear RGB.
