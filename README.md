# docker-ionic
Build environment for Ionic apps

[![DockerHub](https://img.shields.io/docker/pulls/ruhland/ionic)](https://hub.docker.com/r/ruhland/ionic)

## Description
This container is based on `Ubuntu 20.04` and has `npm`, `nodejs` and `ionic` pre-installed. `Wine` is also installed, so it is possible to build apps with `electron-builder` for Linux/Windows.

The `Android SDK` is installed in `/opt/android/` and `OpenJDK 8` is available, so this is container is also suitable for building Android versions of your Ionic apps.
