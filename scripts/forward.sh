#!/bin/sh

isset() {
  [ -n "$1" ]
}

if isset "$PORT_LOCAL" && isset "$PORT_REMOTE" && isset "$ADDRESS_REMOTE"; 
then
  echo "Port forwarding starting from $PORT_LOCAL to $ADDRESS_REMOTE:$PORT_REMOTE"
  socat tcp-listen:"$PORT_LOCAL",reuseaddr,fork tcp:"$ADDRESS_REMOTE":"$PORT_REMOTE"
else
  echo "MISSING ENVIROMENT VARIABLE:"
  isSet "$PORT_LOCAL" || echo -e "\tPORT_LOCAL"
  isSet "$PORT_REMOTE" || echo -e "\tPORT_REMOTE"
  isSet "$ADDRESS_REMOTE" || echo -e "\tADDRESS_REMOTE"
  exit 1
fi

