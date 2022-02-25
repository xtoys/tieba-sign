#!/bin/bash

set -e

[[ ! -d /scripts/logs ]] && mkdir -p /scripts/logs
[[ $(cat /scripts/tasklist) != $(crontab -l) ]] && crontab /scripts/tasklist
echo "tieba-sign: service started, have fun"

exec crond -f "$@"