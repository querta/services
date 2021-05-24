#!/bin/bash

eval $(minikube docker-env)
if [ -n "$1" ]
then
        kubectl delete svc $1
        kubectl delete deploy $1-deploy
        docker build -t $1_image ./srcs/$1/
        kubectl apply -f ./srcs/$1/setup.yaml
else
        kubectl delete svc nginx
        kubectl delete deploy nginx-deploy
        kubectl delete svc mysql
        kubectl delete deploy mysql-deploy
        kubectl delete svc wordpress
        kubectl delete deploy wordpress-deploy
        kubectl delete svc pma
        kubectl delete deploy pma-deploy
        kubectl delete svc ftps
        kubectl delete deploy ftps-deploy
        kubectl delete svc influxdb
        kubectl delete deploy influxdb-deploy
        kubectl delete svc grafana
        kubectl delete deploy grafana-deploy

        docker build -t nginx_image ./srcs/nginx/
        kubectl apply -f ./srcs/nginx/setup.yaml
        docker build -t mysql_image ./srcs/mysql/
        kubectl apply -f ./srcs/mysql/setup.yaml
        docker build -t wordpress-image ./srcs/wordpress/
        kubectl apply -f ./srcs/wordpress/setup.yaml
        docker build -t pma_image ./srcs/pma/
        kubectl apply -f ./srcs/pma/setup.yaml
        docker build -t ftps_image ./srcs/ftps/
        kubectl apply -f ./srcs/ftps/setup.yaml
        docker build -t influxdb_image ./srcs/influxdb/
        kubectl apply -f ./srcs/influxdb/setup.yaml
        docker build -t grafana_image ./srcs/grafana/
        kubectl apply -f ./srcs/grafana/setup.yaml
fi
