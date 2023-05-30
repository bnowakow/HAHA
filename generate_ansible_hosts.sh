#!/bin/bash

ansible_hosts_file="ansible_hosts"

echo "[hacluster]" > $ansible_hosts_file

# TODO grep Vagrantfile to check how many nodes we have
number_of_nodes=3

for i in $(seq 1 $number_of_nodes); do
    echo $(vagrant ssh ha$i -c "/vagrant/generate_single_line_of_ansible_host.sh" 2>/dev/null) >> $ansible_hosts_file
    ## TODO remove all previous known_hosts based on this prefix line
    #echo "#HAHA begin ha$i" >> ~/.ssh/known_hosts
    #vagrant ssh ha$i -c "ssh-keyscan -H localhost 2>/dev/null" 2>/dev/null >> ~/.ssh/known_hosts
    #echo "#HAHA end ha$i" >> ~/.ssh/known_hosts
done

# https://www.baeldung.com/linux/public-key-known_hosts
# ssh-keygen -Hf ~/.ssh/known_hosts

dos2unix $ansible_hosts_file

