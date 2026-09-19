#!/usr/bin/env bash
set -euxo pipefail

# Install dependencies
sudo apt-get update -y && sudo apt-get install -y \
    m4 tcsh csh libx11-dev tcl-dev tk-dev libcairo2-dev \
    mesa-common-dev libglu1-mesa-dev libncurses-dev

# Clone and build Magic

WORKDIR=${1:-"edadir"}
mkdir -p "$WORKDIR"
cd "$WORKDIR"

if [ ! -d magic ]; then
    # git clone https://github.com/RTimothyEdwards/magic.git
    git clone git://opencircuitdesign.com/magic
fi
cd magic
./configure --enable-cairo-offscreen
make -j$(nproc)
sudo make install
cd ..
rm -rf magic 
cd ..

echo "###################################################"
echo "[ Success ] magic installed"
echo "###################################################"
exit 0
