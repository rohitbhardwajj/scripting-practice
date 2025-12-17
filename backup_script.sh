#!/bin/bash

read -p "Enter full path of your file or folder: " source

backup_dir="/home/ubuntu/backup"
mkdir -p "$backup_dir"

if [ ! -e "$source" ]; then
    echo "Error: Given path does not exist"
    exit 1
fi

name=$(basename "$source")
tar -cvf "$backup_dir/$name.tar" "$source"

echo "Backup created successfully at $backup_dir/$name.tar"

