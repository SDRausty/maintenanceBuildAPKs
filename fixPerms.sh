#!/bin/env sh 
# Copyright 2017-2019 (c) all rights reserved 
# SDRausty https://sdrausty.github.io 
# Used for reinitializing a git repository. 
# `sn.sh` should be added to your $PATH for this script to work. 
#####################################################################
set -e
find . -type f -exec chmod 640 {} \;
find . -type f -name "*.sh" -exec chmod 750 {} \;
find . -type d -exec chmod 770 {} \;
