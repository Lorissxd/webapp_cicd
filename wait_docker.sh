#!/bin/bash

while true; do

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
        exit
    fi
done