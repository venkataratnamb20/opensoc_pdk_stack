#!/bin/bash
set -euxo pipefail

# Install dependencies
apt-get update && apt-get install -y \
    flex bison libxpm-dev

# Clone and build XSchem

WORKDIR=${1:-"edadir"}
mkdir -p "$WORKDIR"


if [ ! -d xschem ]; then
    git clone https://github.com/StefanSchippers/xschem.git
fi
cd xschem
./configure
make -j$(nproc)
make install
cd ..
rm -rf xschem 
cd ..

exit 0
