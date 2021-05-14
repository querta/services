#!/bin/bash

export MINIKUBE_HOME=/goinfre/$USER/  
minikube start --vm-driver=virtualbox --cpus 2 --memory 3000
eval $(minikube docker-env)
docker pull metallb/speaker:v0.8.2; docker pull metallb/controller:v0.8.2

minikube addons enable metallb && kubectl apply -f ./srcs/metalconfig.yaml 
minikube addons enable dashboard

docker build -t influxdb_image ./srcs/influxdb ; kubectl apply -f ./srcs/influxdb/setup.yaml
docker build -t ftps_image ./srcs/ftps ; kubectl apply -f ./srcs/ftps/setup.yaml
docker build -t nginx_image ./srcs/nginx ; kubectl apply -f ./srcs/nginx/setup.yaml
docker build -t mysql_image ./srcs/mysql ; kubectl apply -f ./srcs/mysql/setup.yaml
docker build -t pma_image ./srcs/pma ; kubectl apply -f ./srcs/pma/setup.yaml
docker build -t wordpress_image ./srcs/wordpress ; kubectl apply -f ./srcs/wordpress/setup.yaml
docker build -t grafana_image ./srcs/grafana ; kubectl apply -f ./srcs/grafana/setup.yaml



# kubectl exec deploy/nginx-deploy -- pkill nginx