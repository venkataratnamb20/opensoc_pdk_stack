#!/usr/bin/env bash
set -euxo pipefail

# Update and install all required dependencies for EDA tools and utilities
# apt-get update && apt-get install -y \
#       git vim curl wget
# 	m4 tcsh csh libx11-dev tcl-dev tk-dev libcairo2-dev
#	flex bison libxpm-dev

sudo apt-get update && apt-get upgrade -y &&\
    sudo apt-get install  -y curl wget git \
    build-essential tcsh csh tcl-dev tk-dev

exit 0
