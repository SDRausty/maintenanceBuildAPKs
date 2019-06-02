#!/bin/env sh 
# Copyright 2019 (c) all rights reserved by S D Rausty 
# This script is for computing size and amount of built applications.
#####################################################################
set -e
unset LD_PRELOAD
while true;do
date >> notes
du -hsk "$HOME"/buildAPKs >> notes
du -hsk /storage/emulated/0/Download/builtAPKs >> notes ||:
echo Size in KB >> notes
echo Number of APKs >> notes
ls -Al /storage/emulated/0/Download/builtAPKs/|wc -l >> notes
tail -n 24 notes
sleep 1800
done

#EOF
