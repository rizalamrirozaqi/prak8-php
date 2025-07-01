FROM php:8.2-apache
COPY ./public /var/www/html/
RUN chown -R www-data:www-data /var/www/html
RUN a2enmod rewrite
RUN apt update && apt install -y git