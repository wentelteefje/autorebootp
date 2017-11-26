#!/bin/bash
echo "Adding autorebootp cron jobs..."
crontab -l -u ethos | cat - cronjobs | crontab -u ethos -