#!/bin/bash

ip=(ipv4)
action=$(nmap -Pn -p 22 $ip | awk '/tcp/{ print $2 }' > output3.txt)
val_negative=$(cat output3.txt | grep filtered | wc -l)
val_agree=$(cat output3.txt | grep open | wc -l)
start=`date +%s`

while true; do
    $action
    if [ $val_agree -ge 1 ]; then
        echo "Connection establish!"
        end=`date +%s`
        echo "Connection was established after: $(($end-$start)) seconds."
        exit
    else
        echo "Not connected"
        cat output3.txt
        sleep 1
        if [ $(($(date +%s)-$start)) -ge 50 ]; then
            echo "Error Timeout"
            exit
        fi
    fi
done