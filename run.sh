#!/bin/bash

ln -sf docker-compose-for-installation.yml docker-compose.yml
vagrant up;
./generate_ansible_hosts.sh
ansible-playbook setup-hacluster.yml -i ansible_hosts
if [ $? = 0 ]; then
    ln -sf docker-compose-after-installation.yml docker-compose
fi


