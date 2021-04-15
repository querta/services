#!/bin/bash

export MINIKUBE_HOME=/goinfre/$USER/  
minikube start --vm-driver=virtualbox  
eval $(minikube docker-env)

minikube addons enable metallb
kubectl apply -f metalconfig.yaml 
docker build -t nginx_image ./nginx/
kubectl apply -f ./nginx/nginx.yaml