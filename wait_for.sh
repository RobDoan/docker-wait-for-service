#! /bin/bash

print-wait-for-usage(){
  echo "Usage: $0 host port"
}

wait_for(){
  host=$1
  port=$2
  if [ -z "$host" ] || [ -z "$port" ]
  then
    echo "Host And Port is required"
    print-wait-for-usage
    exit 125
  fi

  while !</dev/tcp/$host/$port
  do
    echo "waiting ${host} at port ${$port}"
    sleep 1
  done
}
