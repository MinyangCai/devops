#!/bin/sh

DEFAULT_LOG_DIF=/var/log/tegrastats/
LOG_FILE=tegrastats.log

mkdir -p $DEFAULT_LOG_DIF

tegrastats --interval 1000 | stdbuf -o0 sed -e 's/off/0%@0/g' >> $DEFAULT_LOG_DIF/$LOG_FILE
