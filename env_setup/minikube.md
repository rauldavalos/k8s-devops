# K8s running on minikube

## Download minikube
```
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
```

## set driver
```
minikube config set driver docker
```

## set NO_PROXY to allow minikube cluster to resolve and download from external registries
```
export NO_PROXY=localhost,127.0.0.1,10.96.0.0/12,192.168.59.0/24,192.168.39.0/24
```

## start minikube cluster
```
minikube start -p davalos --memory=3g --nodes=3  ## first time
minikube start -p davalos  ## subsequent times
```

## add master nodes
```
minikube -p davalos node add --control-plane=true
```

## add worker nodes
```
minikube -p davalos node add --worker=true
```

## enable tunnel into load-balanced services
```
minikube -p davalos tunnel
```

## stop minikube cluster
```
minikube stop -p davalos
```

## delete kubectl minikube cluster
```
minikube delete -p davalos
```

## Windows forwarding of WSL port
```
netsh interface portproxy add v4tov4 listenport=3000 listenaddress=0.0.0.0 connectport=3000 connectaddress=172.18.28.x
```
