#!/usr/bin/env bash

function run {
    if ! pgrep -f $1 ;
    then
        $@&
    fi
}

run nitrogen --restore
run setxkbmap -model pc105 -layout us,gr -option grp:rctl_toggle -option ctrl:nocaps
run emacs --daemon
run dunst
