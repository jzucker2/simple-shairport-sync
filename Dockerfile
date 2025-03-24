# https://fastapi.tiangolo.com/deployment/docker/
ARG SHAIRPORT_SYNC_VERSION=3.13-alpine
FROM mikebrady/shairport-sync:${SHAIRPORT_SYNC_VERSION} AS builder


