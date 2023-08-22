#!/bin/bash

set -x
set -eo pipefail

trap "rm common/device_base.yaml" EXIT

op inject --in-file common/device_base.yaml.in --out-file common/device_base.yaml

command=$1
shift

if [ $# -eq 0 ]; then
    configs="*.yaml"
else
    configs="$@"
fi

esphome $command $configs
