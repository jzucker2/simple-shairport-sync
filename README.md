# simple-shairport-sync

Simple set up, with plans to start using.

Would be cool to add some instructions (someday)

The `shairport-sync.conf` file is located here: https://github.com/mikebrady/shairport-sync/blob/master/scripts/shairport-sync.conf

This _might_ work ... (so far)

Example for running this on your own:

```yaml
services:
  shairport-sync:
    container_name: shairport-sync
    image: ghcr.io/jzucker2/simple-shairport-sync:latest
    restart: unless-stopped
    network_mode: host
    privileged: true
    extra_hosts:
      - "host.docker.internal:host-gateway"
    environment:
      - AIRPLAY_NAME="MyAirplaySpeaker"
      - ENABLE_MQTT=yes
      - MQTT_HOSTNAME=10.0.1.21
    devices:
      - "/dev/snd" # ALSA device, omit if using PulseAudio
    cap_add:
      - SYS_NICE # Found in the docs
    logging:
      options:
        max-size: "200k"
        max-file: "10"
```

## Issues

* https://github.com/mikebrady/shairport-sync/issues/1858
