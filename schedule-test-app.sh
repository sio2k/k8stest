#!/bin/bash

terraform output kube_config > ~/.kube/config
kubectl get nodes
kubectl get ns

helm upgrade  ingress-ext stable/nginx-ingress -n ing-ext1 --install --cleanup-on-fail --atomic

helm upgrade mongodb stable/mongodb -n test1 --install --cleanup-on-fail --atomic

helm upgrade mongo-express mongo-express/ -n test1 --install  --cleanup-on-fail --atomic --set adminPassword=$(kubectl get secret --namespace test1 mongodb -o jsonpath="{.data.mongodb-root-password}" | base64 --decode)

lb_ip=$(kubectl get svc ingress-ext-nginx-ingress-controller -n ing-ext -o jsonpath="{.status.loadBalancer.ingress[0].ip}")

echo "$lb_ip mongo-express.test1.0.49.0.com"
