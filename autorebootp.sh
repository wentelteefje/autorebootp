#!/bin/bash
# Determine number of failed cards, i.e. those with 00.00 H/s
fc=`stats | egrep "^miner_hashes" | tr ' ' '\n' | grep -c "00.00"`
# Append to log file
date | tr '\n' ' ' >> ar.log
echo $fc  >> ar.log

# Reset thermals and reboot if failed cards >= 3 else do nothing
if [ $fc -ge 3 ]; then
  clear-thermals
  r
fi