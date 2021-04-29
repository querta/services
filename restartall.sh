#!/bin/bash

eval $(minikube docker-env)
if [ -n "$1" ]
then
        kubectl delete svc $1-svc
        kubectl delete deploy $1-deploy
        docker build -t $1_image ./$1/
        kubectl apply -f ./$1/setup.yaml
else
        kubectl delete svc nginx-svc
        kubectl delete deploy nginx-deploy
        kubectl delete svc mysql-svc
        kubectl delete deploy mysql-deploy
        kubectl delete svc wordpress-svc
        kubectl delete deploy wordpress-deploy
        kubectl delete svc pma-svc
        kubectl delete deploy pma-deploy
        kubectl delete svc ftps-svc
        kubectl delete deploy ftps-deploy
        kubectl delete svc influxdb-svc
        kubectl delete deploy influxdb-deploy
        kubectl delete svc grafana-svc
        kubectl delete deploy grafana-deploy

        docker build -t nginx_image ./nginx/
        kubectl apply -f ./nginx/setup.yaml
        docker build -t mysql_image ./mysql/
        kubectl apply -f ./mysql/setup.yaml
        docker build -t wordpress-image ./wordpress/
        kubectl apply -f ./wordpress/setup.yaml
        docker build -t pma_image ./pma/
        kubectl apply -f ./pma/setup.yaml
        docker build -t ftps_image ./ftps/
        kubectl apply -f ./ftps/setup.yaml
        docker build -t influxdb_image ./influxdb/
        kubectl apply -f ./influxdb/setup.yaml
        docker build -t grafana_image ./grafana/
        kubectl apply -f ./grafana/setup.yaml
fi

# if [ $# -eq 0 ]
#     then
#         kubectl delete svc nginx-svc
#         kubectl delete deploy nginx-deploy
#         kubectl delete svc mysql-svc
#         kubectl delete deploy mysql-deploy
#         kubectl delete svc wordpress-svc
#         kubectl delete deploy wordpress-deploy
#         kubectl delete svc pma-svc
#         kubectl delete deploy pma-deploy

#         docker build -t nginx_image ./nginx/
#         kubectl apply -f ./nginx/setup.yaml
#         docker build -t mysql_image ./mysql/
#         kubectl apply -f ./mysql/setup.yaml
#         docker build -t wordpress-image ./wordpress/
#         kubectl apply -f ./wordpress/setup.yaml
#         docker build -t pma_image ./pma/
#         kubectl apply -f ./pma/setup.yaml

#         sleep 3
#         kubectl get deploy
#         kubectl get pods
# fi

# if [ $1 == mysql ]
#     then
#         kubectl delete svc mysql-svc
#         kubectl delete deploy mysql-deploy
#         docker build -t mysql_image ./mysql/
#         kubectl apply -f ./mysql/setup.yaml
# fi

# if [ $1 == mysql ]
#     then
#         kubectl delete svc mysql-svc
#         kubectl delete deploy mysql-deploy
#         docker build -t mysql_image ./mysql/
#         kubectl apply -f ./mysql/setup.yaml
# fi