FROM php:7.4-apache

RUN apt-get update && apt-get install -y \
    curl \
    apache2 \
    apache2-utils \
    apache2-data \
 && rm -rf /var/lib/apt/lists/*

ENV USUARIO=admin \
    SENHA=adminadmin

COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
COPY start-apache /usr/local/bin
RUN a2enmod rewrite

COPY src /var/www/html
RUN chown -R www-data:www-data /var/www

CMD [ "start-apache" ]
