#!/usr/bin/env bash
set -o pipefail
set -o nounset
set -o errexit

sudo mkdir -p ~/usr/bin
sudo mkdir -p ~/usr/lib64
sudo touch /etc/environment
sudo touch /etc/profile
echo 'PATH=$PATH:~/usr/bin' | sudo tee --append /etc/environment
echo 'PATH=$PATH:~/usr/bin' | sudo tee --append /etc/profile
echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/usr/lib64' | sudo tee --append /etc/environment
echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/usr/lib64' | sudo tee --append /etc/profile
