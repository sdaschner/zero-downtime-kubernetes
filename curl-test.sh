#!/bin/bash

FORTIO_POD=$(kubectl get pod | grep fortio | awk '{ print $1 }')
#HOST=$(kubectl-istio-gateway-ip-address)
PORT=$(kubectl-istio-gateway-http-nodeport)
HOST='zero-downtime:8080'
HOST="192.168.99.100:$PORT"

URL=http://$HOST/zero-downtime/resources/hello
echo accessing $URL
echo

kubectl exec -it $FORTIO_POD  -c fortio /usr/local/bin/fortio -- curl $URL
