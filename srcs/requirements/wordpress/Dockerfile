FROM		debian:bullseye

RUN			apt-get update && apt-get install -y \
			wget \
			php7.4 \
			php-fpm \
			php-mysqli \
			mariadb-client

RUN			rm -rf /var/lib/apt/lists/*


COPY		./conf/www.conf /etc/php/7.4/fpm/pool.d
COPY		./tools/ /var/www/

RUN			chmod +x /var/www/wordpress_script.sh

EXPOSE		9000
 
ENTRYPOINT	[ "/var/www/wordpress_script.sh" ]

CMD			["/usr/sbin/php-fpm7.4", "--nodaemonize"]
