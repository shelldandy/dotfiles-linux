#!/usr/bin/env bash

killall -q polybar

echo "---" | tee -a /tmp/polybar.log
polybar tonton 2>&1 | tee -a /tmp/polybar.log & disown
echo "Bars launched..."
