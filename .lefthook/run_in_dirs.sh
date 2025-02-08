#!/usr/bin/env bash

set -e

if [ "$#" -le 2 ]; then
	echo "Usage: $0 <command> <directories>"
	exit 1
fi

CMD=$1
shift $(expr $OPTIND)

DIRS=$@
for dir in $DIRS; do
	echo "Running $CMD in $dir..."
	bash -c "cd $(dirname $dir); $CMD"
done
