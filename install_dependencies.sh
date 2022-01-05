#!/bin/bash

echo "
This script is for installing dependencies for dockerdemo
"

package_list=(
    
    build-essential
    software-properties-common
    python3.8
    python3-tk
    python3-pip
    build-essential
    libfreetype6-dev
    libpng-dev
    libzmq3-dev
    libspatialindex-dev
    libgl1-mesa-glx
    libsm6
    vim
    wget
    zip

)

apt-get update --fix-missing && apt-get install -y --no-install-recommends ${package_list[@]}
apt-get clean && rm -rf /var/lib/apt/lists/*
