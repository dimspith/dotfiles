#!/bin/bash
# baraction.sh for spectrwm status bar

## DATE
dte() {
  dte="$(date +"%A, %B %d %l:%M%p")"
  echo -e "$dte"
}

## DISK
batt() {
  bat_capacity=$(cat /sys/class/power_supply/BAT1/capacity)
  bat_status=$(cat /sys/class/power_supply/BAT1/status)
  echo -e "BAT: $bat_status: $bat_capacity%"
}

## RAM
mem() {
  mem=`free | awk '/Mem/ {printf "%d MiB/%d MiB\n", $3 / 1024.0, $2 / 1024.0 }'`
  echo -e "MEM: $mem"
}

## CPU
cpu() {
  read cpu a b c previdle rest < /proc/stat
  prevtotal=$((a+b+c+previdle))
  sleep 0.5
  read cpu a b c idle rest < /proc/stat
  total=$((a+b+c+idle))
  cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
  echo -e "CPU: $cpu%"
}

## VOLUME
vol() {
    vol=`amixer get Master | awk -F'[][]' 'END{ print $4":"$2 }'`
    echo -e "VOL: $vol"
}

SLEEP_SEC=0.5
#loops forever outputting a line every SLEEP_SEC secs
while :; do
    echo "$(cpu) | $(mem) | $(batt) | $(vol) | $(dte)"
	sleep $SLEEP_SEC
done
