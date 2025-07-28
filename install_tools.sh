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

sudo apt-get install -y ngspice klayout
sudo ./install_xschem.sh "$WORKDIR" 
sudo ./install_magic.sh "$WORKDIR"
# sudo ./install_klayout.sh "$WORKDIR"
sudo ./install_open_pdks.sh "$WORKDIR"
sudo ./install_netgen.sh "$WORKDIR"

# echo 'export PDK_ROOT="/usr/local/share/pdk"' >> ~/.bash_aliases
cat ./.bash_aliases > tmp.txt
sed -i '1,3d' tmp.txt
cat ./tmp.txt >> ~/.bash_aliases

# cleanup
rm -f ./tmp.txt
rm -rf "$WORKDIR"


exit 0
