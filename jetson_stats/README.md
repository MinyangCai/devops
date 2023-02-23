# Jetson Telemetry Logging

Local telemetry logs -> Telegraf -> InfluxDB -> Grafana

## Dependency
```bash
sudo apt install moreutils

```

## Setup

```bash
# Install telegraf
# influxdb.key GPG Fingerprint: 05CE15085FC09D18E99EFB22684A14CF2582E0C5
wget -q https://repos.influxdata.com/influxdb.key
echo '23a1c8836f0afc5ed24e0486339d7cc8f6790b83886c4c96995b88a061c5bb5d influxdb.key' | sha256sum -c && cat influxdb.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/influxdb.gpg > /dev/null
echo 'deb [signed-by=/etc/apt/trusted.gpg.d/influxdb.gpg] https://repos.influxdata.com/debian stable main' | sudo tee /etc/apt/sources.list.d/influxdata.list
sudo apt-get update && sudo apt-get install telegraf

# Copy over config files
sudo cp <PROJECT>/jetson_stats/logrotate_config/tegrastats /etc/logrotate.d/
sudo cp <PROJECT>/jetson_stats/systemd_service/tegrastats.service /etc/systemd/system
sudo cp <PROJECT>/jetson_stats/telegraf_config/telegraf.conf /etc/telegraf/

# General systemd commands
sudo systemctl daemon-reload
sudo systemctl start <service>
sudo systemctl restart <service>
sudo systemctl stop <service>

# Start tegrastats and telegraf
sudo systemctl start telegraf
sudo systemctl start tegrastats

# Configure service to start systemd service on boot
sudo systemctl enable <service>

# Test logrotate config
logrotate -d /etc/logrotate.d/tegrastats

# To monitor local telemetry logs
sudo tail -f /var/log/tegrastats/tegrastats.log
```

