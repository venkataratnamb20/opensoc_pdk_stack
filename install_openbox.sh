#!/usr/bin/env bash
set -euxo pipefail

sudo apt-get update -y && sudo apt-get install -y openbox 

echo "###################################################"
echo "[ Success ] openbox installed"
echo "###################################################"
exit 0