#!/bin/bash
set -e

# Install dependencies
apt-get update && apt-get install -y \
    m4 tcsh csh libx11-dev tcl-dev tk-dev libcairo2-dev \
    mesa-common-dev libglu1-mesa-dev libncurses-dev

# Clone and build Magic

WORKDIR=${1:-"edadir"}
mkdir -p "$WORKDIR"


if [ ! -d magic ]; then
    git clone https://github.com/RTimothyEdwards/magic.git
fi
cd magic
./configure --enable-cairo-offscreen
make -j$(nproc)
make install
cd ..
rm -rf magic 
cd ..

exit 0
