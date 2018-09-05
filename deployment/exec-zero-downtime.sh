#!/bin/bash
cd ${0%/*}

if [[ "$1" == "" || "$2" == "" || "$3" == "" ]]; then
  echo "Usage: ${0##*/} <old-version> <new-version> <new-image>"; exit 2
fi
oldVersion=$1
newVersion=$2
newImage=$3

set -euo pipefail

function render-deployment() {
  # renders subset $1 and image $2 to deployment YAML file $3
  kontemplate template --var newVersion=$1 --var image=$2 -i deployment .kontemplate.yaml 1> $3 2> /dev/null
}

function render-routing() {
  # renders virtual service routing to $1, and defines subsets $2 to routing YAML file $3
  kontemplate template --var newVersion=$1 --var subsets=$2 -i routing .kontemplate.yaml 1> $3 2> /dev/null
}

function rollout() {
  kubectl apply -f $1
}

function rollout-deployment() {
  name=$(kubectl apply -f $1 -o name)
  kubectl rollout status $name
}

function remove() {
  kubectl delete -f $1
}


render-deployment $newVersion $newImage deployment-new.yaml
rollout-deployment deployment-new.yaml

render-routing $oldVersion ${newVersion},${oldVersion} routing.yaml
rollout routing.yaml

echo waiting for 2 seconds, Envoy proxies are reconfiguring
sleep 2

render-routing $newVersion ${newVersion},${oldVersion} routing.yaml
rollout routing.yaml

echo waiting for 2 seconds, Envoy proxies are reconfiguring
sleep 2

render-routing $newVersion $newVersion routing.yaml
rollout routing.yaml

echo waiting for 5 seconds
sleep 5

render-deployment $oldVersion 'ignored' deployment-old.yaml
remove deployment-old.yaml
