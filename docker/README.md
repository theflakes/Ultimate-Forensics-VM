**Preperation**  
Install LUbuntu latest version  
(I want a low resource host, therefore I chose LUbuntu)  
***Now install Docker stuff***  
```bash
apt-get install docker  
apt-get install docker.io  
# update docker to auto start
sudo update-rc.d docker defaults  
```

**Docker images to pull**  
```bash
# Javascript deobfuscation and analysis
docker pull remnux/jsdetox  
# needed to create forensics docker images  
docker pull ubuntu:14.04  
```


**Create a directory to share with all Dockers**  
```mkdir /data  ```
/tmp will also be shared by default


**Copy each Docker Dockerfile to their own directory**  
/home/docker/sonion/Dockerfile  
/home/docker/remnux/Dockerfile  
/home/docker/sift/Dockerfile  
/home/docker/powershell/Dockerfile  


**Build REMNUX**  
```bash
cd /home/docker/remnux   
docker build -t remnux .  
```
_Remnux package install failures_:  
inetsim  
unrar  


**Build SIFT**  
```bash
cd /home/docker/sift  
docker build -t sift .  
```
_Sift package install failures_:  
mantaray  
nikto  
pytsk3  
rar  
regripper  
unrar  
wine  


**Build SecurityOnion**
```bash
cd /home/docker/sonion  
docker build -t sonion .  
```
_SecurityOnion package install failures_:  


**Build Powershell**  
https://channel9.msdn.com/Shows/msftazure/Run-PowerShell-Natively-on-Linux-with-Docker
```bash
cd /home/docker/powershell
docker build -t pshell .  
# start pshell docker
# -i -> interactive docker
# -t -> connect docker to terminal
# --rm -> role back to the pre-run state of the docker after it is shutdown
docker run -i -t --rm pshell
```


Use "```service ssh start```" to start sshd and then ssh to the IP of the docker container.  
Refer to the Dockerfile for each image to find the SSH password.  
