#!/usr/bin/env bash

set -e

unique_directories=$(echo "$@" | tr ' ' '\n' | awk -F '/' '!a[$1]++' | tr '\n' ' ')

echo "$unique_directories"
