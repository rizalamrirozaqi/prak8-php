FROM php:8.2-cli

COPY . /app
WORKDIR /app

RUN apt-get update && apt-get install -y git unzip
RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer

RUN composer install

CMD ["php", "index.php"]
