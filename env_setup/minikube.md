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
export NO_PROXY=localhost,127.0.0.1,10.96.0.0/12,192.168.59.0/24,192.168.39.0/24,10.0.0.0/8
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
# netsh interface portproxy add v4tov4 listenport=443 listenaddress=0.0.0.0 connectport=443 connectaddress=127.0.0.1
netsh interface portproxy add v4tov4 listenport=443 listenaddress=10.135.214.109 connectport=443 connectaddress=127.0.0.1
netsh interface ip show config
netsh interface portproxy show all
```

## Add GitHub Repo to Argo CD
```
argocd repo add git@eos2git.cec.lab.emc.com:davalr/k8s-devops.git --ssh-private-key-path ~/.ssh/git_rsa
```
