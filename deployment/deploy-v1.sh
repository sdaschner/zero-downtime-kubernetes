#!/bin/bash
set -euo pipefail
cd ${0%/*}

kubectl apply -f ./fortio/

kubectl apply -f ./coffee-shop/deployment.yaml
kubectl apply -f ./coffee-shop/gateway.yaml
kubectl apply -f ./coffee-shop/routing.yaml
kubectl apply -f ./coffee-shop/service.yaml
