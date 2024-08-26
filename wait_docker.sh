#!/bin/bash

while true; do
    docker ps 2>&1 >/dev/null
    exit_code=$?
    docker ps 2>&1 | grep -i "CONTAINER ID" >/dev/null 2>/dev/null
    exit_code1=$?
    docker ps 2>&1 | grep -i "permission denied" >/dev/null 2>/dev/null
    exit_code2=$?
    if [ $exit_code -eq 0 ]; then
        if [ $exit_code1 -eq 0 ]; then
            echo "Docker sucessfully found on the server"
            exit
        else
            echo "Waiting for docker to be installed"
            sleep 1
    fi

    elif [ $exit_code2 -eq 0 ]; then
        echo "Done, docker have been installed"
        sudo reboot
        exit
    fi
done