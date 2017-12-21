#!/bin/bash

while true
do
  # Determine number of failed cards, i.e. those with 00.00 H/s
  fc=`stats | egrep "^miner_hashes" | tr ' ' '\n' | grep -c "00.00"`
  # Append to log file
  date | tr '\n' ' ' >> autorebootp.log
  echo "$fc GPUs not hashing"  >> autorebootp.log

  # Reboot if failed cards >= 3 else do nothing
  if [ $fc -ge 3 ]; then
    echo "...initiating reboot." >> autorebootp.log
    r
  fi

  # Wait 3 minutes until next iteration
  sleep 180
done
