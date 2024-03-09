#!/bin/bash

sed -i "s/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/" "/etc/php/7.4/fpm/pool.d/www.conf";
chown -R www-data:www-data /var/www/*;
chown -R 777 /var/www/*;
mkdir -p /run/php/;
touch /run/php/php7.4-fpm.pid;

#check if wp-config.php exist
if [ ! -f /var/www/html/wp-config.php ]; then
	mkdir -p /var/www/html
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
	chmod +x wp-cli.phar; 
	mv wp-cli.phar /usr/local/bin/wp;
	cd /var/www/html;
	wp core download --allow-root;
	mv /var/www/wp-config.php /var/www/html/
	
	# Replace database credentials with environment variables
    sed -i "s/replace_with_env_user/${DB_USER}/" /var/www/html/wp-config.php
    sed -i "s/replace_with_env_password/${DB_PASSWORD}/" /var/www/html/wp-config.php
	sed -i "s/replace_with_db_name/${DATABASE_NAME}/" /var/www/html/wp-config.php
	
	sed -i "s/replace_with_auth_key/${AUTH_KEY}/" /var/www/html/wp-config.php
	sed -i "s/replace_with_secure_auth_key/${SECURE_AUTH_KEY}/" /var/www/html/wp-config.php
	sed -i "s/replace_with_logged_in_key/${LOGGED_IN_KEY}/" /var/www/html/wp-config.php
	sed -i "s/replace_with_nonce_key/${NONCE_KEY}/" /var/www/html/wp-config.php
	sed -i "s/replace_with_auth_salt/${AUTH_SALT}/" /var/www/html/wp-config.php
	sed -i "s/replace_with_secure_auth_salt/${SECURE_AUTH_SALT}/" /var/www/html/wp-config.php
	sed -i "s/replace_with_logged_in_key/${LOGGED_IN_SALT}/" /var/www/html/wp-config.php
	sed -i "s/replace_with_nonce_salt/${NONCE_SALT}/" /var/www/html/wp-config.php


	wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_LOGIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL}
	wp user create --allow-root ${WP_USER_LOGIN} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWORD};
fi

exec "$@"
