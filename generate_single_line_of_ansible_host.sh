#!/bin/bash


echo $(ip -4 -o a show dev eth1 | cut -d ' ' -f 4,7 | cut -d '/' -f 1 | sed 's/\ //g')"  ansible_connection=ssh  ansible_ssh_user=vagrant  ansible_ssh_private_key_file=/mnt/MargokPool/home/sup/code/HAHA/.vagrant/machines/$(hostname)/virtualbox/private_key"

