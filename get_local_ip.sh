#!/bin/bash


ip -4 -o a show dev eth1 | cut -d ' ' -f 4,7 | cut -d '/' -f 1 | sed 's/\ //g'


