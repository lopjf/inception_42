# Start of image with a node base image
FROM		debian:bullseye

#install needed packages with answering yes to all prompts (-y)
RUN			apt-get update && apt-get install -y \
			nginx \
			openssl

COPY		./conf/default /etc/nginx/sites-enabled/default
COPY		./tools/nginx_script.sh /var/www

RUN			chmod +x /var/www/nginx_script.sh

# only allowed port
EXPOSE		443

ENTRYPOINT	[ "var/www/nginx_script.sh" ]

#container startetd in foreground, does not stop
CMD			["nginx", "-g", "daemon off;"]
