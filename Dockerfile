FROM php:5.6.38-apache
RUN apt-get update && apt-get install -y libpq-dev && docker-php-ext-install pdo mysqli pdo_mysql
RUN a2enmod rewrite
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
WORKDIR /var/www/html
RUN chmod -R 755 /var/www/html/src

RUN git config --global user.username "automation"
RUN git config --global user.email "automation@arcacorp.com"
RUN git config --global user.password "Abcd1234"

RUN cd /src && git clone http://172.105.122.80:3000/Mitra/mustika.git