#!/bin/bash

flag=true
memoryUsage() {

    total_memory=$(free -m | grep Mem | awk '{print $2}')
    used_memory=$(free -m | grep Mem | awk '{print $3}')

    used_in_percentage=$(( used_memory * 100 / total_memory ))

    if [ "$used_in_percentage" -ge 80 ]; then
        echo "Memory is running high: $used_in_percentage%"
	flag=false
    else
        echo "Memory usage is normal: $used_in_percentage%"
	flag=true
    fi
}

logindays(){
   
	days=$(uptime | awk '{print $3}')
	
	if [ "$days" -ge 10 ]; then
	   echo "continously running from $days days"
	   flag=false
	else
	   echo "running from past $days days"
	   flag=true
	fi

}

diskusage(){
     
	      disk=$(df -m | grep /dev/root | awk '{print $5}' | tr -d '%')

	      if [ "$disk" -ge 80 ]; then

		  echo "disk space is running low $disk %"
		  flag=false

	      else
		   echo "space is sufficient $disk %"
		   flag=true
	      fi

}
memoryUsage
logindays
diskusage

if [ "$flag" = "true" ]; then
	echo "system is okkkkkkkkkk"
else
	echo "system is not okkkk"
fi
