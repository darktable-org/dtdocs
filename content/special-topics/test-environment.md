---
title: using a test environment
id: test-environment
weight: 100
---

To run multiple installations of darktable on your computer, for example to try out a [nightly build](https://github.com/darktable-org/darktable/releases/nightly), you can give each installation its own configuration without affecting the others.

Three steps are needed:

1. Install the additional version of darktable without overwriting the existing installation.
2. Give it its own configuration directory.
3. Make sure it doesn't touch edits created by other installations.

## 1. Install the version you want to test

Linux
: If an [AppImage](./program-invocation/invocation-per-OS.md#linux) is available, this is the easiest option. Just download it and make it executable. Alternatively, you can build darktable from source and install it with a custom `--prefix` (e.g. `--prefix /opt/darktable-nightly`).

Windows
: Install it into its own separate directory.

macOS
: Rename the `.app` file before moving it to `/Applications` (e.g. `darktable-nightly.app`), instead of overwriting the existing one.

## 2. Set up a separate configuration directory

darktable stores its settings, presets, styles, and library database in its [configuration directory](../preferences-settings/config-directory.md). The default location depends on your operating system and installation method.

To prevent an installation from writing to the same configuration directory as another installation, launch it with the option `--configdir`, followed by the path to a new folder. If the folder does not exist yet, darktable creates and populates it automatically.

You can run an experiment without persistent library changes by additionally setting `--library :memory:`, which keeps the library database in RAM. All changes to the database are discarded on exit: `darktable --configdir /path/to/test-config --library :memory:`

**Tip:** You can also copy an existing configuration directory into the new folder instead of starting from scratch. This allows the other installation to inherit your presets, styles, and keyboard shortcuts as a starting point, while both installations still run fully independently from then on. If you do this, take special care in step 3 to avoid affecting your existing edits.

Linux
: Run the following commands in a terminal:
    * AppImage: `/path-to-appimage/darktable.AppImage --configdir /path-to-test-config-dir`
    * Built binary: `/prefix-path-to-binary/darktable --configdir /path-to-test-config-dir`

: For convenience, you can put the whole command in a shell script or a [`.desktop` file](https://specifications.freedesktop.org/desktop-entry/latest/) (see [darktable's `.desktop` file](https://github.com/darktable-org/darktable/blob/master/data/org.darktable.darktable.desktop.in) for an example).

Windows
: Either create a new shortcut for `darktable.exe`:
  1. Navigate to `C:\path-to-your-install\bin\`, right-click `darktable.exe` and choose _Show more options_ and then _Create shortcut_.
  2. Under the shortcut's "Properties", append the `--configdir` option to the "Target" field: `"C:\path-to-your-install\bin\darktable.exe" --configdir "C:\path-to-test-config"`
  3. Set "Start in" to the matching `bin` folder.

: Or launch darktable from the terminal:
    ```
    cd "C:\path-to-your-install\bin\"
    .\darktable.exe --configdir "C:\path-to-test-config"
    ```

macOS
: An `.app` file can't be launched with extra parameters by double-clicking, so launch the executable inside the app bundle directly from a terminal:

  ```
  /Applications/darktable-nightly.app/Contents/MacOS/darktable --configdir /path/to/new/config/dir
  ```

: Replace `darktable-nightly.app` with the filename you gave the `.app` file.

## 3. Protect your existing edits

Edits are stored in two places: in the library database inside the configuration directory, and, if enabled, in [XMP sidecar files](../overview/sidecar-files/sidecar.md) next to your RAW files. Step 2 gives the other installation its own library database, but XMP sidecar files are stored alongside the RAW files and are therefore shared between installations.

To prevent the other installation from modifying existing XMP files, you have two options:

a) Work with separate copies of your RAW files
: Safest option. Use copies of your RAW files with the other version in a separate folder. Your original RAW files and their XMP sidecars remain untouched.

b) Turn off XMP creation in the other installation's preferences
: Launch darktable with the additional `--conf write_sidecar_files=never` option. Alternatively, you can set _preferences / storage / create XMP files_ to "never" in the UI. This lets you open folders with existing edits without writing changes back to their XMP files. The setting only affects this installation because it has its own configuration.

## Summary

For an independent installation that should not write XMP sidecar files:

```
darktable --configdir /path-to-test-config-dir --conf write_sidecar_files=never
```

To additionally keep all changes to its library database in memory only:

```
darktable --configdir /path-to-test-config-dir --conf write_sidecar_files=never --library :memory:
```

For the safest setup, use copies of the RAW files rather than relying on XMP creation being disabled.

**Caution:** If you cloned an existing installation's configuration directory for another installation, disable XMP file creation as described above under b). Alternatively, remove (not delete) all photos from the library in the new installation. This removes them only from the library database; it does not delete the files from disk. Otherwise, you could interfere with edits made by the original installation.
