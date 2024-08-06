#!/usr/bin/env bash

host="$1"
host_file="$2"

if [ -z "$host" ]; then
  echo "Creating 'ignored/host' file"
  echo "$host" > $host_file
fi
