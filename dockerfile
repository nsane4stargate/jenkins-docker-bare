# base image
FROM jenkins/jenkins:lts

# make jenkins a root user
USER root

# update the base OS
RUN apt-get update
RUN apt-get install curl -y

# download the docker
RUN curl -sSLO https://raw.githubusercontent.com/docker/docker-install/master/install.sh 

# give install.sh executable
RUN chmod +x ./install.sh

# install the script
RUN ./install.sh
RUN usermod -aG docker jenkins

# switch to user
USER jenkins