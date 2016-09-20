**Preperation**  
Install LUbuntu latest version  
(I want a low resource host, therefore I chose LUbuntu)  
```bash
apt-get install docker  
apt-get install docker.io  
```

**Docker images to pull**  
```
docker pull blacktop/jsdetox  
docker pull ubuntu:14.04
```
(needed to create forensics docker images)  


**Create a directory to share with all Dockers**  
```mkdir /data  ```
/tmp will also be shared by default


**Copy each Docker Dockerfile to their own directory**  
/home/docker/sonion/Dockerfile  
/home/docker/remnux/Dockerfile  
/home/docker/sift/Dockerfile  


**Build REMNUX**  
```bash
cd /home/docker/remnux   
docker build -t remnux .  
```
_Remnux Install failures_:  
inetsim  
unrar  


**Build SIFT**  
```bash
cd /home/docker/sift  
docker build -t sift .  
```


**Build SecurityOnion**
``` bash
cd /home/docker/remnux/sonion  
docker build -t sonion .  
```

Use "```service ssh start```" to start sshd and then ssh to the IP of the docker container.  
Refer to Dockerfile for each image to find the SSH password.  
