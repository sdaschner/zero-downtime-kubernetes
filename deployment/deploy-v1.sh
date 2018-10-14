#!/bin/bash
cd ${0%/*}
set -euo pipefail

kubectl apply -f coffee-shop/
kubectl apply -f fortio/
