# https://fastapi.tiangolo.com/deployment/docker/
ARG SHAIRPORT_SYNC_VERSION=4.3.7
FROM mikebrady/shairport-sync:${SHAIRPORT_SYNC_VERSION} AS builder

RUN apk -U add \
        gettext

# Set environment variables (if needed)
ENV S6_KEEP_ENV=1
ENV AIRPLAY_NAME="SimpleShairportSync"
ENV OUTPUT_DEVICE="hw:0"
ENV MIXER_CONTROL_NAME="PCM"
ENV MIXER_CONTROL_INDEX=0
ENV ENABLE_MQTT="no"
ENV MQTT_HOSTNAME="localhost"
ENV MQTT_PORT=1883
ENV MQTT_USERNAME="user"
ENV MQTT_PASSWORD="pass"
ENV MQTT_TOPIC="shairport/sync"
ENV MQTT_AUTODISCOVERY="homeassistant"
ENV LOG_VERBOSITY=0


# Copy the config template
COPY shairport_sync/shairport-sync.conf /etc/shairport-sync/shairport-sync.conf.template

RUN chmod +rw /etc/shairport-sync.conf

COPY scripts/run_shairport_sync.sh /usr/local/bin/run_shairport_sync.sh

RUN chmod +x /usr/local/bin/run_shairport_sync.sh


# Start Shairport Sync with the customized configuration
ENTRYPOINT ["/init","/usr/local/bin/run_shairport_sync.sh"]
