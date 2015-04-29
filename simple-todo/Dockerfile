FROM       centos:7
MAINTAINER Ian Ruffell <ian.ruffell@argos.co.uk>

RUN        yum install -y make
RUN        yum install -y less
RUN        yum install -y epel-release
RUN        yum install -y nodejs
RUN        yum install -y npm

COPY       . /opt/todo/

WORKDIR    /opt/todo

RUN        npm install

# for main web interface:
EXPOSE     3000

ENTRYPOINT npm start

