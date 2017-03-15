FROM ubuntu:14.04

MAINTAINER Brian Kellogg <theflakes@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# check for updates
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get clean

# install SSH server and setup SSH for docker
# https://docs.docker.com/engine/examples/running_ssh_service/
RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:sonion' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

# install SecurityOnion
# https://github.com/Security-Onion-Solutions/security-onion/wiki/InstallingOnUbuntu
RUN echo "debconf debconf/frontend select noninteractive" | sudo debconf-set-selections
RUN rm -rf /var/lib/apt/lists/*
RUN apt-get update
RUN apt-get -y install software-properties-common
RUN apt-get clean
RUN add-apt-repository -y ppa:securityonion/stable
RUN apt-get update
RUN apt-get -y install securityonion-all syslog-ng-core
RUN apt-get clean
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get clean

RUN useradd -ms /bin/bash sonion
RUN echo 'sonion:sonion' | chpasswd
RUN adduser sonion sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN apt-get install -y firefox
RUN echo 2 | update-alternatives --config x-www-browser 

USER sonion
WORKDIR /home/sonion

VOLUME /tmp
VOLUME /data

EXPOSE 22

ENTRYPOINT ["/bin/sh"]
