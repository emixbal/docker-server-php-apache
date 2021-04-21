FROM php:5.6.38-apache
RUN addgroup -g 1000 aic && adduser -G aic -g aic -s /bin/sh -D aic 
RUN apt-get update && apt-get install -y libpq-dev && docker-php-ext-install pdo mysqli pdo_mysql
RUN a2enmod rewrite
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
RUN chown aic:aic /var/www/html 
WORKDIR /var/www/html