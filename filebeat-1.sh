#!/bin/bash
if ! [ $(id -u) = 0 ]; then
   echo "The script need to be run as root." >&2
   exit 1
fi
if [ $SUDO_USER ]; then
    real_user=$SUDO_USER
else
    real_user=$(whoami)
fi
curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.9.2-amd64.deb
#download FileBeat
sudo dpkg -i filebeat-7.9.2-amd64.deb
#download
curl -L -O https://gist.githubusercontent.com/slape/5cc350109583af6cbe577bbcc0710c93/raw/eca603b72586fbe148c11f9c87bf96a63cb25760/Filebeat
#move
mv Filebeat /etc/filebeat/filebeat.yml
#open
nano /etc/filebeat/filebeat.yml