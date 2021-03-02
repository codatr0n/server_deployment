# install packages
cd ~
sudo apt install qemu-guest-agent
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
