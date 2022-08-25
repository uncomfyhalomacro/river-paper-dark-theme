#!/usr/bin/env bash

killall -q wbg
while pgrep -x wbg >/dev/null; do sleep 1; done
exec wbg /usr/share/wallpapers/openSUSEtumbleweed-1920x1080.jpg
