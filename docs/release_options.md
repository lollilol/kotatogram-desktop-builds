# Release options

When creating a release, it will make all release builds from `master` branch. If you want to change the way it builds, you can specify options in release description:

```

Branch: dev
Updater: yes
Packer: false

```

Boolean options (like `Updater` and `Packer`) support multiple variants of setting its options: 

* `true`/`false`
* `yes`/`no`
* `enable`/`disable`
* `enabled`/`disabled`
* `on`/`off`
* `0`/`1`

They are also case-insensitive, like any option name and values.

## Supported options

### Reference

Aliases: `ref`, `commit`, `tag`, `branch`.

Specifies target commit, tag or branch to build. Behaves like `ref` parameter from [actions/checkout](https://github.com/actions/checkout).

### Builds

Aliases: `build`, `platform`, `platforms`, `os`, `oses`.

Specfies a platform to build.

Values:
* `appimage`/`linux` – AppImage build 
* `win`/`windows` – Windows build (not ready yet)

This option supports multiple values, separated by comma, like this:

```
Platform: Linux, Windows
```

### Updater

Aliases: `upd`, `update`

Boolean parameter, enables in-app autoupdater and packs updater in archive on `true`. Disabled by default to preserve experimental builds as-is.

### Packer

Aliases: `pack`, `packager`.

Boolean parameter, packages build in autoupdater format on `true`. Disabled by default. Has no effect if autoupdater is disabled.

