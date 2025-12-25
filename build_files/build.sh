#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1


dnf5 -y copr enable ublue-os/staging
dnf5 swap ffmpeg-free ffmpeg --allowerasing

 dnf5 update @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
 dnf5 install tlp tlp-rdw

#### Example for enabling a System Unit File

systemctl enable podman.socket
 systemctl enable --now tlp
