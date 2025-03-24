# https://fastapi.tiangolo.com/deployment/docker/
ARG SHAIRPORT_SYNC_VERSION=latest
FROM mikebrady/shairport-sync:${SHAIRPORT_SYNC_VERSION} AS builder

COPY scripts/configure_shairport_sync.sh /configure_shairport_sync.sh

RUN chmod +x /configure_shairport_sync.sh

# CMD ["/configure_shairport_sync.sh"]

RUN sh /configure_shairport_sync.sh
