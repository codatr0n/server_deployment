#!/bin/bash
# install sudo and add me to sudo'er
USERNAME=$(whoami)
su
apt-get install sudo
/sbin/adduser $USERNAME sudo
exit
logout