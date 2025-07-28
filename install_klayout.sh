#!/bin/bash
set -e

# Install dependencies
apt-get update && apt-get install -y \
    qtbase5-dev qtchooser qt5-qmake qtbase5-dev-tools libqt5svg5-dev

# Download and install KLayout

WORKDIR=${1:-"edadir"}
mkdir -p "$WORKDIR"


KLAYOUT_VERSION=0.28.16
if [ ! -f klayout_${KLAYOUT_VERSION}-1_amd64.deb ]; then
    wget https://www.klayout.org/downloads/Ubuntu-22/klayout_${KLAYOUT_VERSION}-1_amd64.deb
fi
dpkg -i klayout_${KLAYOUT_VERSION}-1_amd64.deb || apt-get install -f -y 

rm -rf *.deb
cd ..


exit 0
