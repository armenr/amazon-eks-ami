#!/usr/bin/env bash
set -o pipefail
set -o nounset
set -o errexit

TEMPLATE_DIR=${TEMPLATE_DIR:-/tmp/worker}
SERVICE_UNIT_DIR=${SERVICE_UNIT_DIR:-/tmp/services}
MODS_BIN_DIR=${MODS_BIN_DIR:-/tmp/mods-bin}

################################################################################
###  MetaData Genius  ##########################################################
################################################################################

sudo cp "$MODS_BIN_DIR"/ec2-metadata /usr/bin/ec2-metadata
sudo chown root:root /usr/bin/ec2-metadata
sudo chmod +x /usr/bin/ec2-metadata

sudo cp "$MODS_BIN_DIR"/fetch-userdata /usr/bin/fetch-userdata
sudo chown root:root /usr/bin/fetch-userdata
sudo chmod +x /usr/bin/fetch-userdata

sudo cp "$SERVICE_UNIT_DIR"/fetch-userdata.service /usr/lib/systemd/system/fetch-userdata.service
sudo chown root:root /usr/lib/systemd/system/fetch-userdata.service

sudo cp "$SERVICE_UNIT_DIR"/run-ec2-userdata.service /usr/lib/systemd/system/run-ec2-userdata.service
sudo chown root:root /usr/lib/systemd/system/run-ec2-userdata.service

systemctl enable fetch-userdata.service
systemctl enable run-ec2-userdata.service
