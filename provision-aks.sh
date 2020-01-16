#!/bin/bash

rm -rf aks-terraform/test*
ssh-keygen -t rsa -b 4096 -C "Key pair for AKS" -f "aks-terraform/test" -q -N ''

terraform plan -var "client_id=a7e1682e-ebc7-4145-b435-9c482279dd12" -var "client_secret=e7d5bc73-e368-46f6-8b15-f0a08c505572" -out test-aks aks-terraform/