# Start of imgae with a node base image
FROM		debian:bullseye

#install needed packages with answering yes to all prompts (-y)
RUN			apt-get update && apt-get install -y \
			nginx \
			openssl

#RUN	mkdir -p /etc/nginx/ssl

#generates self-assigned SSL/TLS certificate and private key using OpenSSL
#req -x509 - generate self-signed SSL/TLS certificate signing request (CSR)
#-nodes - dont encrypt private key with passphrase
#-days - nr days in whcih ceriticate is valid for
#-newkey - new private key with length 2048 has to be generated
#-subj subject of ceritifcate (country, location, organization, organizational unit, common name)

#RUN	openssl req -newkey -x509 -nodes -days 365 rsa:2048 \
#	-keyout /etc/nginx/ssl/lpenelon.key \
#	-out /etc/nginx/ssl/lpenelon.crt \
#	-subj "/C=PT/ST=Lisbon/L=Lisbon/O=42/OU=lpenelon/CN=lpenelon.42.fr"

#RUN	mkdir -p /var/run/nginx


COPY		./conf/default /etc/nginx/sites-enabled/default
COPY		./tools/nginx_script.sh /var/www

RUN			chmod +x /var/www/nginx_script.sh

# only allowed port
EXPOSE		443

ENTRYPOINT	[ "var/www/nginx_script.sh" ]

#container startetd in foreground, does not stop
CMD			["nginx", "-g", "daemon off;"]
