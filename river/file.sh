#!/bin/bash

shopt -s lastpipe
fd . $HOME --type file | fuzzel -P "Open file: " -p 0 -s f2d26fff -S 173f4fff -t 35b9abff -b 061C2Aff -r 0 -C 81c13bff -f "JetBrains Mono:size=7" -x 30 -w 135 -y 70 -p 0 -l 20 --show-actions --fuzzy-min-length 3 --fuzzy-max-distance 3 --dmenu --no-run-if-empty | read -r uwu

[ -z "${uwu}" ] && exit
setsid /bin/sh -c "TERMINAL=foot xdg-open \"${uwu}\"" >&/dev/null &
sleep 0.3s
