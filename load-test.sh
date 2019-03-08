#!/bin/bash

FORTIO_POD=$(kubectl get pods | grep fortio | awk '{ print $1 }')
HOST=$(kubectl-istio-gateway-ip-address)
#PORT=$(kubectl-istio-gateway-http-nodeport)
#HOST='coffee-shop:8080'
#HOST="192.168.99.100:$PORT"
#HOST="35.204.171.231"

kubectl exec -it $FORTIO_POD  -c fortio /usr/local/bin/fortio -- load -a -c 50 -qps 500 -t 40s -loglevel Warning http://$HOST/coffee-shop/resources/coffee
