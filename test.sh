#!/bin/bash

ansible localhost -m ping
ansible all -m ping -i ansible_hosts


