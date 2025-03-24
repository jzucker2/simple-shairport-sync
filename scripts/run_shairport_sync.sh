#!/bin/sh
set -x -e

# Variables (can be set via environment variables or directly here)
export OUTPUT_DEVICE=${OUTPUT_DEVICE:-"hw:Audio"}
export HOSTNAME=${HOSTNAME:-"localhost"}
export PORT=${PORT:-"1883"}
export USERNAME=${USERNAME:-"user"}
export PASSWORD=${PASSWORD:-"pass"}
export TOPIC=${TOPIC:-"shairport/sync"}

# Configuration file path
CONFIG_FILE="/etc/shairport-sync.conf"

# Replace placeholders in the configuration file
sed -i "s|\"output_device\": \".*\"|\"output_device\": \"$OUTPUT_DEVICE\"|g" "$CONFIG_FILE"
sed -i "s|\"hostname\": \".*\"|\"hostname\": \"$HOSTNAME\"|g" "$CONFIG_FILE"
sed -i "s|\"port\": .*|\"port\": $PORT|g" "$CONFIG_FILE"
sed -i "s|\"username\": \".*\"|\"username\": \"$USERNAME\"|g" "$CONFIG_FILE"
sed -i "s|\"password\": \".*\"|\"password\": \"$PASSWORD\"|g" "$CONFIG_FILE"
sed -i "s|\"topic\": \".*\"|\"topic\": \"$TOPIC\"|g" "$CONFIG_FILE"

cat $CONFIG_FILE

./run.sh
