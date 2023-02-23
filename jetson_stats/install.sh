#!/usr/bin/env bash

set -e

if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit
fi

wget -q https://repos.influxdata.com/influxdata-archive_compat.key
echo '393e8779c89ac8d958f81f942f9ad7fb82a25e133faddaf92e15b16e6ac9ce4c influxdata-archive_compat.key' | sha256sum -c && cat influxdata-archive_compat.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/influxdata-archive_compat.gpg > /dev/null
echo 'deb [signed-by=/etc/apt/trusted.gpg.d/influxdata-archive_compat.gpg] https://repos.influxdata.com/debian stable main' | sudo tee /etc/apt/sources.list.d/influxdata.list

apt-get update && sudo apt-get install -y telegraf moreutils

rm -f influxdb.key

cp tegrastats.sh /usr/local/bin/
cp nvme_telemetry.sh /usr/local/bin/
cp systemd_service/tegrastats.service /etc/systemd/system
cp systemd_service/nvme_telemetry.service /etc/systemd/system
cp logrotate_config/tegrastats /etc/logrotate.d/
mkdir -p /etc/telegraf
cp telegraf_config/telegraf.conf /etc/telegraf/

systemctl daemon-reload

systemctl enable telegraf
systemctl enable tegrastats
systemctl enable nvme_telemetry
systemctl restart telegraf
systemctl restart tegrastats
systemctl restart nvme_telemetry

echo "Done. Test with \"sudo tail -f /var/log/tegrastats/tegrastats.log \" and \"logrotate -d /etc/logrotate.d/tegrastats\""
