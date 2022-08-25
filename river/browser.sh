#!/usr/bin/env bash

sites=(
    "personal     twitter             https://twitter.com/"
    "personal     tweetdeck           https://tweetdeck.twitter.com/"
    "personal     archwiki            https://wiki.archlinux.org"
    "personal     codeberg            https://codeberg.org/user/settings/repos"
    "personal     everything-wayland  https://wayland.app/protocols/"
    "personal     foot                https://codeberg.org/dnkl/foot"
    "personal     github              https://github.com"
    "personal     julia               https://julialang.org" 
    "personal     netflix             https://netflix.com"
    "personal     odysee              https://odysee.com"
    "personal     openSUSE            https://opensuse.github.io/openSUSE-docs-revamped-temp"
    "personal     r/julia             https://reddit.com/r/Julia"
    "personal     river               https://github.com/riverwm/river"
    "personal     types.pl            https://types.pl"
    "personal     wayland-protocols   https://gitlab.freedesktop.org/wayland/wayland-protocols/"
    "school       classroom           https://classroom.google.com"
    "school       scholar             https://scholar.google.com"
    "social       facebook            https://fb.me"
		"social       fb-messenger        https://www.messenger.com"
)

shopt -s lastpipe

for site in "${sites[@]}"
do
    echo "${site}" | awk '{print $1" "$2}'
done | sort | fuzzel -P "Open Site: " -p 0 -s f2d26fff -S 173f4fff -t 35b9abff -b 061C2Aff -r 0 -C 81c13bff -f "JetBrains Mono:size=10" -x 30 -w 35 -y 70 -p 0 -l 20 --show-actions --fuzzy-min-length 3 --fuzzy-max-distance 3 --dmenu --no-run-if-empty | read -r name 

for site in "${sites[@]}"
do 
    _name="$(echo "${site}" | awk '{print $2}')"
	name2="$(echo "${name}" | awk '{print $2}')"
	case "${_name}" in 
		"${name2}")
        url="$(echo "${site}" | awk '{print $3}')"
        profile="$(echo "${site}" | cut -d' ' -f1)"
		break
		;;
	esac
done

[ -z "${url}" ] && exit

if [ -x "$(command -v firefox)" ]
then
	if [ "${profile}" == "private" ]
	then
    command="firefox --private-window \"${url}\""
	else
    command="firefox -P \"${profile}\" \"${url}\""
	fi
	setsid /bin/sh -c "${command}" >&/dev/null &
	sleep 0.3
elif [ -x "$(command -v flatpak)" ]
then
    if [ "Firefox" == "$(flatpak --user list | grep Firefox | awk '{print $1}')" ]
    then

		if [ "${profile}" == "private" ]
		then
    	command="flatpak --user run org.mozilla.firefox --private-window \"${url}\""
		else
    	command="flatpak --user run org.mozilla.firefox -P \"${profile}\" \"${url}\""
		fi

	setsid /bin/sh -c "${command}" >&/dev/null &
	sleep 0.3
    else
        notify-send -u "critical" "Trying to use flatpak but Firefox is not installed! Install Firefox! We will try to use an existing browser in the system"
		command="xdg-open \"${url}\""
		setsid /bin/sh -c "${command}" >&/dev/null &
		sleep 0.3
        exit
    fi
else
	notify-send -u "critical" "Trying to use flatpak has failed! Command not found!"
	notify-send -u "critical" "Firefox may not be installed! Install Firefox! We will try to use any existing browser in the system instead"
    command="xdg-open \"${url}\""
	setsid /bin/sh -c "${command}" >&/dev/null &
	sleep 0.3
	exit
fi

