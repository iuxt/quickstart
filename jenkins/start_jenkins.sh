#!/bin/bash

docker run -d \
    -v jenkins_home:/var/jenkins_home \
    -p 8080:8080 -p 50000:50000 \
    --name jenkins \
    --restart=on-failure \
    jenkins/jenkins:lts-jdk11

cp -f ./jenkins-nginx.conf ../nginx/conf.d/jenkins.conf
