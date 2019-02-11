#!/bin/bash
source ./env.conf
echo $DOMAIN
if [ "$CERTBOT_VALIDATION" != "" ] ;
then
    echo $CERTBOT_VALIDATION
    aliyun alidns AddDomainRecord --DomainName ${DOMAIN} --RR "_acme-challenge" --Type "TXT" --Value "${CERTBOT_VALIDATION}" --TTL 120
    exit 0
else
    echo "Error"
    exit 1
fi

