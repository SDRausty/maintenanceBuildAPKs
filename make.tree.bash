#!/bin/env bash 
# Copyright 2017-2019 (c) all rights reserved 
# by S D Rausty https://sdrausty.github.io
#####################################################################
set -Eeuo pipefail
shopt -s nullglob globstar
VERSIONID="v3.3"

_STRPERROR_() { # Run on script error.
	local RV="$?"
	echo Signal "$RV" received!
	printf "\\e[?25h\\e[1;7;38;5;0mbuildAPKs %s ERROR:  Signal %s received!  See \`stnderr*.log files.\`\\e[0m\\n" "${0##*/}" "$RV"
	_CUP_
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
	_CUP_
 	exit 241 
}

_STRPQUIT_() { # Run on quit.
	printf "\\e[?25h\\e[1;7;38;5;0mbuildAPKs %s WARNING:  Quit signal %s received!\\e[0m\\n" "${0##*/}" "$?"
	_CUP_
 	exit 242 
}

_CUP_() { # clean up
	rm "$TMPDIR/$FNM"
}

if [[ -z "${1:-}" ]] 
then
	ARGS=""
else
	ARGS="$@"
fi

trap '_STRPERROR_ $LINENO $BASH_COMMAND $?' ERR 
trap _STRPEXIT_ EXIT
trap _STRPSIGNAL_ HUP INT TERM 
trap _STRPQUIT_ QUIT 

NOW=$(date +%Y%m%d%m%s%N)
FNM="tree.$NOW.file"
WDR="$PWD"
rm -f du du.*
rm -f tree tree.*
TMPDIR=/tmp
[[ ! -d "/tmp" ]] && (echo "Directory /tmp DOES NOT exist." && TMPDIR=/data/data/com.termux/files/usr/tmp)
#_TMPDIR_() { # https://www.cyberciti.biz/faq/howto-check-if-a-directory-exists-in-a-bash-shellscript/
#	if [[ -e "./tmp" ]]
#	then
#		TMPDIR=/tmp
#	else
#		TMPDIR=/data/data/com.termux/files/usr/tmp
#	fi
#}
#_TMPDIR_
{
echo "cat .gitmodules results:"
cat .gitmodules
echo "find .git/modules/ -name config -exec cat {} \; results:"
find .git/modules/ -name config -exec cat {} \;
echo "find . -type f -exec sha512sum {} \; results:"
find . -type f -exec sha512sum {} \;
echo 
echo "#EOF"
} > "$TMPDIR/$FNM" ||:  
cat "$TMPDIR/$FNM"
sleep 0.64
cd "$TMPDIR"
tar zcf tree.tar.gz "./$FNM"
mv tree.tar.gz "$WDR"
rm "./$FNM"
cd "$WDR"
md5sum tree.tar.gz > tree.md5
sha256sum tree.tar.gz > tree.sha256
sha512sum tree.tar.gz  > tree.sha512
exit $?

#EOF
