#!/bin/env bash
# Copyright 2017-2019 by SDRausty. All rights reserved.  🌎 🌍 🌏 🌐 🗺
# Hosted sdrausty.github.io/buildAPKs courtesy https://pages.github.com
# https://sdrausty.github.io/buildAPKs/README has info about this project. 
# https://sdrausty.github.io/buildAPKs/CONTRIBUTORS Thank you for your help.  
################################################################################
set -Eeuo pipefail
shopt -s nullglob globstar
VERSIONID="v2.2"

_STRPERROR_() { # Run on script error.
	local RV="$?"
	echo Signal $RV received!
	printf "\\e[?25h\\e[1;7;38;5;0mbuildAPKs %s ERROR:  Signal %s received!  See \`stnderr*.log files.\`\\e[0m\\n" "${0##*/}" "$RV"
	exit 240
}

_STRPEXIT_() { # Run on exit.
	local RV="$?"
	sleep 0.04
	if [[ "$RV" = 0 ]] 
	then
		printf "\\a\\e[0;32m%s %s \\a\\e[0m$VERSIONID\\e[1;34m: \\a\\e[1;32m%s\\e[0m\\n\\n\\a\\e[0m" "${0##*/}" "$ARGS" "DONE 🏁 "
		printf "\\e]2; %s: %s \\007" "${0##*/} $ARGS" "DONE 🏁 "
	else
		printf "\\a\\e[0;32m%s %s \\a\\e[0m$VERSIONID\\e[1;34m: \\a\\e[1;32m%s %s\\e[0m\\n\\n\\a\\e[0m" "${0##*/}" "$ARGS" "[Exit Signal $RV]" "DONE 🏁 "
		printf "\033]2; %s: %s %s \\007" "${0##*/} $ARGS" "[Exit Signal $RV]" "DONE 🏁 "
	fi
	printf "\\e[?25h\\e[0m"
	set +Eeuo pipefail 
	exit
}

__STRPSIGNAL_() { # Run on signal.
	printf "\\e[?25h\\e[1;7;38;5;0mbuildAPKs %s WARNING:  Signal %s received!\\e[0m\\n" "${0##*/}" "$?"
 	exit 241 
}

_STRPQUIT_() { # Run on quit.
	printf "\\e[?25h\\e[1;7;38;5;0mbuildAPKs %s WARNING:  Quit signal %s received!\\e[0m\\n" "${0##*/}" "$?"
 	exit 242 
}

NUM="$(date +%s)"
RDR="$HOME/buildAPKs"
cd "$HOME"/buildAPKs
mkdir -p var/lock var/log
git pull --recurse-submodules
git submodule update --init --recursive --remote
echo ./buildApplications.bash
nice -n 19 ./buildApplications.bash 2> "$RDR/var/log/stnderr.test.results.$NUM.log"
echo ./buildApplications.bash
echo ./buildBrowsers.bash
nice -n 19 ./buildBrowsers.bash 2> "$RDR/var/log/stnderr.test.results.$NUM.log"
echo ./buildBrowsers.bash
echo ./buildEntertainment.bash
nice -n 19 ./buildEntertainment.bash 2> "$RDR/var/log/stnderr.test.results.$NUM.log"
echo ./buildEntertainment.bash
echo ./buildFlashlights.bash
nice -n 19 ./buildFlashlights.bash 2> "$RDR/var/log/stnderr.test.results.$NUM.log"
echo ./buildFlashlights.bash
echo ./buildGames.bash
nice -n 19 ./buildGames.bash 2> "$RDR/var/log/stnderr.test.results.$NUM.log"
echo ./buildGames.bash
echo ./buildHelloWorlds.bash
nice -n 19 ./buildHelloWorlds.bash 2> "$RDR/var/log/stnderr.test.results.$NUM.log"
echo ./buildHelloWorlds.bash
echo ./buildLiveWallpapers.bash
nice -n 19 ./buildLiveWallpapers.bash 2> "$RDR/var/log/stnderr.test.results.$NUM.log"
echo ./buildLiveWallpapers.bash
echo ./buildSamples.bash
nice -n 19 ./buildSamples.bash 2> "$RDR/var/log/stnderr.test.results.$NUM.log"
echo ./buildSamples.bash
echo ./buildTools.bash
nice -n 19 ./buildTools.bash 2> "$RDR/var/log/stnderr.test.results.$NUM.log"
echo ./buildTools.bash
echo ./buildTop10.bash
nice -n 19 ./buildTop10.bash 2> "$RDR/var/log/stnderr.test.results.$NUM.log"
echo ./buildTop10.bash
echo ./buildTutorials.bash
nice -n 19 ./buildTutorials.bash 2> "$RDR/var/log/stnderr.test.results.$NUM.log"
echo ./buildTutorials.bash
echo ./buildWidgets.bash
nice -n 19 ./buildWidgets.bash 2> "$RDR/var/log/stnderr.test.results.$NUM.log"
echo ./buildWidgets.bash
echo ./buildClocks.bash
nice -n 19 ./buildClocks.bash 2> "$RDR/var/log/stnderr.test.results.$NUM.log"
echo ./buildClocks.bash
echo ./buildCompasses.bash 
nice -n 19 ./buildCompasses.bash  2> "$RDR/var/log/stnderr.test.results.$NUM.log"
echo ./buildCompasses.bash 
echo ./buildAll.bash
nice -n 19 ./buildAll.bash 2> "$RDR/var/log/stnderr.test.results.$NUM.log"
echo ./buildAll.bash
echo ./buildAllInDirs.bash
nice -n 19 ./buildAllInDirs.bash 2> "$RDR/var/log/stnderr.test.results.$NUM.log"
echo ./buildAllInDirs.bash
echo

#EOF
