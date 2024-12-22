#!/bin/bash

# Exit on error
set -e

# Configuration variables
DB_NAME="wordpress"
DB_USER="wordpress"
DB_PASS="wordpress_password"
WP_ADMIN_USER="admin"
WP_ADMIN_PASS="StrongAdminPass123!"
WP_ADMIN_EMAIL="admin@example.com"
WP_TITLE="WordPress Blog"

# Update system and install dependencies
apt-get update
apt-get install -y php php-mysql php-fpm php-curl php-gd php-mbstring php-xml php-xmlrpc mariadb-server nginx curl

# Start MariaDB
service mariadb start

# Create WordPress database and user
mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
mysql -e "CREATE USER IF NOT EXISTS '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASS';"
mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost';"
mysql -e "FLUSH PRIVILEGES;"

# Download and set up WordPress
cd /var/www/html
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
chown -R www-data:www-data wordpress/
rm latest.tar.gz

# Copy WordPress config
cp ../config/wp-config.php /var/www/html/wordpress/
chown www-data:www-data /var/www/html/wordpress/wp-config.php

# Configure Apache
cp ../config/wordpress.conf /etc/apache2/sites-available/
a2ensite wordpress
a2enmod rewrite
a2dissite 000-default
service apache2 restart

# Install WP-CLI
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# Install WordPress core
cd /var/www/html/wordpress
sudo -u www-data wp core install --url=http://localhost --title="$WP_TITLE" --admin_user="$WP_ADMIN_USER" --admin_password="$WP_ADMIN_PASS" --admin_email="$WP_ADMIN_EMAIL"

# Install and activate Wordfence
sudo -u www-data wp plugin install wordfence --activate

echo "Installation completed successfully!"
echo "WordPress admin URL: http://localhost/wp-admin"
echo "Username: $WP_ADMIN_USER"
echo "Password: $WP_ADMIN_PASS"