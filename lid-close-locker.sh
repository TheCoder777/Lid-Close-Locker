#!/bin/bash

get_state() {
    #echo $(awk -F':' '{ print $2 }' /proc/acpi/button/lid/LID/state)
    echo $(cat /home/nova/.lid_status)
}

while true
do
    state="$(get_state)"
    echo $state

    if [[ $state -eq 0 ]]; then
        echo "Executing physlock..."
        exec physlock -p "lid closed" &
        wait $(pidof /usr/bin/phylock)
    fi

done
