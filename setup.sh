#!/bin/bash

export MINIKUBE_HOME=/goinfre/$USER/  
minikube start --vm-driver=virtualbox  
eval $(minikube docker-env)
docker pull metallb/speaker:v0.8.2
docker pull metallb/controller:v0.8.2

minikube addons enable metallb
kubectl apply -f metalconfig.yaml 
docker build -t nginx_image ./nginx/ && kubectl apply -f ./nginx/setup.yaml
docker build -t mysql_image ./mysql/ && kubectl apply -f ./mysql/setup.yaml
docker build -t wordpress_image ./wordpress/ && kubectl apply -f ./wordpress/setup.yaml
docker build -t pma_image ./pma/ && kubectl apply -f ./pma/setup.yaml
docker build -t ftps_image ./ftps/ && kubectl apply -f ./ftps/setup.yaml
# docker build -t influxdb_image ./influxdb/ && kubectl apply -f ./influxdb/setup.yaml
# docker build -t grafana_xxx ./grafana ; kubectl apply -f ./grafana/grafana.yaml
# docker build -t grafana_image ./grafana/ && kubectl apply -f ./grafana/setup.yaml

# docker rmi mysql_image && docker rmi pma_image && docker rmi nginx_image && docker rmi ftpsimage 