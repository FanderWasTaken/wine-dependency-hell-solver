#!/bin/bash

clear

if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

echo "Applying system tweaks"

echo 'vm.max_map_count=1048576' >>/etc/sysctl.conf
echo 'PULSE_LATENCY_MSEC=60' >>/etc/profile.d/pulselatency.sh
echo 'RADV_PERFTEST=gpl' >>/etc/profile.d/gpl.sh

echo "Done!"
