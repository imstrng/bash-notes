#!/bin/bash


PATH=${PATH}:/bin:/usr/bin

logit() {
  echo $1
  logger -i -t "$0" "$1"
}


start() {
  logit "Starting"
  exec /usr/bin/node-red &> /dev/null &
}


stop() {
  logit "Stopping"
  pkill "node-red"
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
