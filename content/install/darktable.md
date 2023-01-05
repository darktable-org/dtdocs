---
title: Import configuration from darktable
date: 2023-01-05
draft: false
weight: 60
---

Ansel is based on darktable 4.0 and configuration files of darktable 4.0.1 and prior can be seemlessly imported by Ansel, such that you recover your tags, styles, presets, and library of images.

{{< warning >}}
Importing darktable 4.2 database into Ansel will make you lose the settings of _filmic RGB_, _sigmoid_ and _highlights reconstruction_ modules for all edits using them. _Sigmoid_ is not and will never be supported into Ansel, and the nonsensical changes made to _filmic RGB_ in darktable 4.2 will never be ported to Ansel. All other modules should still work.
{{</ warning >}}

## Importing usual darktable configuration files

{{< note >}}
This section applies if you installed darktable from sources or pre-built packages, on Linux, Windows and Mac. It does __not__ apply if you installed darktable from Flatpak packages (_see the next section in this case_).
{{</ note >}}

The configuration folder of darktable is located by default at :

- `~/.config/darktable` for Mac OS and Linux
- `C:\%LOCALAPPDATA%\darktable` on Windows.

Ansel re-uses the same folder structure, where `darktable` is replaced by `ansel`. Since Ansel is based on darktable 4.0, you can import your darktable 4.0 and earlier configuration files by simply copying into `/ansel` configuration folder.

### Terminal

This works on Mac OS and Linux terminal : 

```bash
$ cp -R ~/.config/darktable ~/.config/ansel
$ mv ~/.config/ansel/darktablerc ~/.config/ansel/anselrc
```

### Graphical

If you are not comfortable with command lines or use Windows, use your file browser to copy-paste the following files from the darktable configuration folder to the Ansel's one :

- `library.db`,
- `data.db`,
- `shortcutsrc`,
- `darktablerc`, which will need to be renamed `anselrc` after copying.
- the `color` folder, if any, especially if some of your edits use custom-made ICC color profiles.

From there, you can continue to work just as before. Ansel can be installed alongside darktable.


## Importing configuration files from Flatpak

Flatpak packages work on recent Linux distributions only and are a hacky way of dealing with outdated packages on distributions repositories, but they create many other problems in the process.

Flatpak run in sandboxes and don't store their configuration files at the usual place but in ` ~/.var/app/org.darktable.Darktable/config/darktable`, where `~/` is the current user home folder.

From this Flatpak configuration folder, you will need to import the files mentionned in the previous section into `~/.config/ansel`. However, the current user will not be the owner of the copied files, which belong to the Flatpak user, and they are copied with their permissions retained. In practice, it means that the copied files will be read-only and Ansel will not be able to write into the database.

To fix the permissions, you have a console and a graphical method.

### Terminal

Run in terminal :

```bash
$ cp -R ~/.var/app/org.darktable.Darktable/config/darktable ~/.config/ansel
$ mv ~/.config/ansel/darktablerc ~/.config/ansel/anselrc
$ chown -R USER:USER ~/.config/ansel # may need sudo
$ chmod -R 644 ~/.config/ansel
```

where `USER` is your OS-wise username.

### Graphical

Use your file browser to navigate to `~/.config/`. Since it is an hidden file (as the `.` prefix suggests), you may need to display hidden files first to find it (the typical shortcut is <kbd>Ctrl + H</kbd>).

{{< note >}}
The following uses a generic logic. The actual wording of the labels depend on the file browser and desktop environment you are using and need to be adjusted.
{{</ note >}}

Once in `~/.config/`, right-click on the `ansel` folder and click on the _Properties_ entry of the contextual menu, then on the _Permissions_ tab. From there, set `read` and `write` permissions for the file owner and its group and check the option _Apply to subfolders and their content_.

Note that the graphical method does not allow you to change the file owner, which needs to be done in terminal with the command `chown -R USER:USER ~/.config/ansel`. If you don't know how to do it, and if you are not the owner of the folder, set `read` and `write` permissions to _Others_ too (which means all users of the system). __This is a security threat if you are not the only user of the computer since it will allow anybody to access and write changes in the folder__. It is ok if you are the only user of the computer or you trust the intents __and__ the skills of the other users (at home).


## Working with Ansel alongside darktable

darktable and Ansel can store the images editing histories in [XMP sidecar files](./overview/sidecar-files/sidecar.md) when the option is enabled. Since they both use the same XMP tags, the last application to have opened the image will overwrite its own history within the XMP. This is not a real issue for darktable 4.0 and Ansel 0.0 since their [pixel pipelines](./views/darkroom/pixelpipe/_index.md) are compatible, but the compatibility is broken between Ansel and darktable 4.2.

However, both applications load the editing histories first from their database. Then, if the _look for updated xmp files on startup_ is [enabled in the preferences](../preferences-settings/storage#xmp), they can crawl the image folders to detect if the XMP edits are more recent than the database ones. In that case, they will prompt a window asking if the files should be synchronized and in which direction. Never synchronize from XMP to database if you use both applications on the same files.
