#!/bin/bash

email=$1
password=$2

# get authorization
curl \
  -X POST \
  -d accountType=HOSTED_OR_GOOGLE \
  -d Email=$email \
  -d Passwd=$password \
  -d source=companyName-applicationName-versionID \
  -d service=xapi \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  https://www.google.com/accounts/ClientLogin  2>/dev/null | \
grep 'Auth' | perl -pe 's/^Auth=//' > auth-token
