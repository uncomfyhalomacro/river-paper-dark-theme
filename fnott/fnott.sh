#!/bin/sh

killall -q fnott
while pgrep -x fnott >/dev/null; do sleep 1; done
exec fnott
