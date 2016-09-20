**Preperation**
Install Lubuntu latest version  
(I want a low resource host, therefore I chose LUbuntu)
apt-get install docker  
apt-get install docker.io  


**Docker images to pull**  
docker pull blacktop/jsdetox  
docker pull ubuntu:14.04
(needed to create forensics docker images)


**Create a directory to share with all Dockers** 
mkdir /data  
/tmp will also be shared by default


**Copy each Dockerfile to seperate directories then execute the below in the appropriate directory**  
/home/docker/sonion/Dockerfile  
/home/docker/remnux/Dockerfile  
/home/docker/sift/Dockerfile  


**REMNUX**
cd /home/docker/remnux Docker:  
docker build -t remnux .  
Install failures:  
- inetsim
- unrar


**SIFT**
cd /home/docker/sift Docker:  
docker build -t sift .  


**SecurityOnion**
cd /home/docker/remnux/sonion Docker:  
docker build -t sonion .  


Use "service ssh start" to start sshd and then ssh to the IP of the docker container.  
Refer to Dockerfile for each image to find the SSH password.
