#!/bin/bash

kubectl delete deploy nginx-deployment
docker build -t nginx_image ./nginx/
kubectl apply -f ./nginx/nginx.yaml
# minikube addons enable metallb
sleep 3
kubectl get deploy
kubectl get pods
