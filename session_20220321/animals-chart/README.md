# Spring Music Chart

## Create the 'animals-chart' chart template
```
helm create animals-chart
rm -rf animals-chart/templates/*
rm -rf animals-chart/values.yaml
```

## Create project's specific content
```
animals-chart/values.yaml
animals-chart/templates/_helper.tpl
animals-chart/templates/deployment.yaml
animals-chart/templates/svc.yaml
```


## Installing the project's chart
```
helm install animals-chart ./animals-chart --set cluster=local
kubectl port-forward service/animals-chart 8080:80 &
```

## Upgrading the project's chart
```
helm upgrade animals-chart ./animals-chart --set cluster=local
```

## Uninstalling the project's chart
```
helm uninstall animals-chart
```

## Accessing the application
Browse http://127.0.0.1.nip.io:8080/


### Enjoy
