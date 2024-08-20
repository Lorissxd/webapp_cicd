#!/bin/bash

ip=(ipv4)

nc -zv -w 35 $ip 22
exit_code=$?
while [ $exit_code -eq 1 ]; do
    echo "Timeout of waiting"
    exit
    if [ $exit_code -eq 0 ]; then
        echo "connected"
        exit
    fi
done
    