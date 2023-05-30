#!/bin/bash

vagrant up;
./generate_ansible_hosts.sh
ansible-playbook setup-hacluster.yml -i ansible_hosts

