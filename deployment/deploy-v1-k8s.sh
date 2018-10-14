#!/bin/bash
cd ${0%/*}
set -euo pipefail

./render-template.sh deployment > deployment.yaml
kubectl apply -f deployment.yaml

kubectl apply -f coffee-shop/service.yaml
kubectl apply -f coffee-shop/ingress.yaml

kubectl apply -f fortio/deployment.yaml
