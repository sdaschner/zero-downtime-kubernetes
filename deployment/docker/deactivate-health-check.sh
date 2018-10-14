#!/bin/bash
set -e
curl -f localhost:8080/coffee-shop/resources/health -XDELETE -i
