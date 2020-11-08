#!/bin/bash
updates=$(checkupdates)
number=$(echo "$updates" | wc -l)
if [[ ! -z $updates ]]
then
    echo "<img>/usr/share/icons/Faenza/apps/22/update-notifier.png</img>"
    show=$(echo "$updates" | head)
    echo "<tool>$number new updates available:"
    echo "$show"
    echo "...</tool>"
else
    echo "<txt></txt>"
fi
