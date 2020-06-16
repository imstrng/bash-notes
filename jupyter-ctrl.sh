#!/bin/bash


PATH=${PATH}:/bin:/usr/bin

logit() {
  echo $1
  logger -i -t "$0" "$1"
}


start() {
  logit "Starting"
  exec /usr/local/bin/jupyter notebook &> /dev/null &

}


stop() {
  logit "Stopping"
  pkill -f "python3 /usr/local/bin/jupyter-notebook"
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
