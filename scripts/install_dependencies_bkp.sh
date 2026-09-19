#!/bin/bash
set -e

# Update and install all required dependencies for EDA tools and utilities
apt-get update && apt-get install -y \
    sudo wget curl git vim build-essential python3 python3-pip python3-venv \
    locales tzdata \
    m4 tcsh csh libx11-dev tcl-dev tk-dev libcairo2-dev \
    mesa-common-dev libglu1-mesa-dev libncurses-dev \
    flex bison libxpm-dev \
    libxaw7-dev libreadline-dev \
    qtbase5-dev qtchooser qt5-qmake qtbase5-dev-tools libqt5svg5-dev \
    openbox \
    x11vnc xvfb \
    dbus-x11 supervisor \
    libgtk-3-dev xterm \
    && locale-gen en_US.UTF-8 