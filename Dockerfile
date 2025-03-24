# https://fastapi.tiangolo.com/deployment/docker/
ARG SHAIRPORT_SYNC_VERSION=latest
FROM mikebrady/shairport-sync:${SHAIRPORT_SYNC_VERSION} AS builder


