#!/bin/bash
set -e

# Install dependencies
apt-get update && apt-get install -y \
    libxaw7-dev libreadline-dev

# Download and build ngspice

WORKDIR=${1:-"edadir"}
mkdir -p "$WORKDIR"
cd "$WORKDIR"

NGSPICE_VERSION=41
if [ ! -f ngspice-${NGSPICE_VERSION}.tar.gz ]; then
    wget https://sourceforge.net/projects/ngspice/files/ng-spice-rework/${NGSPICE_VERSION}/ngspice-${NGSPICE_VERSION}.tar.gz
fi
tar -xvzf ngspice-${NGSPICE_VERSION}.tar.gz
cd ngspice-${NGSPICE_VERSION}
mkdir -p release
cd release
../configure --with-x --enable-xspice --disable-debug --enable-cider --with-readline=yes --enable-predictor --enable-osdi --enable-openmp
make -j$(nproc)
make install
cd ./"$1"
rm -rf ngspice-${NGSPICE_VERSION}* 
cd ..


exit 0
