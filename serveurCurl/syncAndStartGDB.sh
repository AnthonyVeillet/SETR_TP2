#!/bin/bash
set -e

bn=$(basename $1)

# Ensure the folder exists
ssh pi@$2 "mkdir -p /home/pi/projects/laboratoire2/"

# Sync executable
rsync -az $1/build/setr_tp2_serveurcurl pi@$2:/home/pi/projects/laboratoire2/setr_tp2_serveurcurl

# Execute GDB
ssh pi@$2 "rm -f /home/pi/capture-stdout-curl; rm -f /home/pi/capture-stderr-curl; nohup gdbserver :4567 /home/pi/projects/laboratoire2/setr_tp2_serveurcurl > /home/pi/capture-stdout-curl 2> /home/pi/capture-stderr-curl < /dev/null &"
sleep 1
