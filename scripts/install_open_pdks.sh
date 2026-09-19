#!/usr/bin/env bash
set -euxo pipefail

# Clone and build Open PDKs

WORKDIR=${1:-"edadir"}
mkdir -p "$WORKDIR"
cd "$WORKDIR"

if [ ! -d open_pdks ]; then
    git clone https://github.com/RTimothyEdwards/open_pdks.git
fi
cd open_pdks
./configure --enable-sky130-pdk --enable-sram-sky130
make -j$(nproc)
sudo make install
make distclean
cd ..
rm -rf open_pdks 
cd ..

echo "###################################################"
echo "[ Success ] open_pdks installed"
echo "###################################################"
exit 0
