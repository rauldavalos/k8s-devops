# CI Pipelines with Jenkins

Run commands on slide #62 of file [here](https://docs.google.com/presentation/d/1IteHsyHaXBItZaUJ5OIEM74Iyaxhpw0W9__AY6fSOg4/edit#slide=id.g50771a00b0_0_1439)

Update the `docker-compose-jenkins.yml` file and comment out line 15
```
# container_name: jenkins-slave
```
Scale to 3 Jenkins nodes using:
```
docker-compose -f docker-compose-jenkins.yml up -d --scale jenkins-slave=3
```
Browse to http://IP:8080/ using admin:admin
