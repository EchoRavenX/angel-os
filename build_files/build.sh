#!/bin/bash

set -ouex pipefail

### Install packages


dnf5 remove  -y firefox
dnf5 remove  -y firefox-langpacks
dnf5 -y copr enable ublue-os/staging
dnf5  -y swap ffmpeg-free ffmpeg --allowerasing
dnf5 install -y \
    https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-rawhide.noarch.rpm \
    https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-rawhide.noarch.rpm
dnf5 group install -y multimedia --setopt=install_weak_deps=False --exclude=PackageKit-gstreamer-plugin


#### System Unit File

systemctl enable podman.socket
