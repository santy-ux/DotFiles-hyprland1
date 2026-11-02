#!/usr/bin/env bash
THRESHOLD=${THRESHOLD:-20}
BAT=$(ls -d /sys/class/power_supply/BAT* 2>/dev/null | head -1)
[ -z "$BAT" ] && exit 0
sent=0
while true; do
  level=$(cat "$BAT/capacity")
  status=$(cat "$BAT/status")
  if [ "$status" = "Discharging" ] && [ "$level" -le "$THRESHOLD" ]; then
    if [ "$sent" -eq 0 ]; then
      notify-send -u critical -t 0 -i battery-caution "Batería baja" "Queda el ${level}%. Conecta el cargador."
      sent=1
    fi
  else
    sent=0
  fi
  sleep 30
done
