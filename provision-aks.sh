#!/bin/bash

rm -rf aks-terraform/test*
ssh-keygen -t rsa -b 4096 -C "Key pair for AKS" -f "aks-terraform/test" -q -N ''

terraform plan -var "client_id=<app_id>" -var "client_secret=<secret>" -out test-aks aks-terraform/
