#!/usr/bin/env bash
#
#


# sudo apt-get install -y curl
export PDK_ROOT="/usr/local/share/pdk"
# alias xschem_init="cp $PDK_ROOT/sky130B/libs.tech/xschem/xschemrc ."
alias xschem_inita="echo 'source $PDK_ROOT/sky130A/libs.tech/xschem/xschemrc' > ./xschemrc;"
alias xschem_initb="echo 'source $PDK_ROOT/sky130B/libs.tech/xschem/xschemrc' > ./xschemrc;"
alias magic_init="cp $PDK_ROOT/sky130A/libs.tech/magic/sky130A.magicrc .; cp $PDK_ROOT/sky130A/libs.tech/magic/sky130B.magicrc .;"
alias magicskya="magic -rcfile sky130A.magicrc"
alias magicskyb="magic -rcfile sky130B.magicrc"
alias klayoutskya="KLAYOUT_PATH=$PDK_ROOT/sky130A/libs.tech/klayout klayout -e"
alias klayoutskyb="KLAYOUT_PATH=$PDK_ROOT/sky130B/libs.tech/klayout klayout -e"
alias klayoutgf="KLAYOUT_PATH=$PDK_ROOT/gf180mcuC/libs.tech/klayout klayout -e"
