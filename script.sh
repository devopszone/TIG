#!/bin/bash

# Script parameters from arguments
Java=$1
Docker=$2
Hostmetrics=$3
JavaIP=$4
var=$(dig +short myip.opendns.com @resolver1.opendns.com)


apt-get update
apt-get install software-properties-common -y
apt-add-repository ppa:ansible/ansible -y
apt-get update
apt-get install ansible -y
apt-get install unzip -y

wget https://github.com/sankara7/Ansible/raw/master/Configfiles.zip
unzip Configfiles.zip -d /home
