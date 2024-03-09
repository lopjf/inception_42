#!/bin/bash

#generates self-assigned SSL/TLS certificate and private key using OpenSSL
#req -x509 : generate self-signed SSL/TLS certificate signing request (CSR)
#-nodes : dont encrypt private key with passphrase
#-days : validity of the certificate
#-newkey : new private key with length 4096 has to be generated
#-keyout : where key will be saved
#-out : where certificate will be saved
#-subj : subject of ceritifcate (country, location, organization, organizational unit, common name)

# check if already exist
if [ ! -f /etc/ssl/certs/nginx.crt ]; then
openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj "/C=PT/ST=Lisbon/L=Lisbon/O=42 Lisboa/CN=lpenelon";
fi

# enable the CMD to run as the same process as the script. from PID1
exec "$@"