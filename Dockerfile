# https://fastapi.tiangolo.com/deployment/docker/
ARG SHAIRPORT_SYNC_VERSION=latest
FROM mikebrady/shairport-sync:${SHAIRPORT_SYNC_VERSION} AS builder

COPY shairport_setup.sh /shairport_setup.sh

RUN chmod +x /shairport_setup.sh

# CMD ["/shairport_setup.sh"]

RUN /shairport_setup.sh
