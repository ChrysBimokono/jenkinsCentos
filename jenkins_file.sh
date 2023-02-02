#!/bin/bash
  #Author: chrys bimokono;
  #Date: february 1,2023;

  #Subject: creating a jenkins installation script on centos

# I- Install Java
  ##We need to install java first since jenkins is a java application
  sudo yum install java-11-openjdk-devel -y

# II-Enabling the Jenkins repository
  # useful in order to use yum to install install the latest version
  curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo

  sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key

  #III- Install the latest stable version of jenkins
  sudo yum install jenkins -y
  #After installation completed, we start the service
  sudo systemctl start jenkins
  #Checking the status with:
  sudo systemctl status jenkins
  #enable the Jenkins service
  sudo systemctl enable jenkins

  #IV- Adjust the firewall
  sudo firewall-cmd --permanent --zone=public --add-port=8080/tcp
  sudo firewall-cmd --reload

 
