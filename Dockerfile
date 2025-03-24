# https://fastapi.tiangolo.com/deployment/docker/
ARG SHAIRPORT_SYNC_VERSION=latest
FROM mikebrady/shairport-sync:${SHAIRPORT_SYNC_VERSION} AS builder

COPY scripts/run_shairport_sync.sh /configure_shairport_sync.sh

RUN chmod +x /run_shairport_sync.sh

CMD ["sh", "/run_shairport_sync.sh"]
