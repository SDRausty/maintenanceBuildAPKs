#!/data/data/com.termux/files/usr/bin/sh -e 
# Copyright 2017 (c) all rights reserved 
# by S D Rausty https://sdrausty.github.io
# Update repository and update submodules.
#####################################################################
cd $HOME/buildAPKs
git pull 
git submodule update
git submodule update --init --recursive --remote
