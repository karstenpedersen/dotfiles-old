#!/usr/bin/env bash

host="$1"
host_file="$2"

if [ ! -z "$WSL_DISTRO_NAME" ] && [[ "$WSL_DISTRO_NAME" != "nixos" ]]; then
  echo "WSL_DISTRO_NAME is defined, but is not nixos"
  exit 1
fi

if [ -z "$host" ]; then
  echo "Creating 'host' file"
  echo "$host" > $host_file
else
  host=$(head -n 1 $host_file)
  echo "Found current file $host"
fi

sudo nixos-rebuild switch --flake .#$host
