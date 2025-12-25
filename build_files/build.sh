#!/bin/bash

set -ouex pipefail

### Install packages


dnf5 remove firefox
dbf5 remove firefox-langpacks
dnf5 -y copr enable ublue-os/staging
dnf5 swap ffmpeg-free ffmpeg --allowerasing

 dnf5 update @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
 dnf5 install tlp tlp-rdw

#### System Unit File

systemctl enable podman.socket
 systemctl enable --now tlp
