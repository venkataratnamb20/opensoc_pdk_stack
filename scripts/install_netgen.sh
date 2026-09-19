#!/usr/bin/env bash
set -euxo pipefail

# Install dependencies (already installed with magic)

# Clone and build Netgen

WORKDIR=${1:-"edadir"}
mkdir -p "$WORKDIR"
cd "$WORKDIR"

if [ ! -d netgen ]; then
    git clone https://github.com/RTimothyEdwards/netgen.git
fi
cd netgen
./configure
make -j$(nproc)
sudo make install
cd ..
rm -rf netgen 
cd ..

echo "###################################################"
echo "[ Success ] netgen installed"
echo "###################################################"
exit 0
