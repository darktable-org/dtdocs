---
title: Install
date: 2022-12-11
lastmod: 2022-12-12
weight: 10
draft: false
author: "people"
---

## Understanding Ansel's releases

### Ansel channels

Ansel development and release path follows 3 channels :

1. A __production channel__ :
	1. linked to the Git [master branch](https://github.com/aurelienpierreeng/ansel),
	2. contains tested code supposed to work reliably for daily use,
	3. contains features found under the _Done_ column, in the [project management board](https://github.com/orgs/aurelienpierreeng/projects/1).
2. A __pre-release channel__ :
	1. backward-compatible with the production channel _(so you can switch from one to another without breaking your image edits)_, 
	2. linked to the Git [candidate branch](https://github.com/aurelienpierreeng/ansel/tree/candidate),
	3. contains code to test before integration in production channel but still relatively safe to use,
	4. contains features found under the _Testing_ column, in the [project management board](https://github.com/orgs/aurelienpierreeng/projects/1).
3. An __experimental channel__ : 
	1. __non-backward-compatible__ with either the production or pre-release channels, 
	2. linked to the Git [dev branch](https://github.com/aurelienpierreeng/ansel/tree/dev),
	3. contains features found under the _In progress_ column, in the [project management board](https://github.com/orgs/aurelienpierreeng/projects/1),
	4. This channel needs to be used aside of the production install since it contains prototypes of new modules, new versions of old modules, and other features that will upgrade the version of the [Ansel database](../preferences-settings/storage#database), making it incompatible with previous versions. It can also contain prototypes that will never make it in production.

At all time, the  [project management Kanban board](https://github.com/orgs/aurelienpierreeng/projects/1) will show what changes are being currently worked on in the non-production channels, with links to their pull request and issue, to help traceability of changes and bug reports.

### Ansel versioning

The __production channel__ is versioned as follow :

1. All versions having the same major version number (`0.x`, `1.x`, `2.x`) produce editing histories that are compatible with each other and use the same internal [database](../preferences-settings/storage#database) version. Major version numbers are upgraded every time changes are introduced that break this property, such as new modules, database structure changes, or new versions of old modules.
2. Minor version numbers (`x.0`, `x.1`, `x.2`) are upgraded every time new changes are made that don't break compatibility within the major version, like GUI refactorings and bug fixes.
3. The major version `0.x` is compatible with darktable 4.0 and 4.0.1 image editing histories, which means it is also compatible with edits made with any darktable version earlier than 4.0. Ansel will not maintain compatibility with upstream darktable for future versions after `0.x`, since darktable 4.2 will introduce nonsensical changes that will stay the burden of the darktable team only.
4. Versions are tested snapshots of the __production channel__. This channel will keep getting changes in-between versions, notably from the __pre-release channel__, supposed to be safe between versions.

### Ansel testing

Tests are important because I develop and use Ansel on Linux Fedora, and I have no way of knowing how it works on other OS. A [continuous integration](https://github.com/aurelienpierreeng/ansel/actions/workflows/ci.yml) bot automatically tests building and basic execution (processing a test picture through the [CLI variant](../cli/ansel-cli) of the software), on Windows 10, Linux Ubuntu 20.04 and 22.04 and Mac OS 11.7 and 12.6. On each OS, the CI bot builds using GCC 9 to GCC 12 and Clang 12 to 14.

But those continuous integration tests are not enough as they don't encompass a real desktop use with a graphical interface and will not show runtime errors. The different channels are meant to gradually push changes to production.

```mermaid
graph TD;
	master[/Stable/];
	candidate[/Pre-release/];
	dev[/Experimental/];
	master2[/Stable/];
	master3[/Stable/];

	master --> m1((Merge));
	master --> m2((Merge));

	master --> dev;
	dev --> c3[fa:fa-code Make unsafe changes];
	c3 --> t3[fa:fa-clock Testing];
	t3 --> r3{Bugs ?};
	r3 -- no ---> m2;
	r3 -- yes --> f3[Fix];
	f3 --> t3;
	m2 --> p3([fa:fa-tag Tag new major version]);
	p3 --> master2;

	master --> candidate;
	candidate --> c1[fa:fa-code Make safe changes];
	c1 --> t1[fa:fa-clock Testing];
	t1 --> r1{Bugs ?};
	r1 -- no -----> m1;
	r1 -- yes --> f1[Fix];
	m1 --> p1([fa:fa-tag Tag new minor version]);
	f1 ---> t1;
	p1 --> master2;

	master2 --> t2[fa:fa-clock Testing];
	t2 --> r2{Bugs ?};
	r2 -- no ---> p2([fa:fa-tag Tag new maintenance version])
	r2 -- yes --> f2[Fix];
	f2 --> t2;
	p2 --> master3;

```

This graph shows how tests are dispatched in the general development workflow. Pre-built "nightly" packages are provided for all 3 channels (stable, pre-release and experimental) for all the platforms (Linux, Windows, Mac OS) and can be tested directly by anyone.

After some time without bug reports, the pre-release and experimental channels are successively merged into the stable channel, letting some time between both merges.

After some time with no bug report in the stable channel, a new maintenance release gets tagged. This means that the `x.0.0` major versions are less tested than the `x.0.1` and `x.1.0`, and should be avoided in environments where stability is the priority.

### Release schedule

The __production channel__ is updated in a rolling-release fashion. Each change triggers automatic builds on Linux, Windows and Mac OS, producing "nightly" packages that can be directly downloaded and installed on each platform. You can subscribe to these nightly builds to update Ansel in a rolling-release fashion.

Major, minor and maintenance versions are released when they are ready.

## Ugrading between major releases

Major releases are defined by the fact that the [Ansel database](../preferences-settings/storage#database) structure will be upgraded and therefore will not be usable by previous major releases. Before the ugrading process starts, Ansel automatically backs up the database in the configuration folder, appending the new version number to the database filename. 

The configuration folder of Ansel is located by default at :
* `$HOME/.config/ansel` for Mac OS and Linux
* `C:\%LOCALAPPDATA%\ansel` on Windows.

In this configuration folder, the image editing histories are stored in the file `library.db` and the presets, styles, and other preferences are stored in the file `data.db`. 

If you upgrade, for example, from version 2.6 to 3.0, both files are backed up under the respective names `library.db-pre-3.0`  and `data.db-pre-3.0`. If, for some reason, you want to go back to the previous 2.6 version after having upgraded to 3.0, you just need to remove the `pre-3.0` suffixes from the file names to restore your back-ups. Any editing you may have done with the 3.0 version will be lost without a chance of being recovered in that case, unless you manually back up `library.db` and `data.db` for a future where you will use the 3.0 version.

{{< warning >}}
There is no backup mechanism in place for the [XMP sidecar files](./overview/sidecar-files/sidecar.md), but they can be restored from the `library` database, which means you need to keep it clean and up-to-date.
{{</ warning >}}

## Importing darktable configuration files

The configuration folder of darktable is located by default at :
 - `$HOME/.config/darktable` for Mac OS and Linux
 - `C:\%LOCALAPPDATA%\darktable` on Windows.

Ansel re-uses the same folder structure, where `darktable` is replaced by `ansel`. Since Ansel is based on darktable 4.0, you can import your darktable 4.0 and earlier configuration files by copy-pasting the following files from the darktable configuration folder to the Ansel's one :
- `library.db`, 
- `data.db`,
- `shortcutsrc`,
- `darktablerc`, which will need to be renamed `anselrc` after copying.

From there, you can continue to work just as before. Ansel can be installed alongside darktable.

{{< danger >}}
darktable and Ansel can store the images editing histories in [XMP sidecar files](./overview/sidecar-files/sidecar.md) when the option is enabled. Since they both use the same XMP tags, the last application to have opened the image will overwrite its own history within the XMP. This is not a real issue for darktable 4.0 and Ansel 0.0 since their [pixel pipelines](./views/darkroom/pixelpipe/_index.md) are compatible, but the compatibility is broken between Ansel and darktable 4.2.

However, both applications load the editing histories first from their database. Then, if the _look for updated xmp files on startup_ is [enabled in the preferences](../preferences-settings/storage#xmp), they can crawl the image folders to detect if the XMP edits are more recent than the database ones. In that case, they will prompt a window asking if the files should be synchronized and in which direction. Never synchronize from XMP to database if you use both applications on the same files.
{{</ danger >}}
