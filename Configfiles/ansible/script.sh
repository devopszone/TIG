echo java value
read Java
echo Dockervalue
read Docker
echo Hostmetrics
read Hostmetrics
echo JavaIP
read JavaIP
Java=$Java
Docker=$Docker
Hostmetrics=$Hostmetrics
JavaIP=$JavaIP
#HostIP=$(dig +short myip.opendns.com @resolver1.opendns.com)
HostIP=$(ip addr show |grep "inet " |grep -v 127.0.0. |head -1|cut -d" " -f6|cut -d/ -f1)

ansible-playbook /home/test-TIG/Configfiles/ansible/docker_install.yml -i /etc/ansible/hosts --extra-vars "HostIP=$HostIP JavaIP=$JavaIP Hostmetrics=$Hostmetrics Docker=$Docker Java=$Java RedisConfig=$RedisConfig RedisIP=$RedisIP ApacheConfig=$ApacheConfig TomcatConfig=$TomcatConfig TomcatIP=$TomcatIP MongoConfig=$MongoConfig MongoIP=$MongoIP" -v
