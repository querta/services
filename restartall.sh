#!/bin/bash

kubectl delete svc nginx-svc
kubectl delete deploy nginx-deploy
kubectl delete svc mysql-svc
kubectl delete deploy mysql-deploy
kubectl delete svc wordpress-svc
kubectl delete deploy wordpress-deploy

if [ $# -eq 0 ]
    then
        docker build -t nginx_image ./nginx/
        kubectl apply -f ./nginx/setup.yaml
        docker build -t mysql_image ./mysql/
        kubectl apply -f ./mysql/setup.yaml
        docker build -t wordpress-image ./wordpress/
        kubectl apply -f ./wordpress/setup.yaml

        sleep 3
        kubectl get deploy
        kubectl get pods
fi
