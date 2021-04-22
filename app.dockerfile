FROM php:5.6.38-apache
RUN apt-get update && apt-get install -y libpq-dev && docker-php-ext-install pdo mysqli pdo_mysql
RUN apt-get install -y git
RUN a2enmod rewrite
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
WORKDIR /var/www/html
RUN chmod -R 755 /var/www/html