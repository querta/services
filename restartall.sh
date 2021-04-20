#!/bin/bash

kubectl delete svc nginx-svc
kubectl delete deploy nginx-deploy
kubectl delete svc mysql-svc
kubectl delete deploy mysql-deploy

docker build -t nginx_image ./nginx/
kubectl apply -f ./nginx/setup.yaml
docker build -t mysql_image ./mysql/
kubectl apply -f ./mysql/setup.yaml
sleep 3
kubectl get deploy
kubectl get pods
