#!/bin/bash

FORTIO_POD=$(kubectl get pods | grep fortio | awk '{ print $1 }')
HOST=$(kubectl get services -n istio-system istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')

URL=http://$HOST/coffee-shop/resources/coffee
echo accessing $URL
echo

kubectl exec -it $FORTIO_POD  -c fortio /usr/local/bin/fortio -- curl $URL
