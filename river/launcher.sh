#!/bin/sh
# Launcher for executables in $PATH

shopt -s lastpipe

IFS=: read -ra path <<< "$PATH"
for p in "${path[@]}"
do
	ls "$p"
done | uniq | fzf -e -i --prompt='launch: ' | read cmd

[ -z "${cmd}" ] && exit

riverctl spawn "${cmd}"

