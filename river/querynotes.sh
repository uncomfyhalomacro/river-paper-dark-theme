#!/usr/bin/env bash

shopt -s lastpipe

USEFUL_NOTES="$HOME/useful-notes"
IFS=$'\n' read -r -d '' -a MARKDOWN <<< "$(find "$USEFUL_NOTES" -name "*.md")"
NOTES=( ${MARKDOWN[@]} "Create new note" )
for i in "${NOTES[@]}"; do echo "$i"; done | sort | fuzzel -P "notes: " -p 0 -s f2d26fff -S 173f4fff -t 35b9abff -b 061C2Aff -r 0 -C 81c13bff -f "JetBrains Mono:size=7" -x 30 -w 70 -y 70 -p 0 -l 20 --fuzzy-min-length 3 --fuzzy-max-distance 3 --dmenu --no-run-if-empty | read -r answer
[ -z "${answer}" ] && exit
if [ "${answer}" == "Create new note" ]
then
	command="foot newnotes.sh"
	setsid /bin/sh -c "${command}" >&/dev/null &
	sleep 0.3s
else
	command="foot nvim \"${answer}\""
	setsid /bin/sh -c "${command}" >&/dev/null &
	sleep 0.3s
fi
