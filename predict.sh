#!/bin/bash

DATA=$1
INPUT="$2"

AUTH=`cat auth-token`

# encode model name
model=`echo $DATA | perl -pe 's:/:%2F:'`
data="{data: {\"instance\" : { \"input\" : { \"text\" : [ \"$INPUT\" ]}}}}"

echo $data

# get a prediction
curl -X POST \
-H "Content-Type:application/json" \
-H "Authorization: GoogleLogin auth=$AUTH" \
-d "$data" \
https://www.googleapis.com/prediction/v1/query/$model
echo
