Install Lubuntu latest version  
apt-get install docker  
apt-get install docker.io  

Docker images to pull:  
docker pull blacktop/jsdetox  
- https://hub.docker.com/r/remnux/jsdetox/  

Create a directory to share with all Dockers  
mkdir /data  

Copy Dockerfile to seperate directories:  
/home/docker/sonion/Dockerfile  
/home/docker/remnux/Dockerfile  
/home/docker/sift/Dockerfile  
 
cd /home/docker/remnux Docker:  
docker build -t remnux .  

cd /home/docker/sift Docker:  
docker build -t sift .  

cd /home/docker/remnux/sonion Docker:  
docker build -t sonion .  
Install failures:  
- inetsim
- unrar
