# https://fastapi.tiangolo.com/deployment/docker/
ARG SHAIRPORT_SYNC_VERSION=latest
FROM mikebrady/shairport-sync:${SHAIRPORT_SYNC_VERSION} AS builder

COPY scripts/run_shairport_sync.sh /usr/local/bin/run_shairport_sync.sh

RUN chmod +x /usr/local/bin/run_shairport_sync.sh


ENTRYPOINT ["/usr/local/bin/run_shairport_sync.sh"]
