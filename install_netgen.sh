#!/bin/bash
set -e

# Install dependencies (already installed with magic)

# Clone and build Netgen

WORKDIR=${1:-"edadir"}
mkdir -p "$WORKDIR"


if [ ! -d netgen ]; then
    git clone https://github.com/RTimothyEdwards/netgen.git
fi
cd netgen
./configure
make -j$(nproc)
make install
cd ..
rm -rf netgen 
cd ..

exit 0
