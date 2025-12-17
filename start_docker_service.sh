#!/bin/bash


function run(){

    isActive=$(systemctl status docker | grep Active | awk '{print $2}')
    
    if [ "$isActive" = "active" ]; then
	    
	    echo "Service is already running"
    
     else 
	     echo "starting docker service"
	     sudo systemctl start docker

	     if [ $? -eq 0 ]; then
            echo "$SERVICE started successfully"
        else
            echo "Failed to start $SERVICE"
        fi
	  
    fi 
    
}

run
