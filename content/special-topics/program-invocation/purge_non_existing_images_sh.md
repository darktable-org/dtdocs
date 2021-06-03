---
title: purge_non_existing_images_sh
id: darktable-cli
weight: 70
draft: false
author: "people"
---

The `purge_non_existing_images.sh` shell script can be used to seek out entries in the darktable database that point to files no longer existing in the filesystem. You must close darktable before running this script.

The script can be called with the following command line parameters:

```
purge_non_existing_images.sh [-c|--configdir <path>]
                             [-l|--library <path>]
                             [-p|--purge]
```

If the user runs the script with no options, then the script will do a "dry run" and generate a report of missing files, without committing any changes to the darktable database.

The available options are:

`-c|--configdir <path>`
: This specifies the path to the darktable config directory to be used by the script. If this option is not provided, the default config directory location shall be used."

`-l|--library <path>`
: This specifies the path to the darktable library.db file to be analysed by the script. If this option is not specified, then the default library.db file shall be analysed.

`-p|--purge`
: When this option is specified, then the script will actually delete any entries in the database that refer to non-existant files. If the option is not provided, then a report will be printed without committing any changes to the database.

---

**Notes:**

1. The script must be run in a unix shell, and the `sqlite3` client must be available in the command search path. For Linux systems, this generally will not be an issue. 

2. For Windows systems, you will normally need the MSYS2 environment to be installed, as described in the instructions for building darktable in a Windows environment. If you installed darktable using the standard windows installer package, then the location of the script would normally be something like: `C:\Program Files\darktable\share\darktable\tools\purge_non_existing_images.sh`.

3. For macOS systems, the Terminal application provides a shell, and there is an sqlite3 client provided by the operating system by default. If darktable was installed using an application bundle from a dmg image, then the default location for the script would be `/Applications/darktable.app/Contents/Resources/share/darktable/tools/purge_non_existing_iamges.sh`

4. The delete operation can't be undone. It is therefore strongly recommended that you take a backup of the database before purging any entries.

---

