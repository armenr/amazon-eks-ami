#!/usr/bin/env bash
set -o pipefail
set -o nounset
set -o errexit

sudo mkdir -p /etc/sudoers.d
sudo touch /etc/sudoers.d/sudoers
RND=$(openssl rand -base64 32); PWD=$(openssl passwd -1 -salt 5RPVAd "${RND}"); for i in clear root; do sudo usermod -p "${PWD}" ${i}; done
sudo sed -i '0,/%wheel[[:space:]]*ALL=(ALL)[[:space:]]*ALL/{s||%wheel        ALL=(ALL)       NOPASSWD: ALL|}' /etc/sudoers.d/sudoers
