# Spring Music Chart

## Create the 'spring-music' chart template
```
helm create spring-music
rm -rf spring-music/templates/*
rm -rf spring-music/values.yaml
```

## Create project's specific content
```
spring-music/values.yaml
spring-music/templates/_helper.tpl
spring-music/templates/deployment.yaml
spring-music/templates/svc.yaml
```


## Installing the project's chart
```
helm install spring-music ./spring-music --set cluster=local
kubectl port-forward service/spring-music 8080:80 &
```

## Upgrading the project's chart
```
helm upgrade spring-music ./spring-music --set cluster=local
```

## Uninstalling the project's chart
```
helm uninstall spring-music
```

## Accessing the application
Browse http://127.0.0.1.nip.io:8080/


### Enjoy
