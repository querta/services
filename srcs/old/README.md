# How to do all

brew install minikube  
export MINIKUBE_HOME=/goinfre/$USER/  
echo "export MINIKUBE_HOME=/goinfre/$USER/" >> ~/.zshrc  
minikube start --vm-driver=virtualbox  
eval $(minikube docker-env)  
  
docker build -t nginx_image ./nginx/
kubectl apply -f nginx.yaml  
  
kubectl get pods  
kubectl delete pods  

Если ошибка с адаптерами в virtualbox,  
1. Чекаем их <VBoxManage list -l hostonlyifs>
2. Удаляем ненужные <VBoxManage hostonlyif remove vboxnet1>

Вывести логи
kubectl logs nginx
kubectl describe pods nginx

kubectl exec deploy/nginx-deploy -- pkill sshd