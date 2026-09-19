#!/usr/bin/env bash
set -euxo pipefail

# Install dependencies
sudo apt-get update -y && sudo apt-get install -y \
    flex bison libxpm-dev

# Clone and build XSchem

WORKDIR=${1:-"edadir"}
mkdir -p "$WORKDIR"
cd "$WORKDIR"

if [ ! -d xschem ]; then
    git clone https://github.com/StefanSchippers/xschem.git
fi
cd xschem
./configure
make -j$(nproc)
sudo make install
cd ..
rm -rf xschem 
cd ..

echo "###################################################"
echo "[ Success ] xschem installed"
echo "###################################################"
exit 0
