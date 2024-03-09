# inception_42

Have to create the two folders that will hold the volumes:
sudo mkdir -p /home/lpenelon/data/mariadb
sudo mkdir -p /home/lpenelon/data/wordpress

How to change your localhost by lpenelon.42.fr
sudo nano /etc/hosts
Add the following line : "127.0.0.1 lpenelon.42.fr"

build and run nginx:
docker build -t nginx .
docker run -it -p 443:443 nginx

Access the wp-admin: https://localhost/wp-admin/ or https://lpenelon.42.fr/wp-admin/



Go inside database:

Step 1: Access MariaDB Client

Go inside mariadb container:
docker exec -it <container_id> /bin/bash

Step 2: Log in to MariaDB

Type the following command and press Enter:
mysql -u your_username -p

Step 4: List Databases

To see a list of databases available:
SHOW DATABASES;

Step 5: Select Database

Choose a database to work with. For example, let's say we have a database named my_database. To use it:
USE my_database;

Step 6: List Tables

To see the tables within the selected database:
SHOW TABLES;

Step 7: Check Table Contents

Assuming you have a table named my_table, you can check its contents:
SELECT * FROM my_table;