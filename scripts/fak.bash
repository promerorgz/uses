#!/bin/bash
function fak {
  
  clear 

  Red='\033[1;91m'        # Red
  Yellow='\033[1;93m'     # Yellow
  Purple='\033[1;95m'     # Purple
  Cyan='\033[1;96m'       # Cyan
  NaN='\033[0m'

  pid=$(sudo lsof -i tcp:$1 -t)  

  if [[ -z $pid ]]
    then 
      echo -e $Yellow 'No Processes running in port' $1 $NaN
    else
      echo -e $Yellow Processes at port $1: $Cyan $pid $NaN 
      echo -e $Purple Execute order 66 $NaN 
      echo -e $Red 'killing process(es) :' $pid $NaN
      sudo kill -9 $pid
  fi
}
