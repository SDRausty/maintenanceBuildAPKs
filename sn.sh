#!/bin/env sh 
# Copyright 2017-2019 by SDRausty. All rights reserved.
# SDRausty https://sdrausty.github.io 
# Used for creating the commit message in conjunction with `gr.sh`.
#####################################################################
set -e 
date=`date +%Y%m%d`
time=`date +%H:%M:%S`
utime=`date +%s`
echo Commit on $date at $time and at $utime in Unix time.
