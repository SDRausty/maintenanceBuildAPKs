#!/bin/env sh 
# Copyright 2017-2019 by SDRausty. All rights reserved.
# by S D Rausty https://sdrausty.github.io
# Update repository and initialize and update submodules. 
#####################################################################
set -e
cd $HOME/buildAPKs
git pull 
git submodule init
git submodule update
