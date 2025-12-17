#!/bin/bash

 set -e

  createUser(){
    
	    read -p "Enter name: " name
	    read -s -p "Enter pasword: " pass
	    echo "creating user $name ..."
	   sudo useradd $name
	   
	    echo "$name:$pass" | sudo chpasswd
	   echo "user $user  create succesfully"
   
   }
   createUser
