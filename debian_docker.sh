#!/bin/bash
cd ~

# add local apt cache mirror
echo 
read -p "Set IP of your apt cache mirror (press ENTER to skip):" IP
if [[ $IP -z ]]
then
  echo "Acquire::http::Proxy \"http://$(IP):3142\";" | sudo tee /etc/apt/apt.conf.d/00aptproxy > /dev/null
fi


# install packages
sudo apt install qemu-guest-agent -y -f
sudo systemctl start qemu-guest-agent

# install webmin
echo "deb http://download.webmin.com/download/repository sarge contrib" | sudo tee /etc/apt/sources.list.d/webmin.list > /dev/null
sudo apt update
sudo apt install gnupg1 -y -f
wget -q http://www.webmin.com/jcameron-key.asc -O- | sudo apt-key add -
sudo apt update
sudo apt install webmin -y -f

# allow webmin on firewall
sudo ufw allow 10000

# install docker
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y -f
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -f -y

# check docker is up
sudo systemctl status docker

# run docker without sudo
echo "Changing permissions for user: '$(whoami)' to run docker without sudo"
sudo usermod -aG docker $(whoami)

# create folders for docker container appdata
mkdir -v ~/docker/ && mkdir ~/docker/appdata

# change default location for docker appdata
# https://www.guguweb.com/2019/02/07/how-to-move-docker-data-directory-to-another-location-on-ubuntu/
echo -e "{\n\t'data-root': '/home/$(whoami)/docker/appdata'\n}" | sudo tee /etc/docker/daemon.json > /dev/null