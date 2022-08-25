#!/bin/sh

shopt -s lastpipe

DOC="$HOME/Documents"

find "$DOC" -name "*.pdf" | fuzzel -P "read book: " -p 0 -s f2d26fff -S 173f4fff -t 35b9abff -b 061C2Aff -r 0 -C 81c13bff -f "JetBrains Mono:size=8" -x 30 -w 180 -y 70 -p 0 -l 20 --fuzzy-min-length 3 --fuzzy-max-distance 3 --dmenu --no-run-if-empty | read -r book

[ -z "${book}" ]  && exit

command="zathura \"$book\""
riverctl spawn "${command}"
