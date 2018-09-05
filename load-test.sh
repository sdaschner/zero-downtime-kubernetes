#!/bin/bash

FORTIO_POD=$(kubectl get pod | grep fortio | awk '{ print $1 }')
#HOST=$(kubectl-istio-gateway-ip-address)
PORT=$(kubectl-istio-gateway-http-nodeport)
HOST='zero-downtime:8080'
HOST="192.168.99.100:$PORT"

kubectl exec -it $FORTIO_POD  -c fortio /usr/local/bin/fortio -- load -a -c 8 -qps 500 -t 59s -loglevel Warning http://$HOST/zero-downtime/resources/hello
#kubectl exec -it $FORTIO_POD  -c fortio /usr/local/bin/fortio -- load -a -c 2 -qps 0 -n 100 -loglevel Warning http://$HOST/zero-downtime/resources/hello
