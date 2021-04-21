#install on web servers
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
apt-get update && apt-get upggrade

apt install docker.io &&
apt install python3-pip &&
apt install docker &&
docker pull vulnerables/web-dvwa &&
systemctl start docker &&
docker run -it -p 80:80 --restart always vulnerables/web-dvwa &&
exit
#Run the last two commands
#sudo systemctl enable docker.service
#sudo systemctl enable containerd.service
