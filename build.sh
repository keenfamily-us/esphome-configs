#!/bin/bash

set -x
set -eo pipefail

trap "rm common/secrets.yaml" EXIT

op inject --in-file common/secrets.yaml.in --out-file common/secrets.yaml

command=$1
shift

if [ $# -eq 0 ]; then
    configs="*.yaml"
else
    configs="$@"
fi

esphome $command $configs
