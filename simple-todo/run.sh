export DOCKER_CERT_PATH=/var/jenkins_home/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://192.168.59.103:2376

build-docker.sh

docker run -it -d --name todo -p 3000:3000 -t iruffell/todo /bin/bash

docker attach todo
docker logs todo
