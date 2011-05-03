#!/bin/bash
# (c) 2011, it-in, http://it-in.ru
# Author: Sergey Kovalev <kovalev_s@it-in.ru>
APIURL=$(curl -I -H "X-Auth-User: ${1}" -H "X-Auth-Key: ${2}" --silent http://api.clodo.ru | grep 'X-Server-Management-Url' | sed 's/X-Server-Management-Url: \(.*\)\r/\1/')
TOKEN=$(curl -I -H "X-Auth-User: ${1}" -H "X-Auth-Key: ${2}" --silent http://api.clodo.ru | grep 'X-Auth-Token' | sed 's/X-Auth-Token: \(\w*\)\r/\1/')
echo "API URL: ${APIURL}"
echo "Token: ${TOKEN}"
curl -H "X-Auth-Token: ${TOKEN}" $APIURL/servers/$4/$3
