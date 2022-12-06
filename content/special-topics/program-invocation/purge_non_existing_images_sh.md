---
title: purge_non_existing_images.sh
id: purge-non-existing-images-sh
weight: 70
draft: false
author: "people"
---

Find and remove entries from the library database referencing images that no longer exist in the filesystem. You must close Ansel before running this script.

The script can be called with the following command line parameters:

```
purge_non_existing_images.sh [-c|--configdir <path>]
                             [-l|--library <path>]
                             [-p|--purge]
```

Run the script with no options to perform a "dry run", which generates a report of the missing files without committing any changes to the database.

The available options are:

`-c|--configdir <path>`
: Specify the path to the Ansel configuration directory to be used by the script. If this option is not provided, the default config directory location will be used.

`-l|--library <path>`
: Specify the path to the library.db database file to be analysed by the script. If this option is not specified, the default library.db file location will be used.

`-p|--purge`
: Actually delete any entries in the database that refer to non-existent files. If the option is not provided, a report will be printed without committing any changes to the database.

---

**Notes:**

1. The script must be run in a unix shell, and the `sqlite3` client must be available in the command search path. For Linux systems, this will normally not be an issue.

2. For Windows systems, you will normally need the MSYS2 environment to be installed, as described in the [instructions for building Ansel in a Windows environment](https://github.com/Ansel-org/Ansel/blob/master/packaging/windows/BUILD.md). If you installed Ansel using the standard Windows installer package, the location of the script would normally be something like: `C:\Program Files\Ansel\share\Ansel\tools\purge_non_existing_images.sh`.

3. For macOS systems, the Terminal application provides a shell, and the `sqlite3` client is provided by the operating system by default. If Ansel was installed using an application bundle from a dmg image, then the default location for the script would be `/Applications/Ansel.app/Contents/Resources/share/Ansel/tools/purge_non_existing_images.sh`

4. The delete operation can't be undone. It is therefore strongly recommended that you take a backup of the database before purging any entries.

---
