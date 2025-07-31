#!/usr/bin/env bash

set -euxo pipefail

WORKDIR=${1:-"edadir"}
mkdir -p "$WORKDIR" && cd "$WORKDIR"

PDK_DIR="/workspaces/opensoc_pdk_stack/cad"
# PDK_DIR="/usr/local/share/pdk"
mkdir -p $PDK_DIR

if [ -d "$PDK_DIR/pdk" ]; then
echo "PDK already available!"
    exit 0
fi

## fetch the repository with git:
if [ ! -d open_pdks ]; then
    # git clone git://opencircuitdesign.com/open_pdks
    git clone https://github.com/RTimothyEdwards/open_pdks.git
fi
cd open_pdks
## configure the build, a --prefix option can be given to install
## in a different place, by default after installation a 
## /usr/local/share/pdk directory is created if no --prefix is provided.
## Below line for example requests installation in my home directory
## (/home/schippes/share/pdk):
## ./configure --enable-sky130-pdk --prefix=/home/schippes
## Do the following steps one at a time and ensure no errors are
##  reported after each step.

#  ./configure --enable-sky130-pdk --enable-gf180mcu-pdk 
./configure --enable-sky130-pdk --prefix=$PDK_DIR
make
sudo make install 

echo "Installed 'PDK: sky130' successfully!"

echo "Cleaning up..."
rm -rf open_pdks

exit 0