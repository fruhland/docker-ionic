# docker-ionic
Build environment for Ionic apps

## Description
This container is based on `Ubuntu 18.04` and has `npm`, `nodejs` and `ionic` pre-installed. `Wine` is also installed (x86_64 and i386), so it is possible to build apps with `electron-builder` for Linux/Windows.

The `Android SDK` is installed in `/opt/android/` and `OpenJDK 8` is available, so this is container is also suitable for building Android versions of you Ionic apps.
