#!/usr/bin/env bash
set -euo pipefail
hostnamectl set-hostname "angel"

echo "Angel OS: Setting easy live credentials"


useradd -m -G wheel liveuser || true

echo "liveuser:angel" | chpasswd


echo "liveuser ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/liveuser
chmod 0440 /etc/sudoers.d/liveuser

mkdir -p /etc/greetd
cat > /etc/greetd/config.toml <<EOF
[terminal]
vt = 1

[default_session]
command = "cosmic-session"
user = "liveuser"
autologin = true
EOF

echo "Live username: liveuser"
echo "Live password: angel"
echo "Auto-login attempted – type password if prompted"
