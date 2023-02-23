#!/bin/sh

DEFAULT_LOG_DIF=/var/log/tegrastats/
LOG_FILE=nvme_telemetry.log

mkdir -p $DEFAULT_LOG_DIF

while true; do
	echo $(nvme smart-log /dev/nvme0 | sed '3q;d' | awk -v N=3 '{print $N}' | ts '%Y-%m-%d %H:%M:%.S') >> $DEFAULT_LOG_DIF/$LOG_FILE
	sleep 1
done
