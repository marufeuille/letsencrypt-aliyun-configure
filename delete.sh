#!/bin/bash
source ./env.conf
RecordId=$(aliyun alidns DescribeDomainRecords --DomainName ${DOMAIN} | jq -r '.DomainRecords.Record[] | select(.RR | test ("_acme-challenge")) | .RecordId')
if [[ ${RecordId} != "" ]];
then
    echo ${RecordId}
    aliyun alidns DeleteDomainRecord --RecordId ${RecordId}
    exit 0
else
    echo "Error"
    exit 1
fi
