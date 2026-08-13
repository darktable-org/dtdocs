---
title: using a test environment
id: test-environment
weight: 100
---

To run a second version of darktable on your computer, for example to try out a [nightly build](https://github.com/darktable-org/darktable/releases/nightly), you can set up a second configuration without affecting your main installation. 

Three steps are needed:

1. Install the second darktable version without overwriting the existing one.
2. Give it its own configuration directory.
3. Make sure it doesn't touch your existing edits.

## 1. Install the version you want to test

Linux
: Easiest with an AppImage. Just download it and make it executable.

Windows
: Install it into its own separate directory. 

macOS
: Rename the `.app` file before moving it to `/Applications` (e.g. `darktable-nightly.app`), instead of overwriting the existing one.

## 2. Set up a separate configuration directory

darktable stores its settings, presets, styles, and database in its configuration directory. The default folder depends on your OS and chosen method of installation and is [documented here](../preferences-settings/config-directory.md).

To stop the second installation from writing into that same directory, launch it with the option `--configdir`, followed by the path to a new folder. If it doesn't exist yet, darktable creates and populates it automatically.

Tip: You can also copy your existing configuration directory into the new folder instead of starting from scratch. That way the test version inherits your presets, styles, and keyboard shortcuts as a starting point, while both installations still run fully independently from there on. This requires special care in step 3 to avoid affecting your existing edits.

Linux
: Execute from a terminal: `/path-to-appimage/darktable.AppImage --configdir /path-to-test-config`
: For convenience, you can wrap this in a shell script or a `.desktop` file.

Windows
: Either create a new shortcut for `darktable.exe`:
  1. Navigate to `C:\path-to-your-install\bin\`, right-click `darktable.exe` and choose _Show more options_ and then _Create shortcut_.
  2. Under "Properties", add to the "Target" field: `"C:\path-to-your-install\bin\darktable.exe" --configdir "C:\path-to-test-config"`
  3. Set "Start in" to the matching `bin` folder.

: Or launch darktable from the terminal:
    ```
    cd "C:\path-to-your-install\bin\"
    .\darktable.exe --configdir "C:\path-to-test-config"
    ```

macOS
: An `.app` file can't be launched with extra parameters by double-clicking, so call the executable inside the app bundle directly from a terminal:

  ```
  /Applications/darktable-nightly.app/Contents/MacOS/darktable --configdir /path/to/new/config/dir
  ```

: Replace `darktable-nightly.app` with the filename you gave the `.app` file.

## 3. Protect your existing edits

Edits are stored in two places: in the database inside the configuration directory, and, if enabled, in [XMP sidecar files](../overview/sidecar-files/sidecar.md) next to your RAW files. The database is already protected by step 2. For the XMP files, you have three options:

a) Work with separate copies of your RAW files
: Safest option. Use copies of your RAW files with the test version in a separate folder. Your originals and their XMP files stay untouched.

b) Turn off XMP creation in the test installation's preferences
: Set _preferences / storage / create XMP files_ to "never". This lets you open folders with existing edits without changing their XMP files. Only affects the test version, since it has its own configuration.

c) Pure in-memory mode
: Launching darktable with the option `--library :memory:` keeps the database in RAM only, and all changes are discarded on exit: `darktable --configdir /path/to/test-config --library :memory:`

For a lasting test setup, options a) or b) are practical. Option c) is handy for a quick, no-trace experiment.

**Caution:** If you cloned your main installation's configuration directory for the testing environment, make sure to either disable XMP creation as described above under b) or remove (not delete) all photos from the library in your testing environment. Otherwise you could interfere with your main installation's edits.
