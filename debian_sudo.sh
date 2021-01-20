#!/bin/bash
# install sudo and add me to sudo'er
USERNAME=$(whoami)
echo "Type these commands to enable sudo on Debian 10"
echo "-----------------------------------------------"
echo "su"
echo "apt-get install sudo"
echo "/sbin/adduser $USERNAME sudo"
echo "logout of root with exit"
echo "logout of $USERNAME and back in for the changes to take effect"