
#!/bin/bash

# Script parameters from arguments
Java=$1
Docker=$2
Hostmetrics=$3
JavaIP=$4
ApacheConfig=$5
TomcatConfig=$6
RedisConfig=$7
ApacheIP=$8
TomcatIP=$9
RedisIP=$10
HostIP=$(dig +short myip.opendns.com @resolver1.opendns.com)


apt-get update
apt-get install software-properties-common -y
apt-add-repository ppa:ansible/ansible -y
apt-get update
apt-get install ansible -y
apt-get install unzip -y
#mv /etc/ansible/hosts /etc/ansible/hosts.original
#echo localhost > /etc/ansible/hosts

cd /home/
wget https://raw.githubusercontent.com/devopszone/TIG/master/Configfiles.zip
unzip Configfiles.zip -d /home/

#HOME=/root ansible-playbook /home/Configfiles/ansible/docker_install.yml 

HOME=/root ansible-playbook /home/Configfiles/ansible/docker_install.yml  --extra-vars "HostIP=$HostIP JavaIP=$JavaIP Hostmetrics=$Hostmetrics Docker=$Docker Java=$Java RedisConfig=$RedisConfig RedisIP=$RedisIP ApacheConfig=$ApacheConfig TomcatConfig=$TomcatConfig TomcatIP=$TomcatIP" -vvv


