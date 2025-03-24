# https://fastapi.tiangolo.com/deployment/docker/
ARG SHAIRPORT_SYNC_VERSION=4.3.7
FROM mikebrady/shairport-sync:${SHAIRPORT_SYNC_VERSION} AS builder

# Set environment variables (if needed)
ENV AIRPLAY_NAME="Simple Shairport Sync"
ENV OUTPUT_DEVICE="hw:Audio"
ENV HOSTNAME="localhost"
ENV USERNAME="user"
ENV PASSWORD="pass"
ENV TOPIC="shairport/sync"


COPY shairport_sync/shairport-sync.conf /etc/shairport-sync.conf

RUN chmod +r /etc/shairport-sync.conf

COPY scripts/run_shairport_sync.sh /usr/local/bin/run_shairport_sync.sh

RUN chmod +x /usr/local/bin/run_shairport_sync.sh

# Start Shairport Sync with the customized configuration
ENTRYPOINT ["/init","/usr/local/bin/run_shairport_sync.sh"]
