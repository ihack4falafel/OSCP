#!/bin/bash
#---------------------------------------------------------------------------------#
# Name       = Cron Job Checker                                                   #
# Author     = @ihack4falafel                                                     #
# Date       = 12/16/2017                                                         #
# Reference  = https://www.youtube.com/watch?v=K9DKULxSBK4                        #
# Usage      = chmod +x CronJobChecker.sh && ./CronJobChecker.sh                  #
#---------------------------------------------------------------------------------#

IFS=$'\n'

# Check list of running processes
old_process=$(ps -eo command)

# Look for newly created processes
while true; do
  new_process=$(ps -eo command)
  diff <(echo "$old_process") <(echo "$new_process") | grep [\<\>]
  sleep 1
  old_process=$new_process
done

