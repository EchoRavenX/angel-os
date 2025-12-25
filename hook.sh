#!/bin/bash
set -euo pipefail

# Create liveuser if it doesn't exist
if ! id -u liveuser >/dev/null 2>&1; then
    useradd -m -G wheel liveuser
fi

passwd -d liveuser

mkdir -p /etc/greetd

cat <<EOF > /etc/greetd/config.toml
[terminal]
vt = 1

[default_session]
command = "cosmic-session"
user = "liveuser"
autologin = true
EOF


echo "Auto-login enabled for liveuser"
