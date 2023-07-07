#!/bin/bash

clear

if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

echo "Applying system tweaks"

sudo echo 'vm.max_map_count=1048576' >>/etc/sysctl.conf
sudo echo 'PULSE_LATENCY_MSEC=60' >>/etc/profile.d/pulselatency.sh
sudo echo 'RADV_PERFTEST=gpl' >>/etc/profile.d/gpl.sh

echo "Done!"
