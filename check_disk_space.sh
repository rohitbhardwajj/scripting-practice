#!/bin/bash

usage=$(df -h | grep /dev/root | awk '{print $5}' | tr -d '%')


if [ -z "$usage" ]; then
    echo "Disk info not found"
    exit 1
fi


if [ "$usage" -gt 80 ]
then
    echo "Disk space is running low ${usage}%"
else
    echo "space is sufficient ${usage}%"
fi

