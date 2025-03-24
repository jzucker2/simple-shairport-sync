#!/bin/sh
set -x -e

# Replace environment variables in the template and write to final conf file
envsubst < /etc/shairport-sync/shairport-sync.conf.template > /etc/shairport-sync.conf

cat /etc/shairport-sync.conf

./run.sh
