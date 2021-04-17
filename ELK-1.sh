#install docker and container
#!/bin/bash

#Updating
apt-get update
#upgrading
apt-get upgrade

if ! [ $(id -u) = 0 ]; then
   echo "The script need to be run as root." >&2
   exit 1
fi
if [ $SUDO_USER ]; then
    real_user=$SUDO_USER
else
    real_user=$(whoami)
fi

apt install docker.io &&
#installs docker to box

apt install python3-pip &&
#installs python

apt install docker &&
#installs docker python module

sysctl -w vm.max_map_count=262144 &&
#increases virtual memory

#starts docker
systemctl start docker &&
systemctl enable docker.service &&
systemctl enable containerd.service &&

docker pull sebp/elk &&
#pulls docker elk

docker run -it -p 5601:5601 -p 9200:9200 -p 5044:5044 --restart always sebp/elk
exit
