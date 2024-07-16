#!/usr/bin/env bash

host="$1"

echo "Creating 'ignored/host' file"
mkdir -p "~/dotfiles/ignored"
echo "$host" > "../ignored/host"
