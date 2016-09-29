#!/bin/bash
set -e

if [ "$1" != '--' ]; then
  CMD="/usr/sbin/keepalived --dont-fork --log-console $@"
  echo running $CMD
  exec $CMD
else
  shift
  exec $@
fi
