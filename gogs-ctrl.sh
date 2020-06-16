#!/bin/bash


PATH=${PATH}:/bin:/usr/bin

logit() {
  echo $1
  logger -i -t "$0" "$1"
}


start() {
  logit "Starting"
  cd ~/gogs
  exec ./gogs web  &> /dev/null &
}


stop() {
  logit "Stopping"
  pkill gogs
}


# MAIN
while true; do
  case $1 in
    stop)
      stop
      exit
      ;;
    start)
      start
      exit
      ;;
    *)
      logit "$0 [start|stop]"
      exit
      ;;
  esac
done
