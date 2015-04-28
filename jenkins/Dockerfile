FROM       centos:7
MAINTAINER Ian Ruffell <ian.ruffell@argos.co.uk>

RUN        yum install -y java-1.7.0-openjdk-devel
RUN        yum install -y epel-release
RUN        yum install -y nodejs
RUN        yum install -y npm
RUN        yum install -y git
RUN        yum install -y make
RUN        yum install -y less

ENV        JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
ENV        JENKINS_HOME /var/jenkins_home

RUN        useradd -d "$JENKINS_HOME" -u 1000 -m -s /bin/bash jenkins

VOLUME     /var/jenkins_home

# `/usr/share/jenkins/ref/` contains all reference configuration we want 
# to set on a fresh new installation. Use it to bundle additional plugins 
# or config file with your custom jenkins Docker image.
RUN        mkdir -p /usr/share/jenkins/ref/init.groovy.d

COPY       init.groovy /usr/share/jenkins/ref/init.groovy.d/tcp-slave-angent-port.groovy

ENV        JENKINS_VERSION 1.596.2

# could use ADD but this one does not check Last-Modified header 
# see https://github.com/docker/docker/issues/8331
RUN        curl -L http://mirrors.jenkins-ci.org/war-stable/$JENKINS_VERSION/jenkins.war -o /usr/share/jenkins/jenkins.war

ENV        JENKINS_UC https://updates.jenkins-ci.org
RUN        chown -R jenkins "$JENKINS_HOME" /usr/share/jenkins/ref

# for main web interface:
EXPOSE     8080

# will be used by attached slave agents:
EXPOSE     50000

USER       jenkins

COPY       jenkins.sh /usr/local/bin/jenkins.sh
ENTRYPOINT ["/usr/local/bin/jenkins.sh"]

# from a derived Dockerfile, can use `RUN plugin.sh active.txt` to setup /usr/share/jenkins/ref/plugins from a support bundle
COPY       plugins.sh /usr/local/bin/plugins.sh
