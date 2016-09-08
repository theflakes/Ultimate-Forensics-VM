# Ultimate-Forensics-VM
Evolving directions on building the best Open Source Forensics VM


**VM minimum config recommendations:**  
- 2 procs  
- 4GB RAM  
- 30GB disk space  
- 2 NICs  
  - One shared or direct connect  
  - One host only  
      - Use this NIC for the SO monitor interface  
      - Replay your PCAPs on this interface  


**Install Ubuntu 14.04 LTS and run:**  
sudo apt-get update  
sudo apt-get upgrade  
sudo apt-get update  
sudo apt-get dist-upgrade  
sudo reboot  

**Install SIFT Workstation:**  
wget --quiet -O - https://raw.github.com/sans-dfir/sift-bootstrap/master/bootstrap.sh | sudo bash -s -- -i  
sudo apt-get update  
sudo apt-get upgrade  
sudo reboot  

**Install Remnux Tools:**  
wget --quiet -O - https://remnux.org/get-remnux.sh | sudo bash  
sudo apt-get update  
sudo apt-get upgrade  
sudo reboot  

(above three steps sourced from: https://digital-forensics.sans.org/blog/2015/06/13/how-to-install-sift-workstation-and-remnux-on-the-same-forensics-system)  


**Install JSDetox Docker:**  
	- Awesome JavaScript forensic tool: http://www.relentless-coding.com/projects/jsdetox/  
sudo apt-get install docker  
sudo apt-get update  
sudo apt-get upgrade  
***Run JSDetox:***  
docker run  
sudo docker run --rm -p 3000:3000 remnux/jsdetox  
To stop JSDetox --> use "sudo docker ps -l" to obtain the container ID, then use the "sudo docker stop *container-id*" and wait about a minute.  
Source: https://hub.docker.com/r/remnux/jsdetox/  


**Install SecurityOnion:**  
echo "debconf debconf/frontend select noninteractive" | sudo debconf-set-selections  
sudo apt-get -y install software-properties-common  
sudo add-apt-repository -y ppa:securityonion/stable  
sudo apt-get update  
sudo apt-get -y install securityonion-all syslog-ng-core  
Now setup SecurityOnion as a standalone server.  
	- You can now run PCAPs against the monitor interface and have Bro and Suricata run against them.  
	- Install all of your custom Bro scripts  
	- View the results of the PCAP replay in Sguil and ELSA.  
Source: https://github.com/Security-Onion-Solutions/security-onion/wiki/InstallingOnUbuntu  


**Update SIFT and Remnux:**  
update-sift  
update-remnux  

Pasted from <https://digital-forensics.sans.org/blog/2015/06/13/how-to-install-sift-workstation-and-remnux-on-the-same-forensics-system>   


**If you have any APT keys that need added run the below command.**  
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys KEY  
