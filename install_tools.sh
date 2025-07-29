#!/usr/bin/env bash
#
#
# Install all eda tools
#
#

set -euxo pipefail

# WORKDIR="edadir"
WORKDIR=${1:-"edadir"}
mkdir -p "$WORKDIR"

sudo apt-get update && sudo apt-get upgrade -y && \
  sudo apt-get install -y klayout

sudo ./install_dependencies.sh
sudo ./install_xschem.sh "$WORKDIR" 
sudo ./install_magic.sh "$WORKDIR"
# sudo ./install_klayout.sh "$WORKDIR"
sudo ./install_open_pdks.sh "$WORKDIR"
sudo ./install_netgen.sh "$WORKDIR"
# sudo apt-get install -y ngspice

# echo 'export PDK_ROOT="/usr/local/share/pdk"' >> ~/.bash_aliases
cat ./.bash_aliases > tmp.txt
sed -i '1,3d' tmp.txt
cat ./tmp.txt >> ~/.bash_aliases

# cleanup
rm -f ./tmp.txt
rm -rf "$WORKDIR"

# Test
#
#
# ngspice
#

echo "ngspice version..."
ngspice -v

echo "xschem version..."
xschem -v

echo "klayout version..."
klayout -v

echo "magic version..."
magic --version

echo "netgen version..."
netgen -v

exit 0
