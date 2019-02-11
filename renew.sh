#!/bin/bash
source ./env.conf
echo $DOMAIN
certbot renew --dry-run
if [[ $? -ne 0 ]] ;
then
    echo "Error"
    exit 256
fi

aliyun slb UploadServerCertificate --RegionId ${REGION_ID}  --ServerCertificate "$(cat /etc/letsencrypt/live/${DOMAIN}/cert.pem)" --PrivateKey "$(cat /etc/letsencrypt/live/${DOMAIN}/privkey.pem | sed -e 's/-----BEGIN PRIVATE KEY-----/-----BEGIN RSA PRIVATE KEY-----/'  -e 's/-----END PRIVATE KEY-----/-----END RSA PRIVATE KEY-----/')" 
exit 0
