#!/bin/env sh
# Copyright 2017-2019 (c) all rights reserved 
# by S D Rausty https://sdrausty.github.io
#####################################################################
set  -e 
find .  -name AndroidManifest.xml \
	-exec cat {} \; | grep minSdkVersion
find .  -name AndroidManifest.xml \
	-exec cat {} \; | grep targetSdkVersion
