FROM ubuntu:14.04

MAINTAINER Brian Kellogg <theflakes@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get clean

# install SSH server and setup SSH for docker
# https://docs.docker.com/engine/examples/running_ssh_service/
RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:sift' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

# install sift
RUN apt-get update && apt-get install -y apt-transport-https
RUN apt-get install wget
RUN apt-get clean
RUN wget --quiet -O - https://raw.github.com/sans-dfir/sift-bootstrap/master/bootstrap.sh | sudo bash -s -- -i

VOLUME /tmp
VOLUME /data

EXPOSE 22

ENTRYPOINT ["/bin/sh"]
