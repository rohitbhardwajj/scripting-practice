#!/bin/bash

servers=(
  "ubuntu@54.160.233.25"
)

for server in "${servers[@]}"
do
  echo "==============================="
  echo "Connecting to: $server"
  echo "==============================="

  ssh -o ConnectTimeout=5 "$server" "
    uptime
    df -h
  "

  echo
done

