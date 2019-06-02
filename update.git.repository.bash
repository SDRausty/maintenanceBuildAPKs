#!/bin/env bash 
# Copyright 2017-2019 (c) all rights reserved 
# by S D Rausty https://sdrausty.github.io
#####################################################################
set -Eeuo pipefail
shopt -s nullglob globstar
unset LD_PRELOAD
VERSIONID="v2.2"

_SUGRERROR_() { # Run on script error.
	local RV="$?"
	echo Signal "$RV" received!
	printf "\\e[?25h\\e[1;7;38;5;0mbuildAPKs %s ERROR:  Signal %s received!  See \`stnderr*.log files.\`\\e[0m\\n" "${0##*/}" "$RV"
	exit 240
}

_SUGREXIT_() { # Run on exit.
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

__SUGRSIGNAL_() { # Run on signal.
	printf "\\e[?25h\\e[1;7;38;5;0mbuildAPKs %s WARNING:  Signal %s received!\\e[0m\\n" "${0##*/}" "$?"
 	exit 241 
}

_SUGRQUIT_() { # Run on quit.
	printf "\\e[?25h\\e[1;7;38;5;0mbuildAPKs %s WARNING:  Quit signal %s received!\\e[0m\\n" "${0##*/}" "$?"
 	exit 242 
}

trap '_SUGRERROR_ $LINENO $BASH_COMMAND $?' ERR 
trap _SUGREXIT_ EXIT
trap _SUGRSIGNAL_ HUP INT TERM 
trap _SUGRQUIT_ QUIT 

if [[ -z "${1:-}" ]] 
then
	ARGS=""
else
	ARGS="$@"
fi

echo "$PWD"
git pull
sleep 1.6
echo "$PWD"
echo 
exit $?
