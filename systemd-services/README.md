# Service Files

Any of our custom systemd services live here.

## Aeron setup
Before running the general commands below, create a copy of the service file, and make sure to change the specified `User` field to *the user who will be running any services that need to communicate over Aeron*. The media driver must be the same user as the services.

## General Commands

```bash
sudo cp <service_file> /etc/systemd/system

# Run this if there are changes in the service file
sudo systemctl daemon-reload

sudo systemctl start <service>
sudo systemctl restart <service>
sudo systemctl stop <service>
# To start on boot
sudo systemctl enable <service>
```

