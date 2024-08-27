#!/bin/bash

while true; do
    docker --version 2> /dev/null
    exit_code=$?
    if [ $exit_code -eq 0 ]; then
        echo "Docker sucessfully found on the server"
        sleep 2
        exit
    else
        echo "Waiting for docker installation"
        sleep 1
    fi
done