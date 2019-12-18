#!/bin/bash

get_state() {
    state=$(awk -F':' '{ print $2 }' /proc/acpi/button/lid/LID/state)
    if [[ $state == *"close"* ]]; then
        echo 0
    elif [[ $state == *"open"* ]]; then
        echo 1
    fi
    
}

while true
do
    state="$(get_state)"
    #echo $state

    if [[ $state -eq 0 ]]; then
        echo "Executing physlock..."
        exec physlock -p "lid closed" &
        wait $(pidof /usr/bin/phylock)
    fi

done
