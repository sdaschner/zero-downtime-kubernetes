#!/bin/bash
cd ${0%/*}

if [[ "$1" == "" ]]; then
  echo "Usage: ${0##*/} <resource-set>"; exit 2
fi

set -euo pipefail
rs=$1

kontemplate template --var subsets=v1,v2 --var image=3 --var newVersion=v3 -i $rs .kontemplate.yaml
