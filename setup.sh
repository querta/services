#!/bin/bash

export MINIKUBE_HOME=/goinfre/$USER/  
minikube start --vm-driver=virtualbox  
eval $(minikube docker-env)
# docker pull metallb/speaker:v0.8.2
# docker pull metallb/controller:v0.8.2

minikube addons enable metallb
kubectl apply -f metalconfig.yaml 
docker build -t nginx_image ./nginx/
kubectl apply -f ./nginx/setup.yaml

docker build -t mysql_image ./mysql/
kubectl apply -f ./mysql/setup.yaml

docker build -t wordpress_image ./wordpress/
kubectl apply -f ./wordpress/setup.yaml