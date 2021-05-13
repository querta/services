#!/bin/bash

export MINIKUBE_HOME=/goinfre/$USER/  
minikube start --vm-driver=virtualbox
eval $(minikube docker-env)
# docker pull metallb/speaker:v0.8.2; docker pull metallb/controller:v0.8.2

minikube addons enable metallb && kubectl apply -f ./srcs/metalconfig.yaml 
minikube addons enable dashboard

# http://192.168.99.100/phpmyadmin
# http://192.168.99.100/wordpress
# docker build -t influxdb_image ./srcs/influxdb ; kubectl apply -f ./srcs/influxdb/setup.yaml
docker build -t ftps_image ./srcs/ftps ; kubectl apply -f ./srcs/ftps/setup.yaml
docker build -t mysql_image ./srcs/mysql ; kubectl apply -f ./srcs/mysql/setup.yaml
docker build -t pma_image ./srcs/pma ; kubectl apply -f ./srcs/pma/setup.yaml
docker build -t wordpress_image ./srcs/wordpress ; kubectl apply -f ./srcs/wordpress/setup.yaml
docker build -t nginx_image ./srcs/nginx ; kubectl apply -f ./srcs/nginx/setup.yaml
# docker build -t nginx_xxx ../ft_services_spitt/srcs/nginx ; kubectl apply -f ../ft_services_spitt/srcs/nginx/nginx.yaml
# docker build -t grafana_image ./srcs/grafana ; kubectl apply -f ./srcs/grafana/setup.yaml

# docker build -t influxdb_image ./influxdb_1; kubectl apply -f ./influxdb_1/influxdb.yaml
# # docker build -t influxdb_image ./influxdb/ && kubectl apply -f ./influxdb/setup.yaml

# docker build -t nginx_image ./nginx/ && kubectl apply -f ./nginx/setup.yaml
# docker build -t mysql_image ./mysql/ && kubectl apply -f ./mysql/setup.yaml
# docker build -t wordpress_image ./wordpress/ && kubectl apply -f ./wordpress/setup.yaml
# docker build -t pma_image ./pma/ && kubectl apply -f ./pma/setup.yaml
# docker build -t ftps_image ./ftps/ && kubectl apply -f ./ftps/setup.yaml

# docker build -t grafana_image ./grafana_1; kubectl apply -f ./grafana_1/grafana.yaml
# Надо проверить, по ходу, графана не работает если запускать supervisord из докерфайла вместо sh скрипта

# docker build -t grafana_image ./grafana/ && kubectl apply -f ./grafana/setup.yaml
# docker build -t influxdb_image ./influxdb/ && kubectl apply -f ./influxdb/setup.yaml
# docker build -t grafana_xxx ./grafana ; kubectl apply -f ./grafana/grafana.yaml

# docker rmi mysql_image && docker rmi pma_image && docker rmi nginx_image && docker rmi ftpsimage 