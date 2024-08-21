#!/bin/bash

ip=(ipv4)
start=`date +%s`

while true; do
    nmap -Pn -p 22 $ip | awk '/tcp/{ print $2 }' > output3.txt
    if [ $? -eq 0 ]; then
        val_agree=$(cat output3.txt | grep -i open | wc -l)
        val_error=$(cat output3.txt | grep -E 'filtered|closed')
        if [ $val_agree -eq 1 ]; then
            end=`date +%s`
            cat output3.txt
            echo "Connection establish!"
            echo "Connection was established after: $(($end-$start)) seconds."
            sleep 5
            exit
        else
            echo "Connection status: $val_error"
            sleep 1
        fi


    elif [ $(($(date +%s)-$start)) -ge 35 ]; then
            echo "Error Timeout"
            exit
    fi
done