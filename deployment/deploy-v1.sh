#!/bin/bash
cd ${0%/*}
set -euo pipefail

#./render-template.sh deployment > deployment.yaml
kontemplate template -i deployment .kontemplate.yaml > deployment.yaml
kubectl apply -f deployment.yaml

#./render-template.sh routing > routing.yaml
kontemplate template -i routing .kontemplate.yaml > routing.yaml
kubectl apply -f routing.yaml

kubectl apply -f coffee-shop/gateway.yaml
kubectl apply -f coffee-shop/service.yaml
kubectl apply -f coffee-shop/service-entry.yaml

kubectl apply -f fortio/deployment.yaml

echo "if required, please update gateway IP address in service-entry.yaml"
