export DOCKER_CERT_PATH=/var/jenkins_home/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://192.168.59.103:2376

docker stop todo
docker rm todo
docker rmi -f todo
docker build -t iruffell/todo .
