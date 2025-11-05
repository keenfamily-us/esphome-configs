#!/bin/bash

set -x
set -eo pipefail

command=$1
shift

if [ $# -eq 0 ]; then
    configs="*.yaml"
else
    configs="$@"
fi

op run --env-file=.env -- esphome $command $configs
