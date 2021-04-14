# How to do all

brew install minikube
export MINIKUBE_HOME=/goinfre/$USER/
echo "export MINIKUBE_HOME=/goinfre/$USER/" >> ~/.zshrc
minikube start --vm-driver=virtualbox
eval $(minikube docker-env)

docker build -t nginx_image
kubectl apply -f nginx.yaml

kubectl get pods
kubectl delete pods