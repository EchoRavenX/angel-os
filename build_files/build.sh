#!/bin/bash

set -ouex pipefail

### Install packages


dnf5 remove  -y firefox
dnf5 remove  -y firefox-langpacks
dnf5 -y copr enable ublue-os/staging
dnf5  -y swap ffmpeg-free ffmpeg --allowerasing

 dnf5 update  -y  @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
 dnf5 install  -y tlp tlp-rdw

#### System Unit File

systemctl enable podman.socket
 systemctl enable --now tlp
