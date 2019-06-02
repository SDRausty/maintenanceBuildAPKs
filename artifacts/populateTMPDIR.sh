#!/bin/env bash 
# Copyright 2017-2019 (c) all rights reserved 
# by S D Rausty https://sdrausty.github.io
#####################################################################
set -Eeuo pipefail
_PRINTDONE_() {
	printf "\\033[1;32mDONE  \\033[0m\\n"
}

_PRINTP_() {
	printf "\\n\\033[1;34mPopulating %s/buildAPKsLibs: " "$TMPDIR"
	printf '\033]2;Populating %s/buildAPKsLibs: OK\007' "$TMPDIR"
}

if [ ! -e "$TMPDIR"/buildAPKsLibs ]
then
	_PRINTP_
	mkdir "$TMPDIR"/buildAPKsLibs 
	cd "$TMPDIR"/buildAPKsLibs 
	find "$WDR"/libs -name "*.aar" -exec ln -s {} \; 2>"$WDR"/stnderr"$NUM".log ||:
	find "$WDR"/libs  -name "*.jar" -exec ln -s {} \; 2>"$WDR"/stnderr"$NUM".log ||:
	cd "$WDR"
	 _PRINTDONE_
fi
