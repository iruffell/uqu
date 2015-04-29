export DOCKER_CERT_PATH=/Users/ruffelli/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://192.168.59.103:2376

docker stop jenkins
docker rm jenkins
docker rmi -f jenkins
docker build -t iruffell/jenkins .

docker run -it -d --name=jenkins -p 8080:8080 -v /Users/ruffelli/jenkins-data:/var/jenkins_home -t iruffell/jenkins

docker logs jenkins
