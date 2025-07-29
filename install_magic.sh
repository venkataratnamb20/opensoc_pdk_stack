#!/bin/bash
set -e

# Install dependencies
sudo apt-get update && sudo apt-get install -y \
    m4 tcsh csh libx11-dev tcl-dev tk-dev libcairo2-dev \
    mesa-common-dev libglu1-mesa-dev libncurses-dev

# Clone and build Magic

WORKDIR=${1:-"edadir"}
mkdir -p "$WORKDIR"
cd "$WORKDIR"

if [ ! -d magic ]; then
    git clone https://github.com/RTimothyEdwards/magic.git
fi
cd magic
./configure --enable-cairo-offscreen
make -j$(nproc)
sudo make install
cd ..
rm -rf magic 
cd ..

exit 0
