#!/bin/env sh 
# Copyright 2017-2019 by SDRausty. All rights reserved.
# SDRausty https://sdrausty.github.io 
# Used for creating the commit message in conjunction with `gr.sh`.
#####################################################################
set -e 
date=`date +%Y%m%d`
ntime=`date +%N`
echo Commit $ntime on $date
