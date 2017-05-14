#!/bin/bash

#!/bin/bash

APP_NAME="jobctrl"


logit() {
  echo $1
  logger -i -t $APP_NAME "$1"
}



# MAIN
while true; do
  #read -t 0.1 -n 1 input
  read -n 1 input
  case $input in
    q)
      logit "Quit"
      exit
      ;;
    s)
      logit "Start"
      ;;
    *)
      ;;
  esac
done
