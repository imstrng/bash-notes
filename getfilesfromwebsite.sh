#!/bin/sh

USERNAME=""
PASSWORD=""
URL="https://domain.com"
DATE=$(date +%Y%m%d)

curl --insecure -s ${URL}/Authentication -c cookiefile -d "username=${USERNAME}&password=${PASSWORD}"
curl --insecure -s -O ${URL}/download/file -b cookiefile

rm cookiefile
echo "Done"
