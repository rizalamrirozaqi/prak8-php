FROM php:8.2-apache

# Salin aplikasi ke docroot Apache
COPY ./public /var/www/html/

# Hak akses & mod_rewrite (opsional)
RUN chown -R www-data:www-data /var/www/html
RUN a2enmod rewrite