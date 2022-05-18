# CI Pipelines with Jenkins

## Excercise #1
Run commands on slide #62 of file [here](https://docs.google.com/presentation/d/1IteHsyHaXBItZaUJ5OIEM74Iyaxhpw0W9__AY6fSOg4/edit#slide=id.g50771a00b0_0_1439) (NOTE: Jenkins installation is on `advanced` branch)
```
sudo yum install git -y
git clone --branch advanced  https://github.com/yanivomc/docker-cicd.git
cd docker-cicd
```
Update the `docker-compose-jenkins.yml` file and comment out line 15
```
# container_name: jenkins-slave
```
Scale to 3 Jenkins nodes using:
```
docker-compose -f docker-compose-jenkins.yml up -d --scale jenkins-slave=3
```
Browse to http://IP:8080/ using admin:admin

---

Examples are located under `master` branch.
```
cd docker-cicd
git checkout master
```

## References
* [Multi-Stage-Dockerfile](https://www.jenkins.io/doc/book/pipeline/docker/)
