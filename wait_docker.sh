#!/bin/bash

while true; do
    docker ps
    exit_code=$?
    if [ $exit_code -eq 0 ]; then
        positive=$(docker ps | grep -i "CONTAINER ID" | wc -l)
        negative=$(docker ps | grep -i "permission denied" | wc -l)
        if [ $positive -ge 1 ]; then
            echo "Docker sucessfully found on the server"
            exit
        else
            echo "Waiting for docker to be installed"
            sleep 1
    fi
    
    elif [ $negative -ge 1 ]; then
        echo "Done, docker have been installed"
        sudo reboot
        exit
    fi
done