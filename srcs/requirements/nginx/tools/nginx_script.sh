#!/bin/bash

if [ ! -f /etc/ssl/certs/nginx.crt ]; then
echo "Nginx: setting up ssl ...";
openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj "/C=PT/ST=Lisbon/L=Lisbon/O=42 Lisboa/CN=lpenelon";
echo "Nginx is set up with ssl/tls";
fi

exec "$@"
