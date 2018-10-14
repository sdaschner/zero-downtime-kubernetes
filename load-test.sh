#!/bin/bash

FORTIO_POD=$(kubectl get pods | grep fortio | awk '{ print $1 }')
HOST=$(kubectl get ingress coffee-shop -o jsonpath='{.status.loadBalancer.ingress[0].ip}')

kubectl exec -it $FORTIO_POD  -c fortio /usr/local/bin/fortio -- load -a -c 50 -qps 500 -t 40s -loglevel Warning http://$HOST/coffee-shop/resources/coffee
